require 'key_flatten/core_ext'

RSpec.describe KeyFlatten do
  describe '.key_flatten' do
    context 'without options' do
      it 'flattens keys of Hash' do
        expect({foo: 'bar'}.key_flatten).to eq({'foo' => 'bar'})
        expect({foo: {bar: 'baz'}}.key_flatten).to eq({'foo.bar' => 'baz'})
      end
    end

    context 'when symbolize: true' do
      it 'flattens keys of Hash and the key is Symbol' do
        expect({foo: 'bar'}.key_flatten(symbolize: true)).to eq({foo: 'bar'})
        expect({foo: {bar: 'baz'}}.key_flatten(symbolize: true)).to eq({:'foo.bar' => 'baz'})
      end
    end

    context 'when delimiter is specified' do
      it 'flatten keys and its delimiter is specified value' do
        expect({foo: 'bar'}.key_flatten(delimiter: '_')).to eq({'foo' => 'bar'})
        expect({foo: {bar: 'baz'}}.key_flatten(delimiter: '_')).to eq({'foo_bar' => 'baz'})
      end
    end
  end
end
