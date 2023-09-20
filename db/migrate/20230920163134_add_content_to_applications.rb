class AddContentToApplications < ActiveRecord::Migration[7.0]
  def change
    add_column :applications, :content, :text
  end
end
