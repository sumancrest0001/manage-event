class PagesController < ApplicationController
  def home
    @past_events = Event.past
    @upcoming_events = Event.upcoming
    @latest_events = Event.top_3
  end

  def about
  end
end
