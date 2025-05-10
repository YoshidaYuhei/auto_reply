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
class User < ApplicationRecord
    has_many :devices, dependent: :destroy, inverse_of: :user
    has_one :user_profile, dependent: :destroy, inverse_of: :user
end
