class Submission < ApplicationRecord
    validate :error_check

    def error_check
        #subjectが空のときにエラーメッセージを追加する
        if subject.blank?
            errors[:base] << '科目を入力してください'
        end
        if title.blank?
            errors[:base] << 'タイトルを入力してください'
        end
        if deadline.blank?
            errors[:base] << '期限を選択してください'
        end
    end
    
end
