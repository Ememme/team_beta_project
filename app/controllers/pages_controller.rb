class PagesController < ApplicationController
  skip_before_action :authenticate_student!, only: :home

  def home
  end

  def about
  end
end
