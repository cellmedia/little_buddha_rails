class ChangeBodyToTextInContact < ActiveRecord::Migration
  def change
    change_column :contacts, :body, :text
  end
end
