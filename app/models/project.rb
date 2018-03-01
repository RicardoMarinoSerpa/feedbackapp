class Project < ApplicationRecord
  # Direct associations

  has_many   :staffings,
             :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :staffings,
             :source => :user

  # Validations

end
