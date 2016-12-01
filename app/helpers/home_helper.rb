module HomeHelper
  def col_sm_image(count_images)

    if count_images % 3 == 0
      4
    elsif count_images % 2 == 0
      6
    else
      12
    end

  end
end
