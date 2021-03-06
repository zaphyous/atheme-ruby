require 'spec_helper'

describe 'Atheme::Service' do
  it 'should have services' do
    expect(Atheme::SERVICES.count).to be > 0
  end

  it 'should be able to query services' do
    authenticate

    VCR.use_cassette('chanserv_help') do
      expect(Atheme::ChanServ.help).to be_true
    end
  end

  it 'should error when an invalid services command is used' do
    VCR.use_cassette('bad_service_command') do
      expect{ Atheme::ChanServ.bad_method }.to raise_error XMLRPC::FaultException
    end
  end

  it 'should have raw xmlrpc output in to_raw' do
    VCR.use_cassette('chanserv_help') do
      expect(Atheme::ChanServ.help.raw_services_output).to include('***** ChanServ Help *****')
    end
  end

  it 'should raise an error when no user is set' do
    Atheme.user = nil

    expect { Atheme::ChanServ.help }.to raise_error Atheme::Error::InvalidUser
  end
end
