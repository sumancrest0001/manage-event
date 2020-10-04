class RemoveImageNameFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :event_image, :text
  end
end
