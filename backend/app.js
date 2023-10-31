const express = require("express");
const bodyParser = require("body-parser");

const app = express();


////////////////////////////////////////////////////////////////  
const all_students = require("./api/all_students");
const all_courses = require("./api/all_courses");

const students_courses = require("./api/students_courses");
const my_courses = require("./api/my_courses");
const students_going = require("./api/students_going");

const add_student = require("./api/add_student");

const add_friend = require("./api/add_friend");
const list_pending_friend = require("./api/list_pending_friend");
const change_friendship_status = require("./api/change_friendship_status");

const stats = require("./api/stats");
const sept_stats = require("./api/average_change");
const students_privacy = require("./api/students_privacy");

const change_grade = require("./api/change_grade");
const change_pending = require("./api/change_pending");
const change_going = require("./api/change_going");
const change_password = require("./api/change_password");
const change_privacy = require("./api/change_privacy");

const remove_course = require("./api/remove_course");
/////////////////////////////////////////////////////////////////


console.log(`NODE_ENV = |${process.env.NODE_ENV}|`);

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.use((req, res, next) => {
  res.setHeader("Access-Control-Allow-Origin", "*");
  res.setHeader(
    "Access-Control-Allow-Methods",
    "OPTIONS, GET, POST, PUT, PATCH, DELETE"
  );
  res.setHeader(
    "Access-Control-Allow-Headers",
    "Content-Type, Authorization, X-OBSERVATORY-AUTH"
  );
  next();
});

// /* Routes used by our project */  
/////////////////////////////////////////////////////////////////
app.use("/all_students", all_students);
app.use("/all_courses", all_courses);

app.use("/students_courses/:id", students_courses);
app.use("/my_courses/:id", my_courses);
app.use("/students_going/:id", students_going);

app.use("/add_student/:username/:password/:user_name/:birthday/:email", add_student);

app.use("/add_friend/:user1/:user2/:status", add_friend);
app.use("/list_pending_friend/:id", list_pending_friend);
app.use("/change_friendship_status/:id/:status", change_friendship_status);


app.use("/stats/:id", stats);
app.use("/sept_stats/:id", sept_stats);
app.use("/privacy/:id", students_privacy); 


app.use("/change_grade/:student_id/:course_id/:grade", change_grade);
app.use("/change_pending/:student_id/:course_id/:grade/:pending", change_pending);
app.use("/change_going/:student_id/:course_id/:going", change_going);
app.use("/change_password/:pass/:id", change_password);
app.use("/change_privacy/:pass/:id", change_privacy);

app.use("/remove_course/:student_id/:course_id", remove_course);
//////////////////////////////////////////////////////////////// 



// In case of an endpoint does not exist
app.use((req, res, next) => {
  res.status(404).json({ message: "Endpoint not found!!" });
});

module.exports = app;