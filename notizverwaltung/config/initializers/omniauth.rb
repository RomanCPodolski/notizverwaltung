OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, ENV['582968218443424'],ENV['0fb46a795587bbd39e76b00dfa4cd268']
end