class TimeApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :check_json!

  before_action only: :show_timetable do |controller|
    unless @json.has_key?('from') && @json.has_key?('to')
      render json: {
          error: "Missing property 'from' or 'to'"
      }
    end
  end

  # on times tables (free_times & busy_times)
  # columns name END. Also END - is keyword on pgsql
  # to avoid conflict

  def self._end
    '"END"' if ActiveRecord::Base.connection.adapter_name == "PostgreSQL" else 'END'
  end

  def show_timetable
    from = @json['from'].to_datetime
    to = @json['to'].to_datetime

    if service = @json['service']
      frees = FreeTime.where("BEGIN >= :from and #{self.class._end} <= :to and SERVICE = :service", from: from, to: to, service: service).
          to_a.map { |x| x.as_json(except: [:id, :created_at, :updated_at]) }
      busys = BusyTime.where("BEGIN >= :from and #{self.class._end} <= :to and SERVICE = :service", from: from, to: to, service: service).
          to_a.map { |x| x.as_json(except: [:id, :created_at, :updated_at]) }
    else
      frees = FreeTime.where("BEGIN >= :from and #{self.class._end} <= :to", from: from, to: to).
          to_a.map { |x| x.as_json(except: [:id, :created_at, :updated_at]) }
      busys = BusyTime.where("BEGIN >= :from and #{self.class._end} <= :to", from: from, to: to).
          to_a.map { |x| x.as_json(except: [:id, :created_at, :updated_at]) }

    end
    render json: {
        from: from,
        to: to,
        now: Date.today,
        frees: frees.to_s,
        busys: busys.to_s,
        status: :ok,
    }
  rescue Exception => e
    render json: {
        error: e.to_s
    }, status: :bad_request

  end

  before_action only: :create_free_time do |controller|
    unless @json.has_key?('from') && @json.has_key?('to') && @json.has_key?('service')
      render json: {
          error: "Missing property 'from', 'to' or 'service'"
      }
    end
  end

  def create_free_time
    params = {
        begin: @json['from'].to_datetime,
        end: @json['to'].to_datetime,
        service: @json['service'],
    }

    if FreeTime.create(params)
      render json: {status: "saved"}
    else
      render json: {status: "canceled"}
    end

  rescue ArgumentError => e
    render json: {
        error: e.to_s
    }, status: :bad_request

  end

  before_action only: :create_free_time do |controller|
    unless @json.has_key?('from') && @json.has_key?('to') && @json.has_key?('service')
      render json: {
          error: "Missing property 'from', 'to' or 'service'"
      }
    end
  end

  def create_busy_time
    params = {
        begin: @json['from'].to_datetime,
        end: @json['to'].to_datetime,
        service: @json['service'],
        name: @json['name'] || '',
        phone: @json['phone'] || '',
        info: @json['info'] || ''
    }

    if BusyTime.create(params)
      render json: {status: "saved"}
    else
      render json: {status: "canceled"}
    end

  rescue ArgumentError => e
    render json: {
        error: e.to_s
    }, status: :bad_request

  end

  private

  def check_json!
    @json = JSON.parse(request.body.read)
  rescue JSON::ParserError => e
    render :nothing,
           status: :bad_request

  end


end
