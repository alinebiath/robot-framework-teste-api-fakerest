# Automated tests for "FakeRestAPI.Web" API with Robot Framework

- Tests applied to FakeRestAPI.Web, available at: https://fakerestapi.azurewebsites.net/swagger/ui/index#/
- Performed some basic tests with HTTP methods: GET, POST, PUT and DELETE
- It isn't necessary to register your application
- The API doesn't require authentication

### 1. Structure of tests
The tests are structured in directories as follows:
- **keywords**: contains <i>.robot</i> files with implementation keywords.
- **other_files**: contains <i>.json</i> files created to pass the body data in PUT and POST methods.
- **test-suites**: contains the <i>.robot</i> file with test suites (scenarios or test cases).
- **.gitignore**: ccontains files to be ignored by git.
- **requirements.txt**: file containing the calls for installation of the robot framework and the necessary libraries.</br>

### 2. Pre-conditions for the tests
- Clone the project
- Python 2.7.15 installed
- Use an ASCII editor of your preference (i.e. VSCode, Atom, RIDE, etc)</br>

### 3. Installing required Python libraries
With the pre-conditions satisfied, the libraries required to run the tests must be installed. At the terminal, execute the command below:
```sh
Windows
$ pip install -r requirements.txt
```
```sh
Linux / Mac
$ sudo pip install -r requirements.txt
```
This command will perform pip installation of what is required by the Robot Framework specified in the <i>requirements.txt file</i>.</br></br>

### 4. Running Robot Framework tests
Execute at the terminal the command below:
- For the consultation scenarios (GET): 
```sh
$ robot -d output test-suites/test-suite-consult-data.robot
```
- for data manipulation scenarios (PUT, POST and DELETE):
```sh
$ robot -d output test-suites/test-suite-manipulation-data.robot
```
<i>NOTE: For the PUT and POST methods two .JSON files were created to pass the body data, which can be changed as required.</i></br></br>

### 5. Gererating documentation
Generate reports of your scenarios or users keywords with Robot.

- The following command generates the documentation of the user keywords in the output directory (or another of your preference):
```sh
$ python -m robot.libdoc keywords/keywords-faker-api.robot output/user-keywords-documentation.html
```
- The following command generates the documentation of the scenarios in the output directory (or another of your preference):
```sh
$ python -m robot.testdoc test-suites/test-suite-manipulation-data.robot output/test-suite-documentation.html
```
