require 'cybersource_rest_client'
require_relative '../../data/Configuration.rb'

public
class RetrievePaymentInstrument
    def run(profileid, token_id)
        config = MerchantConfiguration.new.merchantConfigProp()
        api_client = CyberSource::ApiClient.new
        api_instance = CyberSource::PaymentInstrumentApi.new(api_client, config)

        data, status_code, headers = api_instance.get_payment_instrument(profileid, token_id)

        return data, status_code, headers
    rescue StandardError => err
        puts err.message
    end
    if __FILE__ == $0
        puts "\nInput missing header parameter <profile-id>:"
        profileid = gets.chomp
        puts "\nInput missing path parameter <tokenId>:"
        tokenId = gets.chomp

        RetrievePaymentInstrument.new.run(profileid, tokenId)
    end
end
