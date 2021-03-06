class ProjectsController < SessionController
  before_action :set_project, only: [:show, :update, :destroy]

  # GET /projects
  def index
    @projects = Project.all
    json_response(@projects)
  end
  
  # POST /projects
  def create
    @project = Project.create!(project_params)
    json_response(@project, :created)
  end
  
  # GET /projects/:id
  def show
    json_response(@project)
  end
  
  # PUT /projects/:id
  def update
    @project.update(project_params)
    head :no_content
  end
  
  # DELETE /projects/:id
  def destroy
    @project.destroy
    head :no_content
  end
  
  private
  
  def project_params
    params.permit(:title, :description, :due_date, :user_id, :task_id)
  end
  
  def set_project
    @project = Project.find(params[:id])
  end
end
