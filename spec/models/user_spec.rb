# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string(255)
#  password               :string(255)
#  plan                   :integer          not null
#  refresh_token          :string(255)
#  reset_passowrd_sent_at :datetime
#  reset_passowrd_token   :string(255)
#  role                   :integer          not null
#  username               :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    let(:model) { build(:user) }

    it do
      expect(model).to(
        have_many(:devices)
        .dependent(:destroy)
        .inverse_of(:user)
      )
    end

    it do
      expect(model).to(
        have_one(:user_profile)
        .dependent(:destroy)
        .inverse_of(:user)
      )
    end
  end
end
