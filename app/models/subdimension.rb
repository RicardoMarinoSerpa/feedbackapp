class Subdimension < ApplicationRecord
  # Direct associations

  has_many   :feedbacks,
             :dependent => :destroy

  belongs_to :role

  # Indirect associations

  # Validations

end
