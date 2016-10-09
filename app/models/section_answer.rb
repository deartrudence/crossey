class SectionAnswer < ActiveRecord::Base
  belongs_to :section
  belongs_to :individual_review
end
