class SitesController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    begin
      if current_user.site.create(params[:site].permit!)
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
    @id = params[:id]
    @site = Site.find(@id)

    @status = @site.destroy ? true : false

    respond_to do |format|
      format.js
    end
  end

  def index
    render layout: false
  end

  def show
  end
end
