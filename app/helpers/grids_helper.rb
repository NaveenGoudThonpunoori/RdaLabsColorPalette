module GridsHelper
  def get_color(position)
    Grid.find_by(user_id: session[:user]["id"], position: position).try(:color)
  end

  def most_used(user_id)
    Grid.where(user_id: user_id).select("color, count(color) as counter").group("color").order('count(color) desc').first.color
  end
end
