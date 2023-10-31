const pool = require('../dbconnector');

// Function to update a user's password in the database
const fetchData = (newPassword,  userId, callback) => {
  // Get a connection from the pool
  pool.getConnection((err, connection) => {
    if (err) {
      console.error('Error connecting to the database:', err);
      callback(err);
      return;
    }

    // Execute a SQL query to update the password
    const query = 'UPDATE student SET password = ? WHERE student_id = ?';
    const values = [newPassword, userId];
    
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
