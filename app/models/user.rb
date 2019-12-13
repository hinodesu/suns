class User < ApplicationRecord
    validates :number, presence: true, uniqueness: true
    validate :number_check
    validates :name, presence: true
    validates :kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
    validate :gender_check
    has_secure_password
    #validates :password_confirmation, presence: true
    

    def number_check
        #numberが空の時にエラーメッセージを追加する
        if number.blank?
           errors[:base] << '学籍番号は半角で入力してください'
        end
    end

    def gender_check
        #genderが空の時にエラーメッセージを追加する
        if gender.blank?
            errors[:base] << '性別を選択してください'
        end
    end

end


        #if filename.blank?
         #   errors[:base] << 'ファイルを選択してください'
        #end
      
        #unless filename.blank?
         #   case File.extname(filename)
         #   when".csv"
         #   else
         #       errors[:base] <<'登録できる拡張子はcsvです。'
         #   end
        #end
