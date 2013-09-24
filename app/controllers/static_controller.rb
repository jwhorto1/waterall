class StaticController < ApplicationController
  before_filter :authenticate_user!
  
  def about
  end

  def index
  end

  def contact
  end

  def social
  end

  def tos    
  end

  def blog
  end
end
