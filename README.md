# Example Test Automation Project

This is a small sample project for introducing web test automation using Python, Robot Framework and QWeb library. The project is an example of

- good test automation project structure
- division of test code into test suites and resource files
- usage of existing keyword library (QWeb)
- creation of own keywords in a resource file
- keyword documentation created with Libtoc

# Project Structure

```
tests       - robot test files
resources   - resource files
docs        - documentation
```

# Tools

- [Python](https://www.python.org/)
- [Robot Framework](https://robotframework.org/)
- [QWeb library](https://github.com/qentinelqi/qweb)
- [ChromeDriver](https://chromedriver.chromium.org/)
- [Robocop](https://robocop.readthedocs.io/en/stable/) - for static code analysis
- [Libtoc](https://github.com/amochin/robotframework-libtoc) - for keyword documentation

# System Under Test

The test app is a simple [TodoMVC application](https://todomvc.com/examples/react/dist/), written in React by TodoMVC Team. It contains the following features:

- Feature 1: User can add todo items.
- Feature 2: User can mark todo items as completed/uncompleted.
- Feature 3: User can view all, active and completed todo items.
- Feature 4: User can clear completed todo items.
- Feature 5: User can destroy todo items.

# How to run tests and create documentation for keywords

Run tests headless, from root folder: 

```
robot -v browser_options:"-headless" tests/test_todo_app.robot
```

Run tests with Chrome, from root folder:

```
robot tests/test_todo_app.robot
```

Run linter, on root folder:

```
robocop --reports all .
```

Create documentation for own keywords:

```
libtoc --output_dir docs resources
```
