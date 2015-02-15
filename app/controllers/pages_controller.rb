class PagesController < ApplicationController
  def home
  	@skip_footer = true
  	@skip_header = true
  end
end
