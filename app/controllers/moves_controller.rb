class MovesController < ApplicationController
  def index
    @moves = Move.joins(:user_take, :user_register, :move_details)
  end
end
