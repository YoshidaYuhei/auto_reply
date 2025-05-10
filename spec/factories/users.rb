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
FactoryBot.define do
  factory :user do
    username { 'test_user' }
    email { 'test@example.com' }
    password { 'password' }
    role { 0 }
    plan { 0 }
    devices do
      Array.new(2) do
        association(
          :device,
          strategy: :build,
          user: instance
        )
      end
    end

    trait :with_user_profile do
      user_profile do
        association(
          :user_profile,
          strategy: :build,
          user: instance
        )
      end
    end
  end
end
