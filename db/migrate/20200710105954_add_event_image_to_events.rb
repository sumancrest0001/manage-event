class AddEventImageToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :event_image, :text
  end
end
