class Project < ApplicationRecord
  # Direct associations

  has_many   :staffings,
             :dependent => :destroy

  # Indirect associations

  has_many   :roles,
             :through => :staffings,
             :source => :role

  has_many   :users,
             :through => :staffings,
             :source => :user

  # Validations

end
