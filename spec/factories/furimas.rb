FactoryBot.define do
  factory :furima do
    item_name               {'test'}
    explanation             {'test'}
    category_id             {4}
    condition_id            {4}
    shipping_fee_info_id    {5}
    prefecture_id           {6}
    shipping_date_info_id   {7}
    price                   {1000}
    image { Rack::Test::UploadedFile.new('app/assets/images/comment.png', 'comment/png') } 
    association :user
  end
end
