require File.expand_path(File.join(File.dirname(__FILE__), 'spec_helper'))

describe 'the null object plugin' do

  before do
    @book = Book.create
    @designer = Designer.create(:name => 'Paul Rand')
    @cover = @book.create_cover(:color => 'blue', :designer => @designer)
  end
  
  it "should add a null_object option to both has_one and belongs_to" do
    @book.cover.color.should eql('blue')
    @book.cover = nil
    @book.cover.color.should eql('n/a')
    @cover.designer.name.should eql('Paul Rand')
    @cover.designer = nil
    @cover.designer.name.should eql('Unknown designer')
  end

end
