# Flutter Clean Architecture

`This post is the first part of a tutorial series for Clean Architecture!.`

In their early stages, some software developers only struggle to pick up new skills quickly and create functional features; they don't worry about writing clean code or following the right architecture to improve application performance. When using a framework, some other developers often use the well-known MVC pattern, which enables us to separate our application into models, views, and controllers. This is not a problem when developing simple apps, but when we need to scale an application by adding new features, updating a library, or doing something similar, we encounter a number of problems because, as our code becomes more coupled, it becomes more challenging to make changes in our application without also making numerous changes throughout our code. As a result, before you begin developing your application, you must first design the appropriate architecture.

## [1]: An Overview

When designing your application architecture, it is essential that you respond to several principles, including:

- [SOLID]('https://medium.com/@sanjayofficial94/s-o-l-i-d-principals-41a5b3b604eb'): five object-oriented programming principles contribute to the readability, adaptability, and maintainability of OOP designs.

- [KISS]('https://www.baeldung.com/cs/kiss-software-design-principle'): a design principle stating that designs and/or systems should be as simple as possible in order to maximize user acceptance and interaction.

- [DRY]('https://www.baeldung.com/cs/dry-software-design-principle'): a software development principle which stands for 'don't repeat yourself,' that aims to reduce code duplication in favor of abstractions and avoiding redundancy.

# [2]:Architectures that implement the preceding principles

- Hexagonal Architecture: the Ports and Adapters architecture is based on the idea of separating the application into loosely coupled components in order to isolate the core business logic from outside concerns.

- Onion Architecture: this architecture is made up of multiple concentric layers that connect to the core, which represents the domain. In fact, this architecture is based on the principle of control inversion.

- The Clean architecture: Uncle Bob's architecture is based on the dependency inversion principle to define boundaries between high-level and low-level components. Furthermore, this architecture attempts to combine all previous architectures into a single actionable idea.

![Alt Text](https://media.giphy.com/media/RgbxwGbdUNqtWWo79S/giphy.gif)

So, as we can see, the fundamental objective of all these architectures is to achieve a clear separation of concerns. This is accomplished by dividing the software into distinct layers, typically including a layer for business rules and another for interfaces. Furthermore, each architecture establishes a well-defined system that is:

1. [Independent of Frameworks]()
2. [Testable]()
3. [Independent of UI]()
4. [Independent of Database]()
5. [Independent of any external agency]()

After discussing the most popular architectures and their roles, we'll build an architecture for every Flutter application based on C. Martin's (also known as Uncle Bob's) concept, which contains several architecture ideas.
![1v6aaw5ye9ttb2zw6111](https://github.com/Des-Vu-Technologies/Fly_with_flutter/assets/59717384/42fa6289-9dcc-4b07-80d3-9db788988863)

It should be noted that this architecture is not simply a folder structure that you can copy and paste into your project. It is the concept of separating your application into layers while adhering to Uncle Bob's Dependency Rule, which states that:

`Nothing in an inner circle can know anything at all about something in an outer circle.`

In other words, no variable, class or function declared in an outer circle can be mentioned in an inner circle.

Let's start by integrating this architecture into a Flutter project.

![Alt Text](https://media.giphy.com/media/wwg1suUiTbCY8H8vIA/giphy.gif)

We will create a weather application which aims to visualize the weather of a specific city.

- This application has two interfaces: one for displaying the details of the city's weather.
  
  ![e8qi1itwj25uuehv346r](https://github.com/Des-Vu-Technologies/Fly_with_flutter/assets/59717384/003d3fa7-ea68-4acb-9dba-1247cc370dd0)




- Another for adding a new city. This app will include the most basic functionalities, such as getting data from an API, storing data in a local database, handling errors,and so on.

  
![s4xb1jp3khtv95kx86eb](https://github.com/Des-Vu-Technologies/Fly_with_flutter/assets/59717384/3c8643b6-aa49-489e-8a44-53f800734591)


## Flutter Clean Architecture and data flow

