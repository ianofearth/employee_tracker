class CreateEmployeesTable < ActiveRecord::Migration
  def change
    create_table(:employees) do |t|
      t.column(:name, :string)
      t.column(:project, :string)
      t.column(:division_id, :int)
    end
  end
end
