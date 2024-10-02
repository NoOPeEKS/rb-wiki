json.extract! proposal, :id, :title, :type, :call, :description, :app_domain, :deadline, :duration, :status, :client, :units_involved, :people_involved, :total_budget, :eurecat_budget, :eurecat_budget_excel, :document_link, :keywords, :created_at, :updated_at
json.url proposal_url(proposal, format: :json)
json.description proposal.description.to_s
