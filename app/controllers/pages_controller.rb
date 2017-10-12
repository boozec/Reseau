class PagesController < ApplicationController
  def index
  end

  def about
    @page_title = 'About'
  end
end
