class StaticController < ApplicationController
  before_action :authenticate_user!

  def index
    # render layout: false
  end

  def realtime
    @site = Site.find(cookies[:current_site_id])
        # get online user
    now = Time.now.to_i
    before_15m = now - 900 # 900 second
    time_at_15m = Time.at(before_15m)
    @online = Req.distinct.where("client_id = ? AND created_at > ? ", @site.client_id, time_at_15m).count(:ip)

    # Show detail 10 requests
    @data = Req.where("client_id = ? AND created_at > ? ", @site.client_id, time_at_15m).limit(10).order(created_at: :desc)
    render layout: false
  end

  def dashboard
    @site = Site.find(cookies[:current_site_id])

    @req = Req.where("client_id = ?", @site.client_id)

    @total = @req.count
    @unique = @req.distinct.count(:ip)

    @total_pageview = @req.distinct.count(:location)

    @top_5_ip = @req.limit(5).count(:group => :ip).sort_by {|k, v| v}.reverse

    @top_5_os = @req.limit(5).count(:group => :useragent).sort_by {|k, v| v}.reverse

    @top_5_location = @req.limit(5).count(:group => :location).sort_by {|k, v| v}.reverse

    @top_5_referrer = @req.limit(5).count(:group => :referrer).sort_by {|k, v| v}.reverse

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
