class Dimension < ApplicationRecord
  # Direct associations

  has_many   :subdimensions,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
