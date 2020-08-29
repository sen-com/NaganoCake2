class RemoveEffectiveFlagOfGenres < ActiveRecord::Migration[5.2]
  def up
    remove_column :genres, :effective_flag
  end

  def down
    add_column :genres, :effective_flag, :boolean
  end
end
