class AddAttachmentsToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :attachments, :json, default: []
  end
end
