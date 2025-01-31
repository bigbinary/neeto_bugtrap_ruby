require 'neeto-bugtrap-ruby/backend/debug'
require 'neeto-bugtrap-ruby/config'

describe NeetoBugtrap::Backend::Debug do
  let(:config) { NeetoBugtrap::Config.new(logger: NULL_LOGGER, debug: true) }
  let(:logger) { config.logger }

  let(:instance) { described_class.new(config) }

  subject { instance }

  before do
    allow(logger).to receive(:warn)
    allow(logger).to receive(:unknown)
  end

  it { should respond_to :notify }

  describe "#notify" do
    let(:notice) { double('Notice', to_json: '{}') }

    subject { instance.notify(:notices, notice) }

    it { should be_a NeetoBugtrap::Backend::Response }

    it "logs the notice" do
      expect(logger).to receive(:unknown).with(/feature=notices/)
      instance.notify(:notices, notice)
    end
  end

  describe "#check_in" do
    it "logs the check_in" do
      expect(logger).to receive(:unknown).with("checking in debug backend with id=10")

      instance.check_in(10)
    end
  end
end
