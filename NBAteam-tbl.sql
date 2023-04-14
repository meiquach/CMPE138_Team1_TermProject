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

CREATE TABLE Head_Coach (
  coach_id VARCHAR(50) PRIMARY KEY,
  team_id INT NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  CONSTRAINT fk_team_head_coach FOREIGN KEY (team_id) REFERENCES Team(team_id)
);

select * from Head_Coach
--DROP TABLE Head_Coach 

CREATE TABLE Assistant_Coach (
  assistant_id VARCHAR(50) PRIMARY KEY,
  team_id INT NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  CONSTRAINT fk_team_assistant_coach FOREIGN KEY (team_id) REFERENCES Team(team_id)
);
select * from Assistant_Coach
--DROP TABLE Assistant_Coach

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

CREATE TABLE Match (
  match_id VARCHAR(50) PRIMARY KEY,
  location VARCHAR(50) NOT NULL,
  match_date DATE NOT NULL,
  team_id INT NOT NULL,
  CONSTRAINT fk_team_match FOREIGN KEY (team_id) REFERENCES Team(team_id)
);

select * from Match
--DROP TABLE Match


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
--DROP TABLE Statistic

