// initiate
session:
psql -U username [mydatabase]
----- \l to see databases
CREATE USER indexed_cars_user;
\du
----show users
CREATE DATABASE indexed_cars OWNER indexed_cars_user;
\i scripts/car_models.sql
---- \dt to see tables
\i scripts/car_model_data.sql
\timing

// 1. Run a query to get a list of all `make_title` values from the `car_models` table where the `make_code` is `'LAM'`, without any duplicate rows, and note the time somewhere.
(should have 1 result)
SELECT DISTINCT make_title from car_models WHERE make_code='LAM';
--31.832ms
-->1.478 ms

// 2. Run a query to list all `model_title` values where the `make_code` is `'NISSAN'`, and the `model_code` is `'GT-R'` without any duplicate rows, and note the time somewhere.
(should have 1 result)
SELECT DISTINCT model_title from car_models WHERE make_code='NISSAN' and model_code='GT-R';
--48.313 ms
-->1.816 ms

// 3. Run a query to list all `make_code`, `model_code`, `model_title`, and year from `car_models` where the `make_code` is `'LAM'`, and note the time somewhere. (should have 1360 rows)
SELECT make_code, model_code, model_title, year FROM car_models WHERE make_code='LAM';
--23.415 ms  ---stopped by using CNTL-C
-->2.179 ms

// 4. Run a query to list all fields from all `car_models` in years between `2010` and `2015`, and note the time somewhere (should have 78840 rows)
SELECT * FROM car_models WHERE year >= 2010 AND year <= 2015;
--110.688 ms
-->115.679 ms

// 5. Run a query to list all fields from all `car_models` in the year of `2010`, and note the time somewhere (should have 13140 rows)
SELECT * FROM car_models WHERE year='2010';
--38.978 ms
-->19.155 ms

// CREATE INDEX [index name] ON [table name] ([column name(s) index]);
CREATE INDEX idx_car_models_make_code ON car_models (make_code);
--389.875 ms
CREATE INDEX idx_car_models_model_code ON car_models (model_code);
--563.221 ms
CREATE INDEX idx_car_models_year ON car_models (year);
--189.715 ms

DELETE TABLE car_models;

\i scripts/car_models.sql;
---- \dt to see tables
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
\i scripts/car_model_data.sql;
