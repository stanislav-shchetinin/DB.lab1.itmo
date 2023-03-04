CREATE TABLE team (
	team_id SERIAL PRIMARY KEY,
	number_of_people int NOT NULL CHECK (number_of_people >= 2),
	aim varchar(255) NOT NULL,
	name_team varchar(255) NOT NULL,
	type_team varchar(255) NOT NULL
);

CREATE TABLE creature
(
	creature_id SERIAL PRIMARY KEY,
	team_id SERIAL REFERENCES team(team_id),
	name_creature varchar(255) NOT NULL,
	type_creature varchar(255) NOT NULL,
	speed INTEGER NOT NULL CHECK(speed >= 0),
	power_creature INTEGER NOT NULL CHECK(power_creature >= 0),
	intellect INTEGER NOT NULL CHECK(intellect >= 0),
	aggressiveness INTEGER NOT NULL CHECK(aggressiveness >= 0),
	number_of_limbs INTEGER NOT NULL CHECK(number_of_limbs >= 0),
	way_of_movement varchar(255) NOT NULL,
	determination INTEGER NOT NULL CHECK(determination >= 0),
	aim varchar(255) NOT NULL,
	intuition INTEGER NOT NULL CHECK(intuition >= 0)
);

CREATE TABLE stalker
(
	stalker_id SERIAL PRIMARY KEY,
	creature_id SERIAL REFERENCES creature(creature_id) NOT NULL,
	team_puruers_id SERIAL REFERENCES team(team_id) NOT NULL,
	name_stalker varchar(255) NOT NULL,
	type_stalker varchar(255) NOT NULL,
	degree_of_injury INTEGER NOT NULL
);
CREATE TABLE artefact
(
	artefact_id SERIAL PRIMARY KEY,
	name_artefact varchar(255) NOT NULL,
	year_of_creation DATE NOT NULL,
	material varchar(255) NOT NULL,
	volume float NOT NULL CHECK (volume >= 0),
	weight float NOT NULL CHECK (weight >= 0),
	type_creature_pictured varchar(255) NOT NULL,
	type_creature_created varchar(255) NOT NULL
);
CREATE TABLE place
(
	place_id SERIAL PRIMARY KEY,
	main_team_id SERIAL REFERENCES team(team_id) NOT NULL,
	number_of_resident INTEGER NOT NULL CHECK (number_of_resident >= 0),
	opportunity_to_live INTEGER NOT NULL CHECK (opportunity_to_live >= 0),
	average_temerature float NOT NULL
);

CREATE TABLE team_artefact
(
	team_id SERIAL REFERENCES team(team_id) NOT NULL,
	artefact_id SERIAL REFERENCES artefact(artefact_id) NOT NULL
);
CREATE TABLE team_team
(
	team_id1 SERIAL REFERENCES team(team_id) NOT NULL,
	team_id2 SERIAL REFERENCES team(team_id) NOT NULL
);

INSERT INTO team (team_id, number_of_people, aim, name_team, type_team)
VALUES (0, 1000, 'захватить сушу', 'Кошмарные создания', 'Монстры');
INSERT INTO team (team_id, number_of_people, aim, name_team, type_team)
VALUES (1, 100, 'Выжить', 'Люди', 'Жертвы');
INSERT INTO creature (creature_id,
					  team_id, name_creature,
					  type_creature, speed,
					 power_creature,
						intellect,
						aggressiveness,
						number_of_limbs,
						way_of_movement,
						determination,
						aim,
						intuition
)
VALUES (0, 0, 'ГлавныйМонтср333', 'Монстр', 100, 100, 100, 1000, 54, 'Fly', 100, 
	   'Первентсно в мире', 100);
INSERT INTO creature (creature_id,
					  team_id, name_creature,
					  type_creature, speed,
					 power_creature,
						intellect,
						aggressiveness,
						number_of_limbs,
						way_of_movement,
						determination,
						aim,
						intuition
)
VALUES (1, 1, 'Дефорт', 'Жертва', 10, 10, 10, 2, 4, 'Пеший ход', 100, 
	   'Выжить', 1000);
INSERT INTO creature (creature_id,
					  team_id, name_creature,
					  type_creature, speed,
					 power_creature,
						intellect,
						aggressiveness,
						number_of_limbs,
						way_of_movement,
						determination,
						aim,
						intuition
)
VALUES (2, 1, 'Неизвестный', 'Жертва', 10, 10, 10, 2, 4, 'Пеший ход', 100, 
	   'Преследовать группу', 1000);
INSERT INTO stalker (stalker_id,
	creature_id,
	team_puruers_id,
	name_stalker,
	type_stalker,
	degree_of_injury
)
VALUES (0, 2, 1, 'Преследователь', 'Человек', 50);

INSERT INTO artefact (artefact_id,
	name_artefact,
	year_of_creation,
	material,
	volume,
	weight,
	type_creature_pictured,
	type_creature_created

)
VALUES (0, 'барельефы Старцев', '1234-12-22', 'Камень', '100', '450',
	   'Человек', 'Монстр');

INSERT INTO place (place_id,
	main_team_id,
	number_of_resident,
	opportunity_to_live,
	average_temerature
)
VALUES (0, 0, 500, 20, -10);

INSERT INTO team_artefact (team_id,
				   artefact_id
)
VALUES (0, 0);

INSERT INTO team_team (team_id1,
				   team_id2
)
VALUES (0, 1);
