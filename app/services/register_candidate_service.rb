class RegisterCandidateService
  def initialize(params)
    @params = params
  end

  def call
    builder = CandidateBuilder.new
      .with_name(@params[:name])
      .with_email(@params[:email])
      .with_resume(@params[:resume])

    candidate = builder.build

    if candidate.save
      Result.success(candidate)
    else
      Result.failure(candidate.errors.full_messages.to_sentence)
    end
  end
end
