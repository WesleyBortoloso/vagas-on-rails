class CandidatesController < ApplicationController
  before_action :set_candidate, only: %i[show edit update destroy]

  def index
    @candidates = Candidate.all
  end

  def show; end

  def new
    @candidate = Candidate.new
  end

  def create
    result = RegisterCandidateService.new(params[:candidate]).call
  
    if result.success?
      redirect_to result.data, notice: "Candidato registrado com sucesso."
    else
      flash.now[:alert] = result.error
      @candidate = Candidate.new(params[:candidate])
      render :new
    end
  end

  def edit; end

  def update
    if @candidate.update(candidate_params)
      redirect_to @candidate, notice: "Candidato atualizado com sucesso."
    else
      render :edit
    end
  end

  def destroy
    @candidate.destroy
    redirect_to candidates_path, notice: "Candidato removido com sucesso."
  end

  private

  def set_candidate
    @candidate = Candidate.find(params[:id])
  end

  def candidate_params
    params.require(:candidate).permit(:name, :email, :resume)
  end
end
