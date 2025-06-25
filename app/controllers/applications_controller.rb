class ApplicationsController < ApplicationController
  def index
    @applications = Application.includes(:candidate, :job).all
  end

  def show
    @application = Application.find(params[:id])
  end

  def create
    candidate = Candidate.find(params[:candidate_id])
    job = Job.find(params[:job_id])

    result = ApplyForJobService.new(candidate:, job:).call

    if result.success?
      redirect_to job_path(job), notice: "Candidatura realizada com sucesso!"
    else
      redirect_to job_path(job), alert: result.error
    end
  end

  def destroy
    application = Application.find(params[:id])
    application.destroy
    redirect_to applications_path, notice: "Candidatura removida com sucesso."
  end
end
