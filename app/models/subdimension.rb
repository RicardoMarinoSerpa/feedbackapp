class Subdimension < ApplicationRecord
  # Direct associations

  belongs_to :dimension

  has_many   :feedbacks,
             :dependent => :destroy

  belongs_to :role

  # Indirect associations

  # Validations

end
