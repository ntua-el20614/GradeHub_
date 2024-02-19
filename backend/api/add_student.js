const pool = require('../dbconnector');

// Function to add a user to the database
const fetchData = (username, school, password, name, birthday, email, callback) => {
  // Get a connection from the pool
  pool.getConnection((err, connection) => {
    if (err) {
      console.error('Error connecting to the database:', err);
      callback(err);
      return;
    }

    // Execute a SQL query to add a user
    const query = 'INSERT INTO student (username, school, password, name, birthday, email, privacy) VALUES (?, ?, ?, ?, ?, ?, 0)';
    const values = [username, school, password, name, birthday, email];
    connection.query(query, values, (err, result) => {
      // Release the connection back to the pool
      connection.release();

      if (err) {
        console.error('Error executing query:', err);
        callback(err);
        return;
      }
 
      callback(null, result);
    });
  });
};

module.exports = { fetchData };