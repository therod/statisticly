class CreateEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :emails do |t|
      t.string :guid
      t.string :from
      t.string :subject
      t.string :to
      t.datetime :date

      t.timestamps
    end
  end
end
