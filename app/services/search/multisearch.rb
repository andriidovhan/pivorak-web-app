module Search
  class Multisearch < ::ApplicationService
    def initialize(params)
      @query     = params[:query]
      @formatter = params[:formatter]
    end

    def call
      return documents unless formatter

      formatter.call(collection: documents)
    end

    private

    def documents
      @documents ||= multisearch(query)
    end

    attr_reader :query, :formatter
    delegate    :multisearch, to: :PgSearch
  end
end
