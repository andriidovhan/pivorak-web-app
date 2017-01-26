module Search
  module Formatters
    class Default < ::ApplicationService
      def initialize(params)
        @collection = params[:collection]
      end

      def call
        collection.map(&:searchable).group_by(&:class)
      end

      private

      attr_reader :collection
    end
  end
end
