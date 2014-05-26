class NameIndex

  KATAKANA_CHARS = %w(
    アイウエオ
    カキクケコガギグゲゴ
    サシスセソザジズゼゾ
    タチツテトダヂヅデド
    ナニヌネノ
    ハヒフヘホバビブベボパピプペポ
    マミムメモ
    ヤユヨ
    ワヲ
    ン
  )

  private
  def self.get_index_char(name)
    found_line = KATAKANA_CHARS.find do |kana_line|
      kana_line.include?(name[0])
    end
    found_line[0]
  end

  public
  def self.create_index(names)
    index = Hash.new { Array.new }
    names.each do |name|
      key = get_index_char(name)
      index[key] += [name]
    end
    index = index.sort_by do |key,val|
      KATAKANA_CHARS.map {|s| s[0]}.index(key)
    end
    index.map {|key,val| [key, val.sort] }
  end
end
