class ApplyForJobService
  def initialize(candidate:, job:)
    @candidate = candidate
    @job = job
  end

  def call
    return Result.failure("Candidato já aplicado a esta vaga.") if already_applied?

    application = ApplicationFactory.build(candidate: @candidate, job: @job)
    application.save!
    Result.success(application)
  rescue => e
    Result.failure(e.message)
  end

  private

  def already_applied?
    Application.exists?(candidate: @candidate, job: @job)
  end
end