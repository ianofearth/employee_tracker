class CreateDivisionsTable < ActiveRecord::Migration
  def change

    create_table(:divisions) do |t|
      t.column(:division, :string)
    end
  end
end
