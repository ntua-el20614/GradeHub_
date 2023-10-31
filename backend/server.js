const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser'); // Import the cookie-parser module

const app = express();
app.use(cookieParser()); // Use the cookie-parser middleware

app.use(cors());
app.use(bodyParser.json());
// Define the allowed origin (your front-end application's URL)
const allowedOrigins = [
  'http://localhost:8800',
  'http://localhost:8800/home',
  'http://localhost:8800/home_admin',
  'http://localhost:8800/change_courses',
  'http://localhost:8800/my_grades',
  'http://localhost:8800/my_active_courses',
  'http://localhost:8800/my_friends',
  'http://localhost:8800/september',
  'http://localhost:8800/diagnostic',
  'http://localhost:8800/forgot_password',
  'http://localhost:8800/notes',
  'http://localhost:8800/signup',
  'http://localhost:8800/admin'

];

// Configure CORS options
const corsOptions = {
  origin: function (origin, callback) {
    if (allowedOrigins.indexOf(origin) !== -1 || !origin) {
      // Allow requests from allowed origins or if there is no origin (e.g., a direct API request)
      callback(null, true);
    } else {
      // Deny requests from other origins
      callback(new Error('Not allowed by CORS'));
    }
  },
  credentials: true, // Allow credentials (cookies, HTTP authentication)
  methods: 'GET, POST, PUT, DELETE', // Specify the allowed HTTP methods
  allowedHeaders: 'Content-Type, Authorization', // Specify the allowed headers
};

// Use the CORS middleware with the specified options
app.use(cors(corsOptions));


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
const { fetchData: fetchUsers } = require('./api/all_students');
const { fetchData: fetchConfirmation } = require('./api/all_student_confirmation');
const { fetchData: fetchSchools } = require('./api/all_schools');
const { fetchData: fetchNames } = require('./api/all_names');
const { fetchData: fetchAllCourses } = require('./api/all_courses');

const { fetchData: fetchAvgOfCourse } = require('./api/average_course');
const { fetchData: fetchCourses } = require('./api/students_courses');
const { fetchData: fetchFriendCourses } = require('./api/friends_courses');
const { fetchData: fetchFriendPendingCourses } = require('./api/pending_courses');
const { fetchData: fetchMyCourses } = require('./api/my_courses');
const { fetchData: StudentsGoing } = require('./api/students_going');
const { fetchData: fetchFilteredCourses } = require('./api/select_filtered_courses');
const { fetchData: fetchSchoolInfo } = require('./api/all_info_for_school');



const { fetchData: addStudent } = require('./api/add_student');

const { fetchData: addFriend } = require('./api/add_friend');
const { fetchData: listFriends } = require('./api/list_pending_friends');
const { fetchData: changeStatus } = require('./api/change_friendship_status');

const { fetchData: semester_stats } = require('./api/stats_semester');
const { fetchData: Stats } = require('./api/stats');
const { fetchData: Sept_stats } = require('./api/average_change');
const { fetchData: students_privacy } = require('./api/students_privacy');

const { fetchData: changePending } = require('./api/change_pending');
const { fetchData: changeGoing } = require('./api/change_going');
const { fetchData: changeGrade } = require('./api/change_grade');
const { fetchData: changePassword } = require('./api/change_password');
const { fetchData: changeMyLast_login } = require('./api/update_last_login');


const { fetchData: changePrivacy } = require('./api/change_privacy');

const { fetchData: removeCourse } = require('./api/remove_course');
const { fetchData: deleteFriendship } = require('./api/delete_friendship');
const { fetchData: deleteUser } = require('./api/delete_user');
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Define a route handler for the root URL
app.get('/', (req, res) => {
  res.send('Hello, world!');
});

