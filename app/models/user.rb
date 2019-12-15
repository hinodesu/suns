class User < ApplicationRecord
    validates :number, presence: true, uniqueness: true
    validates :name, presence: true
    validates :kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
    validate :gender_check
    has_secure_password
    validates :password_confirmation, presence: true
    

    def gender_check
        #genderが空の時にエラーメッセージを追加する
        if gender.blank?
            errors[:base] << '性別を選択してください'
        end
    end

end


