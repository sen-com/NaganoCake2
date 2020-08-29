class AddDefaultEffectiveFlagOfGenres < ActiveRecord::Migration[5.2]
  def up
    change_column :genres, :effective_flag, :boolean, default: true
  end
  def down
    change_column :genres, :effective_flag, :boolean
  end
end
