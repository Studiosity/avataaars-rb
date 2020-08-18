# frozen_string_literal: true

require 'spec_helper'

describe Avataaars::Error do
  it { is_expected.to be_a StandardError }

  describe 'Avataaars::DependencyError' do
    subject { Avataaars::DependencyError.new }

    it { is_expected.to be_a described_class }
  end

  describe 'Avataaars::JavaScript::Error' do
    subject { Avataaars::JavaScript::Error.new }

    it { is_expected.to be_a described_class }
  end

  describe 'Avataaars::JavaScript::UnknownError' do
    subject { Avataaars::JavaScript::UnknownError.new }

    it { is_expected.to be_a Avataaars::JavaScript::Error }
  end

  describe 'Avataaars::JavaScript::SomeOtherError' do
    subject { Avataaars::JavaScript::SomeOtherError.new }

    it { is_expected.to be_a Avataaars::JavaScript::Error }
  end
end
