class ProvisionController < ApplicationController

  def index
    @provisions = Provision.joins(:user).select("provisions.*, users.name AS user_name")
  end

  def show
    @provision = Provision.joins(:user).select("provisions.*, users.name AS user_name").find(params[:id])
  end

end
