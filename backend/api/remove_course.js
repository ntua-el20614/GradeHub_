const pool = require('../dbconnector');

// Function to delete the subject_user record
const fetchData = (student_id, course_id, callback) => {
  // Get a connection from the pool
  pool.getConnection((err, connection) => {
    if (err) {
      console.error('Error connecting to the database:', err);
      callback(err);
      return;
    }

    // Execute a SQL query to delete the subject_user record
    const query = 'DELETE FROM subject_user WHERE student_id = ? AND course_id = ?';
    const values = [student_id, course_id];
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
