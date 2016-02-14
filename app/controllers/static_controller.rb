class StaticController < ApplicationController
  def index
    if user_signed_in?
      # TODO: Implement logic
    else
      render 'static/front'
    end
  end

  def faq
  end

  def about
  end

  def terms
  end

  def coc
  end
end
