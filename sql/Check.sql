ALTER TABLE apps
ADD PRIMARY KEY (app_id);


ALTER TABLE country_stats
ADD PRIMARY KEY (id);


ALTER TABLE country_stats
ADD CONSTRAINT fk_country_app
FOREIGN KEY (app_id)
REFERENCES apps(app_id);


ALTER TABLE discovery_signals
ADD PRIMARY KEY (id);


ALTER TABLE discovery_signals
ADD CONSTRAINT fk_discovery_app
FOREIGN KEY (app_id)
REFERENCES apps(app_id);



SELECT * FROM apps LIMIT 5;

SELECT * FROM country_stats LIMIT 5;

SELECT * FROM discovery_signals LIMIT 5;


SELECT 
    a.app_id,
    c.country,
    d.*
FROM apps a
LEFT JOIN country_stats c
ON a.app_id = c.app_id
LEFT JOIN discovery_signals d
ON a.app_id = d.app_id;