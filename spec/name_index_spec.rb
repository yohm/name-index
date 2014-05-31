require File.expand_path(File.dirname(__FILE__) + '/../name_index')

describe NameIndex do
  specify { expect(NameIndex.create_index([])).to eq [] }

  specify {
    input = ['キシモト', 'イトウ', 'ババ', 'カネダ', 'ワダ', 'ハマダ']
    expected = [ ['ア', ['イトウ']], ['カ', ['カネダ', 'キシモト']], ['ハ', ['ハマダ', 'ババ']], ['ワ', ['ワダ']] ]
    expect(NameIndex.create_index(input)).to eq expected
  }

  it "sorts values" do
    input = %w(クドウ カトウ キシダ)
    expected = [ ['カ', ['カトウ','キシダ','クドウ']]]
    expect(NameIndex.create_index(input)).to eq expected
  end
end
