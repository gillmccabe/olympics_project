DROP TABLE participation;
DROP TABLE events;
DROP TABLE athletes;
DROP TABLE nations;


CREATE TABLE nations(
  id serial4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE athletes(
  id serial4 PRIMARY KEY,
  name VARCHAR(255),
  nation_id INT4 references nations(id) ON DELETE CASCADE
);

CREATE TABLE events(
  id serial4 PRIMARY KEY,
  name VARCHAR(255),
  gold_id INT4 references athletes(id) ON DELETE CASCADE,
  silver_id INT4 references athletes(id) ON DELETE CASCADE,
  bronze_id INT4 references athletes(id) ON DELETE CASCADE
);

CREATE TABLE participation(
  id serial4 PRIMARY KEY,
  athlete_id INT4 references athletes(id) ON DELETE CASCADE,
  event_id INT4 references events(id) ON DELETE CASCADE
);