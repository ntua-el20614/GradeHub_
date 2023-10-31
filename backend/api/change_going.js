const pool = require('../dbconnector');

// Function to add a user to the database or update going value
const fetchData = (student_id, course_id, going, callback) => {
    // Get a connection from the pool
    pool.getConnection((err, connection) => {
        if (err) {
            console.error('Error connecting to the database:', err);
            callback(err);
            return;
        }
        const updateQuery = 'UPDATE subject_user SET going = ? WHERE student_id = ? AND course_id = ?';
        const updateValues = [going, student_id, course_id];
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


    });
};

module.exports = { fetchData };
