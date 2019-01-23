class Api::V1::TodosController < ApplicationController


  def index
    @todos = Todo.all
    render json: @todos
  end

  def show
    @todo = Todo.find_by(id: params[:id])
    render json: {todo: TodoSerializer.new(@todo)}
  end

  def update
    @todo = Todo.find_by(id: params[:id])
    @todo.update(todo_params)
    @todos = Todo.all
    render json: @todos
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.save
    render json: {todo: TodoSerializer.new(@todo)}
  end


  private

  def todo_params
    params.require(:todo).permit(:user_id, :community_id, :likes, :boos, :body, :action, :reaction_id)
  end


end
