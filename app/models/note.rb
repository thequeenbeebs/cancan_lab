class Note < ApplicationRecord
  belongs_to :user

  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  def visible_to
    readers.map(&:name).join(',')
  end

  def visible_to=(viewer_list)
    viewer_names = viewer_list.gsub(/\s+/, '').split(',').compact
    eligible = User.where(name: viewer_names).to_a
    eligible << user if user
    self.readers = eligible.uniq
    visible_to
  end
end
