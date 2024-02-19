const pool = require('../dbconnector');

// Function to fetch data from the database
const fetchData = (student_id, callback) => {

  // Get a connection from the pool
  pool.getConnection((err, connection) => {
    if (err) {
      console.error('Error connecting to the database:', err);
      callback(err, null);
      return;
    }

    // Execute a SQL query to fetch data
    const query = `
    SELECT course.name, course.course_id, subject_user.grade, course.semester
    FROM subject_user
    INNER JOIN course ON subject_user.course_id = course.course_id
    WHERE subject_user.student_id = ` + student_id + `
    GROUP BY course.semester, course.course_id
    ORDER BY course.semester ASC`;
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