class Feedback < ApplicationRecord
  # Direct associations

  belongs_to :receiver_user,
             :class_name => "User"

  belongs_to :sender_user,
             :class_name => "User"

  # Indirect associations

  # Validations

end
