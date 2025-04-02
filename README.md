# Example Test Automation Project

This is a small sample project for introducing web test automation using Python, Robot Framework and QWeb library. The project is an example of

- Good test automation project folder structure, using GitHub.
- Usage of gitignore file to ignore certain generated files and directories which are unnecessary to this project.
- Usage of requirements.txt file to storing dependencies with tool versions.
- Division of test code into test suites and resource files.
- Usage of existing keyword library (QWeb) in test automation.
- Creation of own keywords in a resource file, using existing keywords.
- Creation of keyword documentation using Libtoc.
- Exclusion of existing Robocop linter rule "todo-in-comment" in .robocop argument file.
- Customization of own INFO type linter rule for Robocop.
- Usage of bash script as a pre-commit hook to lint robot code with Robocop and run robot smoke tests before each code commit.
- Usage of bash script for test report generation with Robot Framework Dashboard.

# Project Structure

```
docs        - keyword documentation
resources   - resource files, robocop config file, own linter rules
scripts     - example scripts for git hooks and test report generation
tests       - robot test files
test_runs   - test runs that can be added to the db stored locally
```

# Tools

- [Python](https://www.python.org/) - for anything :)
- [Robot Framework](https://robotframework.org/) - for test automation and running tests
- [QWeb library](https://github.com/qentinelqi/qweb) - for efficient and reliable web testing and automation
- [ChromeDriver](https://googlechromelabs.github.io/chrome-for-testing/) - for running tests in browser (Chrome)
- [Gechodriver](https://github.com/mozilla/geckodriver/releases) - for running tests in browser (Firefox)
- [Robocop](https://robocop.readthedocs.io/en/stable/) - for static code analysis
- [Libtoc](https://github.com/amochin/robotframework-libtoc) - for keyword and test library documentation
- [Git](https://git-scm.com/) - for version control
- [GitHub](https://github.com/) - for creating, storing, managing, and sharing code
- [Git hooks](https://www.atlassian.com/git/tutorials/git-hooks) - for triggering customizable actions on this Git repository
- [Bash scripting](https://www.datacamp.com/tutorial/how-to-write-bash-script-tutorial) - for creating executable helper scripts
- [Robot Framework Dashboard](https://github.com/timdegroot1996/robotframework-dashboard) - for test reporting

# System Under Test

The test app is a simple [TodoMVC application](https://todomvc.com/examples/react/dist/), written in React by TodoMVC Team. It contains the following features:

- Feature 1: User can add todo items.
- Feature 2: User can mark todo items as completed/uncompleted.
- Feature 3: User can view all, active and completed todo items.
- Feature 4: User can clear completed todo items.
- Feature 5: User can edit todo items.
- Feature 6: User can destroy todo items.

# Hooks

To enable hooks, copy all hook files from _scripts/hooks_to_copy_ folder to your local repo's _.git/hooks_ folder.

# How to run tests

Run tests headless, from root folder: 

```
robot --outputdir logs -v browser_options:-headless tests/test_todo_app.robot
```

Run tests from root folder with default browser Chrome:

```
robot --outputdir logs tests/test_todo_app.robot
```

Run tests from root folder with Firefox:
```
robot --outputdir logs --variable browser:Firefox tests/test_todo_app.robot
```

# How to run linter

Run Robocop linter using either config file or a set of own rules, on root folder:

```
robocop check
robocop check --config resources\robocop.toml
robocop check --custom-rules .\resources\my_rules.py
```

# How to create documentation

Create documentation for own keywords:

```
libtoc --output_dir docs resources
```

# How create test report after running tests

You can create a report of your test results across multiple runs using a bash script that uses Robot Framework Dashboard tool.

Run bash script on project scripts folder:
```
bash create_report.sh
``` 

This bash script moves test results that were created to output.xml to a specific folder and adds a timestamp to it. Then it updates a local test results database and creates a test report with all test results available in the local database.

To view the test report, open test_runs/test_runs_dashboard.html