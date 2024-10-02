class CreateProposals < ActiveRecord::Migration[7.1]
  def change
    create_table :proposals do |t|
      t.string :title
      t.string :type
      t.string :call
      t.text :app_domain
      t.date :deadline
      t.integer :duration
      t.string :status
      t.text :client
      t.text :units_involved
      t.text :people_involved
      t.integer :total_budget
      t.integer :eurecat_budget
      t.string :eurecat_budget_excel
      t.string :document_link
      t.text :keywords

      t.timestamps
    end
  end
end
