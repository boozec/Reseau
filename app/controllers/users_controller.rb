class UsersController < ApplicationController
  def signup
    @page_title = "Registrazione"
    @errors = ''
  end

  def signin
    @page_title = "Login"
    @errors = ''
  end
end
