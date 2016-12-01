ActiveAdmin.register Service do
  3
  permit_params :title, :description, :photo

  form do |f|
    inputs 'Details' do
      input :title
      input :description
      attachinary_file_field  :photo, class: "form-control"

      actions
    end
  end




end
