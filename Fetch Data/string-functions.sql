SELECT
  CONCAT(name, '_', country) AS city_country,
  LENGTH(name) AS name_length,
  LOWER(name) AS lower_name,
  TRIM(country) AS trimmed_country,
  POSITION('p' IN country) AS position_of_p,
  (population / area) AS number_of_people_per_square
FROM
  cities;
