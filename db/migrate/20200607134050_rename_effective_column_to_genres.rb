class RenameEffectiveColumnToGenres < ActiveRecord::Migration[5.2]
  def change
    rename_column :genres, :effective, :effective_flag
  end
end
