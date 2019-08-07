class User < ApplicationRecord
  
  has_many :experiences 
  has_one :volunteer_profile, :dependent => :destroy
  before_create :create_volunteer_profile
  has_many :groups
  has_many :posts

  def create_volunteer_profile
    volunteer_profile = build_volunteer_profile(:tagline => "Tagline") 
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
      
        private
      
        def self.dummy_email(auth)
        "#{auth.uid}-#{auth.provider}@example.com"
        end
  
        

end
