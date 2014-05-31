module NameIndex

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
  ).freeze

  extend self

  def create_index(names)
    names.sort.group_by { |name|
      get_index_char(name)
    }.to_a
  end

  private
  def get_index_char(name)
    KATAKANA_CHARS.find { |kana_line|
      kana_line.include?(name.chr)
    }.chr
  end
end
