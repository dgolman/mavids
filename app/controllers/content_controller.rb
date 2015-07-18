class ContentController < ApplicationController
  before_action :authenticate_user!

  def silver
    @videos = Video.all
    redirect_to root_path, :notice => "Access denied." unless current_user.silver?
  end

  def gold
    @videos = Video.all
    redirect_to root_path, :notice => "Access denied." unless current_user.gold?
  end

  def platinum
    @videos = Video.all
    redirect_to root_path, :notice => "Access denied." unless current_user.platinum?
  end

end
