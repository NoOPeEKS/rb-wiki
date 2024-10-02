class Project < ApplicationRecord
  has_rich_text :description
  has_rich_text :result_summary
end
