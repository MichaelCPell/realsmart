class Constitute < ActiveRecord::Base
  belongs_to :voter
  belongs_to :district
end
