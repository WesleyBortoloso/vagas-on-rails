class JobsController < ApplicationController
  before_action :set_job, only: %i[show edit update destroy]

  def index
    @jobs = Job.includes(:company).all
  end

  def show
    @job = Job.includes(applications: :candidate).find(params[:id])
  end

  def new
    @company = Company.find(params[:company_id])
    @job = @company.jobs.build
  end

  def create
    @company = Company.find(params[:company_id])
    result = CreateJobService.new(job_params.merge(company_id: @company.id)).call
  
    if result.success?
      redirect_to result.data, notice: "Vaga criada com sucesso."
    else
      flash.now[:alert] = result.error
      @job = @company.jobs.build(job_params)
      render :new
    end
  end

  def edit; end

  def update
    if @job.update(job_params)
      redirect_to @job, notice: "Vaga atualizada com sucesso."
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to jobs_path, notice: "Vaga removida com sucesso."
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description, :location, :job_type, :company_id)
  end
end
