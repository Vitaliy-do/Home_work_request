-- Задание 2

-- Запрос вывода названия и продолжительности самого длительного трека.
SELECT MAX(title_track)
FROM track;

-- Запрос вывода названия треков, продолжительность которых не менее 3,5 минут.
SELECT title_track
FROM track
WHERE duration >= 3.5;

-- Запрос вывода названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT title_mix
FROM mix
WHERE year >= '2018' AND year <= '2020';

-- Запрос вывода исполнителей, чьё имя состоит из одного слова.
SELECT name
FROM executere
WHERE name NOT LIKE '% %';

-- Запрос вывода названий треков, которые содержат слово «мой» или «my».
SELECT title_track 
FROM track 
WHERE title_track LIKE '%Мой%';

-- Задание 3
-- Запрос вывода количества исполнителей в каждом жанре.
SELECT g.title, COUNT(DISTINCT ge.executere_id) FROM genre g
JOIN genreexecutere ge ON g.genre_id = ge.genre_id
GROUP BY title;

-- Запрос вывода количества треков, вошедших в альбомы 2019–2020 годов.
SELECT count(title_track) FROM track t 
JOIN albom a ON t.albom_id = a.albom_id 
WHERE year >= '2019' AND year <= '2020'; 

-- Запрос вывода средней продолжительности треков по каждому альбому.
SELECT a.title_albom, avg(duration) FROM track t
JOIN albom a ON a.albom_id = t.albom_id
GROUP BY a.title_albom;

-- Запрос вывода всех исполнителей, которые не выпустили альбомы в 2020 году.
SELECT name FROM executere e
JOIN albomexecutere al ON e.executere_id = al.executere_id
JOIN albom a on a.albom_id = al.albom_id 
WHERE year NOT BETWEEN '2020' AND '2020'
GROUP BY name;

-- Запрос вывода названий сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT title_mix FROM mix m 
JOIN trackmix tm ON m.mix_id = tm.mix_id
JOIN track t ON tm.track_id = t.track_id 
JOIN albom a ON t.albom_id  = a.albom_id 
JOIN albomexecutere al ON a.albom_id = al.albom_id  
JOIN executere e ON al.executere_id = e.executere_id 
WHERE name = 'Анна'
GROUP BY title_mix; 

