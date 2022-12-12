# ITI-DevOps
## Bash-Script-Project
### Database Management System (DBMS).

The Project aim to develop DBMS, that will enable users to store and retrieve the data from Hard-disk.

##### You should read this file before running.

##### The DBMS Features.

- The Database will store as Directory on Current Script File
- The Select of Rows displayed in screen/terminal in  an Accepted/Good Format
- Ask about columns datatypes in create table and check on them in both insert and update
- Ask about primary key in create table and check for it in the insert into table

The Application will be CLI Menu based app, that will provide to user this Menu items:
Main Menu:
- Create Database
- List Databases
- Connect To Databases
- Drop Database

Upon user Connect to Specific Database, there will be new Screen with this Menu:
- Create Table 
- List Tables
- Drop Table
- Insert into Table
- Select From Table
- Delete From Table
- Update Table

##### Some Steps to run the DBMS in perfect way.

1- You have to group all files at the same Directory any where at your disk.

2- To Run the DBMS from any where in your disk you have to add the path of the DBMS directory 
to the PATH in the file .bashrc that located in your Home Directory Like: path=$PATH:DBMS_PATH

3- To run the DMBS you should write "batServer.sh" command in terminal where you want to create your database.

4- Now you can interact with the menus in the DBMS to get a perfect user experiance, Enjoy using.
