module Searchable
  module Configuration
    module Goal
      include Configurable

      define_searchable do
        multisearchable against: %i(title description)
      end
    end
  end
end
