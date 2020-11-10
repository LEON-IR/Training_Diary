class Menu < ApplicationRecord

	belongs_to :user
	belongs_to :genre, optional: true
	accepts_nested_attributes_for :genre
	has_many :favorites
	has_many :menu_comments, dependent: :destroy

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

	def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end

end