// Define a route handler for /all_users
app.get('/all_students', (req, res) => {

  if (req.cookies && req.cookies['user']) {

    const my_user = JSON.parse(req.cookies['user']);
    if (my_user.student_id == 1 || my_user.student_id == 2) {
      fetchUsers((err, results) => {
        if (err) {
          console.error('Error fetching user data:', err);
          res.status(500).send('Internal Server Error');
          return;
        }

        res.json(results);
      });

    } else {
      res.json({ "error": "you aren't authorized to view this" });
    }

  }else{
    res.json({ "error": "you aren't logged in" });
  }

});

 

// Define a route handler for /all_users
app.get('/confirmation/:username/:password', (req, res) => {
  const usrnm = req.params.username;
  const psswrd = req.params.password;

  fetchConfirmation(usrnm, psswrd, (err, results) => {
    if (err) {
      console.error('Error fetching user data:', err);
      res.status(500).send('Internal Server Error');
      return;
    }

    res.json(results);
  });


});

// Define a route handler for /all_schools
app.get('/all_schools', (req, res) => {
  fetchSchools((err, results) => {
    if (err) {
      console.error('Error fetching user data:', err);
      res.status(500).send('Internal Server Error');
      return;
    }

    res.json(results);
  });
});

// Define a route handler for /all_schools
app.get('/all_students_friends', (req, res) => {
  fetchNames((err, results) => {
    if (err) {
      console.error('Error fetching user data:', err);
      res.status(500).send('Internal Server Error');
      return;
    }

    res.json(results);
  });
});

// Define a route handler for /fetchAllCourses
app.get('/all_courses/:school_id', (req, res) => {
  const school_id = req.params.school_id;
  if (req.cookies && req.cookies['user']) {

    const my_user = JSON.parse(req.cookies['user']);
    if ((my_user.school == parseInt(school_id))) {
      fetchAllCourses(school_id, (err, results) => {
        if (err) {
          console.error('Error fetching user data:', err);
          res.status(500).send('Internal Server Error');
          return;
        }

        res.json(results);
      });

    } else {
      res.json({ "error": "you aren't authorized to view this" });
    }

  } else {
    res.json({ "error": "this isn't your school" })
  }
});


// Define a route handler for /filtered_courses
app.get('/filtered_courses/:school_id/:user_id', (req, res) => {
  const school_id = req.params.school_id;
  const user_id = req.params.user_id;
  const semesters = req.query.semesters || [];
  const flows = req.query.flows || [];
  const states = req.query.states || [];

  // Convert semesters and flows to arrays if they are not
  const arraySemesters = Array.isArray(semesters) ? semesters : [semesters];
  const arrayFlows = Array.isArray(flows) ? flows : [flows];
  const arrayStates = Array.isArray(states) ? states : [states];

  if (req.cookies && req.cookies['user']) {
    const my_user = JSON.parse(req.cookies['user']);

    if ((my_user != undefined) && (my_user.student_id == parseInt(user_id)))
      fetchFilteredCourses(school_id, user_id, arraySemesters, arrayFlows, arrayStates, (err, results) => {
        if (err) {
          console.error('Error fetching course data:', err);
          res.status(500).send('Internal Server Error');
          return;
        }

        res.json(results);
      });
  } else {
    res.status(400).json({ "error": "User information (user cookie) is missing or invalid" });
  }

});




app.get('/course_avg/:id', (req, res) => {
  const courseid = req.params.id;

  if (req.cookies && req.cookies['user']) {
    fetchAvgOfCourse(courseid, (err, results) => {
      if (err) {
        console.error('Error fetching user data:', err);
        res.status(500).send('Internal Server Error');
        return;
      }

      res.json(results);
    });


  } else {
    res.status(400).json({ "error": "User information (user cookie) is missing or invalid" });
  }
});


app.get('/students_courses/:id', (req, res) => {
  const userid = req.params.id;


  if (req.cookies && req.cookies['user']) {

    const my_user = JSON.parse(req.cookies['user']);

    if ((my_user != undefined) && (my_user.student_id == parseInt(userid))) {
      fetchCourses(userid, (err, results) => {
        if (err) {
          console.error('Error fetching user data:', err);
          res.status(500).send('Internal Server Error');
          return;
        }

        res.json(results);
      });
    } else {
      res.json({ "error": "you aren't authorized to view this" });
    }
  } else {
    res.status(400).json({ "error": "User information (user cookie) is missing or invalid" });
  }
});


