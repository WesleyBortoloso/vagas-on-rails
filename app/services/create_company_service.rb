class CreateCompanyService
  def initialize(params)
    @params = params
  end

  def call
    builder = CompanyBuilder.new
      .with_name(@params[:name])
      .with_cnpj(@params[:cnpj])
      .with_description(@params[:description])

    company = builder.build

    if company.save
      Result.success(company)
    else
      Result.failure(company.errors.full_messages.to_sentence)
    end
  end
end
