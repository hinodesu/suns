class AnnualEvent < ApplicationRecord
validate :error_check

def error_check
    if filename.blank?
      errors[:base] << 'ファイルを選択してください'
    end
end

end