app.get('/friends_courses/:id/:my_id', (req, res) => {
  const userid = req.params.id;
  const the_users_id = req.params.my_id;


  if (req.cookies && req.cookies['user']) {

    const my_user = JSON.parse(req.cookies['user']);

    if ((my_user != undefined) && (my_user.student_id == parseInt(the_users_id))) {
      fetchFriendCourses(userid, the_users_id, (err, results) => {
        if (err) {
          console.error('Error fetching user data:', err);
          res.status(500).send('Internal Server Error');
          return;
        }

        res.json(results);
      });
    } else {
      res.json({ "error": "you aren't authorized to view this" });
    }
  } else {
    res.status(400).json({ "error": "User information (user cookie) is missing or invalid" });
  }
});



app.get('/friends_pending_courses/:id/:my_id', (req, res) => {
  const userid = req.params.id;
  const the_users_id = req.params.my_id;


  if (req.cookies && req.cookies['user']) {

    const my_user = JSON.parse(req.cookies['user']);

    if ((my_user != undefined) && (my_user.student_id == parseInt(the_users_id))) {
      fetchFriendPendingCourses(userid, the_users_id, (err, results) => {
        if (err) {
          console.error('Error fetching user data:', err);
          res.status(500).send('Internal Server Error');
          return;
        }

        res.json(results);
      });
    } else {
      res.json({ "error": "you aren't authorized to view this" });
    }
  } else {
    res.status(400).json({ "error": "User information (user cookie) is missing or invalid" });
  }
});

//all_info_for_school fetchSchoolInfo

app.get('/schools_info/:id', (req, res) => {
  const userid = req.params.id;


  if (req.cookies && req.cookies['user']) {



    const my_user = JSON.parse(req.cookies['user']);
    if ((my_user != undefined) && (my_user.school == parseInt(userid))) {

      fetchSchoolInfo(userid, (err, results) => {
        if (err) {
          console.error('Error fetching user data:', err);
          res.status(500).send('Internal Server Error');
          return;
        }

        res.json(results);
      })
    } else {
      res.json({ "error": "you aren't authorized to view this" });
    }
    ;
  } else {
    res.status(400).json({ "error": "User information (user cookie) is missing or invalid" });
  }
});




app.get('/my_courses/:id', (req, res) => {
  const userid = req.params.id;

  if (req.cookies && req.cookies['user']) {
    const my_user = JSON.parse(req.cookies['user']);


    if ((my_user != undefined) && (my_user.student_id == parseInt(userid))) {
      fetchMyCourses(userid, (err, results) => {
        if (err) {
          console.error('Error fetching user data:', err);
          res.status(500).send('Internal Server Error');
          return;
        }

        res.json(results);
      });
    } else {
      res.json({ "error": "you aren't authorized to view this" });
    }


  } else {
    res.status(400).json({ "error": "User information (user cookie) is missing or invalid" });
  }
});

app.get('/students_going/:id', (req, res) => {
  const courseID = req.params.id;

  if (req.cookies && req.cookies['user']) {
    StudentsGoing(courseID, (err, results) => {
      if (err) {
        console.error('Error fetching user data:', err);
        res.status(500).send('Internal Server Error');
        return;
      }

      res.json(results);
    });

  } else {
    res.status(400).json({ "error": "User information (user cookie) is missing or invalid" });
  }
});

app.get('/add_student/:username/:school/:password/:name/:birthday/:email', (req, res) => {
  const username = req.params.username;
  const password = req.params.password;
  const name = req.params.name;
  const birthday = req.params.birthday;
  const email = req.params.email;
  const school = req.params.school;
  addStudent(username, school, password, name, birthday, email, (err, results) => {
    if (err) {
      console.error('Error fetching user data:', err);
      res.status(500).send('Internal Server Error');
      return;
    }

    res.json(results);
  });
});


