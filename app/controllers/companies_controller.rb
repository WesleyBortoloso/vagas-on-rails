class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit update destroy]

  def index
    @companies = Company.all
  end

  def show; end

  def new
    @company = Company.new
  end

  def create
    result = CreateCompanyService.new(params[:company]).call
  
    if result.success?
      redirect_to result.data, notice: "Empresa criada com sucesso."
    else
      flash.now[:alert] = result.error
      @company = Company.new(params[:company])
      render :new
    end
  end

  def edit; end

  def update
    if @company.update(company_params)
      redirect_to @company, notice: "Empresa atualizada com sucesso."
    else
      render :edit
    end
  end

  def destroy
    @company.destroy
    redirect_to companies_path, notice: "Empresa removida com sucesso."
  end

  private

  def set_company
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:name, :cnpj, :description)
  end
end
