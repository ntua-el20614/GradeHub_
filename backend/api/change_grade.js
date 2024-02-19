const pool = require('../dbconnector');

// Function to add a user to the database
const fetchData = (student_id, course_id, grade, callback) => {
  // Get a connection from the pool
  pool.getConnection((err, connection) => {
    if (err) {
      console.error('Error connecting to the database:', err);
      callback(err);
      return;
    }

    // Execute a SQL query to add a user
    const query = 'UPDATE subject_user SET grade = ? WHERE student_id = ? AND course_id = ?';    const values = [student_id, course_id, grade];
    const qvalues = [grade, student_id, course_id];
    connection.query(query, qvalues, (err, result) => {
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