class AddColumnToDestination < ActiveRecord::Migration[7.0]
  def change
    add_column :destinations, :title, :string
  end
end
