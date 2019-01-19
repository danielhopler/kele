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

end
