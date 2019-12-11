class User < ApplicationRecord
    validates :number, presence: true, uniqueness: true
    validates :name, presence: true
    validates :kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
    has_secure_password
    #validates :password_confirmation, presence: true
    validate :error_check
    

    def error_check
        #numberが空の時にエラーメッセージを追加する
        if number.blank?
           errors[:base] << '学籍番号は半角で入力してください'
        end

        #nameが空の時にエラーメッセージを追加する
        # if name.blank?
        #    errors[:base] << '名前を入力してください' 
        #end

        #kanaが空の時にエラーメッセージを追加する
        #if kana.blank?
        #    errors[:base] << 'フリガナを入力してください'
        #end

        #genderが空の時にエラーメッセージを追加する
        if gender.blank?
            errors[:base] << '性別を選択してください'
        end

        if filename.blank?
            errors[:base] << 'ファイルを選択してください'
        end
      
        #passwordが空の時にエラーメッセージを追加する
        #if password.blank?
        #   errors[:base] << 'パスワードを入力してください'
        #end

        unless filename.blank?
            case File.extname(filename)
            when".csv"
            else
                errors[:base] <<'登録できる拡張子はcsvです。'
            end
        end
    
    end


end
