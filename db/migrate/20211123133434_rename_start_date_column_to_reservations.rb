class RenameStartDateColumnToReservations < ActiveRecord::Migration[5.2]
  def change
    rename_column :reservations, :start_date, :start_data
    rename_column :reservations, :end_date, :end_data
  end
end
