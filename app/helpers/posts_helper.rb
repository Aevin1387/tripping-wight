module PostsHelper
  def month_year(post)
    post.created_at.strftime("%B %Y")
  end

  def created_day(post)
    post.created_at.strftime("%d")
  end

  def created_day_name(post)
    post.created_at.strftime("%^A")
  end
  # def get_month_year(post)
  #   post.created_at.strftime("%B %Y")
  # end

  # def get_date_string(post)
  #   post.created_at.strftime("%D")
  # end

  # def get_time_string(post)
  #   post.created_at.strftime("%R")
  # end
end
