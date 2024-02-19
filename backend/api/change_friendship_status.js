const pool = require('../dbconnector');

// Function to update the status in the friendship table
const fetchData = (id, status, student_id, callback) => {
  // Get a connection from the pool
  pool.getConnection((err, connection) => {
    if (err) {
      console.error('Error connecting to the database:', err);
      callback(err);
      return;
    }
    
    const updateQuery = 'UPDATE friendship SET status = ? WHERE friendship_id = ? AND user2_id = ?';
    const updateValues = [status, id, student_id];
    
    connection.query(updateQuery, updateValues, (err, result) => {
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

 