# frozen_string_literal: true

require 'spec_helper'

describe Avataaars::Utils do
  describe '.squish' do
    subject(:squish) { described_class.squish string }

    context 'with an empty string' do
      let(:string) { '' }

      it { is_expected.to eq '' }
    end

    context 'with leading spaces' do
      let(:string) { '   Foo' }

      it { is_expected.to eq 'Foo' }
    end

    context 'with trailing spaces' do
      let(:string) { 'Bar   ' }

      it { is_expected.to eq 'Bar' }
    end

    context 'with spaces in the middle' do
      let(:string) { 'Foo Bar    Baz' }

      it { is_expected.to eq 'Foo Bar Baz' }
    end

    context 'with newlines' do
      let(:string) { "\nFoo\nBar Baz\nBoop\n" }

      it { is_expected.to eq 'Foo Bar Baz Boop' }
    end

    context 'with tabs' do
      let(:string) { "Foo\tBar" }

      it { is_expected.to eq 'Foo Bar' }
    end
  end

  describe '.deep_transform_keys_in_object' do
    subject(:deep_transform_keys_in_object) do
      described_class.deep_transform_keys_in_object(hash) { |key| key.to_s.upcase }
    end

    context 'when hash is empty' do
      let(:hash) { {} }

      it { is_expected.to eq({}) }
    end

    context 'when hash has basic keys' do
      let(:hash) { { foo: 'bar' } }

      it { is_expected.to eq('FOO' => 'bar') }

      it 'doesnt modify the original hash' do
        deep_transform_keys_in_object
        expect(hash).to eq(foo: 'bar')
      end
    end

    context 'when hash contains an array of hashes' do
      let(:hash) { { foo: [{ bar: 'baz' }] } }

      it { is_expected.to eq('FOO' => [{ 'BAR' => 'baz' }]) }

      it 'doesnt modify the original hash' do
        deep_transform_keys_in_object
        expect(hash).to eq(foo: [{ bar: 'baz' }])
      end
    end
  end

  describe '.normalize_object' do
    subject(:normalize_object) { described_class.normalize_object(object) }

    context 'when key is a single-word symbol' do
      let(:object) { { foo: 'bar' } }

      it { is_expected.to eq('foo' => 'bar') }
    end

    context 'when key is a multi-word symbol' do
      let(:object) { { foo_bar: 'baz' } }

      it { is_expected.to eq('fooBar' => 'baz') }
    end

    context 'when key is a single-word string' do
      let(:object) { { 'foo' => 'bar' } }

      it { is_expected.to eq('foo' => 'bar') }
    end

    context 'when key is a multi-word string' do
      let(:object) { { 'foo_bar' => 'baz' } }

      it { is_expected.to eq('fooBar' => 'baz') }
    end

    context 'when key is up-case' do
      let(:object) { { 'FOO_BAR' => 'baz' } }

      it { is_expected.to eq('fooBar' => 'baz') }
    end

    context 'with nested Hashes' do
      let(:object) { { foo: { bar: 'baz' } } }

      it { is_expected.to eq('foo' => { 'bar' => 'baz' }) }
    end

    context 'when value is a number' do
      let(:object) { { foo: 1.34 } }

      it { is_expected.to eq('foo' => 1.34) }
    end
  end
end
