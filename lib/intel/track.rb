module Intel
  module Track

    def search_with_track(term, options = {})
      results = search_without_track(term, options)

      if options[:track]
        attributes = options[:track] == true ? {} : options[:track]
        Intel::Search.create({searchable_type: self.name, query: term, results_count: results.total_count}.merge(attributes))
      end

      results
    end

  end
end
