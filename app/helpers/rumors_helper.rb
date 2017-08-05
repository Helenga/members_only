module RumorsHelper

def has_prime_key?
	logged_in? && @current_user.prime_key
end

end
