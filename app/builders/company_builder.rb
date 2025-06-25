class CompanyBuilder
  def initialize
    @company = Company.new
  end

  def with_name(name)
    @company.name = name
    self
  end

  def with_cnpj(cnpj)
    @company.cnpj = cnpj
    self
  end

  def with_description(description)
    @company.description = description
    self
  end

  def build
    @company
  end

  def save!
    @company.save!
    @company
  end
end
