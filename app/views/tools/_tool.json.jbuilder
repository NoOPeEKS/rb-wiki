json.extract! tool, :id, :title, :type, :date, :code_repo_link, :document_link, :units, :keywords, :usage, :technology, :created_at, :updated_at
json.url tool_url(tool, format: :json)
json.usage tool.usage.to_s
