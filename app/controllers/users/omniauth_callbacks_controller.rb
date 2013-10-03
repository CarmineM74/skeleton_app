class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    auth_hash = request.env['omniauth.auth']
    uid = auth_hash['uid']
    name = auth_hash['info']['name']
    provider = 'twitter' # auth_hash['provider']
    auth = Authorization.find_by_provider_and_uid(provider,uid)
    if auth
      user = auth.user
    else
      unless user = User.find_by_name(name)
        user = User.create({
          name: name,
          email: "#{UUIDTools::UUID.random_create}@skeleton.change.me"
        })
      end
      unless auth = user.authorizations.find_by_provider(provider)
        auth = user.authorizations.build(provider: provider, uid: uid)
        user.authorizations << auth
      end
      auth.update_attributes({
        uid: uid,
        token: auth_hash['credentials']['token'],
        secret: auth_hash['credentials']['secret'],
        name: name,
        url: auth_hash['info']['urls']['Twitter']
      })
    end
    sign_in user
    redirect_to '/'
  end
end

