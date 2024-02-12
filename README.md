# Rails API with jwt auth and cursor pagination

This Rails API project is configured with a set of features and dependencies tailored for modern web applications. It provides a robust starting point for building APIs with authentication, serialization, and pagination capabilities.

## Major Dependencies

- **Ruby Version**: 3.2.2
- **Framework**: Ruby on Rails

### CORS
- `rack-cors` for handling Cross-Origin Resource Sharing (CORS), allowing or restricting requests from different domains.

### Authentication
- `devise` for basic user authentication including registration, login, and logout functionalities.
- `devise-jwt` for JWT token based authentication, providing a secure way to manage user sessions via JSON Web Tokens.

### Serialization
- `jsonapi-serializer` for efficient serialization of Ruby objects into JSON API compliant responses.

### Linter
- `standardrb` for enforcing consistent coding styles and best practices.

### Pagination
- `pagy_cursor` for implementing efficient, cursor-based pagination in API responses, optimizing data retrieval for large datasets.

## Features

### Cursor-based Pagination
This project uses `pagy_cursor` for cursor-based pagination, optimizing the performance and scalability of data retrieval operations. This approach is particularly useful for APIs dealing with large data sets, providing a more efficient way to navigate through records.

### JWT Authentication
With `devise-jwt`, the project integrates JWT based authentication, securing API endpoints and managing user sessions. This method leverages JSON Web Tokens for stateless authentication, offering a reliable and scalable authentication solution.

## Getting Started

### Prerequisites
- Ruby 3.2.2
- Rails (version corresponding to the project)

### Setup
1. Clone the repository.
2. Run `bundle install` to install dependencies.
3. Setup your database with `rails db:create db:migrate`.
4. (Optional) Seed the database with `rails db:seed`.

### Running the Application
- Start the Rails server with `rails s`.
- Access the API endpoints as per the API documentation.

### Running Tests
- Execute tests with `rspec`.