app.get('/add_friend/:user1/:user2/:status', (req, res) => {
  const user1 = req.params.user1;
  const user2 = req.params.user2;
  const status = req.params.status;

  if (req.cookies && req.cookies['user']) {


    const my_user = JSON.parse(req.cookies['user']);
    if ((my_user != undefined) && (my_user.student_id == parseInt(user1) || my_user.student_id == parseInt(user2))) {
      addFriend(user1, user2, status, (err, results) => {
        if (err) {
          console.error('Error fetching user data:', err);
          res.status(500).send('Internal Server Error');
          return;
        }

        res.json(results);
      });
    } else {
      res.json({ "error": "you aren't authorized to view this" });
    }
  } else {
    res.status(400).json({ "error": "User information (user cookie) is missing or invalid" });
  }
});

app.get('/list_friends/:id', (req, res) => {
  const userid = req.params.id;

  if (req.cookies && req.cookies['user']) {
    const my_user = JSON.parse(req.cookies['user']);
    if ((my_user != undefined) && (my_user.student_id == parseInt(userid))) {
      listFriends(userid, (err, results) => {
        if (err) {
          console.error('Error fetching user data:', err);
          res.status(500).send('Internal Server Error');
          return;
        }

        res.json(results);
      });
    } else {
      res.json({ "error": "you aren't authorized to view this" });
    }
  } else {
    res.status(400).json({ "error": "User information (user cookie) is missing or invalid" });
  }
});


app.get('/change_friendship_status/:f_id/:status/:user_id', (req, res) => {
  const user1 = req.params.f_id;
  const status = req.params.status;
  const users_id = req.params.user_id;


  if (req.cookies && req.cookies['user']) {
    const my_user = JSON.parse(req.cookies['user']);
    if ((my_user != undefined) && (my_user.student_id == parseInt(users_id))) {
      changeStatus(user1, status, users_id, (err, results) => {
        if (err) {
          console.error('Error fetching user data:', err);
          res.status(500).send('Internal Server Error');
          return;
        }

        res.json(results);
      });
    } else {
      res.json({ "error": "you aren't authorized to view/edit this" });
    }
  } else {
    res.status(400).json({ "error": "User information (user cookie) is missing or invalid" });
  }
});




app.get('/semester_stats/:id', (req, res) => {
  const userid = req.params.id;

  if (req.cookies && req.cookies['user']) {
    const my_user = JSON.parse(req.cookies['user']);
    if ((my_user != undefined) && (my_user.student_id == parseInt(userid))) {
      semester_stats(userid, (err, results) => {
        if (err) {
          console.error('Error fetching user data:', err);
          res.status(500).send('Internal Server Error');
          return;
        }

        res.json(results);
      });
    } else {
      res.json({ "error": "you aren't authorized to view/edit this" });
    }
  } else {
    res.status(400).json({ "error": "User information (user cookie) is missing or invalid" });
  }
});




app.get('/stats/:id', (req, res) => {
  const userid = req.params.id;

  if (req.cookies && req.cookies['user']) {
    const my_user = JSON.parse(req.cookies['user']);

    if ((my_user != undefined) && (my_user.student_id == parseInt(userid))) {
      Stats(userid, (err, results) => {
        if (err) {
          console.error('Error fetching user data:', err);
          res.status(500).send('Internal Server Error');
          return;
        }
        res.json(results);
      })
    } else {
      res.json({ "error": "you aren't authorized to view this" });
    }
  } else {
    res.status(400).json({ "error": "User information (user cookie) is missing or invalid" });
  }
});


