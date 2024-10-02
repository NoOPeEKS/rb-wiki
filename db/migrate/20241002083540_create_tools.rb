class CreateTools < ActiveRecord::Migration[7.1]
  def change
    create_table :tools do |t|
      t.string :title
      t.string :type
      t.date :date
      t.string :code_repo_link
      t.string :document_link
      t.string :units
      t.string :keywords
      t.text :technology

      t.timestamps
    end
  end
end
