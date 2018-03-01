class Project < ApplicationRecord
  # Direct associations

  has_many   :staffings,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
