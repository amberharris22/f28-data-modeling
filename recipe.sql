CREATE TABLE users (
user_id SERIAL PRIMARY KEY,
username VARCHAR(30),
password VARCHAR(30),
email VARCHAR(50)
);

CREATE TABLE ingredients (
  ingredient_id SERIAL PRIMARY KEY,
  ingredient_name VARCHAR(30)
  );
  
CREATE TABLE recipes (
  recipe_id SERIAL PRIMARY KEY,
  recipe_name VARCHAR(30),
  ingredient_quantity VARCHAR(15),
  ingredient_id VARCHAR(30),
  instructions TEXT,
  user_id INTEGER REFERENCES users(user_id),
  is_public BOOLEAN
  );

  CREATE TABLE grocery_list (
  list_id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(user_id),
  recipe_id INTEGER REFERENCES recipes(recipe_id)
  );

  CREATE TABLE view (
  view_id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(user_id),
  recipe_id INTEGER REFERENCES recipes(recipe_id)
  );

  CREATE TABLE ocassions (
  ocassion_id SERIAL PRIMARY KEY,
  ocassion_name VARCHAR(30),
  user_id INTEGER REFERENCES users(user_id),
  recipe_id INTEGER REFERENCES recipes(recipe_id)
  );

INSERT INTO users(username, password, email)
VALUES ('ab', '123', 'ab@gmail.com'), ('cd', 345, 'cd@gmail.com');

INSERT INTO ingredients(ingredient_name)
VALUES ('caramel'), ('apple');


INSERT INTO recipes(recipe_name, ingredient_quantity, ingredient_id, instructions, user_id, is_public)
VALUES ('caramel apples', 
        '20 cubes', 
        1, 
        'unwrap caramels and melt the microwave, stirring every 30 seconds.  Dip the apple into the melted caramel until  fully covered.  Let cool on wax paper.', 
       		1, 
        'TRUE');

INSERT INTO recipes(recipe_id, ingredient_id, ingredient_quantity)
VALUES (1, 2, 4);