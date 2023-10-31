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
        SELECT c.course_id, c.semester, c.name, c.optional, su.grade, su.going, su.pending AS pending
        FROM course c
        LEFT JOIN subject_user su ON c.course_id = su.course_id AND su.student_id = ${student_id}
        WHERE (su.grade = 'Fail') OR su.pending = 1
        ORDER BY c.semester, c.course_id;
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