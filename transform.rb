ragex = /(== 1月 ==)(.*)/
wiki_array = ragex.match(json["query"]["pages"][0]["extract"].gsub!(/[\r\n]/,""))[0].split("==").reject(&:empty?).map(&:strip)
key_value_array = wiki_array.map.with_index { |string, index| [string, wiki_array[index + 1]] if string.match(/\d+月/) }
#月毎のハッシュの形に整形
hash = Hash[*key_value_array.compact.flatten]
months = %w[1月 2月 3月 4月 5月 6月 7月 8月 9月 10月 11月 12月]
#月毎に/\d*日/のところの前の部分を取り除いて日毎のハッシュの形に変換
months.each do |month|
  hash[month] =  /(\d*日).*/.match(hash[month])[0].gsub(/[" " | "　"]/, "").split(/\d*日-/).map.with_index { |aniversarry, index| ["#{index + 1}日", aniversarry] }
  hash[month] = Hash[*hash[month].compact.flatten]
end

p hash
