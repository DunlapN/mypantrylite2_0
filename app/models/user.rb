class User < ApplicationRecord
  # Direct associations

  has_many   :recipes,
             :foreign_key => "creator_id",
             :dependent => :destroy

  has_many   :pantry_items,
             :foreign_key => "userid",
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :username, :uniqueness => true

  validates :username, :presence => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
