const { error } = require('console');
const pool = require('../dbconnector');

// Function to add/update friendship connection in the database
const fetchData = (user1_id, user2_id, status, callback) => {
  // Get a connection from the pool
  pool.getConnection((err, connection) => {
    if (err) {
      console.error('Error connecting to the database:', err);
      callback(err);
      return;
    }

    // Check if the friendship connection already exists
    const checkQuery = 'SELECT * FROM friendship WHERE (user1_id = ? AND user2_id = ?) OR (user1_id = ? AND user2_id = ?)';
    connection.query(checkQuery, [user1_id, user2_id, user2_id, user1_id], (err, result) => {
      if (err) {
        console.error('Error executing query:', err);
        callback(err);
        return;
      }

      if (result.length > 0) {

        if(status!="pending"){
        // Friendship connection already exists, update the status accordingly
        const updateQuery = 'UPDATE friendship SET status = ? WHERE (user1_id = ? AND user2_id = ?) OR (user1_id = ? AND user2_id = ?)';
        connection.query(updateQuery, [status, user1_id, user2_id, user2_id, user1_id], (err, result) => {
          // Release the connection back to the pool
          connection.release();
        
          if (err) {
            console.error('Error executing query:', err);
            callback(err);
            return;
          }

          callback(null, result);
        });}else{

            console.error('Error executing query:', err);
            callback(err);
            return error;
        }
      } else {
        // Friendship connection does not exist, insert a new entry
        const insertQuery = 'INSERT INTO friendship (user1_id, user2_id, status) VALUES (?, ?, ?)';
        connection.query(insertQuery, [user1_id, user2_id, status], (err, result) => {
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
