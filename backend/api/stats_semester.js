const pool = require('../dbconnector');

const fetchData = (studentId, callback) => {
  pool.getConnection((err, connection) => {
    if (err) {
      console.error('Error connecting to the database:', err);
      callback(err, null);
      return;
    }

    // Query to calculate the average of each semester for the user
    const query = `
      SELECT semester, ROUND(AVG(CAST(grade AS DECIMAL(10, 3))), 3) AS semesterAverage
      FROM subject_user
      WHERE student_id = ? AND grade >= 5
      GROUP BY semester
    `;

    connection.query(query, [studentId], (err, results) => {
      connection.release(); // Release the connection back to the pool

      if (err) {
        console.error('Error executing query:', err);
        callback(err, null);
        return;
      }

      // Create an array of objects with semester and average
      const averageSemesters = results.map((row) => ({
        [row.semester]: row.semesterAverage,
      }));

      callback(null, averageSemesters);
    });
  });
};

module.exports = { fetchData };
