-- Создание таблицы жанров
CREATE TABLE IF NOT EXISTS Genre (
	genre_id SERIAL PRIMARY KEY,
	title VARCHAR (90) NOT NULL
);

-- Создание таблицы исполнителей
CREATE TABLE IF NOT EXISTS Executere (
	executere_id SERIAL PRIMARY KEY,
	name VARCHAR (90) NOT NULL 
);

-- Создание промежуточной таблицы жанры_исполнители
CREATE TABLE IF NOT EXISTS  GenreExecutere (
	genre_id INTEGER NOT NULL REFERENCES Genre (genre_id),
	executere_id INTEGER NOT NULL REFERENCES Executere (executere_id),
	CONSTRAINT pk PRIMARY KEY (genre_id, executere_id)
);

-- Создание таблицы альбом
CREATE TABLE IF NOT EXISTS Albom (
	albom_id SERIAL PRIMARY KEY,
	title_albom VARCHAR (90) NOT NULL,
	year INTEGER NOT NULL
);

-- Создание промежуточной таблицы жанры_исполнители
CREATE TABLE IF NOT EXISTS AlbomExecutere (
	albom_id INTEGER NOT NULL REFERENCES Albom (albom_id),
	executere_id INTEGER  NOT NULL REFERENCES Executere (executere_id),
	CONSTRAINT pk1 PRIMARY KEY(albom_id, executere_id)
);

-- Создание таблицы трек
CREATE TABLE IF NOT EXISTS Track (
	track_id SERIAL PRIMARY KEY,
	title_track VARCHAR (90) NOT NULL,
	duration INTEGER NOT NULL,
	albom_id INTEGER NOT NULL REFERENCES Albom (albom_id)
);

-- Создание таблицы сборник
CREATE TABLE IF NOT EXISTS Mix (
	mix_id SERIAL PRIMARY KEY,
	title_mix VARCHAR (90) NOT NULL,
	year INTEGER NOT NULL
);

-- Создание промежуточной таблицы трек_сборник
CREATE TABLE IF NOT EXISTS TrackMix (
	track_id INTEGER NOT NULL REFERENCES Track (track_id),
	mix_id INTEGER NOT NULL REFERENCES Mix (mix_id),
	CONSTRAINT pk2 PRIMARY KEY (track_id, mix_id)
);