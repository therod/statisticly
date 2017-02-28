class Email < ApplicationRecord
  scope :date_range, ->(date1, date2) { where("date between ? and ?", date1.to_date, date2.to_date ) }
  scope :this_week, -> { where("date between ? and ?", (Date.today.beginning_of_week),(Date.today.end_of_week) ) }
  scope :last_week, -> { where("date between ? and ?", (Date.today.beginning_of_week - 1.week),(Date.today.end_of_week - 1.week) ) }
  scope :this_year, -> { where("date between ? and ?", (Date.today.beginning_of_year),(Date.today) ) }
end
