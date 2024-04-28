# frozen_string_literal: true

require 'spec_helper'

describe Avataaars do
  let(:avataaars) { described_class.new(**options) }
  let(:options) { {} }

  describe '.new' do
    subject(:new) { described_class.new }

    it { expect(new.instance_variable_get('@root_path')).to be_nil }
    it { expect(new.instance_variable_get('@options')).to eq({}) }

    context 'with options passed' do
      subject(:new) { described_class.new(**options) }

      let(:options) { { avatar_style: 'Circle' } }

      it { expect(new.instance_variable_get('@root_path')).to be_nil }
      it { expect(new.instance_variable_get('@options')).to eq(avatar_style: 'Circle') }

      context 'with root path specified' do
        let(:options) { { avatar_style: 'Circle', root_path: 'foo/bar/baz' } }

        it { expect(new.instance_variable_get('@root_path')).to eq 'foo/bar/baz' }
        it { expect(new.instance_variable_get('@options')).to eq(avatar_style: 'Circle') }
      end
    end
  end

  describe '#create_avatar' do
    subject(:create_avatar) { avataaars.create_avatar }

    let(:processor) { instance_double 'Avataaars::Processor' }

    before { allow(Avataaars::Processor).to receive(:new).with(Dir.pwd).and_return processor }

    it 'calls to Avataaars::Processor' do
      expect(processor).to receive(:create_avatar).with(no_args).and_return 'some SVG content'
      expect(create_avatar).to eq 'some SVG content'
    end

    context 'when root_path is overridden' do
      let(:options) { { root_path: 'foo/bar/baz' } }

      it 'calls to Avataaars::Processor with overridden path' do
        expect(Avataaars::Processor).to receive(:new).with('foo/bar/baz').and_return processor
        expect(processor).to receive(:create_avatar).with(no_args).and_return 'some SVG content'
        expect(create_avatar).to eq 'some SVG content'
      end
    end

    context 'when other options are specified' do
      let(:options) do
        {
          avatar_style: 'Circle',
          top_type: 'ShortHairShortFlat',
          hair_color: 'BrownDark'
        }
      end

      it 'calls to Avataaars::Processor with normalized options' do
        expect(processor).to(
          receive(:create_avatar)
            .with(
              'avatarStyle' => 'Circle',
              'topType' => 'ShortHairShortFlat',
              'hairColor' => 'BrownDark'
            )
            .and_return('some SVG content')
        )
        expect(create_avatar).to eq 'some SVG content'
      end
    end
  end
end
