use master 
CREATE DATABASE NBA_team

CREATE TABLE Team (
  team_name VARCHAR(50) NOT NULL UNIQUE,
  team_id INT PRIMARY KEY,	
  head_coach VARCHAR(50) NOT NULL,
  assistant_coach VARCHAR(50) NOT NULL,
  num_matches INT,
  --CONSTRAINT fk_head_coach FOREIGN KEY (head_coach) REFERENCES Head_Coach(coach_id),
  --CONSTRAINT fk_assistant_coach FOREIGN KEY (assistant_coach) REFERENCES Assistant_Coach(coach_id)
);

select * from Team
--DROP TABLE Team 

INSERT INTO Team values ('Los Angeles Lakers Roster', 1, 'Darvin Ham', 'Christ Jent', 3);
INSERT INTO Team values ('Sacramento Kings Roster', 2, 'Mike Brown', 'Dutch Gaitley', 3);
INSERT INTO Team values ('Golden State Warriors Roster', 3, 'Steve Kerr', 'Kenny Atkinson', 3);
INSERT INTO Team values ('LA Clippers Roster', 4, 'Tyronn Lue', 'Dan Craig', 3);

CREATE TABLE Head_Coach (
  coach_id VARCHAR(50) PRIMARY KEY,
  team_id INT NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  CONSTRAINT fk_team_head_coach FOREIGN KEY (team_id) REFERENCES Team(team_id)
);

select * from Head_Coach
--DROP TABLE Head_Coach 

INSERT INTO Head_Coach values ('DH-1', 1, 'Darvin', 'Ham');
INSERT INTO Head_Coach values ('MK-2', 2, 'Mike',' Brown');
INSERT INTO Head_Coach values ('SK-3', 3, 'Steve', 'Kerr');
INSERT INTO Head_Coach values ('TL-4', 4, 'Tyronn',' Lue');

CREATE TABLE Assistant_Coach (
  assistant_id VARCHAR(50) PRIMARY KEY,
  team_id INT NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  CONSTRAINT fk_team_assistant_coach FOREIGN KEY (team_id) REFERENCES Team(team_id)
);
select * from Assistant_Coach
--DROP TABLE Assistant_Coach

INSERT INTO Assistant_Coach values ('CJ-1', 1, 'Christ',' Jent');
INSERT INTO Assistant_Coach values ('DG-2', 2, 'Dutch',' Gaitley');
INSERT INTO Assistant_Coach values ('KA-3', 3, ' Kenny', 'Atkinson');
INSERT INTO Assistant_Coach values ('DC-4', 4, 'Dan', 'Craig');

CREATE TABLE Player (
  player_id VARCHAR(50) PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  position_played VARCHAR(50) NOT NULL,
  player_status VARCHAR(50),
  team_id INT NOT NULL,
  CONSTRAINT fk_team FOREIGN KEY (team_id) REFERENCES Team(team_id)
);

select * from Player
--DROP TABLE Player
INSERT INTO Player values ('LR-12', 'Mo', 'Bamba','C','In-match',1);
INSERT INTO Player values ('MB-05', 'Malik', 'Beasley','SG','In-match',1);
INSERT INTO Player values ('HB-40', 'Harrison', 'Barnes','SF','In-match',2);
INSERT INTO Player values ('TD-03', 'Terence', 'Davis','SG','In-match',2);

CREATE TABLE Match (
  match_id VARCHAR(50) PRIMARY KEY,
  location VARCHAR(50) NOT NULL,
  match_date DATE NOT NULL,
  team_id INT NOT NULL,
  CONSTRAINT fk_team_match FOREIGN KEY (team_id) REFERENCES Team(team_id)
);

select * from Match
--DROP TABLE Match
INSERT INTO Match values ('LW-Game1', 'Chase Center-SF', '2022-10-18',1);
INSERT INTO Match values ('LC-Game1', 'Crypto Arena-LA', '2022-10-20',1);

CREATE TABLE Statistic (
  player_match_id VARCHAR(50) PRIMARY KEY,
  player_id VARCHAR(50) NOT NULL,
  match_id VARCHAR(50) NOT NULL,
  points NUMERIC(3,0),
  rebounds NUMERIC(3,0) ,
  assists NUMERIC(3,0),
  blocks NUMERIC(3,0),
  CONSTRAINT fk_player FOREIGN KEY (player_id) REFERENCES Player(player_id),
  CONSTRAINT fk_match FOREIGN KEY (match_id) REFERENCES Match(match_id)
);
select * from Statistic
DROP TABLE Statistic
INSERT INTO Match values ('LW-Game1', 'Chase Center-SF', '2022-10-18',1);
INSERT INTO Match values ('LC-Game1', 'Crypto Arena-LA', '2022-10-20',1);
