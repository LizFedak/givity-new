class User < ApplicationRecord
  include ActionText::Attachable


  has_many :experiences 
  has_one :volunteer_profile, :dependent => :destroy
  before_create :create_volunteer_profile
  has_many :posts

  has_many :memberships
  has_many :groups, through: :memberships

  def create_volunteer_profile
    volunteer_profile = build_volunteer_profile(:tagline => "Tagline") 
  end

  has_many :active_relationships,  class_name:  "Relationship",
                                   foreign_key: "follower_id",
                                   dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships

  # Follows a user.
  def follow(other_user)
    following << other_user
  end

  # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :twitter]

  

         def self.find_for_oauth(auth)
          user = User.where(uid: auth.uid, provider: auth.provider).first
      
          unless user
            user = User.create(
              uid:      auth.uid,
              provider: auth.provider,
              email:    auth.info.email,
              password: Devise.friendly_token[0, 20],
              image: auth.info.image,
              name: auth.info.name
            )
          end
      
          user
        end
      
        def self.new_with_session(params, session)
          super.tap do |user|
            if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
              user.email = data["email"] if user.email.blank?
            end
          end
        end

  def to_trix_content_attachment_partial_path
    to_partial_path
  end
      
        private
      
        def self.dummy_email(auth)
        "#{auth.uid}-#{auth.provider}@example.com"
        end
  
  

end
