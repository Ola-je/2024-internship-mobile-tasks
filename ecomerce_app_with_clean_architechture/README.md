# Task 9: Entities, Use Cases, and Repositories  

This ecommerce mobile app was made using flutter with the principles of clean architecture.


## Table of Contents

- [Getting Started](#getting-started)
- [Architechture](#Architechture)
- [Packages Used](#packages-used)
- [Features](#features)
- [Testing](#Testing)

## Getting Started

To get started with the app, follow these steps:

1. Clone the repository:
    ```bash
    git clone https://github.com/your-username/ecommerce-app.git
    ```

2. Navigate to the project directory:
    ```bash
    cd ecommerce-app
    ```

3. Install the dependencies:
    ```bash
    flutter pub get
    ```

4. Run the app:
    ```bash
    flutter run
    ```

## Architechture

- This project is designed following the principles of Clean Architecture, which divides the app into distinct layers to maintain separation of concerns, improve testability, and support scalability. The layers are as follows: - 

- Entities: Represents the core business logic and the most fundamental part of the application. In this project, the Product entity is central, encapsulating properties like id, name, description, price, and imageUrl. - 

- Use Cases: Contains the application-specific business rules. These use cases orchestrate the interaction between the entities and the repository. For example, use cases like InsertProduct, UpdateProduct, DeleteProduct, and GetProduct are responsible for handling CRUD operations. - 

- Repositories: Acts as a mediator between the domain layer and the data sources. The ProductRepository is implemented to manage data operations, ensuring that the use cases interact seamlessly with the data layer, whether it's a local database, remote server, or any other data source. -    

## Packages Used

These packages were used in this application:

- [Provider](https://pub.dev/packages/provider): Allows you to deliver data to any widget in your app.
- [Equatable](https://pub.dev/packages/equatable): Simplifies value comparison in Dart, particularly useful for comparing entities.
- [Mockito](https://pub.dev/packages/mockito): Supports the creation of mock classes for unit testing, particularly for mocking repository interactions.
- [Build_runner](https://pub.dev/packages/build_runner): Used to generate code from annotations and ensure that generated files remain in sync with the source code.
- [Dartz](https://pub.dev/packages/dartz): Provides types like Option, Either, Task, and more, allowing us to write more predictable and composable code.

## Features

The eCommerce Mobile App includes the following key features:

- **Create Product**: Add new products to the app with details like name, description, price, and image.
- **VRead Product**: Retrieve product details, including product listings and individual product views.
- **Update Product**: Modify existing product details.
- **Delete a Product**: Remove products from the app.
- **Clean Architecture**: The project is structured to adhere to Clean Architecture principles, ensuring that each layer is well-defined and separated from others, promoting a clean and maintainable codebase.

- **Test-Driven Development (TDD)**: The development of this project followed TDD practices, where test cases were written before the actual implementation to ensure robust and reliable code.  

## Testing
- Unit tests for core domain logic and repositories -
- Unit tests for models and repositories in the data layer. -   
Run all Tests:   
```
flutter test
```
