const pool = require('../dbconnector');

// Function to fetch data from the database
const fetchData = (school_id, callback) => {
  // Get a connection from the pool
  pool.getConnection((err, connection) => {
    if (err) {
      console.error('Error connecting to the database:', err);
      callback(err);
      return;
    }

    // Execute a SQL query to fetch data
    const query = 'SELECT * FROM course WHERE school_id = ?';
    connection.query(query, [school_id], (err, results) => {
      // Release the connection back to the pool
      connection.release();

      if (err) {
        console.error('Error executing query:', err);
        callback(err, null);
        return;
      }

      // Pass the retrieved data to the callback function
      callback(null, results);
    });
  });
};


module.exports = { fetchData };