# Automated tests for API Rest with Robot Framework.

- Tests applied to FakeRestAPI.Web, available at https://fakerestapi.azurewebsites.net/swagger/ui/index#/
- It isn't necessary to register your application
- The API doesn't require authentication

### Pre-conditions for the tests
- Clone the project
- Install Python 2.7.15
- Use an ASCII editor of your preference (i.e. VSCode, Atom, RIDE, etc)</br>

### Installing required Python libraries
With the pre-conditions satisfied, the libraries required to run the tests must be installed. At the terminal, execute the command below:
```sh
Windows
$ pip install -r requirements.txt
```
```sh
Linux / Mac
$ sudo pip install -r requirements.txt
```
This command will perform pip installation of what is required by the Robot Framework specified in the <i>requirements.txt file</i>.</br>

### Running Robot Framework tests
Execute at the terminal the command below:
To the consult (GET) scenarios 
```sh
$ robot -d output test-suites/test-suite-consult-data.robot
```
To the manipulation (PUT, POST and DELETE) scenarios:
```sh
$ robot -d output test-suites/test-suite-manipulation-data.robot
```
<b>NOTE: For the PUT and POST methods two .JSON files were created to pass the body data, which can be changed as required.</b>

### Gererating documentation
- Generate reports of your scenarios or users keywords with Robot.

- The following command generates the documentation of the user keywords in the output directory (or another of your preference):
```sh
$ python -m robot.libdoc keywords/keywords-faker-api.robot output/user-keywords-documentation.html
```
- The following command generates the documentation of the scenarios in the output directory (or another of your preference):
```sh
$ python -m robot.testdoc test-suites/test-suite-manipulation-data.robot output/test-suite-documentation.html
```
