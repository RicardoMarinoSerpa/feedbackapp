class Staffing < ApplicationRecord
  # Direct associations

  belongs_to :role

  belongs_to :project

  belongs_to :user

  # Indirect associations

  # Validations

end
