class Api::V1::TodosController < ApplicationController


  def index
    @todos = Todo.all
    render json: @users
  end

  def show
    @todo = Todo.find_by(id: params[:id])
    render json: (todo: TodoSerializer.new(@todo))
  end

  def create
    byebug
    @todo = Todo.create(todo_params)
    render json: {todo: TodoSerializer.new(@todo)}
  end


  private

  def todo_params
    params.require(:todo).permit(:user_id, :community_id, :likes, :boos, :body)
  end


end
