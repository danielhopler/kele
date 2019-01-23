require "httparty"
require "json"
require "./lib/roadmap"

class Kele
	include HTTParty
	include Roadmap
	base_uri 'https://www.bloc.io/api/v1'

	def initialize(email, password)
		post_response = self.class.post('/sessions', body: {email: email, password: password})
		if post_response.code == 404
			puts "#{email} not found!"
		else
			@auth_token = post_response["auth_token"]
			puts "#{email} logged in!"
		end
	end

	def get_me
		response = self.class.get('/users/me', headers: { "authorization" => @auth_token })
		JSON.parse response.body, symbolize_names: true
	end

	def get_mentor_availability(mentor_id)
		response = self.class.get("/mentors/#{mentor_id}/student_availability", headers: { "authorization" => @auth_token } )
		JSON.parse(response.body)
	end

	def get_messages(page = 1)
		response = self.class.get("/message_threads", headers: { "authorization" => @auth_token }, body: {"page": page} )
		JSON.parse response.body
	end

	def create_message(sender, recipient, subject, msg, token = nil)
		if token == nil
			post_response = self.class.post('/messages', headers: { "authorization" => @auth_token }, body: {"sender": sender, "recipient_id": recipient, "subject": subject, "stripped-text": msg})
		else
			post_response = self.class.post('/messages', headers: { "authorization" => @auth_token }, body: {"sender": sender, "recipient_id": recipient, "token": token, "subject": subject, "stripped-text": msg})
		end

		if post_response.success?
			puts "Your message was sent!"
		else
			puts "There was an error sending your message."
		end
	end

end
