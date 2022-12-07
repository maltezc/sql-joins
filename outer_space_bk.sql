-- A fact shoult only be on 1 place
-- Which fields should be Nullable

-- Table Stars
--     -cannot change name and globally known and unique

--     -star_id
--     -star_name
--     -orbiting_planet_id - primary key

CREATE TABLE stars (
  star_id SERIAL PRIMARY KEY,
  star_name TEXT UNIQUE,
  UNIQUE (star_name));

  INSERT INTO stars(star_name)

  VALUES
  ('The Sun'),
  ('Proxima Centauri'),
  ('Gliese 876');


-- Table Planets
--     -Has exactly 1 star they orbit around
--     -cannot change name and globally known and unique

--     -planet_id
--     -planet_name
--     -orbiting_moon_id - Nullable - primary key

CREATE TABLE planets (
  planet_id SERIAL PRIMARY KEY,
  planet_name TEXT UNIQUE NOT NULL,
  orbiting_moon_id INT,
  star_id INT REFERENCES stars NOT NULL,
  UNIQUE (orbiting_moon_id, planet_name, star_id));

  INSERT INTO planets(planet_name)


-- Table Moons
--     -Can be associated with only planet (but not all planets have moons)
--     -cannot change name and globally known and unique
--     -can be Nullable

--     -moon_id
--     -moon_name

--  TODO: ask if we can make planet_id unique if it may be Null

 CREATE TABLE moons (
  moon_id SERIAL PRIMARY KEY,
  moon_name TEXT UNIQUE NOT NULL,
  planet_id INT REFERENCES planets,
  UNIQUE (moon_name));