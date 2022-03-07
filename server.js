const express = require ('express');
const mysql = require ('mysql2');
const inquirer = require ('inquirer');
const cTable = require ('console.table');


const PORT = process.env.PORT || 3001;
const app = express();

app.use(express.urlencoded({ extended: false }));
app.use(express.json());

// connect to database
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'company_db',
  });
  
  connection.connect(err => {
    if (err) throw err;
    console.log("connected to the company_db database");
    startMenu();

  });

  const startMenu = () => {
      inquirer.prompt({
        message: 'What would you like to do today?',
        name: 'menu',
        type: 'list',
        choices: [ 
          'View all departments',
          'View all jobs',
          'View all employees',
          'Add a department',
          'Add a job',
          'Add an employee',
          'Update employee job',
          'Exit',
        ],
    
      }) 

    
    
    startMenu();
    
    }

