class MovesController < ApplicationController
  def index
    @moves = Move.joins(:user_take, :user_register, move_details: :site_to).distinct()
  end

  def edit
    @move = Move.find_by_id(params[:id])
    @move_details = MoveDetail.joins(:inventory).where(move_id: params[:id])
  end

  def update
  end

  def show
  end

  def destroy_move_detail

  end
end
