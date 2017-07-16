#Application record inherrits from ActiveRecord::Base and changes one option.  All other models will inherrit from this model.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
