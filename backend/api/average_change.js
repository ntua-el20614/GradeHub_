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
      WHERE student_id = ? AND (grade >= 5)
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

        // Create the JSON object with student ID, average, pass count, fail count, and position
            const jsonResult = {
              average: average,
              passCount: passCount
            };

            // Pass the JSON object to the callback function
            callback(null, jsonResult);
          }); 
    });
  });
};

module.exports = { fetchData };
