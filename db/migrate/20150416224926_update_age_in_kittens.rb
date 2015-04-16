class UpdateAgeInKittens < ActiveRecord::Migration
  def change
  	change_column :kittens, :age, :decimal
  end
end
