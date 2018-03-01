class Mentorship < ApplicationRecord
  # Direct associations

  belongs_to :mentee,
             :class_name => "User"

  belongs_to :mentor,
             :class_name => "User"

  # Indirect associations

  # Validations

end
