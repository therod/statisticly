class PagesController < ApplicationController
  def dashboard
    # @emails = Email.date_range('2016-06-01', '2016-12-31').group_by_day(:date).count
    # @emails = Email.last_week.group_by_day(:date).count
  end
end
