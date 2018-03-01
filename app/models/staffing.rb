class Staffing < ApplicationRecord
  # Direct associations

  has_many   :feedbacks,
             :dependent => :destroy

  belongs_to :role

  belongs_to :project

  belongs_to :user

  # Indirect associations

  # Validations

end
