require "httparty"

class Kele
	include HTTParty

	base_uri 'https://www.bloc.io/api/v1'

	def initialize(username, password)
		post_response = self.class.post('/sessions', body: {username: username, password: password})
		if post_response.code == 404
			puts "#{username} not found!"
		else
			@auth_token = post_response["auth_token"]
		end
	end
end
