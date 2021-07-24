require 'faraday'
require 'json'

response = Faraday.get 'https://ja.wikipedia.org/w/api.php?action=query&titles=%E6%97%A5%E6%9C%AC%E3%81%AE%E8%A8%98%E5%BF%B5%E6%97%A5%E4%B8%80%E8%A6%A7&format=json&formatversion=2&prop=extracts&explaintext=&utf8='
json = JSON.parse(response.body)
ragex = /(== 1月 ==)(.*)/
wiki_array = ragex.match(json["query"]["pages"][0]["extract"].gsub!(/[\r\n]/,""))[0].split("==").reject(&:empty?).map(&:strip)
key_value_array = wiki_array.map.with_index { |string, index| [string, wiki_array[index + 1]] if string.match(/\d+月/) }
#月毎のハッシュの形に整形
hash = Hash[*key_value_array.compact.flatten]
months = %w[1月 2月 3月 4月 5月 6月 7月 8月 9月 10月 11月 12月]
#月毎に/\d*日/のところの前の部分を取り除いて日毎のハッシュの形に変換
months.each do |month|
  #日にちのところでsplitして見かけ上日にちを合わせて入れてるから1日の位置がズレる
  hash[month] =  /(\d*日).*/.match(hash[month])[0].gsub(/[" " | "　"]/, "").split(/\d*日-/).map.with_index { |aniversarry, index| ["#{index}日", aniversarry] if index > 0 }
  hash[month] = Hash[*hash[month].compact.flatten]
end
