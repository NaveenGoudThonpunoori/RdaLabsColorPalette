class Grids::SetOrUpdateColor
  attr_reader :params, :grid

  def initialize(params)
    @params = params
    @grid = find_grid
  end

  def self.call(params)
    new(params).call
  end

  def call
    assign_columns
    save!
  end

  def assign_columns
    
 
    grid.user_id = params[:user_id]
    grid.position = params[:position]
    grid.color = params[:color]
  end

  def save!
    grid.save!
  end

  def find_grid
    Grid.find_by(user_id: params[:user_id], position: params[:position]) || Grid.new
  end
end
