CREATE TABLE "users" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(35) NOT NULL,
  "email" varchar(40) UNIQUE NOT NULL,
  "password" varchar(30) NOT NULL,
  "age" int NOT NULL
);

CREATE TABLE "roles" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(40) NOT NULL
);

CREATE TABLE "courses" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" varchar(70) NOT NULL,
  "description" varchar(255) NOT NULL,
  "level" text NOT NULL,
  "category_id" int NOT NULL,
  "teacher_id" int NOT NULL
);

CREATE TABLE "course_videos" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "title" varchar(70) NOT NULL,
  "url" text NOT NULL,
  "course_id" int NOT NULL,
  "duration" time
);

CREATE TABLE "categories" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "name" varchar(40) NOT NULL
);

CREATE TABLE "student_courses" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "student_id" int NOT NULL,
  "course_id" int NOT NULL,
  "status" varchar(30)
);

CREATE TABLE "users_roles" (
  "id" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "user_id" int NOT NULL,
  "role_id" int NOT NULL
);

ALTER TABLE "courses" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("teacher_id") REFERENCES "users" ("id");

ALTER TABLE "course_videos" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "student_courses" ADD FOREIGN KEY ("student_id") REFERENCES "users" ("id");

ALTER TABLE "student_courses" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");

ALTER TABLE "users_roles" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "users_roles" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

-- - Data for "users" table
INSERT INTO users (name, email, password, age)
VALUES 
  ('Jurgen Wolf', 'wolf@gmail.com', 'password456', 30),
  ('Daniel Smith', 'daniel@gmail.com', 'password123', 25),
  ('Robert Sander', 'bob@yahoo.com', 'password789', 40),
  ('Alice Johnson', 'alice@hotmail.com', 'password000', 22),
  ('Tom Lars', 'tomlars@gmail.com', 'password111', 28),
  ('Lara Croft', 'lara@gmail.com', 'password444', 25),
  ('Antonio Banderas', 'tony@gmail.com', 'password675', 65);

-- Data for "roles" table
INSERT INTO roles (name)
VALUES 
  ('teacher'),
  ('student'),
  ('admin');

-- - Data for "users_roles" table
INSERT INTO users_roles (user_id, role_id)
VALUES 
  (1, 2),
  (2, 2),
  (3, 2),
  (4, 2),
  (5, 3),
  (6, 1),
  (7, 1);

-- data for "categories" table
INSERT INTO categories (name)
VALUES 
  ('Programming'),
  ('Data Science'),
  ('Design'),
  ('Business'),
  ('Marketing');

-- Data for "courses"table
INSERT INTO courses (title, description, level, category_id, teacher_id)
VALUES 
  ('Introduction to Programming', 'Learn the basics of programming', 'Beginner', 1, 6),
  ('Web Development Fundamentals', 'Learn the basics of web development', 'Intermediate', 1, 6),
  ('Mobile App Development', 'Learn how to build mobile apps', 'Advanced', 1, 6),
  ('Data Science Fundamentals', 'Learn the basics of data science', 'Intermediate', 2, 7),
  ('Machine Learning', 'Learn how to build machine learning models', 'Advanced', 2, 7);

-- Data for "course_videos" table
INSERT INTO course_videos (title, url, course_id, duration)
VALUES 
  ('Introduction to Programming: Part 1', 'https://www.youtube.com/watch?v=12345', 1, '00:10:00'),
  ('Introduction to Programming: Part 2', 'https://www.youtube.com/watch?v=67890', 1, '00:15:00'),
  ('Web Development Fundamentals: Part 1', 'https://www.youtube.com/watch?v=24680', 2, '00:20:00'),
  ('Web Development Fundamentals: Part 2', 'https://www.youtube.com/watch?v=13579', 2, '00:25:00'),
  ('Mobile App Development: Part 1', 'https://www.youtube.com/watch?v=12390', 3, '00:30:00');

-- Data for "student_courses" table
INSERT INTO student_courses (student_id, course_id, status)
VALUES 
  (1, 1, 'enrolled'),
  (1, 2, 'completed'),
  (2, 3, 'enrolled'),
  (3, 2, 'enrolled'),
  (4, 1, 'completed');