-- general check of datframe
SELECT *
FROM "funniest_recommendation"

-- check if there is user that appear more than 1 time
select user_id, COUNT(*) as user_counter from funniest_recommendation f
GROUP BY f."user_id" HAVING user_counter > 1

-- check the average of hours_played
SELECT AVG("hours_played") from funniest_recommendation

-- general check of datframe
SELECT * FROM "top-reviews"

-- check specific user_id
SELECT * FROM "top-reviews" where "user_id" = 40425

-- check if there are users in common in the 2 datasources
SELECT * FROM "top-reviews" t join "funniest_recommendation" f on (t."user_id" = f.user_id)
