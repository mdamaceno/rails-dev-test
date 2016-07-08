FactoryGirl.define do
  factory :message_unread, class: Message do
    title 'MyString'
    content 'MyText'
    state 'unread'
  end

  factory :message_read, class: Message do
    title 'MyString'
    content 'MyText'
    state 'read'
  end
end
