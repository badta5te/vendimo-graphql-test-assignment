# Install


#### 1. Setup project and gems:
```shell
make install
```
or
```shell
bundle install
```


#### 2. Setup and seed database:
```shell
make db-setup
```
or
```shell
bundle exec rails db:create && bundle exec rails db:migrate && bundle exec rails db:seed
```


#### 3. Run tests:
```shell
make tests
```
or
```shell
bundle exec rspec --format documentation
```


## Local run
```shell
rails server
```
After server starts, visit http://localhost:3000/graphiql.

The application includes 3 properties that contain both furnishing and valuation information, as well as 3 properties that do not include this information. For testing creation of valuations and furnishings, you can use properties with the following IDs: **4, 5,** and **6**.


## Postman
[Collection](https://www.postman.com/payload-specialist-3119065/workspace/graphql/collection/26620917-94493d3d-d40d-4133-a733-1f1c36eb327c?action=share&creator=26620917) for tests in the Postman app.
