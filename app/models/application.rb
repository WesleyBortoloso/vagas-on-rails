class Application < ApplicationRecord
  belongs_to :candidate
  belongs_to :job

  enum status: { 
    pending: "pending", 
    approved: "approved", 
    rejected: "rejected" 
  }
end