require 'rails_helper'

RSpec.describe Version, type: :model do
  context 'from_fully_form_version' do
    let!(:version) { Version.create uuid: '2018-choices', version: '1' }

    context 'valid fully form version' do
      let(:fully_form_version) { '2018-choices_1' }

      it { expect(Version.from_fully_form_version(fully_form_version)).to eq(version) }
    end

    context 'missing version number in fully form version' do
      let(:fully_form_version) { '2018-choices_' }

      it { expect(Version.from_fully_form_version(fully_form_version)).to eq(nil) }
    end
  end
end
