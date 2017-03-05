require 'key_flatten'

RSpec.describe KeyFlatten do
  describe '.key_flatten' do
    context 'without options' do
      it 'flattens keys of Hash' do
        expect(KeyFlatten.key_flatten({foo: 'bar'})).to eq({'foo' => 'bar'})
        expect(KeyFlatten.key_flatten({foo: {bar: 'baz'}})).to eq({'foo.bar' => 'baz'})
      end
    end

    context 'when symbolize_keys: true' do
      it 'flattens keys of Hash and the key is Symbol' do
        expect(KeyFlatten.key_flatten({foo: 'bar'}, symbolize_keys: true)).to eq({foo: 'bar'})
        expect(KeyFlatten.key_flatten({foo: {bar: 'baz'}}, symbolize_keys: true)).to eq({:'foo.bar' => 'baz'})
      end
    end

    context 'when delimiter is specified' do
      it 'flatten keys and its delimiter is specified value' do
        expect(KeyFlatten.key_flatten({foo: 'bar'}, delimiter: '_')).to eq({'foo' => 'bar'})
        expect(KeyFlatten.key_flatten({foo: {bar: 'baz'}}, delimiter: '_')).to eq({'foo_bar' => 'baz'})
      end
    end
  end

  describe '.key_unflatten' do
    context 'without options' do
      it 'unflattens keys of Hash' do
        expect(KeyFlatten.key_unflatten({foo: 'bar'})).to eq({'foo' => 'bar'})
        expect(KeyFlatten.key_unflatten({:'foo.bar' => 'baz'})).to eq({'foo' => {'bar' => 'baz'}})
      end
    end

    context 'when symbolize_keys: true' do
      it 'unflattens keys of Hash and the key is Symbol' do
        expect(KeyFlatten.key_unflatten({'foo' => 'bar'}, symbolize_keys: true)).to eq({foo: 'bar'})
        expect(KeyFlatten.key_unflatten({'foo.bar' => 'baz'}, symbolize_keys: true)).to eq({foo: {bar: 'baz'}})
      end
    end

    context 'when delimiter is specified' do
      it 'unflatten keys and its delimiter is specified value' do
        expect(KeyFlatten.key_unflatten({foo: 'bar'}, delimiter: '_')).to eq({'foo' => 'bar'})
        expect(KeyFlatten.key_unflatten({foo_bar: 'baz'}, delimiter: '_')).to eq({'foo' => {'bar' => 'baz'}})
      end
    end
  end
end
