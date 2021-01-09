require './lib/caesar'

describe Caesar do
  caesar = Caesar.new
  describe '#cipher' do
    it 'shifts string characters up or down by the specified amount' do
      expect(caesar.cipher('What a string!', 5)).to eql('Bmfy f xywnsl!')
    end
  end
end
