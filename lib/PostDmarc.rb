require "PostDmarc/version"
require "PostDmarc/client"

module PostDmarc
  def self.client(api_key)
    PostDmarc::Client.new(api_key)
  end
end
