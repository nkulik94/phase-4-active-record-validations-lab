class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :check_clickbait

    # def check_clickbait
    #     if title
    #         unless title.match?(/Won't Believe/) || title.match?(/Secret/) || title.match?(/Guess/) || (title.match?(/Top/) && title.match?(/[1-9]/))
    #             errors.add(:title, 'sorry dude')
    #         end
    #     end
    # end

    def check_clickbait
        required = ["Won't Believe", "Secret", "Guess"]
        if title
            unless required.find { |str| title.include?(str) }
                errors.add(:title, 'sorry dude')
            end
        end
    end
end
