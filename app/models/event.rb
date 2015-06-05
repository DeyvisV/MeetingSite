class Event < ActiveRecord::Base
  #belongs_to :organizer, class_name: "User"
  belongs_to :user

  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]
  #friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
      :title,
      [:title, :location],
    ]
  end

  # To add slugs to events created previously, in rails c
  # > Event.find_each(&:save)


end

