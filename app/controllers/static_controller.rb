class StaticController < ApplicationController
  def index
    if user_signed_in?
      # TODO: Implement logic
    else
      @frontpage = true
      render 'static/front'
    end
  end

  def faq
  end

  def about
  end
end
