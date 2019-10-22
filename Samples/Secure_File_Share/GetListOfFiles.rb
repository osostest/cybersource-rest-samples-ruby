require 'cybersource_rest_client'
require_relative '../../data/Configuration.rb'

public
class GetListOfFiles
    def run()
        start_date = "2018-10-20"
        end_date = "2018-10-30"

        opts = {}
        opts[:"organization_id"] = "testrest"

        config = MerchantConfiguration.new.merchantConfigProp()
        api_client = CyberSource::ApiClient.new
        api_instance = CyberSource::SecureFileShareApi.new(api_client, config)

        data, status_code, headers = api_instance.get_file_detail(start_date, end_date, opts)

        return data, status_code, headers
    rescue StandardError => err
        puts err.message
    end
    if __FILE__ == $0
        puts "\nInput missing query parameter <startDate>:"
        startDate = gets.chomp
        puts "\nInput missing query parameter <endDate>:"
        endDate = gets.chomp
        puts "\nInput missing query parameter <organizationId>:"
        organizationId = gets.chomp

        GetListOfFiles.new.run(startDate, endDate, organizationId)
    end
end
