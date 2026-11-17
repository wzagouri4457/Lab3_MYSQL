USE bibliotheque;
/*ouvrage récentes:les trois ouvrages les plus récentes */
SELECT * FROM ouvrage ORDER BY id DESC LIMIT 3;
/*Auteurs à nom long :  le nom comporte au moins cinq caractères.*/
SELECT * FROM auteur WHERE CHAR_LENGTH(nom) >= 5;
/*Abonnés hors domaine : trouvez  tous les abonnés dont l'email ne provient pas de example.com ni de test.org.*/
SELECT nom, email FROM abonne WHERE email NOT LIKE '%@example.com' AND email NOT LIKE '%@test.org';
/*Emprunts en retard :  sélectionnez les emprunts dont la date de fin prévue est antérieure à aujourd'hui et dont date_retour_effective est NULL.*/
SELECT * FROM emprunt WHERE date_fin_prevue < CURDATE() AND date_retour_effective IS NULL;
/*Statistiques par auteur :  pour chaque auteur,indiquez le nombre total d'ouvrages et le nombre d'ouvrages disponibles.*/
SELECT a.id, a.nom, COUNT(o.id) AS total_ouvrages, SUM(CASE WHEN o.disponible = TRUE THEN 1 ELSE 0 END) AS disponibles FROM auteur a JOIN ouvrage o ON a.id = o.auteur_id GROUP BY a.id, a.nom;




