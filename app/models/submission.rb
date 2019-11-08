class Submission < ApplicationRecord
    validate :error_check

    def error_check
        #subjectが空のときにエラーメッセージを追加する
        if subject.blank?
            errors.[:base] << '科目名を入力してください'
        end
    end
    
end
