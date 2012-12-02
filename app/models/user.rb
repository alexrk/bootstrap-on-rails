class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable and :omniauthable, :confirmable
  devise :database_authenticatable, :registerable, :recoverable,
    :rememberable, :trackable, :validatable, :lockable, :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
    :username

  validates :username, :presence => true, :length => 5..50, :uniqueness => true,
    :format => { :with => %r{[A-Za-z][-_A-Za-z0-9]+}, :message => "only alpha characters allowed" }
end
