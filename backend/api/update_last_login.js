const pool = require('../dbconnector');

// Function to update a user's password in the database
const fetchData = (last_login,  userId, callback) => {
  // Get a connection from the pool
  pool.getConnection((err, connection) => {
    if (err) {
      console.error('Error connecting to the database:', err);
      callback(err);
      return;
    }

    // Execute a SQL query to update the password
    const query = `UPDATE student SET last_login = '${last_login}' WHERE student_id = ${userId}`;
    
    
    connection.query(query, (err, result) => {
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
