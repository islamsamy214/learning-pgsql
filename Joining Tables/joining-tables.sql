SELECT 
    users.name,
    photos.url
FROM 
    users
JOIN 
    photos ON photos.user_id = users.id;

-- Multiple Joins
-- The following query selects the text of a comment, the name of the user who made the comment, and the URL of the photo that the comment was made on.
SELECT 
    comments.text,
    users.name,
    photos.url
FROM
    comments
JOIN
    users ON comments.user_id = users.id
JOIN
    photos ON comments.photo_id = photos.id;

-- Multiple Joins but this time i want to make sure that the comment user is the same as the photo user
SELECT 
    comments.text,
    users.name,
    photos.url
FROM
    comments
JOIN
    users ON comments.user_id = users.id
JOIN
    photos ON comments.photo_id = photos.id AND photos.user_id = users.id;