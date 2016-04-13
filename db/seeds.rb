require "factory_girl_rails"

Admin.create! email: 'test@gmail.com', password: '123456789'
FactoryGirl.create(:proposal,:selected)
FactoryGirl.create(:proposal,:selected,title: "Another Awesome Talk",speaker_name: "Sarah Smith")
FactoryGirl.create(:proposal,:archived,title: "This Talk Didn't Get Picked",speaker_name: "David Zhou")
