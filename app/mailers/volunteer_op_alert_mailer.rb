class VolunteerOpAlertMailer < ApplicationMailer
    def email(subscriber)
        @subscriber = subscriber
        ...
        # Initialize a new email
        @email = SibApiV3Sdk::SendSmtpEmail.new
        # Setup email attributes
        @email.sender = {
        "name": "Liz Fedak testtest",
        "email": "liz@lizfedak.com"
        }
        @email.to = [{ "email": @subscriber.email }]
        @email.html_content = html("<p>String with your html email</p>")
        @email.text_content = text("String with your plain text email")
        @email.subject = "Your subject line"
        @email.reply_to = {
        "email": "volunteermanager@givity.com",
        "name": "Volunteer Services Team"
        }
        # Send your email
        @send_in_blue.send_transac_email(@email)
    end
    private
    def html
        # Create a string with your html email
        "<!DOCTYPE html><html>...</html>"
    end
    def text
        # Create a string with your text email
        "This is the body of my email!"
    end
    end      