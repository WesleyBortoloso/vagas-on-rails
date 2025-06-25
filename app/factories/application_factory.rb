class ApplicationFactory
  def self.build(candidate:, job:)
    Application.new(
      candidate: candidate,
      job: job,
      status: "pending"
    )
  end
end