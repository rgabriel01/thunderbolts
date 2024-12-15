# README

## Start development
Run the following commands on your terminal
```ruby
rails db:create
```
## Application Access
Since this is an API ONLY type of application, we don't have access to doorkeeper's UI elements
### Applications for authorizing
```ruby
Doorkeeper::Application.create(name: "MyApp", redirect_uri: "urn:ietf:wg:oauth:2.0:oob", scopes: ["read", "write"])
```
