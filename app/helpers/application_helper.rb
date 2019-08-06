module ApplicationHelper

    def full_title(page_title = '')
        base_title = "Givity"
        if page_title.empty?
          base_title
        else
          page_title + " | " + base_title
        end
      end

      def avatar_url(user)
        
        if user.image
          "http://graph.facebook.com/#{user.uid}/picture?type=large"
        else
          gravatar_id = Digest::MD5::hexdigest(user.email).downcase
          "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identical&s=150"
        end
      end   
      
end
