class JobBuilder
  def initialize
    @job = Job.new
  end

  def with_title(title)
    @job.title = title
    self
  end

  def with_description(description)
    @job.description = description
    self
  end

  def with_location(location)
    @job.location = location
    self
  end

  def with_type(type)
    @job.job_type = type
    self
  end

  def with_company(company)
    @job.company = company
    self
  end

  def build
    @job
  end

  def save!
    @job.save!
    @job
  end
end
