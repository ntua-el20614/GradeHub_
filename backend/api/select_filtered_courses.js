const { Console } = require('console');
const pool = require('../dbconnector');

// Function to manually split a comma-separated string into an array
function manuallySplitString(inputString) {
    const result = [];
    if (inputString) {
        let current = '';
        for (let i = 0; i < inputString.length; i++) {
            if (inputString[i] === ',') {
                if (current !== '') {
                    result.push(current.trim());
                }
                current = '';
            } else {
                current += inputString[i];
            }
        }
        if (current !== '') {
            result.push(current.trim());
        }
    }
    return result;
}



const fetchData = (school_id, user_id, semesters, flows, states, callback) => {
    // Get a connection from the pool
    pool.getConnection((err, connection) => {
        if (err) {
            console.error('Error connecting to the database:', err);
            callback(err);
            return;
        }

        let query = 'SELECT '
        query += '* FROM course '

        if (states.length > 0) {
            query += 'as c, subject_user as su'

            query += ' WHERE school_id = ? AND su.student_id = ? ';
        } else {
            query += ' WHERE school_id = ? ';

        }



        semesters = manuallySplitString(semesters[0]);
        flows = manuallySplitString(flows[0]);
        for (var i = 0; i < flows.length; i++) {
            flows[i] = `%${flows[i][0]}%`
        }
 
        states = manuallySplitString(states[0]);


        // Check if semesters and flows are not empty
        if (semesters.length > 0 || flows.length > 0 || states.length > 0) {
            query += ' AND ';

            // Build conditions for semesters
            if (semesters.length > 0) {

                if (semesters.length > 1)
                    query += '(';
                for (let i = 0; i < semesters.length; i++) {
                    if (i > 0) {
                        query += ' OR ';
                    }
                    if (states.length > 0)
                        query += ' c.semester = ?';
                    else
                        query += 'semester = ?';
                }
                if (semesters.length > 1)
                    query += ')';
            }

            // Build conditions for flows
            if (flows.length > 0) {

                if (semesters.length > 0) {
                    query += ' AND ';
                }
                if (flows.length > 1)
                    query += '(';

                for (let i = 0; i < flows.length; i++) {

                    if (i > 0) {
                        query += ' OR ';
                    }
                    query += 'flow LIKE ?';
                }
                if (flows.length > 1)
                    query += ')';
            }

            const add_me_if_i_have_states = ` su.course_id = c.course_id AND`
            if ((flows.length != 0 || semesters.length != 0) && states.length > 0)
                query += " AND "
            if (states.length > 0)
                query += add_me_if_i_have_states;
            const mycourses = ` (su.pending=1)` //case 1
            const myoldcourses = ` ( (su.grade>=5 OR su.grade="Pass") AND su.pending=0)` //case 2
            const myfuturecourses = ` (su.grade="X" AND su.pending=0)` //case 3
            //const notmycourses = `(NOT EXISTS( SELECT 1 FROM subject_user as su WHERE su.course_id = c.course_id AND su.student_id = ${user_id}) AND su.course_id = 1)` //case 4
            const myfailedcourses = ` (su.grade<5 AND su.grade!="Pass" AND su.grade!="X") `


            let states_arr = ["empty", mycourses, myoldcourses, myfuturecourses, myfailedcourses];//, notmycourses];


            if (states.length > 0) {
                if (states.length > 1)
                    query += '(';

                for (let i = 0; i < states.length; i++) {

                    if (i > 0) {
                        query += ' OR ';
                    }
                    query += states_arr[states[i]];
                }
                if (states.length > 1)
                    query += ')';
            }
        }

        let queryParams
        if (states.length > 0)
            queryParams = [school_id, user_id, ...semesters, ...flows];
        else
            queryParams = [school_id, ...semesters, ...flows];
        connection.query(query, queryParams, (err, results) => {
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
