class CandidateBuilder
  def initialize
    @candidate = Candidate.new
  end

  def with_name(name)
    @candidate.name = name
    self
  end

  def with_email(email)
    @candidate.email = email
    self
  end

  def with_resume(resume)
    @candidate.resume = resume
    self
  end

  def build
    @candidate
  end

  def save!
    @candidate.save!
    @candidate
  end
end
