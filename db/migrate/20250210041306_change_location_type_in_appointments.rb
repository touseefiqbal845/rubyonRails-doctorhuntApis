class ChangeLocationTypeInAppointments < ActiveRecord::Migration[6.1]
  def change
    change_column :appointments, :location, :json, default: {}
  end
end
