require "httparty"

class Kele
	include HTTParty

	base_uri 'https://www.bloc.io/api/v1'

	def initialize(email, password)
		post_response = self.class.post('/sessions', body: {email: email, password: password})
		if post_response.code == 404
			puts "#{email} not found!"
		else
			@auth_token = post_response["auth_token"]
		end
	end
end
