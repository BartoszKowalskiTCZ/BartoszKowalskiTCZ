INSERT INTO players (nick,email,password) VALUES ("BKTCZ", "email@gmail.com", "pass1")
INSERT INTO players (nick,email,password) VALUES ("hf45", "email2@gmail.com", "pass2")
INSERT INTO players (nick,email,password) VALUES ("ak23", "email3@gmail.com", "pass3")

@villages_resources
INSERT INTO villages_has_resources (villages_id, resources_id, value) VALUES (1, 1, 1001)
INSERT INTO villages_has_resources (villages_id, resources_id, value) VALUES (1, 2, 1002)
INSERT INTO villages_has_resources (villages_id, resources_id, value) VALUES (1, 3, 1003)

INSERT INTO villages_has_resources (villages_id, resources_id, value) VALUES (2, 1, 1004)
INSERT INTO villages_has_resources (villages_id, resources_id, value) VALUES (2, 2, 1005)
INSERT INTO villages_has_resources (villages_id, resources_id, value) VALUES (2, 3, 1006)

INSERT INTO villages_has_resources (villages_id, resources_id, value) VALUES (3, 1, 1007)
INSERT INTO villages_has_resources (villages_id, resources_id, value) VALUES (3, 2, 1009)
INSERT INTO villages_has_resources (villages_id, resources_id, value) VALUES (3, 3, 1010)

@villages
INSERT INTO villages (name, x, y, players_id) VALUES ("wioska1", 25, 42, 3)
INSERT INTO villages (name, x, y, players_id) VALUES ("wioska2", 30, 48, 2)
INSERT INTO villages (name, x, y, players_id) VALUES ("wioska3", 35, 50, 1)

@troops
INSERT INTO troops (name, description, damage, distance_damage, defence) VALUES ("Łucznik", "posiada łuk", 2, 3, 2)
INSERT INTO troops (name, description, damage, distance_damage, defence) VALUES ("miecznik", "posiada miecz", 3, 4, 5)
INSERT INTO troops (name, description, damage, distance_damage, defence) VALUES ("kusznik", "jest lepszum lucznikiem", 6, 8, 9)
INSERT INTO troops (name, description, damage, distance_damage, defence) VALUES ("rycerz", "jest lepszym miecznikiem", 1, 2, 3)


@troops2
INSERT INTO villages_has_troops (villages_id, troops_id, value) VALUES (1, 1, 50)
INSERT INTO villages_has_troops (villages_id, troops_id, value) VALUES (1, 2, 60)
INSERT INTO villages_has_troops (villages_id, troops_id, value) VALUES (1, 3, 70)
INSERT INTO villages_has_troops (villages_id, troops_id, value) VALUES (1, 4, 80)

INSERT INTO villages_has_troops (villages_id, troops_id, value) VALUES (2, 1, 90)
INSERT INTO villages_has_troops (villages_id, troops_id, value) VALUES (2, 2, 100)
INSERT INTO villages_has_troops (villages_id, troops_id, value) VALUES (2, 3, 110)
INSERT INTO villages_has_troops (villages_id, troops_id, value) VALUES (2, 4, 120)

INSERT INTO villages_has_troops (villages_id, troops_id, value) VALUES (3, 1, 130)
INSERT INTO villages_has_troops (villages_id, troops_id, value) VALUES (3, 2, 140)
INSERT INTO villages_has_troops (villages_id, troops_id, value) VALUES (3, 3, 150)
INSERT INTO villages_has_troops (villages_id, troops_id, value) VALUES (3, 4, 160)

@resources
INSERT INTO resources (name, description) VALUES ("drewno", podstawa imperium)
INSERT INTO resources (name, description) VALUES ("glina", potrzebny surowiec)
INSERT INTO resources (name, description) VALUES ("zelazo", zelazo warto miec zwlaszcza doo jednostek)

@buildings
INSERT INTO buildings (name) VALUES ("dol z glina")
INSERT INTO buildings (name) VALUES ("huta zelaza")
INSERT INTO buildings (name) VALUES ("chata drwala")

@buildings2
INSERT INTO villages_has_buildings (villages_id, buildings_id) VALUES (1,1)
INSERT INTO villages_has_buildings (villages_id, buildings_id) VALUES (1,2)

INSERT INTO villages_has_buildings (villages_id, buildings_id) VALUES (1,2)
INSERT INTO villages_has_buildings (villages_id, buildings_id) VALUES (1,3)

INSERT INTO villages_has_buildings (villages_id, buildings_id) VALUES (3,3)
INSERT INTO villages_has_buildings (villages_id, buildings_id) VALUES (3,2)


@login2
FROM player SELECT nick WHERE password LIKE "BKTCZ", AND email LIKE "email@gmail.com"

@zasoby1
SELECT players.*, villages.name, resources.name, villages_has_resources.value FROM players
JOIN villages ON players.id=villages.players_id 
JOIN villages_has_resources ON villages.id=villages_has_resources.villages_id
JOIN resources ON villages_has_resources.resources_id=resources.id WHERE players.id=2



@zolnierze3
SELECT players.*, villages.name, troops.name, villages_has_troops.value FROM players
JOIN villages ON players.id=villages.players_id 
JOIN villages_has_troops ON villages.id=villages_has_troops.villages_id
JOIN troops ON villages_has_troops.troops_id=troops.id 
WHERE players.id=1

@budynki4
SELECT players.*, villages.name, buildings.name FROM players
 JOIN villages ON players.id=villages.players_id JOIN villages_has_buildings ON villages.id=villages_has_buildings.villages_id 
 JOIN buildings ON villages_has_buildings.buildings_id=buildings.id
 WHERE players.id=3;





