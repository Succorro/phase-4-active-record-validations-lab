class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}
    validate :sufficiently_clickbait_y

    CLICKBAIT_OPTIONS = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
    ]

    def sufficiently_clickbait_y
        if CLICKBAIT_OPTIONS.none? { |opt| opt.match title}
            errors.add(:title, "must be clickbait")
        end
    end

end
