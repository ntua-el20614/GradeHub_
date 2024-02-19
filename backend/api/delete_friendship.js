const pool = require('../dbconnector');

// Function to delete a friendship by friendship_id
const fetchData = (friendship_id, user_id, callback) => {
  // Get a connection from the pool
  pool.getConnection((err, connection) => {
    if (err) {
      console.error('Error connecting to the database:', err);
      callback(err);
      return;
    }

    // Execute a SQL query to delete the friendship
    const query = 'DELETE FROM friendship WHERE friendship_id = ? AND (user1_id = ? OR user2_id = ?)';
    connection.query(query, [friendship_id,user_id,user_id], (err, result) => {
      // Release the connection back to the pool
      connection.release();

      if (err) {
        //console.error('Error executing query:', err);
        //callback(err);
        return;
      }

      // Check if the friendship was deleted successfully
      if (result.affectedRows === 1) {
        // Friendship deleted successfully
        callback(null, 'Friendship deleted successfully');
      } else {
        // Friendship with the specified ID not found
        callback(new Error('Friendship not found'), null);
      }
    });
  });
};

module.exports = { fetchData };
