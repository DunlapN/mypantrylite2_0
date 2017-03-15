class User < ApplicationRecord
  # Direct associations

  has_many   :recipes,
             :foreign_key => "creator_id",
             :dependent => :destroy

  has_many   :pantry_items,
             :foreign_key => "userid",
             :dependent => :destroy

  has_many   :meals,
             :foreign_key => "user_id",
             :dependent => :destroy
  # Indirect associations

  has_many :food_items, :through => :pantry_items, :source => :food


  # Validations

  validates :username, :uniqueness => true

  validates :username, :presence => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
