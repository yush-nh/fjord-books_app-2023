class ChangeColumnToNull < ActiveRecord::Migration[7.0]
  def up
    change_column_null :reports, :title, true
    change_column_null :reports, :content, true
  end

  def down
    change_column_null :reports, :title, false
    change_column_null :reports, :content, false
  end
end
