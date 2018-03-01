class Role < ApplicationRecord
  # Direct associations

  has_many   :subdimensions,
             :dependent => :destroy

  has_many   :staffings,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
