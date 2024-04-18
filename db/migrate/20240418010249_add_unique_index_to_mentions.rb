class AddUniqueIndexToMentions < ActiveRecord::Migration[7.0]
  def change
    add_index :mentions, [:mentioning_report_id, :mentioned_report_id], unique: true
  end
end
