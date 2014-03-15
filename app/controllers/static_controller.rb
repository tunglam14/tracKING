class StaticController < ApplicationController
  before_action :authenticate_user!

  def index
    # render layout: false
  end

  def realtime
    render layout: false
  end

  def dashboard
    render layout: false
  end

  def visitor
    render layout: false
  end

  def page
    render layout: false
  end

  def system
    render layout: false
  end
end
