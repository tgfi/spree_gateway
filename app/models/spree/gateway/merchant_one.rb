module Spree
  class Gateway::MerchantOne < Gateway
    preference :username, :string
    preference :password, :string

    # MerchantOneGateway::MerchantOneSslConnection.class_eval do
    #   def configure_ssl(http)
    #     super(http)
    #     http.use_ssl = true
    #   end
    # end
    ActiveMerchant::Billing::MerchantOneGateway::MerchantOneSslConnection.class_eval do
        def configure_ssl(http)
          super(http)
          http.use_ssl = true
        end
      # class MerchantOneSslConnection < ActiveMerchant::Connection
      #   def configure_ssl(http)
      #     super(http)
      #     http.use_ssl = true
      #   end
      # end
    end

    def provider_class
      ActiveMerchant::Billing::MerchantOneGateway
    end

    def options_with_test_preference
      options_without_test_preference.merge(:test => self.preferred_test_mode)
    end

    alias_method_chain :options, :test_preference
  end
end
