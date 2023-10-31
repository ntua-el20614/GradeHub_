const pool = require('../dbconnector');

// Function to delete a user by student_id
const fetchData = (student_id, callback) => {
  // Get a connection from the pool
  pool.getConnection((err, connection) => {
    if (err) {
      console.error('Error connecting to the database:', err);
      callback(err);
      return;
    }

    // Start a transaction to ensure data consistency
    connection.beginTransaction((err) => {
      if (err) {
        connection.release();
        console.error('Error starting transaction:', err);
        callback(err);
        return;
      }

      // Execute a SQL query to delete related records in the subject_user table
      const deleteSubjectUserQuery = 'DELETE FROM subject_user WHERE student_id = ?';
      connection.query(deleteSubjectUserQuery, [student_id], (err, subjectUserResult) => {
        if (err) {
          connection.rollback(() => {
            connection.release();
            console.error('Error deleting subject_user records:', err);
            callback(err);
          });
          return;
        }

        // Execute a SQL query to delete related records in the friendship table
        const deleteFriendshipQuery = 'DELETE FROM friendship WHERE user1_id = ? OR user2_id = ?';
        connection.query(deleteFriendshipQuery, [student_id, student_id], (err, friendshipResult) => {
          if (err) {
            connection.rollback(() => {
              connection.release();
              console.error('Error deleting friendship records:', err);
              callback(err);
            });
            return;
          }

          // Execute a SQL query to delete the user from the student table
          const deleteUserQuery = 'DELETE FROM student WHERE student_id = ?';
          connection.query(deleteUserQuery, [student_id], (err, studentResult) => {
            if (err) {
              connection.rollback(() => {
                connection.release();
                console.error('Error deleting student record:', err);
                callback(err);
              });
              return;
            }

            // Commit the transaction
            connection.commit((err) => {
              if (err) {
                connection.rollback(() => {
                  connection.release();
                  console.error('Error committing transaction:', err);
                  callback(err);
                });
              } else {
                // Release the connection back to the pool
                connection.release();

                // Check if the user and related records were deleted successfully
                if (studentResult.affectedRows === 1) {
                  // User and related records deleted successfully
                  callback(null, 'User and related records deleted successfully');
                } else {
                  // User with the specified ID not found
                  callback(new Error('User not found'), null);
                }
              }
            });
          });
        });
      });
    });
  });
};

module.exports = { fetchData };
