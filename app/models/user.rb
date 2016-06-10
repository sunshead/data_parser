class User < ActiveRecord::Base
	has_secure_password #encrypt passowrd with bluefish
end
