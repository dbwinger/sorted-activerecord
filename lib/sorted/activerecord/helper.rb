require 'active_record'
require 'active_support/concern'
require 'sorted/activerecord/builder'

module Sorted
  module ActiveRecord
    module Helper
      extend ActiveSupport::Concern
      included do

        def self.sorted(sort: [], order: [], whitelist: [])
          builder = ::Sorted::ActiveRecord::Builder.new(sort: sort,
                                                        order: order,
                                                        whitelist: whitelist)
          order(builder.to_hash)
        end

        def self.resorted(sort: [], order: [], whitelist: [])
          builder = ::Sorted::ActiveRecord::Builder.new(sort: sort,
                                                        order: order,
                                                        whitelist: whitelist)
          reorder(builder.to_hash)
        end
      end
    end
  end
end
