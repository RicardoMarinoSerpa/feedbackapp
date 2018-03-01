class User < ApplicationRecord
  # Direct associations

  has_many   :received_feedbacks,
             :class_name => "Feedback",
             :foreign_key => "receiver_user_id",
             :dependent => :destroy

  has_many   :sent_feedbacks,
             :class_name => "Feedback",
             :foreign_key => "sender_user_id",
             :dependent => :destroy

  has_many   :staffings,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
