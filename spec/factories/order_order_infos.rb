FactoryBot.define do
  factory :order_order_info do
    furima_id                {1}
    post_code                {'123-4567'}
    prefecture_id            {2}
    city                     {'あああ市'}
    address                  {'1-1-1'}
    building                 {'あああ'}
    telephone_num            {'09012345678'}
    token                    {"tok_abcdefghijk00000000000000000"}

  end
end
