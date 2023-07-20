SELECT style_singer_id , COUNT(singer_id) FROM singer_style   
GROUP BY style_singer_id;

SELECT name_album, COUNT(name_album) FROM musicalbum m  
JOIN musictrack m2 ON m.id = m2.id 
WHERE year_album BETWEEN 2018 AND 2020
GROUP BY name_album;

SELECT musicalbum_id, avg(duration) FROM musictrack m  
GROUP BY musicalbum_id
ORDER BY AVG(duration) DESC;

SELECT namesinger FROM singer s  
JOIN musicalbum_singer ms ON ms.singer_id = s.id 
JOIN musicalbum m  ON m.id = ms.musicalbum_id 
WHERE namesinger NOT IN (SELECT namesinger FROM singer s
WHERE year_album = 2020)
GROUP BY namesinger;

SELECT namecoll FROM collection c 
JOIN collection_musictrack cm  ON c.id = cm.collection_id 
JOIN musictrack m  ON m.id = cm.musictrack_id
JOIN musicalbum m2 ON m2.id = m.musicalbum_id 
JOIN musicalbum_singer ms ON ms.musicalbum_id = m2.id
JOIN singer s ON s.id = ms.singer_id 
WHERE namesinger = 'Киркоров';

SELECT name_album, count(name_style)  FROM musicalbum m  
JOIN musicalbum_singer ms  ON m.id = ms.musicalbum_id
JOIN singer s ON s.id = ms.singer_id
JOIN singer_style ss ON s.id = ss.singer_id 
JOIN style_singer ss2 ON ss2.id = ss.style_singer_id
GROUP BY  name_album, musicalbum_id, style_singer_id
HAVING COUNT(name_style) > 1;

SELECT name_track FROM musictrack m 
LEFT JOIN collection_musictrack cm ON m.id = cm.musictrack_id 
WHERE collection_id = NULL; 

SELECT namesinger FROM singer s 
JOIN musicalbum_singer ms  ON s.id = ms.singer_id 
JOIN musicalbum m2 ON m2.id = ms.musicalbum_id 
JOIN musictrack m  ON m.id = ms.musicalbum_id
WHERE duration = (SELECT min(duration) FROM musictrack);

SELECT name_album,count(name_track)  FROM musicalbum m
JOIN musictrack m2  ON m.id = m2.musicalbum_id
GROUP BY name_album, name_track
HAVING COUNT(name_track) = (SELECT MIN(mycount) 
FROM (SELECT COUNT(name_track) mycount 
FROM musicalbum m 
GROUP BY name_track)v);






