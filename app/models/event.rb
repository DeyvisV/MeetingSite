class Event < ActiveRecord::Base
  #belongs_to :organizer, class_name: "User"
  belongs_to :user
end
