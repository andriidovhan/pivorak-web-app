module Searchable
  module Configuration
    module User
      include Configurable

      define_searchable do
        multisearchable against: %i(first_name last_name email)
      end
    end
  end
end
