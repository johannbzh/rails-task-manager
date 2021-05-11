class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # Display all tasks
  def index
    @tasks = Task.all
  end

  # Display details of given task
  def show; end

  # Create a new task
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  # Update an existing task
  def edit; end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  # Delete an existing task
  def destroy
    @task.destroy
    redirect_to tasks_path(@task)
  end


  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
