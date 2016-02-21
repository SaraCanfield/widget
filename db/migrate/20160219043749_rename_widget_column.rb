class RenameWidgetColumn < ActiveRecord::Migration
  def change
  	rename_column :invoices, :type, :widgetType
  end
end
