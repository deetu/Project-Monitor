class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end
	
	
  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @projects = Project.all

    respond_to do |format|
      if @project.save
        format.html {  }
        format.js {}
        flash.now[:notice] = 'Project was successfully created.'
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def updateStatus
    @todo = Todo.find_by(description: params[:rowId])
    @project = Project.find(@todo.project_id)
    respond_to do |format|
      if @todo.update_attribute(:status, params[:isChecked])
        format.js { render :file => "/todos/create.js.erb" }
        # format.html { redirect_to root_path }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end

    end
    # @users = User.all
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    @projects = Project.all
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to root_url, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
        format.js { render :action => "create" }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.'  }
      format.json { head :no_content }
      # flash.now[:notice] = 'Project was successfully destroyed.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :Description)
    end
end
