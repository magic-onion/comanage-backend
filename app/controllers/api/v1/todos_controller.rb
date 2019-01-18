class Api::V1::TodosController < ApplicationController


  def index
    @todos = Todo.all
    render json: @todos
  end

  def show
    @todo = Todo.find_by(id: params[:id])
    render json: {todo: TodoSerializer.new(@todo)}
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.date = Time.now
    @todo.save
    render json: {todo: TodoSerializer.new(@todo)}
  end


  private

  def todo_params
    params.require(:todo).permit(:user_id, :community_id, :likes, :boos, :body)
  end


end
