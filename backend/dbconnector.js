const mysql = require('mysql2');

// Create a connection pool
const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',//master sto pc
  password: 'password',
  database: 'students',
  connectionLimit: 100 // Adjust the limit as per your requirements
});

module.exports = pool;


// Test the database connection
pool.getConnection((err, connection) => {
  if (err) {
    console.error('Error connecting to the database:', err);
  } else {
    console.log('Connected to the database!');
    connection.release();
  }
});