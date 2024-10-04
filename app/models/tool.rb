class Tool < ApplicationRecord
  has_rich_text :usage
  belongs_to :user
end
