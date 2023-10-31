const pool = require('../dbconnector');

// Function to fetch the average, pass count, fail count, and position for a specific student
const fetchData = (studentId, callback) => {
  // Get a connection from the pool
  pool.getConnection((err, connection) => {
    if (err) {
      console.error('Error connecting to the database:', err);
      callback(err, null);
      return;
    }

    // Execute SQL queries to calculate the average, pass count, fail count, and position
    const averageQuery = `
      SELECT AVG(grade) AS average
      FROM subject_user
      WHERE student_id = ? AND grade >= 5
    `;
    const passCountQuery = `
      SELECT COUNT(*) AS passCount
      FROM subject_user
      WHERE student_id = ? AND (grade >= 5 OR grade = 'Pass')
    `;
    const failCountQuery = `
      SELECT COUNT(*) AS failCount
      FROM subject_user
      WHERE student_id = ?
        AND (
        (grade = "Fail") OR(
          (grade REGEXP '^[0-9]+(\\.[0-9]+)?$') AND
          (CAST(grade AS DECIMAL(10, 2)) < 5.0)))
    `;
    const gradeless_courses_yet = `
    SELECT COUNT(*) AS Xcourses
    FROM subject_user
    WHERE student_id = ?
      AND (grade = 'x' OR grade = 'X')
    `;

    // Execute the averageQuery to get the average
    connection.query(averageQuery, [studentId], (err, averageResult) => {
      if (err) {
        console.error('Error executing averageQuery:', err);
        callback(err, null);
        return;
      }

      // Retrieve the average from the query results
      const average = averageResult[0].average;

      // Execute the passCountQuery to get the pass count
      connection.query(passCountQuery, [studentId], (err, passCountResult) => {
        if (err) {
          console.error('Error executing passCountQuery:', err);
          callback(err, null);
          return;
        }

        // Retrieve the pass count from the query results
        const passCount = passCountResult[0].passCount;

        // Execute the failCountQuery to get the fail count
        connection.query(failCountQuery, [studentId], (err, failCountResult) => {
          if (err) {
            console.error('Error executing failCountQuery:', err);
            callback(err, null);
            return;
          }

          // Retrieve the fail count from the query results
          const failCount = failCountResult[0].failCount;

          // Execute the positionQuery to get the position
          connection.query(gradeless_courses_yet, [studentId], (err, positionResult) => {
            // Release the connection back to the pool
            connection.release();

            if (err) {
              console.error('Error executing gradeless_courses_yet:', err);
              callback(err, null);
              return;
            }

            // Retrieve the position from the query results
            const Xcourses = positionResult[0].Xcourses;

            // Create the JSON object with student ID, average, pass count, fail count, and position
            const jsonResult = {
              studentId: studentId,
              average: average,
              passCount: passCount,
              failCount: failCount,
              coursesX: Xcourses
            };

            // Pass the JSON object to the callback function
            callback(null, jsonResult);
          });
        });
      });
    });
  });
};

module.exports = { fetchData };
