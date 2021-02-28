CREATE TABLE categories
( id number(10) NOT NULL,
  name varchar2(50) NOT NULL,
  CONSTRAINT categories_pk PRIMARY KEY (id)
);


CREATE TABLE regions
( id number(10) NOT NULL,
  name varchar2(50) NOT NULL,
  CONSTRAINT regions_pk PRIMARY KEY (id)
);


CREATE TABLE roles
( id number(10) NOT NULL,
  name varchar2(50) NOT NULL,
  CONSTRAINT roles_pk PRIMARY KEY (id)
);


CREATE TABLE cities
( id number(10) NOT NULL,
  name varchar2(50) NOT NULL,
  region_id varchar2(50) NOT NULL,
  CONSTRAINT cities_pk PRIMARY KEY (id),
  FOREIGN KEY (region_id) REFERENCES regions(id),
);


CREATE TABLE users
( id number(10) NOT NULL,
  username varchar2(50) NOT NULL,
  password varchar2(50) NOT NULL,
  first_name varchar2(50) NOT NULL,
  last_name varchar2(50) NOT NULL,
  age number(10) NOT NULL,
  email varchar2(50) NOT NULL,
  role_id number(10) NOT NULL,
  CONSTRAINT users_pk PRIMARY KEY (id),
  FOREIGN KEY (role_id) REFERENCES roles(id)
);


CREATE TABLE specialists
( id number(10) NOT NULL,
  title varchar2(50) NOT NULL,
  category_id number(10) NOT NULL,
  city_id number(10) NOT NULL,
  content varchar2(50) NOT NULL,
  price number(10) NOT NULL,
  created_date date,
  image varchar2(50) NOT NULL,
  CONSTRAINT specialists_pk PRIMARY KEY (id),
  FOREIGN KEY (category_id) REFERENCES categories(id),
  FOREIGN KEY (city_id) REFERENCES cities(id)
);


CREATE TABLE messages
( id number(10) NOT NULL,
  user_id number(10) NOT NULL,
  specialist_id number(10) NOT NULL,
  content varchar2(50) NOT NULL,
  created_date date,
  CONSTRAINT messages_pk PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (specialist_id) REFERENCES specialists(id)
);


CREATE TABLE user_bucket
( id number(10) NOT NULL,
  user_id number(10) NOT NULL,
  specialist_id number(10) NOT NULL,
  CONSTRAINT user_bucket_pk PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (specialist_id) REFERENCES specialists(id)
);


CREATE TABLE user_resume
( id number(10) NOT NULL,
  user_id number(10) NOT NULL,
  specialist_id number(10) NOT NULL,
  CONSTRAINT user_resume_pk PRIMARY KEY (id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (specialist_id) REFERENCES specialists(id)
);


