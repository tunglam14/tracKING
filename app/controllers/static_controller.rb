class StaticController < ApplicationController
  before_action :authenticate_user!

  def index
    # render layout: false
  end

  def realtime
    @site = Site.find(cookies[:current_site_id])
    @data = Req.where(client_id: @site.client_id)

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
