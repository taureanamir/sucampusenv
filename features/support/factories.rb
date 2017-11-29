FactoryGirl.define do

  factory :member2 , class: User do
    sequence :email do |n|
      "member2#{n}@ait.asia"
    end
    password "password"
    first_name "John"
    last_name "John"
    role_id "2"
  end

  factory :member , class: User do
    email "articleuser@ait.ac.th"
    password "password"
    first_name "Fname"
    last_name "Lname"
    role_id "2"
  end


  factory :adminuser , class: User do
    email "admin@ait.asia"
    password "password"
    first_name "Super"
    last_name "Man"
    role_id "1"
  end

  factory :user do
    sequence :email do |n|
      "testuser#{n}@ait.asia"
    end
    password "password"
    first_name "Fname"
    last_name "Lname"
    password_confirmation "password"
    role_id "2"
  end


  factory :article, class: Article do
    title "Clean Campus"
    content "AIT is clean and green campus."
    uploaded_date "2017-10-01"
    user_id {FactoryGirl.build(:member)}
  end

  factory :event, class: Event do
    title "AIT Debate Competition for recycling"
    description "The event is coming soon."
    event_date "2017-12-01"
    event_time "1:00 PM"
    contact "John"
    venue "AITCC"
    is_publised "t"
    is_completed "f"
  end

  factory :new_event, class: Event do
    title "Discussion board on clean envirnoment"
    description "The event will be arranged for all AITians"
    event_date "2017-11-29"
    event_time "1:00 PM"
    contact "+66123456"
    venue "AITCC"
    is_publised "t"
    is_completed "f"
  end

  factory :comment, class: Comment do
    content "This is interesting event."
    user_id  {FactoryGirl.build(:member)}
    event_id {FactoryGirl.build(:event)}
  end

  factory :participation, class: Participation do
    content "This is interesting event."
    user_id  {FactoryGirl.build(:member)}
    event_id {FactoryGirl.build(:event)}
  end
end
