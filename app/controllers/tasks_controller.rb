class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    def index
        @tasks = Task.all
    end
    
    def show
        set_task
    end

    def new
        @task = Task.new
    end
    
    def create
        # @task = Task.new(task_params)
        @task = current_user.tasks.build(task_params)
        if @task.save
            flash[:success] = 'Task が追加されました'
            redirect_to @task
        else 
            flash.now[:danger] = 'Taskの追加に失敗しました'
            render :new
        end
    end
    
    def edit
        set_task
    end

    def update
        if @task.update(task_params)
            flash[:success] = 'Taskが正常に更新されました'
            redirect_to @task
        else 
            flash.now[:danger] = 'Taskの更新に失敗しました'
            render :edit
        end
        
    end
    
    def destroy
        @task.destroy
        flash[:success] = 'Taskが削除されました'
        redirect_to root_path
        
    end
    
    private
    
    def set_task
        @task = Task.find(params[:id])
    end
    
    def task_params
        params.require(:task).permit(:content,:status)
    end
    
end
