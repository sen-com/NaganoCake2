class Add2EffectiveFlagOfGenres < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :effective_flag, :boolean
  end
end
