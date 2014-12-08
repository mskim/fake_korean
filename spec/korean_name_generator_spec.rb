require File.dirname(__FILE__) + "/spec_helper"

describe 'should create female name' do
  it 'should create female name' do
    @f_name = generate_korean_name(:female=>true)
    @f_name.must_be_kind_of Array
    puts @f_name
  end
  
end


__END__
describe 'should create korean namecard' do  
  before do
    @c = KoreanNameCard.new
  end
  
  it 'should create KoreanNameCard' do
    @c.must_be_kind_of KoreanNameCard
  end
  
  it 'should have name' do
    @c.name.must_be_kind_of String
    # puts @c.name
  end
  
  it 'should have address' do
    @c.address1.must_be_kind_of String
    # puts @c.address1
    # puts @c.address2
  end
  
  it 'should have company' do
    @c.company_name.must_be_kind_of String
    # puts @c.company_name
    # puts @c.en_company_name
  end
end