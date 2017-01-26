module Searchable
  module Configuration
    module Event
      include Configurable

      define_searchable do
        multisearchable against: %i(title description agenda)
      end
    end
  end
end
