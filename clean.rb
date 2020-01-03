require 'csv'
require 'nokogiri'

outcsv = CSV($stdout)
headersout = false

CSV.foreach(ARGV[0], headers: true) do |row|
  body = Nokogiri::HTML(row.to_h['body'])
  body.search('a').each(&:remove)
  body.search('pre').each(&:remove)
  body.search('img').each(&:remove)
  body.search('code').each(&:remove)
  body.search('blockquote').each(&:remove)
  row['bodytext'] = body.search('//text()').map(&:text).map(&:strip).join
  unless headersout
    outcsv << row.headers
    headersout = true
  end
  outcsv << row
end
