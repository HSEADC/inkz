# fix using this issue https://github.com/CanCanCommunity/cancancan/issues/106

require 'cancan'

module CanCan
  module ModelAdapters
    class AbstractAdapter
      def self.find(model_class, id)
        model_class.respond_to?(:friendly) ?
          model_class.friendly.find(id) : model_class.find(id)
      end
    end
  end
end
