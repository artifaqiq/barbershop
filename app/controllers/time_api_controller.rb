
class TimeApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :check_json!

  def show_timetable

    from = @json['from'].to_datetime
    to = @json['to'].to_datetime

    frees = FreeTime.where("begin > :from and end < :to", from: from, to: to).to_a
    busys = BusyTime.where("begin > :from and end < :to", from: from, to: to).to_a

    render json: {
        from: from,
        to: to,
        now: Date.today,
        frees: frees.to_s,
        busys: busys.to_s ,
        status: :ok
    }

  end

  def set_free_time

  end

  def set_busy_time

  end

  private

  def check_json!
    @json = JSON.parse(request.body.read)
  rescue JSON::ParserError => e
    render :nothing,
           status: :bad_request

  end


end
