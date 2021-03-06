class Airplay::Protocol::Scrub < Airplay::Protocol
  def resource
    "/scrub"
  end

  def plist_headers
    {'Content-Type' => 'text/x-apple-plist+xml'}
  end

  def send
    response = get(resource, plist_headers)
    result = {}
    response.delete(":").split.each_slice(2) do |key, value|
      result[key] = value
    end
    result
  end

end
