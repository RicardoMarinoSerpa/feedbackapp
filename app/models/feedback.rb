class Feedback < ApplicationRecord
  # Direct associations

  belongs_to :sender_user,
             :class_name => "User"

  # Indirect associations

  # Validations

end
