const pool = require('../dbconnector');

// Function to add a user to the database or update pending value
const fetchData = (student_id, course_id, semester, grade, pending, callback) => {
  // Get a connection from the pool
  pool.getConnection((err, connection) => {
    if (err) {
      console.error('Error connecting to the database:', err);
      callback(err);
      return;
    }

    // Check if the subject_user record exists
    const checkQuery = 'SELECT * FROM subject_user WHERE student_id = ? AND course_id = ?';
    const checkValues = [student_id, course_id];
    connection.query(checkQuery, checkValues, (err, rows) => {
      if (err) {
        console.error('Error executing query:', err);
        connection.release();
        callback(err);
        return;
      }

      // Record already exists, update the pending value
      if (rows.length > 0) {
        const updateQuery = 'UPDATE subject_user SET pending = ? WHERE student_id = ? AND course_id = ?';
        const updateValues = [pending, student_id, course_id];
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
      }
      // Record doesn't exist, insert a new one
      else {
        const insertQuery = 'INSERT INTO subject_user (student_id, course_id, semester, grade, pending) VALUES (?, ?, ?, ?, ?)';
        const insertValues = [student_id, course_id, semester, grade, pending];
        connection.query(insertQuery, insertValues, (err, result) => {
          // Release the connection back to the pool
          connection.release();

          if (err) {
            console.error('Error executing query:', err);
            callback(err);
            return;
          }

          callback(null, result);
        });
      }
    });
  });
};

module.exports = { fetchData };
