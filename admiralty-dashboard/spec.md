# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) => Users have many ships, ships have many actions and captains
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) => Captains belong to a user
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) => Users have many ships through captains, actions have many captains through ships
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) => Captain has many actions through ships, actions have many captains through ships
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) => action models have a action_type attribute the user assigns.
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) => Ships must have a name, guns, class type, captains must have a name
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) => Actions have scopes for "battles" and "captures" that returns all the actions of certain types.
- [x] Include signup (how e.g. Devise) => used Bcrypt for the password and authentication
- [x] Include login (how e.g. Devise) => built myself but now wish I had used Devise
- [x] Include logout (how e.g. Devise) => same as above.
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) => used OmniAuth for Github
- [x] Include nested resource show or index (URL e.g. users/2/recipes) => captains/1/actions and captains/1/actions/1
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) => captains/1/ships/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new) => I added them to all my forms I think, but you can see the ship form specifically. /ships/new

Confirm:
- [x] The application is pretty DRY => I think it's pretty dry. There is probably room for improvement still.
- [x] Limited logic in controllers => Same as above.
- [x] Views use helper methods if appropriate => I have a few helper methods (current user, captain's ship) that I built.
- [x] Views use partials if appropriate => I have form partials for all my forms.