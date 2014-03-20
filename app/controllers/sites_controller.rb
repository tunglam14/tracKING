class SitesController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    begin
      site = Site.new(params[:site].permit!)

      if site.save
        @status = "OK"
        flash[:success] = "Create OK"
      else
        @status = "Fail"
      end
    rescue
      @status = "Fail"
    end

    respond_to do |format|
      format.js
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    render layout: false
  end

  def show
  end
end
