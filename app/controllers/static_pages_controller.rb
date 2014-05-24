class StaticPagesController < ApplicationController
  def root
    if !!current_user
      render "root"
    else
      render "homepage"
    end
  end
end