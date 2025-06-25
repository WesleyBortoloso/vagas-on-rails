class CreateJobService
  def initialize(params)
    @params = params
  end

  def call
    builder = JobBuilder.new
      .with_title(@params[:title])
      .with_description(@params[:description])
      .with_location(@params[:location])
      .with_type(@params[:job_type])
      .with_company(Company.find(@params[:company_id]))

    job = builder.build

    if job.save
      Result.success(job)
    else
      Result.failure(job.errors.full_messages.to_sentence)
    end
  end
end
