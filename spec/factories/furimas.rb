FactoryBot.define do
  factory :furima do
    id  {1}
    item_name               {'test'}
    explanation             {'test'}
    category_id             {2}
    condition_id            {2}
    shipping_fee_info_id    {2}
    prefecture_id           {2}
    shipping_date_info_id   {2}
    price                   {1000}
    image                   { Rack::Test::UploadedFile.new('app/assets/images/comment.png', 'comment/png') } 
    association :user
  end
end
