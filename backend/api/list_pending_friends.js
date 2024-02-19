const pool = require('../dbconnector');

// Function to get pending friendships for a user
const fetchData = (userId, callback) => {
  // Get a connection from the pool
  pool.getConnection((err, connection) => {
    if (err) {
      console.error('Error connecting to the database:', err);
      callback(err);
      return;
    }
    const query = `
    SELECT 
      friendship.friendship_id, 
      friendship.status, 
      s1.name AS sender_name, 
      s1.student_id AS sender_id, 
      s2.name AS receiver_name, 
      s2.student_id AS receiver_id
    FROM friendship
    JOIN student AS s1 ON friendship.user1_id = s1.student_id
    JOIN student AS s2 ON friendship.user2_id = s2.student_id
    WHERE (friendship.user1_id = ? OR friendship.user2_id = ?)
  `;
  
    connection.query(query, [userId, userId], (err, result) => {
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
