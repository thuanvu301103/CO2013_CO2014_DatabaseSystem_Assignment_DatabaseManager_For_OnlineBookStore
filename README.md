# CO2013_CO2014_DatabaseSystem_Assignment_DatabaseManager_For_OnlineBookStore
This is an asignment from Database System Course (from HCMUT). Our project is to build a simple Database Manager for online bookstore
# Getting Started
## npm file
- Make sure that you have already installed npm and Node.js
- Create npm file (You only need to read this part in case you want to customize your project):
  + Navigate to folder that contains your project
  + Open Terminal then run ```npm init``` This will create a package.json file, which contains the metadata of your npm file, such as its name, version, description, dependencies, and scripts. You can answer the prompts or use the default values. Make sure the name of your npm file is unique and does not conflict with any existing npm packages.
  + In your package.json file, you can specify the scripts that you want to run with your npm file. In our case:
    ```
    "scripts": {
      "start": "node app.js"
    }
    ```
  + To run your npm file, you can use the npm run command in your terminal, followed by the name of the script. For example, you can run ```npm run start```
## Install necessary package
Open Terminal then navigate to the folder that contain your project. Run ```npm run setup```
## MySQL
- In this project, we will use XAMPP to run a MySQL server so make sure that you have already install XAMPP.
- How to specify information to connect to this MySQL server?
  + Enter ```http://localhost/phpmyadmin``` in any browser
  + Go to ```User accounts``` tab to get the information
  + Change information in ```app.js```
# Run Project
- As I mentioned before, just open Termial, navigate to project folder then run ```npm run start```
- The server is now running on port ```3011```, root url  ```localhost:3011```
- Another notation is that, you must run XAMPP server before running this project server (How can a proxy server connect to database if the MySQL Server is not online right?)
# Stop project
On the Terminal window that is running the project: enter ```Ctrl+C``` then type ```yes```
# Software Architectural
- Model: MCV
- Fontend Technology: HTML, JavaScript
- Backend Technology: Express.js, JavaScript
