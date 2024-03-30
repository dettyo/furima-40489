FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birth_date            {'2020-01-01'}
    last_name             {'山田'}
    first_name            {'太郎'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'タロウ'}
  end
end