require 'faraday'
require 'faraday_middleware'
class PostDmarc::Client
  attr_reader :api_token

  def initialize(api_token)
    @api_token = api_token
  end

  def reports(from_date: nil, to_date: nil, limit: nil, after: nil, before: nil,
             reverse: false)
    path = 'records/my/reports?'

    path += "&from_date=#{from_date}" if from_date
    path += "&to_date=#{to_date}" if to_date
    path += "&limit=#{limit}" if limit
    path += "&after=#{after}" if after
    path += "&before=#{before}" if before
    path += "&reverse=#{reverse}" if reverse

    connection.get(path).body
  end

  def report(report_id)
    connection.get("/records/my/reports/#{report_id}").body
  end

  def dns_snippet
    connection.get('/records/my/dns').body
  end
  private

  def connection
    Faraday.new("https://dmarc.postmarkapp.com/") do |f|
      f.response :json, :content_type => /\bjson$/
      f.adapter  Faraday.default_adapter
      f.headers['Content-Type'] = 'application/json'
      f.headers['Accept'] = 'application/json'
      f.headers['X-Api-Token'] = api_token
    end
  end
end
