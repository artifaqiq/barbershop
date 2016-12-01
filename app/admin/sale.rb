ActiveAdmin.register Sale do
  permit_params :title, :percent, :description, :photo

  form do |f|
    inputs 'Details' do
      input :title
      input :percent
      input :description
      attachinary_file_field  :photo, class: "form-control"

      actions
    end
  end


end
