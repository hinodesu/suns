class User < ApplicationRecord
    has_secure_password

    validates :kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
    validate :error_check
    

    def error_check
        #numberが空の時にエラーメッセージを追加する
        if number.blank?
            errors[:base] << '学籍番号を入力してください'
        end

        #nameが空の時にエラーメッセージを追加する
        if name.blank?
            errors[:base] << '名前を入力してください' 
        end

        #kanaが空の時にエラーメッセージを追加する
        if kana.blank?
            errors[:base] << 'フリガナを入力してください'
        end

        #genderが空の時にエラーメッセージを追加する
        if gender.blank?
            errors[:base] << '性別を選んでください'
        end

        #passwordが空の時にエラーメッセージを追加する
        if password.blank?
            errors[:base] << 'パスワードを入力してください'
        end

    end
end
