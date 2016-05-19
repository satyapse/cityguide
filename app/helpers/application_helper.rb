module ApplicationHelper
    
def gravatar_for(customer, options = { size: 80})
    gravatar_id = Digest::MD5::hexdigest(customer.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
	image_tag(gravatar_url, alt:customer.customername, class: "gravatar")
end
	   
    
end
