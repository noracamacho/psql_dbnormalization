# psql_dbnormalization
## -Course Management System

This is a database schema and data for a course management system, consisting of tables for users, roles, courses, course videos, categories, and student courses. The schema is written in SQL for use with PostgreSQL.

## _Schema Description

## The schema consists of the following tables:

> users: stores user information, including their name, email, password, and age.
> roles: stores role information, including their name.
> courses: stores course information, including their title, description, level, category, and teacher.
> course_videos: stores video information, including their title, URL, course, and duration.
> categories: stores category information, including their name.
> student_courses: stores enrollment information, including the student, course, and enrollment status.
> users_roles: stores the relationship between users and roles.
In addition to the tables, foreign key constraints are used to ensure that data is consistent across tables.

##Data

The schema includes sample data for each table.

> users: includes information for seven users.
> roles: includes information for three roles.
> courses: includes information for five courses.
> course_videos: includes information for five videos.
> categories: includes information for five categories.
> student_courses: includes information for two enrolled students.
