json.extract! project, :id, :title, :type, :call, :description, :app_domain, :start_date, :end_date, :duration, :client, :units_involved, :people_involved, :total_budget, :eurecat_budget, :eurecat_budget_excel, :code_repos, :deliverables, :presentation, :data_sources, :keywords, :result_summary, :created_at, :updated_at
json.url project_url(project, format: :json)
json.description project.description.to_s
json.result_summary project.result_summary.to_s
