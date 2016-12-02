class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :rank ]

  def home
  end
  def rank
    @users = User.all.sort_by { |user| user.points}.reverse
  end

  class Numeric
  def percent_of(n)
    self.to_f / n.to_f * 100.0
  end
end
end
