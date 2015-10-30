class TodosController < ApplicationController

def create
    @project = Project.find(params[:project_id])
    @todo = @project.todos.create(todo_params)
    respond_to do |format|
      format.js {}
      format.html
    end

  end
 
  private
    def todo_params
      params.require(:todo).permit(:title, :status, :description)
    end
end
