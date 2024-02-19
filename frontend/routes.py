from flask import Flask, render_template, request, flash, redirect, url_for, abort, jsonify
from flask_mysqldb import MySQL
from frontend import app, db  # initially created by __init__.py, need to be used here
import requests

@app.route("/")
def index():
    return render_template("landing.html", pageTitle="Login Page")


@app.route("/signup")
def sign_up():
    return render_template("signuppage.html", pageTitle="Sign Up Page")
  
@app.route("/home")
def page_for_student():
    return render_template("/home.html", pageTitle="Home Page")

@app.route("/forgot_password")
def page_for_password():
    return render_template("/forgot_password.html", pageTitle="Home Page")


#Users moves
####################################################################################~ 
@app.route("/change_courses")
def page_for_adding_courses():
    return render_template("/change_courses.html", pageTitle="Home Page")

@app.route("/my_grades")
def page_for_grades():
    return render_template("/my_grades.html", pageTitle="Home Page")


@app.route("/my_active_courses")
def page_for_active_courses():
    return render_template("/my_active_courses.html", pageTitle="Home Page")

@app.route("/september")
def sept():
    return render_template("/september.html", pageTitle="Home Page")

@app.route("/add_friends")
def add_friends():
    return render_template("/add_friends.html", pageTitle="Home Page")

@app.route("/my_friends")
def chats():
    return render_template("/my_friends.html", pageTitle="Home Page")

@app.route("/diagnostic")
def diagnostic():
    return render_template("/diagnostic.html", pageTitle="Home Page")

@app.route("/notes")
def notes():
    return render_template("/notes.html", pageTitle="Home Page")
####################################################################################~


#Admin moves
####################################################################################~  
@app.route("/home_admin")
def page_for_admin():
    return render_template("/home_admin.html", pageTitle="Home Page")


@app.route("/admin")
def admin():
    return render_template("/admin.html", pageTitle="Home Page")
####################################################################################~ 