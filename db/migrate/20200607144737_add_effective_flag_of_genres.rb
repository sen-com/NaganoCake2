class AddEffectiveFlagOfGenres < ActiveRecord::Migration[5.2]
  def up
    change_column :genres, :effective_flag, :boolen, default: nil
  end

# ↓は元々の状態

  def down
    change_column :genres, :effective_flag, :boolen, default: true
  end
end