app.get('/sept_stats/:id', (req, res) => {
  const userid = req.params.id;



  if (req.cookies && req.cookies['user']) {
    const my_user = JSON.parse(req.cookies['user']);
    if ((my_user != undefined) && (my_user.student_id == parseInt(userid))) {
      Sept_stats(userid, (err, results) => {
        if (err) {
          console.error('Error fetching user data:', err);
          res.status(500).send('Internal Server Error');
          return;
        }

        res.json(results);
      });
    } else {
      res.json({ "error": "you aren't authorized to view/edit this" });
    }
  } else {
    res.status(400).json({ "error": "User information (user cookie) is missing or invalid" });
  }
});


app.get('/privacy/:id', (req, res) => {
  const userid = req.params.id;
  students_privacy(userid, (err, results) => {
    if (err) {
      console.error('Error fetching user data:', err);
      res.status(500).send('Internal Server Error');
      return;
    }

    res.json(results);
  });
});


app.get('/change_pending/:student_id/:course_id/:semester/:grade/:pending', (req, res) => {
  const student_id = req.params.student_id;
  const course_id = req.params.course_id;
  const semester = req.params.semester;
  const grade = req.params.grade;
  const pending = req.params.pending;


  if (req.cookies && req.cookies['user']) {
    const my_user = JSON.parse(req.cookies['user']);
    if ((my_user != undefined) && (my_user.student_id == parseInt(student_id))) {
      changePending(student_id, course_id, semester, grade, pending, (err, results) => {
        if (err) {
          console.error('Error fetching user data:', err);
          res.status(500).send('Internal Server Error');
          return;
        }

        res.json(results);
      });
    } else {
      res.json({ "error": "you aren't authorized to view/edit this" });
    }
  } else {
    res.status(400).json({ "error": "User information (user cookie) is missing or invalid" });
  }
});


app.get('/change_going/:student_id/:course_id/:going', (req, res) => {
  const student_id = req.params.student_id;
  const course_id = req.params.course_id;
  const going = req.params.going;
  if (req.cookies && req.cookies['user']) {
    const my_user = JSON.parse(req.cookies['user']);
    if ((my_user != undefined) && (my_user.student_id == parseInt(student_id))) {
      changeGoing(student_id, course_id, going, (err, results) => {
        if (err) {
          console.error('Error fetching user data:', err);
          res.status(500).send('Internal Server Error');
          return;
        }

        res.json(results);
      });
    }
    else {
      res.json({ "error": "you aren't authorized to view/edit this" });
    }
  } else {
    res.status(400).json({ "error": "User information (user cookie) is missing or invalid" });
  }
});


app.get('/change_grade/:student_id/:course_id/:grade', (req, res) => {
  const student_id = req.params.student_id;
  const course_id = req.params.course_id;
  const grade = req.params.grade;

  if (req.cookies && req.cookies['user']) {
    const my_user = JSON.parse(req.cookies['user']);
    if ((my_user != undefined) && (my_user.student_id == parseInt(student_id))) {
      changeGrade(student_id, course_id, grade, (err, results) => {
        if (err) {
          console.error('Error fetching user data:', err);
          res.status(500).send('Internal Server Error');
          return;
        }

        res.json(results);
      });
    } else {
      res.json({ "error": "you aren't authorized to view/edit this" });
    }
  } else {
    res.status(400).json({ "error": "User information (user cookie) is missing or invalid" });
  }
});

app.get('/change_password/:pass/:id', (req, res) => {
  const student_id = req.params.id;
  const password = req.params.pass;

  if (req.cookies && req.cookies['user']) {
    const my_user = JSON.parse(req.cookies['user']);
    if ((my_user != undefined) && (my_user.student_id == parseInt(student_id) || my_user.student_id == 1)) {//reset password
      changePassword(password, student_id, (err, results) => {
        if (err) {
          console.error('Error fetching user data:', err);
          res.status(500).send('Internal Server Error');
          return;
        }

        res.json(results);
      });

    } else {
      res.json({ "error": "you aren't authorized to view/edit this" });
    }
  } else {
    res.status(400).json({ "error": "User information (user cookie) is missing or invalid" });
  }
});


