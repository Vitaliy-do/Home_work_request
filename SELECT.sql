-- Задание 2

-- Запрос 1 вывода названия и продолжительности самого длительного трека.
select title_track, duration
from track
where duration = (select max(duration) from track);

-- Запрос 2 вывода названия треков, продолжительность которых не менее 3,5 минут.
SELECT title_track
FROM track
WHERE duration >= 3.5;

-- Запрос 3 вывода названия сборников, вышедших в период с 2018 по 2020 год включительно.
SELECT title_mix
FROM mix
WHERE year >= '2018' AND year <= '2020';

-- Запрос 4 вывода исполнителей, чьё имя состоит из одного слова.
SELECT name
FROM executere
WHERE name NOT LIKE '% %';

-- Запрос 5 вывода названий треков, которые содержат слово «мой» или «my».
SELECT title_track 
FROM track 
WHERE title_track LIKE '%Мой%';

-- Задание 3
-- Запрос 6 вывода количества исполнителей в каждом жанре.
SELECT g.title, COUNT(DISTINCT ge.executere_id) FROM genre g
JOIN genreexecutere ge ON g.genre_id = ge.genre_id
GROUP BY title;

-- Запрос 7 вывода количества треков, вошедших в альбомы 2019–2020 годов.
SELECT count(title_track) FROM track t 
JOIN albom a ON t.albom_id = a.albom_id 
WHERE year >= '2019' AND year <= '2020'; 

-- Запрос 8 вывода средней продолжительности треков по каждому альбому.
SELECT a.title_albom, avg(duration) FROM track t
JOIN albom a ON a.albom_id = t.albom_id
GROUP BY a.title_albom;

-- Запрос 9 вывода всех исполнителей, которые не выпустили альбомы в 2020 году.
select e.name from executere e
WHERE NOT EXISTS (select FROM albomexecutere al 
JOIN albom a ON al.albom_id = a.albom_id
WHERE al.executere_id = e.executere_id
AND a.year = 2020);

-- Запрос 10 вывода названий сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT distinct title_mix FROM mix m 
JOIN trackmix tm ON m.mix_id = tm.mix_id
JOIN track t ON tm.track_id = t.track_id 
JOIN albom a ON t.albom_id  = a.albom_id 
JOIN albomexecutere al ON a.albom_id = al.albom_id  
JOIN executere e ON al.executere_id = e.executere_id 
WHERE name = 'Олег';
 

