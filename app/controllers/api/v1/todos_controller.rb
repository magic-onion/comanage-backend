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
    @community = Community.find_by(id: params[:todo][:community_id])
    todos = @community.todos
    todo = todos.sort_by {|todo| todo.created_at}
    tod = todos.reverse
    render json: tod
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.likes = 0
    @todo.boos = 0
    @todo.save
    @todos = Community.find_by(id: params[:todo][:community_id]).todos
    render json: {todo: TodoSerializer.new(@todo), todos: @todos}
  end

  def destroy
    @todo = Todo.find_by(id: params[:id])
    @todo.destroy
    @community = Community.find_by(id: params[:todo][:community_id])
    render json: {todos: @community.todos}

  end


  private

  def todo_params
    params.require(:todo).permit(:user_id, :community_id, :likes, :boos, :body, :action, :reaction_id)
  end


end
