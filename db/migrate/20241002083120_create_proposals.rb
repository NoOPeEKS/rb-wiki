class CreateProposals < ActiveRecord::Migration[7.1]
  def change
    create_table :proposals do |t|
      t.string :title
      t.string :tipus
      t.string :call
      t.string :app_domain
      t.date :deadline
      t.integer :duration
      t.string :status
      t.string :client
      t.string :units_involved
      t.string :people_involved
      t.integer :total_budget
      t.integer :eurecat_budget
      t.string :eurecat_budget_excel
      t.string :document_link
      t.string :keywords

      t.timestamps
    end
  end
end
