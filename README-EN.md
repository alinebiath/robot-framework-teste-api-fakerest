# Automated tests for "FakeRestAPI.Web" API with Robot Framework

- Tests applied to FakeRestAPI.Web, available at: https://fakerestapi.azurewebsites.net/index.html
- Performed some basic tests with HTTP methods: GET, POST, PUT and DELETE
- The API doesn't require authentication

### 1. Files and directories structure
The tests are structured in directories as follows:

- **keywords**: contains <i>.robot</i> files with implementation keywords.
- **other_files**: contains <i>.json</i> files created to pass the body data in PUT and POST methods.
- **test-suites**: contains the <i>.robot</i> file with test suites (scenarios or test cases).
- **requirements.txt**: file containing the calls for installation of the robot framework and the necessary libraries.</br>

### 2. Pre-conditions for the tests
- Clone the project
- Python 2.7.x
- Use an ASCII editor of your preference (i.e. VSCode, Atom, RIDE, etc)</br>

### 3. Installing required Python libraries
Install all required Python libraries typing on terminal command:

```sh
Linux / Mac
$ pip install -r requirements.txt --user
```

### 4. Running acceptance tests

Execute at the terminal the command below:
- For the consultation scenarios (GET): 
```sh
$ python -m robot -d output/consults test-suites/consult-data.robot
```
- for data manipulation scenarios (PUT, POST and DELETE):
```sh
$ python -m robot -d output/manipultation test-suites/manipulation-data.robot
```
<i>NOTE: For the PUT and POST methods two .JSON files were created to pass the body data, which can be changed as required.</i></br></br>

### 5. Generating additional documentation

Generating documentation for user keywords:

```sh
$ python -m robot.libdoc keywords/faker-api.robot doc/faker-api.html
```
Generating documentation for existing test cases:

```sh
$ python -m robot.testdoc test-suites/ doc/test-suites.html
```
