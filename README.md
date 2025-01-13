# Example Test Automation Project

This is a small sample project for introducing web test automation using Python, Robot Framework and QWeb library. The project is an example of

- good test automation project folder structure
- division of test code into test suites and resource files
- usage of existing keyword library (QWeb)
- creation of own keywords in a resource file
- creation of keyword documentation (Libtoc)
- exclusion of existing Robocop linter rule "todo-in-comment" in .robocop argument file
- customization of own INFO type linter rule for Robocop
- usage of bash script as a pre-commit hook to lint robot code with Robocop and run robot smoke tests before code commit.

# Project Structure

```
docs        - documentation
resources   - resource files, own linter rules
scripts     - example scripts for git hooks
tests       - robot test files
```

# Tools

- [Python](https://www.python.org/) - for anything :)
- [Robot Framework](https://robotframework.org/) - for test automation and running tests
- [QWeb library](https://github.com/qentinelqi/qweb) - for efficient and reliable web testing and automation
- [ChromeDriver](https://googlechromelabs.github.io/chrome-for-testing/) - for running tests in browser
- [Robocop](https://robocop.readthedocs.io/en/stable/) - for static code analysis
- [Libtoc](https://github.com/amochin/robotframework-libtoc) - for keyword and test library documentation
- [Git](https://git-scm.com/) - for version control
- [GitHub](https://github.com/) - for creating, storing, managing, and sharing code
- [Git hooks](https://www.atlassian.com/git/tutorials/git-hooks) - for triggering customizable actions on this Git repository

# System Under Test

The test app is a simple [TodoMVC application](https://todomvc.com/examples/react/dist/), written in React by TodoMVC Team. It contains the following features:

- Feature 1: User can add todo items.
- Feature 2: User can mark todo items as completed/uncompleted.
- Feature 3: User can view all, active and completed todo items.
- Feature 4: User can clear completed todo items.
- Feature 5: User can edit todo items.
- Feature 6: User can destroy todo items.

# Hooks

To use hooks, copy all hook files from _scripts/hooks_to_copy_ folder to your local repo's _.git/hooks_ folder.

# How to run tests and create documentation for keywords

Run tests headless, from root folder: 

```
robot -v browser_options:-headless tests/test_todo_app.robot
```

Run tests from root folder with default browser Chrome:

```
robot tests/test_todo_app.robot
```

Run linter using both an argument file and a set of own rules, on root folder:

```
robocop -A ./resources/.robocop -rules ./resources/my_rules.py
```

Create documentation for own keywords:

```
libtoc --output_dir docs resources
```
