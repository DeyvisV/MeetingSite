class Event < ActiveRecord::Base
  #belongs_to :organizer, class_name: "User"
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings


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

  # Setter 
  def all_tags=(names)
    self.tags = names.split(",").map do |t|
        Tag.where(name: t.strip).first_or_create!
    end
  end

  # Getter
  def all_tags
    self.tags.map(&:name).join(", ")
  end
  

   


end

