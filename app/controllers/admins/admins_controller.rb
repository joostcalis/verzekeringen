class Admins::AdminsController < ApplicationController
  before_action :authenticate_admin!
end
