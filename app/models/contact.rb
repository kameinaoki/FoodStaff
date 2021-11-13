class Contact < ApplicationRecord
  
  validates :email, presence: true, length: {maximum:255},
                    # 有効なメールアドレス（sample@sample.comなど）かどうかを判別するため正規表現
                    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
  validates :message, presence: true

  
end
