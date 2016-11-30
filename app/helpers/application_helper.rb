module ApplicationHelper



	# All three methods below were necessary to support bootstrap modals for
  # sign-in, sign-up in application layout/navbar.
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  
end
