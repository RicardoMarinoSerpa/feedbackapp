class Role < ApplicationRecord
  # Direct associations

  has_many   :subdimensions,
             :dependent => :destroy

  has_many   :staffings,
             :dependent => :destroy

  # Indirect associations

  has_many   :projects,
             :through => :staffings,
             :source => :project

  has_many   :users,
             :through => :staffings,
             :source => :user

  # Validations

end
