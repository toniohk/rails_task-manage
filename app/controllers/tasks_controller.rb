class TasksController < SessionController
  before_action :set_task, only: [:show, :update, :destroy]

  # GET /tasks
  def index
    @tasks = Task.all
    json_response(@tasks)
  end
  
  # POST /tasks
  def create
    if params[:parent_id]
      @task = Task.create!(task_params)
      @task_relation = TaskRelation.create(parent_id: params[:parent_id], child_id: @task.id)
      json_response(@task, :created)
    else
      @task = Task.create!(task_params)
      json_response(@task, :created)
    end
  end
  
  # GET /tasks/:id
  def show
    json_response(@task)
  end
  
  # PUT /tasks/:id
  def update
    @task.update(task_params)
    head :no_content
  end
  
  # DELETE /tasks/:id
  def destroy
    @task.destroy
    head :no_content
  end
  
  private
  
  def task_params
    params.permit(:title, :description, :work_focus, :due_date, :status, :user_id)
  end
  
  def set_task
    @task = Task.find(params[:id])
  end
end
