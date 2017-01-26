module Searchable
  module Configuration
    module Venue
      include Configurable

      define_searchable do
        multisearchable against: %i(name address description)
      end
    end
  end
end
