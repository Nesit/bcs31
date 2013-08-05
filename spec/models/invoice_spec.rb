require 'spec_helper'

describe Invoice do

  let(:invoice) { FactoryGirl.build(:invoice) }

  it 'should be valid with valid attributes' do
    invoice.should be_valid
  end
  it { should enumerize(:status).in(*Invoice.status.values).with_default(:cargo_taken_back) }
  it { should enumerize(:recipient_role).in(*Invoice.recipient_role.values).with_default(:personally) }

  describe '#number' do
    it 'should be unique' do
      FactoryGirl.create :invoice, number: invoice.number
      invoice.should have(1).errors_on(:number)
    end

    it 'should have right format' do
      invoice.number = invoice.number.to_s
      invoice.should have(1).errors_on(:number)
    end

    it 'should have right length' do
      invoice.number = 5082013
      invoice.should have(1).errors_on(:number)
      invoice.number = 999999999
      invoice.should have(1).errors_on(:number)
    end
  end

  describe '#send_from' do
    it 'should not be empty' do
      invoice.send_from = ' '
      invoice.should have(1).errors_on(:send_from)
    end
  end

  describe '#arrival_to' do
    it 'should not be empty' do
      invoice.arrival_to = ' '
      invoice.should have(1).errors_on(:arrival_to)
    end
  end

  describe '#recipient_surname' do
    it 'should not be empty' do
      invoice.recipient_surname = ' '
      invoice.should have(1).errors_on(:recipient_surname)
    end
  end

  describe '#delivered_at' do
    it 'should not be empty only if invoice has status :cargo_is_delivered' do
      Invoice.status.values.each do |status|
        invoice.status = status
        errors_number = invoice.status_cargo_is_delivered? ? 1 : 0
        invoice.should have(errors_number).errors_on(:delivered_at)
        invoice.delivered_at = DateTime.now
        invoice.should have(1 - errors_number).errors_on(:delivered_at)
      end
    end
  end

  describe '#status' do
    it 'should not be empty' do
      invoice.status = ' '
      invoice.should have(1).errors_on(:status)
    end
  end

  describe '#recipient_role' do
    it 'should not be empty' do
      invoice.recipient_role = ' '
      invoice.should have(1).errors_on(:recipient_role)
    end
  end
end
