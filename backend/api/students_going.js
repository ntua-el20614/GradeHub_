const pool = require('../dbconnector');

// Function to fetch data from the database
const fetchData = (courseID, callback) => {

  // Get a connection from the pool
  pool.getConnection((err, connection) => {
    if (err) {
      console.error('Error connecting to the database:', err);
      callback(err, null);
      return;
    }

    // Execute a SQL query to fetch data
    const query = `
    SELECT student_id 
    FROM subject_user
    WHERE subject_user.course_id = ` + courseID + ` 
    AND subject_user.going = True
    `;
    connection.query(query, (err, results) => {
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