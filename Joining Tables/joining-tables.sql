SELECT 
    users.name,
    photos.url
FROM 
    users
JOIN 
    photos ON photos.user_id = users.id;
