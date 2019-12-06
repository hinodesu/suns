class Notification < ApplicationRecord

 validate :error_check

  def error_check
    if filename.blank?
      errors[:base] << 'ファイルを選択してください'
    end

    if category.blank?
      errors[:base] << 'カテゴリーを選択してください'
    end

    if d_day.blank?
      errors[:base] << '表示日付を選択してください'
    end

  end
end
