class ChangeEffectiveFlagOfGenres < ActiveRecord::Migration[5.2]
  # ↓はtasksテーブルのtext型statusカラムのデフォルトを'START'に変更したいという記述
  def up
    change_column :genres, :effective_flag, :boolen
  end

# ↓は元々の状態

  def down
    change_column :genres, :effective_flag, :boolen, default: true
  end
end
