require 'key_flatten/core_ext'

RSpec.describe KeyFlatten do
  describe '.key_flatten' do
    context 'without options' do
      it 'flattens keys of Hash' do
        expect({foo: 'bar'}.key_flatten).to eq({'foo' => 'bar'})
        expect({foo: {bar: 'baz'}}.key_flatten).to eq({'foo.bar' => 'baz'})
      end
    end

    context 'when symbolize_keys: true' do
      it 'flattens keys of Hash and the key is Symbol' do
        expect({'foo' => 'bar'}.key_flatten(symbolize_keys: true)).to eq({foo: 'bar'})
        expect({'foo' => {'bar' => 'baz'}}.key_flatten(symbolize_keys: true)).to eq({:'foo.bar' => 'baz'})
      end
    end

    context 'when delimiter is specified' do
      it 'flatten keys and its delimiter is specified value' do
        expect({foo: 'bar'}.key_flatten(delimiter: '_')).to eq({'foo' => 'bar'})
        expect({foo: {bar: 'baz'}}.key_flatten(delimiter: '_')).to eq({'foo_bar' => 'baz'})
      end
    end
  end

  describe '.key_unflatten' do
    context 'without options' do
      it 'unflattens keys of Hash' do
        expect({foo: 'bar'}.key_unflatten).to eq({'foo' => 'bar'})
        expect({:'foo.bar' => 'baz'}.key_unflatten).to eq({'foo' => {'bar' => 'baz'}})
      end
    end

    context 'when symbolize_keys: true' do
      it 'unflattens keys of Hash and the key is Symbol' do
        expect({'foo' => 'bar'}.key_unflatten(symbolize_keys: true)).to eq({foo: 'bar'})
        expect({'foo.bar' => 'baz'}.key_unflatten(symbolize_keys: true)).to eq({foo: {bar: 'baz'}})
      end
    end

    context 'when delimiter is specified' do
      it 'unflatten keys and its delimiter is specified value' do
        expect({foo: 'bar'}.key_unflatten(delimiter: '_')).to eq({'foo' => 'bar'})
        expect({foo_bar: 'baz'}.key_unflatten(delimiter: '_')).to eq({'foo' => {'bar' => 'baz'}})
      end
    end
  end
end
