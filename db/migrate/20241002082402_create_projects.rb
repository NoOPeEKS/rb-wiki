class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :type
      t.string :call
      t.text :app_domain
      t.date :start_date
      t.date :end_date
      t.integer :duration
      t.text :client
      t.text :units_involved
      t.text :people_involved
      t.integer :total_budget
      t.integer :eurecat_budget
      t.string :eurecat_budget_excel
      t.text :code_repos
      t.text :deliverables
      t.text :presentation
      t.text :data_sources
      t.text :keywords

      t.timestamps
    end
  end
end
