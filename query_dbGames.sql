-- SELECT
-- 1- Selezionare tutte le software house americane (3)
SELECT name
FROM software_houses
WHERE country = 'United States';

-- 2- Selezionare tutti i giocatori della città di 'Rogahnland' (2)
SELECT name
FROM players
WHERE city = 'Rogahnland'

-- 3- Selezionare tutti i giocatori il cui nome finisce per "a" (220)
SELECT name
FROM players
WHERE name LIKE '%a'

-- 4- Selezionare tutte le recensioni scritte dal giocatore con ID = 800 (11)
SELECT id, title, message, rating
FROM reviews
WHERE player_id = '800'

-- Contare quanti tornei ci sono stati nell'anno 2015 (9)
SELECT COUNT(name)
FROM tournaments
WHERE year = '2015'


-- 6- Selezionare tutti i premi che contengono nella descrizione la parola 'facere' (2)
SELECT name
FROM awards
WHERE description LIKE '%facere%'

-- 7- Selezionare tutti i videogame che hanno la categoria 2 (FPS) o 6 (RPG), mostrandoli una sola volta (del videogioco vogliamo solo l'ID) (287)
SELECT DISTINCT videogame_id 
FROM category_videogame
WHERE category_id = '2' 
OR category_id = '6';

-- 8- Selezionare tutte le recensioni con voto compreso tra 2 e 4 (2947)
SELECT *
FROM reviews
WHERE rating BETWEEN 2 and 4 

-- 9- Selezionare tutti i dati dei videogiochi rilasciati nell'anno 2020 (46)
SELECT *
FROM videogames
WHERE release_date LIKE '2020%' 

-- 10- Selezionare gli id dei videogame che hanno ricevuto almeno una recensione da 5 stelle, mostrandoli una sola volta (443)
SELECT DISTINCT videogame_id
FROM reviews
WHERE rating  = '5' 

-- *********** BONUS ***********
-- 11- Selezionare il numero e la media delle recensioni per il videogioco con ID = 412 (review number = 12, avg_rating = 3.16 circa)
SELECT COUNT(id), AVG(rating) 
FROM reviews
WHERE videogame_id  = '412' 

-- 12- Selezionare il numero di videogame che la software house con ID = 1 ha rilasciato nel 2018 (13)
SELECT COUNT(id) 
FROM videogames
WHERE software_house_id  = '1' 
AND release_date LIKE '2018%'

-- GROUP BY
-- 1- Contare quante software house ci sono per ogni paese (3)
SELECT COUNT(id) 
FROM software_houses
GROUP BY country

-- 2- Contare quante recensioni ha ricevuto ogni videogioco (del videogioco vogliamo solo l'ID) (500)
SELECT COUNT(id), country 
FROM software_houses
GROUP BY country

-- 3- Contare quanti videogiochi hanno ciascuna classificazione PEGI (della classificazione PEGI vogliamo solo l'ID) (13)
SELECT COUNT(videogame_id), pegi_label_id
FROM pegi_label_videogame
GROUP BY pegi_label_id

-- 4- Mostrare il numero di videogiochi rilasciati ogni anno (11)
SELECT YEAR(release_date), COUNT(id)
FROM videogames
GROUP BY YEAR(release_date)

-- 5- Contare quanti videogiochi sono disponbiili per ciascun device (del device vogliamo solo l'ID) (7)
SELECT COUNT(videogame_id), device_id
FROM device_videogame
GROUP BY device_id

-- 6- Ordinare i videogame in base alla media delle recensioni (del videogioco vogliamo solo l'ID) (500)
SELECT AVG(rating), videogame_id
FROM reviews
GROUP BY videogame_id
ORDER BY AVG(rating) DESC

-- JOIN
-- 1- Selezionare i dati di tutti giocatori che hanno scritto almeno una recensione, mostrandoli una sola volta (996)
SELECT DISTINCT players.*
FROM players
INNER JOIN reviews
ON players.id = reviews.player_id

-- 2- Sezionare tutti i videogame dei tornei tenuti nel 2016, mostrandoli una sola volta (226)


-- 3- Mostrare le categorie di ogni videogioco (1718)
SELECT name
FROM categories
INNER JOIN category_videogame
ON categories.id = category_videogame.category_id

-- 4- Selezionare i dati di tutte le software house che hanno rilasciato almeno un gioco dopo il 2020, mostrandoli una sola volta (6)
SELECT DISTINCT software_houses.*
FROM software_houses
INNER JOIN videogames
ON software_houses.id = videogames.software_house_id
WHERE YEAR(release_date) > '2020'

-- 5- Selezionare i premi ricevuti da ogni software house per i videogiochi che ha prodotto (55)
