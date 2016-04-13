module OmniauthMacros
  def mock_twitter_authorized
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      :provider => 'twitter',
      :uid => '123545',
      :info => {
        :nickname => 'Alas'
      }
    })
  end

  def mock_twitter_unauthorized
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      :provider => 'twitter',
      :uid => '123545',
      :info => {
        :nickname => 'NoNick'
      }
    })
  end

  def mock_google_authorized
    OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
      :provider => 'google',
      :uid => '123545',
      :info => {
        :email => 'alas@gmail.com'
      }
    })
  end

  def mock_google_unauthorized
    OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
      :provider => 'google',
      :uid => '123545',
      :info => {
        :email => 'noemail@gmail.com'
      }
    })
  end

end
