class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :tipus
      t.string :call
      t.string :app_domain
      t.date :start_date
      t.date :end_date
      t.integer :duration
      t.string :client
      t.string :units_involved
      t.string :people_involved
      t.integer :total_budget
      t.integer :eurecat_budget
      t.string :eurecat_budget_excel
      t.string :code_repos
      t.string :deliverables
      t.string :presentation
      t.string :data_sources
      t.string :keywords

      t.timestamps
    end
  end
end