app.get('/update_last_login/:date/:id', (req, res) => {
  const student_id = req.params.id;
  const password = req.params.date;

  if (req.cookies && req.cookies['user']) {
    const my_user = JSON.parse(req.cookies['user']);
    if ((my_user != undefined) && (my_user.student_id == parseInt(student_id))) {//only each user can change their last_login
      changeMyLast_login(password, student_id, (err, results) => {
        if (err) {
          console.error('Error fetching user data:', err);
          res.status(500).send('Internal Server Error');
          return;
        }

        res.json(results);
      });

    } else {
      res.json({ "error": "you aren't authorized to view/edit this" });
    }
  } else {
    res.status(400).json({ "error": "User information (user cookie) is missing or invalid" });
  }
});


app.get('/change_privacy/:pass/:id', (req, res) => {
  const student_id = req.params.id;
  const privacy = req.params.pass;

  if (req.cookies && req.cookies['user']) {
    const my_user = JSON.parse(req.cookies['user']);
    if ((my_user != undefined) && (my_user.student_id == parseInt(student_id))) {
      changePrivacy(privacy, student_id, (err, results) => {
        if (err) {
          console.error('Error fetching user data:', err);
          res.status(500).send('Internal Server Error');
          return;
        }

        res.json(results);
      });
    } else {
      res.json({ "error": "you aren't authorized to view/edit this" });
    }
  } else {
    res.status(400).json({ "error": "User information (user cookie) is missing or invalid" });
  }
});


app.get('/delete_friendship/:friendship_id/:user_id', (req, res) => {
  const friendship_id = req.params.friendship_id;
  const userid = req.params.user_id;

  if (req.cookies && req.cookies['user']) {
    const my_user = JSON.parse(req.cookies['user']);
    if ((my_user != undefined) && (my_user.student_id == parseInt(userid))) {
      deleteFriendship(friendship_id, userid, (err, results) => {
        if (err) {
          //console.error('Error fetching user data:', err);
          res.status(500).send('You tried to delete a friendship that doesnt exist');
          return;
        }

        res.json(results);
      });
    } else {
      res.json({ "error": "you aren't authorized to view/edit this" });
    }
  } else {
    res.status(400).json({ "error": "User information (user cookie) is missing or invalid" });
  }
});


app.get('/delete_user/:student_id', (req, res) => {
  const student_id = req.params.student_id;

  if (req.cookies && req.cookies['user']) {
    const my_user = JSON.parse(req.cookies['user']);
    if ((my_user != undefined) && (my_user.student_id == 1)) {
      deleteUser(student_id, (err, results) => {
        if (err) {
          console.error('Error fetching user data:', err);
          res.status(500).send('Internal Server Error');
          return;
        }

        res.json(results);
      });
    } else {
      res.json({ "error": "you aren't authorized to view/edit this" });
    }
  } else {
    res.status(400).json({ "error": "User information (user cookie) is missing or invalid" });
  }
});

app.get('/remove_course/:student_id/:course_id', (req, res) => {
  const student_id = req.params.student_id;
  const course_id = req.params.course_id;


  if (req.cookies && req.cookies['user']) {
    const my_user = JSON.parse(req.cookies['user']);
    if ((my_user != undefined) && (my_user.student_id == parseInt(student_id))) {
      removeCourse(student_id, course_id, (err, results) => {
        if (err) {
          console.error('Error fetching user data:', err);
          res.status(500).send('Internal Server Error');
          return;
        }

        res.json(results);
      });
    } else {
      res.json({ "error": "you aren't authorized to view/edit this" });
    }
  } else {
    res.status(400).json({ "error": "User information (user cookie) is missing or invalid" });
  }
});

// Start the server
const port = "5500";
const ipAddress = 'localhost';//
app.listen(port, ipAddress, () => {
  console.log(`Server is running on http://${ipAddress}:${port}`);//${ipAddress}:
});