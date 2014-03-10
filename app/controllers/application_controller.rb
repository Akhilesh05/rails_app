class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	def redirect_to_https
		redirect_to "https://" + request.host + request.fullpath unless (request.ssl? || request.local?)
		#redirect_to protocol: "https://" unless (request.ssl? || request.local?)
	end
	def redirect_to_http
		redirect_to "http://" + request.host + request.fullpath unless !request.ssl?
		#redirect_to protocol: "http://" unless !request.ssl?
	end
end
