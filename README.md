# GradeHub

Welcome to GradeHub, a web application that allows you to manage and track your academic performance easily. With GradeHub, you can edit your grades at any time, visualize your academic progress, and plan your future courses.

## General

- Edit your grades at your convenience, no need to wait for university updates.
- Calculate your GPA by simulating grade changes for each course.
- Plan your future courses and see how they affect your overall average.

## User Interface

- **Home Page:** Displays your semester averages and grade charts.
- Shows pending, failed, and passed courses.
- **My Grades:** Set the grade as 'X' for future enrollment.
- **Friends:** Add friends and view their course plans (you are not allowed to see their grades nor their average score).
- **September:** See which exams your friends plan to take during the September examination period.
- Calculate how your average will change with the "diagnostic" button.
- **Active Courses** tab shows only the courses you've signed up for this academic year.

## Supported Faculties

GradeHub supports courses from the following faculties:
- ECE-NTUA (National Technical University of Athens)
- CS-AUEB (Athens University of Economics and Business)
- ECE-UPATRAS (University of Patras)
- CIVIL-AUTH (Aristotle University of Thessaloniki)

## Admin Panel

- The admin has access to user emails and encrypted passwords (not their grades).
- The admin is the first user (User ID = 1).
- Can reset any user's password in case they forget it.
- Access to the last login time of each user.

## Installation

1. In the `/GradeHub/` folder, run `python3 run.py`.
2. In the `/GradeHub/backend/` folder, run `node server.js`.
3. Ensure you have all the necessary libraries installed.

## Coding Behind

- Routing implemented in Python.
- Backend developed in JavaScript (Node.js).
- Frontend created using HTML and JavaScript.
- Cookies are used to prevent any user from accessing the wrong API

## Online Version

An online version of this website is already running using dynamic DNS and can be accessed at the following URL:
[GradeHub Online Version](http://gradehub.hopto.org:8800/)

Enjoy managing your grades and academic journey with GradeHub!
