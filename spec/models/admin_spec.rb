require "rails_helper"

# == Schema Information
#
# Table name: admins
#
#
#    t.string   "email",                  default: "", null: false
#    t.string   "encrypted_password",     default: "", null: false
#    t.string   "name",                   default: "", null: false
#    t.string   "reset_password_token"
#    t.datetime "reset_password_sent_at"
#    t.datetime "remember_created_at"
#    t.integer  "sign_in_count",          default: 0,  null: false
#    t.datetime "current_sign_in_at"
#    t.datetime "last_sign_in_at"
#    t.string   "current_sign_in_ip"
#    t.string   "last_sign_in_ip"
#    t.datetime "created_at",                          null: false
#    t.datetime "updated_at",                          null: false
#    t.string   "provider"
#    t.string   "uid"
#    t.string   "nickname"
#

RSpec.describe Admin do
  describe "createadmins" do
    it "should return an admin user" do
      adm = create(:admin)
    end
  end
end
