# README

## Start development
Run the following commands on your terminal
```ruby
rails db:create
```
## Application Access
Since this is an API ONLY type of application, we don't have access to doorkeeper's UI elements

### Client application registration
Note that a client application represents the entity that will consume the contents of this API service
In this case, we have 3 different client applications wishing to gain access to this API service
* Admin as the FE administrative application
* Wasp as the mobile application
* Visiion as the NextJS application
> Technically this done on the console side
```ruby
Doorkeeper::Application.create(name: "Admin", redirect_uri: "urn:ietf:wg:oauth:2.0:oob", scopes: ["read", "write"])
Doorkeeper::Application.create(name: "Wasp", redirect_uri: "urn:ietf:wg:oauth:2.0:oob", scopes: ["read"])
Doorkeeper::Application.create(name: "Vision", redirect_uri: "urn:ietf:wg:oauth:2.0:oob", scopes: ["read"])
```

### Client application user registration/enrollment
For users to be actually, be able to use this API, under a client application, we will enroll users and create access tokens.
```ruby
application = Doorkeeper::Application.find_by(name: 'Admin')
application_scopes = application.scopes.map {|scope| scope}

user = User.find_by(email: 'hawkeye@thunderbolts.com')
Doorkeeper::AccessToken.create!(application_id: application.id, resource_owner_id: user.id, scopes: application_scopes)
```
