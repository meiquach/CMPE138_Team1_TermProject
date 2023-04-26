DROP DATABASE IF EXISTS NBA_team;
CREATE DATABASE NBA_team;
USE NBA_team;

CREATE TABLE Team (
  team_id VARCHAR(50) PRIMARY KEY,
  team_name VARCHAR(50) NOT NULL UNIQUE,
  num_matches INT
);
select * from Team;


CREATE TABLE Staff (
  username VARCHAR(50) PRIMARY KEY,
  team_id VARCHAR(50) NOT NULL,
  role enum('HEAD_COACH', 'ASSISTANT_COACH') NOT NULL default 'ASSISTANT_COACH',
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  password VARCHAR(100) NOT NULL,
  CONSTRAINT fk_team_staff FOREIGN KEY (team_id) REFERENCES Team(team_id)
);
select * from Staff;

CREATE TABLE Player (
  player_id VARCHAR(50) PRIMARY KEY,
  team_id VARCHAR(50) NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  position_played VARCHAR(50) NOT NULL,
  player_status VARCHAR(50),
  CONSTRAINT fk_team_player FOREIGN KEY (team_id) REFERENCES Team(team_id)
);
select * from Player;

CREATE TABLE Matches (
  match_id VARCHAR(50) PRIMARY KEY,
  match_date DATE NOT NULL,
  location VARCHAR(50) NOT NULL,
  home_team_id VARCHAR(50)NOT NULL,
  away_team_id VARCHAR(50)NOT NULL,
  home_score INT NOT NULL,
  away_score INT NOT NULL,
  CONSTRAINT fk_home_team FOREIGN KEY (home_team_id) REFERENCES Team(team_id),
  CONSTRAINT fk_away_team FOREIGN KEY (away_team_id) REFERENCES Team(team_id)
);
select * from Matches;

CREATE TABLE Statistic (
  statistic_id VARCHAR(50) PRIMARY KEY,
  player_id VARCHAR(50) NOT NULL,
  match_id VARCHAR(50) NOT NULL,
  points NUMERIC(3,0),
  assists NUMERIC(3,0),
  rebounds NUMERIC(3,0),
  blocks NUMERIC(3,0),
  steals NUMERIC(3,0),
  CONSTRAINT fk_player FOREIGN KEY (player_id) REFERENCES Player(player_id),
  CONSTRAINT fk_match FOREIGN KEY (match_id) REFERENCES Matches(match_id)
);
select * from Statistic;



-- Team: ['team_id', ' team_name', ' num_matches']
INSERT INTO Team VALUES ('Team_000001', 'Los_Angeles_Lakers', 9);
INSERT INTO Team VALUES ('Team_000002', 'Sacramento_Kings', 9);
INSERT INTO Team VALUES ('Team_000003', 'Golden_State_Warriors', 9);
INSERT INTO Team VALUES ('Team_000004', 'LA_Clippers', 9);


-- Staff: ['username', ' team_id', ' role', ' first_name', ' last_name', ' password']
INSERT INTO Staff VALUES ('darvinham', 'Team_000001', 'HEAD_COACH', 'Darvin', 'Ham', '35120f590bc08a7c2ddd6113d22e9c43ad7d00e0d48ac39af4936f0dd8249099');
INSERT INTO Staff VALUES ('chrisjent', 'Team_000001', 'ASSISTANT_COACH', 'Christ', 'Jent', 'e2586ca65f7a3cef131d1a59e06e13d2257c686b5dc95ef69a0789b1706cd3d2');
INSERT INTO Staff VALUES ('mikebrown', 'Team_000002', 'HEAD_COACH', 'Mike', 'Brown', '338d970dc1ddd3b93e81bb0f3d2511418aa88dbaaae5eef0dffce5f5b8b15789');
INSERT INTO Staff VALUES ('dutchgaitley', 'Team_000002', 'ASSISTANT_COACH', 'Dutch', 'Gaitley', 'c48b85dc665f841019744359584392c1aeda21a9eb4f983f987602572a646ed4');
INSERT INTO Staff VALUES ('stevekerr', 'Team_000003', 'HEAD_COACH', 'Steve', 'Kerr', '90e0083111444e26261e591f4f1b91bc32861b70cdb2d7aa63cc352e033acd30');
INSERT INTO Staff VALUES ('kennyatkinson', 'Team_000003', 'ASSISTANT_COACH', 'Kenny', 'Atkinson', '07708f9cc5999bef70cc4a811e07ee2c77138720eead81f45a8814bafd27c36a');
INSERT INTO Staff VALUES ('tyronnlue', 'Team_000004', 'HEAD_COACH', 'Tyronn', 'Lue', '63667479764df4f13a04eb6e52ba6a23c49a856897fd54ccd5b9382b7d8c0f00');
INSERT INTO Staff VALUES ('danialcraig', 'Team_000004', 'ASSISTANT_COACH', 'Danial', 'Craig', '8bc94ab98d8ff6d1b16813259b2bfc9af94acaca8355320e553ce2727e4703e9');


-- Player: ['player_id', ' team_id', ' first_name', ' last_name', ' position_played', ' player_status']
INSERT INTO Player VALUES ('Player_000001', 'Team_000003', 'Stephen', 'Curry', 'PG', 'Healthy');
INSERT INTO Player VALUES ('Player_000002', 'Team_000003', 'Draymond', 'Green', 'PF', 'Healthy');
INSERT INTO Player VALUES ('Player_000003', 'Team_000003', 'Klay', 'Thompson', 'SG', 'Healthy');
INSERT INTO Player VALUES ('Player_000004', 'Team_000003', 'Jordan', 'Poole', 'SG', 'Healthy');
INSERT INTO Player VALUES ('Player_000005', 'Team_000003', 'Jonathan', 'Kuminga', 'PF', 'Healthy');
INSERT INTO Player VALUES ('Player_000006', 'Team_000002', 'DeAaron', 'Fox', 'PG', 'Healthy');
INSERT INTO Player VALUES ('Player_000007', 'Team_000002', 'Domantas', 'Sabonis', 'PF', 'Healthy');
INSERT INTO Player VALUES ('Player_000008', 'Team_000002', 'Kevin', 'Huerter', 'SG', 'Healthy');
INSERT INTO Player VALUES ('Player_000009', 'Team_000002', 'Malik', 'Monk', 'SG', 'Healthy');
INSERT INTO Player VALUES ('Player_000010', 'Team_000002', 'Harrison', 'Barnes', 'SF', 'Healthy');
INSERT INTO Player VALUES ('Player_000011', 'Team_000004', 'Kawhi', 'Leonard', 'SF', 'Healthy');
INSERT INTO Player VALUES ('Player_000012', 'Team_000004', 'Ivica', 'Zubac', 'C', 'Healthy');
INSERT INTO Player VALUES ('Player_000013', 'Team_000004', 'Paul', 'George', 'F', 'Healthy');
INSERT INTO Player VALUES ('Player_000014', 'Team_000004', 'Bones', 'Hyland', 'PG', 'Healthy');
INSERT INTO Player VALUES ('Player_000015', 'Team_000004', 'Terrance', 'Mann', 'SG', 'Healthy');
INSERT INTO Player VALUES ('Player_000016', 'Team_000001', 'LeBron', 'James', 'SF', 'Healthy');
INSERT INTO Player VALUES ('Player_000017', 'Team_000001', 'Anthony', 'Davis', 'PF', 'Healthy');
INSERT INTO Player VALUES ('Player_000018', 'Team_000001', 'Dennis', 'Schroder', 'PG', 'Healthy');
INSERT INTO Player VALUES ('Player_000019', 'Team_000001', 'Austin', 'Reeves', 'SG', 'Healthy');
INSERT INTO Player VALUES ('Player_000020', 'Team_000001', 'Rui', 'Hachimura', 'PF', 'Healthy');


-- Matches: ['match_id', ' match_date', ' location', ' home_team_id', ' away_team_id', ' home_score', ' away_score']
INSERT INTO Matches VALUES ('Match_000001', '2022-10-18', 'San_Francisco', 'Team_000003', 'Team_000001', 123, 109);
INSERT INTO Matches VALUES ('Match_000002', '2022-10-20', 'Los_Angeles', 'Team_000004', 'Team_000001', 103, 97);
INSERT INTO Matches VALUES ('Match_000003', '2022-10-22', 'Sacramento', 'Team_000002', 'Team_000004', 109, 111);
INSERT INTO Matches VALUES ('Match_000004', '2022-10-23', 'San_Francisco', 'Team_000003', 'Team_000002', 130, 125);
INSERT INTO Matches VALUES ('Match_000005', '2022-11-07', 'San_Francisco', 'Team_000003', 'Team_000002', 116, 113);
INSERT INTO Matches VALUES ('Match_000006', '2022-11-09', 'Los_Angeles', 'Team_000001', 'Team_000004', 101, 114);
INSERT INTO Matches VALUES ('Match_000007', '2022-11-11', 'Los_Angeles', 'Team_000001', 'Team_000002', 114, 120);
INSERT INTO Matches VALUES ('Match_000008', '2022-11-13', 'Sacramento', 'Team_000002', 'Team_000003', 122, 115);
INSERT INTO Matches VALUES ('Match_000009', '2022-11-23', 'San_Francisco', 'Team_000003', 'Team_000004', 124, 107);
INSERT INTO Matches VALUES ('Match_000010', '2022-12-03', 'Los_Angeles', 'Team_000004', 'Team_000002', 96, 123);
INSERT INTO Matches VALUES ('Match_000011', '2022-12-21', 'Sacramento', 'Team_000002', 'Team_000001', 134, 120);
INSERT INTO Matches VALUES ('Match_000012', '2023-01-07', 'Sacramento', 'Team_000002', 'Team_000001', 134, 136);
INSERT INTO Matches VALUES ('Match_000013', '2023-01-24', 'Los_Angeles', 'Team_000001', 'Team_000004', 115, 133);
INSERT INTO Matches VALUES ('Match_000014', '2023-02-11', 'San_Francisco', 'Team_000003', 'Team_000001', 103, 109);
INSERT INTO Matches VALUES ('Match_000015', '2023-02-14', 'Los_Angeles', 'Team_000004', 'Team_000003', 134, 124);
INSERT INTO Matches VALUES ('Match_000016', '2023-02-23', 'Los_Angeles', 'Team_000001', 'Team_000003', 124, 111);
INSERT INTO Matches VALUES ('Match_000017', '2023-02-24', 'Los_Angeles', 'Team_000004', 'Team_000002', 175, 176);
INSERT INTO Matches VALUES ('Match_000018', '2023-03-02', 'San_Francisco', 'Team_000003', 'Team_000004', 115, 91);


-- Statistic: ['statistic_id', ' player_id', ' match_id', ' pts', ' assists', ' rebounds', ' blocks', ' steals']
INSERT INTO Statistic VALUES ('Stat_000012', 'Player_000001', 'Match_000001', 10, 3, 4, 5, 0);
INSERT INTO Statistic VALUES ('Stat_000013', 'Player_000001', 'Match_000004', 20, 3, 1, 3, 4);
INSERT INTO Statistic VALUES ('Stat_000014', 'Player_000001', 'Match_000005', 30, 1, 4, 2, 0);
INSERT INTO Statistic VALUES ('Stat_000015', 'Player_000001', 'Match_000008', 32, 5, 2, 1, 1);
INSERT INTO Statistic VALUES ('Stat_000016', 'Player_000001', 'Match_000009', 25, 4, 8, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000017', 'Player_000001', 'Match_000014', 40, 3, 3, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000018', 'Player_000001', 'Match_000015', 5, 12, 4, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000019', 'Player_000001', 'Match_000016', 13, 15, 0, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000021', 'Player_000002', 'Match_000001', 6, 12, 11, 1, 1);
INSERT INTO Statistic VALUES ('Stat_000022', 'Player_000002', 'Match_000004', 4, 10, 10, 1, 2);
INSERT INTO Statistic VALUES ('Stat_000023', 'Player_000002', 'Match_000005', 5, 8, 3, 2, 1);
INSERT INTO Statistic VALUES ('Stat_000024', 'Player_000002', 'Match_000008', 2, 5, 12, 1, 0);
INSERT INTO Statistic VALUES ('Stat_000025', 'Player_000002', 'Match_000009', 7, 7, 15, 3, 0);
INSERT INTO Statistic VALUES ('Stat_000026', 'Player_000002', 'Match_000014', 10, 8, 12, 4, 1);
INSERT INTO Statistic VALUES ('Stat_000027', 'Player_000002', 'Match_000015', 15, 1, 10, 1, 0);
INSERT INTO Statistic VALUES ('Stat_000028', 'Player_000002', 'Match_000016', 2, 3, 8, 0, 2);
INSERT INTO Statistic VALUES ('Stat_000029', 'Player_000002', 'Match_000018', 22, 4, 5, 0, 3);
INSERT INTO Statistic VALUES ('Stat_000031', 'Player_000003', 'Match_000001', 22, 0, 2, 0, 2);
INSERT INTO Statistic VALUES ('Stat_000032', 'Player_000003', 'Match_000004', 25, 2, 3, 3, 0);
INSERT INTO Statistic VALUES ('Stat_000033', 'Player_000003', 'Match_000005', 40, 8, 12, 2, 0);
INSERT INTO Statistic VALUES ('Stat_000034', 'Player_000003', 'Match_000008', 5, 3, 3, 1, 0);
INSERT INTO Statistic VALUES ('Stat_000035', 'Player_000003', 'Match_000009', 13, 2, 12, 0, 1);
INSERT INTO Statistic VALUES ('Stat_000036', 'Player_000003', 'Match_000014', 6, 0, 15, 1, 1);
INSERT INTO Statistic VALUES ('Stat_000037', 'Player_000003', 'Match_000015', 4, 5, 12, 0, 2);
INSERT INTO Statistic VALUES ('Stat_000038', 'Player_000003', 'Match_000016', 5, 10, 10, 2, 1);
INSERT INTO Statistic VALUES ('Stat_000039', 'Player_000003', 'Match_000018', 10, 11, 8, 3, 1);
INSERT INTO Statistic VALUES ('Stat_000041', 'Player_000004', 'Match_000001', 16, 4, 1, 0, 2);
INSERT INTO Statistic VALUES ('Stat_000042', 'Player_000004', 'Match_000004', 25, 12, 4, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000043', 'Player_000004', 'Match_000005', 40, 3, 0, 1, 0);
INSERT INTO Statistic VALUES ('Stat_000044', 'Player_000004', 'Match_000008', 5, 12, 2, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000045', 'Player_000004', 'Match_000009', 13, 15, 12, 2, 0);
INSERT INTO Statistic VALUES ('Stat_000046', 'Player_000004', 'Match_000014', 6, 2, 15, 1, 0);
INSERT INTO Statistic VALUES ('Stat_000047', 'Player_000004', 'Match_000015', 4, 8, 12, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000048', 'Player_000004', 'Match_000016', 5, 10, 10, 0, 1);
INSERT INTO Statistic VALUES ('Stat_000049', 'Player_000004', 'Match_000018', 2, 11, 2, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000051', 'Player_000005', 'Match_000001', 10, 5, 3, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000052', 'Player_000005', 'Match_000004', 9, 14, 2, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000053', 'Player_000005', 'Match_000005', 10, 4, 1, 1, 1);
INSERT INTO Statistic VALUES ('Stat_000054', 'Player_000005', 'Match_000008', 23, 1, 0, 0, 2);
INSERT INTO Statistic VALUES ('Stat_000055', 'Player_000005', 'Match_000009', 4, 0, 0, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000056', 'Player_000005', 'Match_000014', 5, 3, 0, 0, 1);
INSERT INTO Statistic VALUES ('Stat_000057', 'Player_000005', 'Match_000015', 18, 4, 0, 0, 3);
INSERT INTO Statistic VALUES ('Stat_000058', 'Player_000005', 'Match_000016', 20, 1, 5, 0, 1);
INSERT INTO Statistic VALUES ('Stat_000059', 'Player_000005', 'Match_000018', 25, 1, 3, 2, 2);
INSERT INTO Statistic VALUES ('Stat_000061', 'Player_000006', 'Match_000003', 4, 1, 2, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000062', 'Player_000006', 'Match_000004', 8, 4, 5, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000063', 'Player_000006', 'Match_000005', 9, 5, 6, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000064', 'Player_000006', 'Match_000007', 10, 1, 1, 0, 1);
INSERT INTO Statistic VALUES ('Stat_000065', 'Player_000006', 'Match_000008', 20, 0, 8, 0, 2);
INSERT INTO Statistic VALUES ('Stat_000066', 'Player_000006', 'Match_000010', 35, 12, 4, 2, 0);
INSERT INTO Statistic VALUES ('Stat_000067', 'Player_000006', 'Match_000011', 25, 10, 5, 1, 1);
INSERT INTO Statistic VALUES ('Stat_000068', 'Player_000006', 'Match_000012', 26, 3, 5, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000069', 'Player_000006', 'Match_000017', 27, 2, 2, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000071', 'Player_000007', 'Match_000003', 10, 0, 3, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000072', 'Player_000007', 'Match_000004', 6, 0, 4, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000073', 'Player_000007', 'Match_000005', 7, 12, 10, 0, 1);
INSERT INTO Statistic VALUES ('Stat_000074', 'Player_000007', 'Match_000007', 17, 14, 13, 1, 2);
INSERT INTO Statistic VALUES ('Stat_000075', 'Player_000007', 'Match_000008', 15, 15, 2, 2, 0);
INSERT INTO Statistic VALUES ('Stat_000076', 'Player_000007', 'Match_000010', 14, 5, 12, 0, 3);
INSERT INTO Statistic VALUES ('Stat_000077', 'Player_000007', 'Match_000011', 18, 6, 14, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000078', 'Player_000007', 'Match_000012', 20, 9, 15, 0, 4);
INSERT INTO Statistic VALUES ('Stat_000079', 'Player_000007', 'Match_000017', 9, 9, 16, 1, 0);
INSERT INTO Statistic VALUES ('Stat_000081', 'Player_000008', 'Match_000003', 1, 8, 12, 4, 0);
INSERT INTO Statistic VALUES ('Stat_000082', 'Player_000008', 'Match_000004', 30, 3, 3, 6, 0);
INSERT INTO Statistic VALUES ('Stat_000083', 'Player_000008', 'Match_000005', 2, 4, 2, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000084', 'Player_000008', 'Match_000007', 5, 3, 6, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000085', 'Player_000008', 'Match_000008', 7, 2, 1, 0, 1);
INSERT INTO Statistic VALUES ('Stat_000086', 'Player_000008', 'Match_000010', 28, 4, 2, 0, 2);
INSERT INTO Statistic VALUES ('Stat_000087', 'Player_000008', 'Match_000011', 10, 1, 3, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000088', 'Player_000008', 'Match_000012', 4, 5, 2, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000089', 'Player_000008', 'Match_000017', 3, 2, 0, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000091', 'Player_000009', 'Match_000003', 2, 33, 0, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000092', 'Player_000009', 'Match_000004', 6, 1, 1, 0, 3);
INSERT INTO Statistic VALUES ('Stat_000093', 'Player_000009', 'Match_000005', 8, 4, 3, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000094', 'Player_000009', 'Match_000007', 5, 2, 6, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000095', 'Player_000009', 'Match_000008', 12, 5, 2, 0, 5);
INSERT INTO Statistic VALUES ('Stat_000096', 'Player_000009', 'Match_000010', 15, 8, 7, 0, 6);
INSERT INTO Statistic VALUES ('Stat_000097', 'Player_000009', 'Match_000011', 20, 7, 8, 0, 1);
INSERT INTO Statistic VALUES ('Stat_000098', 'Player_000009', 'Match_000012', 24, 3, 4, 0, 2);
INSERT INTO Statistic VALUES ('Stat_000099', 'Player_000009', 'Match_000017', 23, 4, 0, 1, 3);
INSERT INTO Statistic VALUES ('Stat_000101', 'Player_000010', 'Match_000003', 10, 6, 0, 0, 4);
INSERT INTO Statistic VALUES ('Stat_000102', 'Player_000010', 'Match_000004', 15, 2, 1, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000103', 'Player_000010', 'Match_000005', 2, 5, 2, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000104', 'Player_000010', 'Match_000007', 0, 2, 3, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000105', 'Player_000010', 'Match_000008', 10, 6, 2, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000106', 'Player_000010', 'Match_000010', 0, 4, 2, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000107', 'Player_000010', 'Match_000011', 2, 4, 2, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000108', 'Player_000010', 'Match_000012', 3, 7, 2, 0, 1);
INSERT INTO Statistic VALUES ('Stat_000109', 'Player_000010', 'Match_000017', 6, 6, 1, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000111', 'Player_000011', 'Match_000002', 23, 1, 0, 0, 2);
INSERT INTO Statistic VALUES ('Stat_000112', 'Player_000011', 'Match_000003', 32, 1, 1, 0, 3);
INSERT INTO Statistic VALUES ('Stat_000113', 'Player_000011', 'Match_000006', 5, 1, 2, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000114', 'Player_000011', 'Match_000009', 3, 2, 0, 2, 0);
INSERT INTO Statistic VALUES ('Stat_000115', 'Player_000011', 'Match_000010', 1, 3, 3, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000116', 'Player_000011', 'Match_000013', 20, 3, 4, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000117', 'Player_000011', 'Match_000015', 26, 4, 0, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000118', 'Player_000011', 'Match_000017', 12, 5, 0, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000119', 'Player_000011', 'Match_000018', 4, 6, 1, 1, 1);
INSERT INTO Statistic VALUES ('Stat_000121', 'Player_000012', 'Match_000002', 0, 7, 1, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000122', 'Player_000012', 'Match_000003', 3, 8, 1, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000123', 'Player_000012', 'Match_000006', 7, 1, 1, 0, 1);
INSERT INTO Statistic VALUES ('Stat_000124', 'Player_000012', 'Match_000009', 8, 2, 1, 0, 2);
INSERT INTO Statistic VALUES ('Stat_000125', 'Player_000012', 'Match_000010', 19, 0, 1, 1, 0);
INSERT INTO Statistic VALUES ('Stat_000126', 'Player_000012', 'Match_000013', 29, 0, 2, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000127', 'Player_000012', 'Match_000015', 3, 0, 3, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000128', 'Player_000012', 'Match_000017', 14, 0, 4, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000129', 'Player_000012', 'Match_000018', 20, 1, 10, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000131', 'Player_000013', 'Match_000002', 20, 3, 2, 3, 1);
INSERT INTO Statistic VALUES ('Stat_000132', 'Player_000013', 'Match_000003', 3, 4, 3, 8, 4);
INSERT INTO Statistic VALUES ('Stat_000133', 'Player_000013', 'Match_000006', 10, 0, 4, 3, 0);
INSERT INTO Statistic VALUES ('Stat_000134', 'Player_000013', 'Match_000009', 23, 1, 0, 0, 3);
INSERT INTO Statistic VALUES ('Stat_000135', 'Player_000013', 'Match_000010', 45, 2, 1, 0, 1);
INSERT INTO Statistic VALUES ('Stat_000136', 'Player_000013', 'Match_000013', 10, 4, 3, 4, 0);
INSERT INTO Statistic VALUES ('Stat_000137', 'Player_000013', 'Match_000015', 21, 0, 0, 1, 2);
INSERT INTO Statistic VALUES ('Stat_000138', 'Player_000013', 'Match_000017', 15, 8, 4, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000139', 'Player_000013', 'Match_000018', 10, 3, 5, 1, 4);
INSERT INTO Statistic VALUES ('Stat_000141', 'Player_000014', 'Match_000002', 2, 4, 1, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000142', 'Player_000014', 'Match_000003', 3, 1, 2, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000143', 'Player_000014', 'Match_000006', 1, 0, 1, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000144', 'Player_000014', 'Match_000009', 10, 3, 1, 1, 0);
INSERT INTO Statistic VALUES ('Stat_000145', 'Player_000014', 'Match_000010', 23, 2, 0, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000146', 'Player_000014', 'Match_000013', 29, 0, 0, 2, 1);
INSERT INTO Statistic VALUES ('Stat_000147', 'Player_000014', 'Match_000015', 24, 0, 2, 0, 2);
INSERT INTO Statistic VALUES ('Stat_000148', 'Player_000014', 'Match_000017', 15, 0, 3, 0, 1);
INSERT INTO Statistic VALUES ('Stat_000149', 'Player_000014', 'Match_000018', 16, 0, 7, 3, 1);
INSERT INTO Statistic VALUES ('Stat_000151', 'Player_000015', 'Match_000002', 17, 0, 4, 0, 1);
INSERT INTO Statistic VALUES ('Stat_000152', 'Player_000015', 'Match_000003', 12, 1, 6, 0, 1);
INSERT INTO Statistic VALUES ('Stat_000153', 'Player_000015', 'Match_000006', 2, 0, 2, 0, 1);
INSERT INTO Statistic VALUES ('Stat_000154', 'Player_000015', 'Match_000009', 5, 3, 4, 0, 2);
INSERT INTO Statistic VALUES ('Stat_000155', 'Player_000015', 'Match_000010', 8, 4, 0, 0, 2);
INSERT INTO Statistic VALUES ('Stat_000156', 'Player_000015', 'Match_000013', 19, 2, 1, 0, 2);
INSERT INTO Statistic VALUES ('Stat_000157', 'Player_000015', 'Match_000015', 20, 0, 3, 1, 1);
INSERT INTO Statistic VALUES ('Stat_000158', 'Player_000015', 'Match_000017', 22, 0, 4, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000159', 'Player_000015', 'Match_000018', 21, 2, 0, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000161', 'Player_000016', 'Match_000001', 15, 3, 3, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000162', 'Player_000016', 'Match_000002', 25, 4, 12, 1, 0);
INSERT INTO Statistic VALUES ('Stat_000163', 'Player_000016', 'Match_000006', 30, 0, 2, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000164', 'Player_000016', 'Match_000007', 27, 0, 3, 2, 0);
INSERT INTO Statistic VALUES ('Stat_000165', 'Player_000016', 'Match_000011', 40, 1, 0, 1, 0);
INSERT INTO Statistic VALUES ('Stat_000166', 'Player_000016', 'Match_000012', 23, 2, 4, 1, 1);
INSERT INTO Statistic VALUES ('Stat_000167', 'Player_000016', 'Match_000013', 25, 7, 1, 2, 2);
INSERT INTO Statistic VALUES ('Stat_000168', 'Player_000016', 'Match_000014', 28, 5, 0, 3, 3);
INSERT INTO Statistic VALUES ('Stat_000169', 'Player_000016', 'Match_000016', 15, 6, 12, 1, 1);
INSERT INTO Statistic VALUES ('Stat_000171', 'Player_000017', 'Match_000001', 12, 1, 11, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000172', 'Player_000017', 'Match_000002', 11, 1, 10, 1, 0);
INSERT INTO Statistic VALUES ('Stat_000173', 'Player_000017', 'Match_000006', 10, 4, 2, 2, 0);
INSERT INTO Statistic VALUES ('Stat_000174', 'Player_000017', 'Match_000007', 3, 6, 15, 1, 1);
INSERT INTO Statistic VALUES ('Stat_000175', 'Player_000017', 'Match_000011', 12, 4, 2, 8, 0);
INSERT INTO Statistic VALUES ('Stat_000176', 'Player_000017', 'Match_000012', 15, 3, 0, 3, 0);
INSERT INTO Statistic VALUES ('Stat_000177', 'Player_000017', 'Match_000013', 15, 2, 3, 1, 0);
INSERT INTO Statistic VALUES ('Stat_000178', 'Player_000017', 'Match_000014', 2, 0, 5, 2, 3);
INSERT INTO Statistic VALUES ('Stat_000179', 'Player_000017', 'Match_000016', 22, 1, 6, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000181', 'Player_000018', 'Match_000001', 13, 2, 1, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000182', 'Player_000018', 'Match_000002', 12, 7, 0, 0, 1);
INSERT INTO Statistic VALUES ('Stat_000183', 'Player_000018', 'Match_000006', 4, 5, 1, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000184', 'Player_000018', 'Match_000007', 6, 8, 0, 0, 2);
INSERT INTO Statistic VALUES ('Stat_000185', 'Player_000018', 'Match_000011', 4, 9, 0, 0, 2);
INSERT INTO Statistic VALUES ('Stat_000186', 'Player_000018', 'Match_000012', 3, 4, 0, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000187', 'Player_000018', 'Match_000013', 3, 3, 0, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000188', 'Player_000018', 'Match_000014', 8, 2, 1, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000189', 'Player_000018', 'Match_000016', 3, 5, 2, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000191', 'Player_000019', 'Match_000001', 14, 4, 3, 0, 1);
INSERT INTO Statistic VALUES ('Stat_000192', 'Player_000019', 'Match_000002', 5, 1, 1, 3, 1);
INSERT INTO Statistic VALUES ('Stat_000193', 'Player_000019', 'Match_000006', 3, 9, 1, 0, 2);
INSERT INTO Statistic VALUES ('Stat_000194', 'Player_000019', 'Match_000007', 8, 12, 4, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000195', 'Player_000019', 'Match_000011', 3, 3, 1, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000196', 'Player_000019', 'Match_000012', 14, 4, 6, 0, 2);
INSERT INTO Statistic VALUES ('Stat_000197', 'Player_000019', 'Match_000013', 5, 2, 0, 1, 0);
INSERT INTO Statistic VALUES ('Stat_000198', 'Player_000019', 'Match_000014', 23, 0, 0, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000199', 'Player_000019', 'Match_000016', 12, 0, 0, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000201', 'Player_000020', 'Match_000001', 14, 2, 1, 0, 0);
INSERT INTO Statistic VALUES ('Stat_000202', 'Player_000020', 'Match_000002', 10, 3, 3, 2, 0);
INSERT INTO Statistic VALUES ('Stat_000203', 'Player_000020', 'Match_000006', 5, 5, 4, 3, 1);
INSERT INTO Statistic VALUES ('Stat_000204', 'Player_000020', 'Match_000007', 8, 2, 5, 5, 0);
INSERT INTO Statistic VALUES ('Stat_000205', 'Player_000020', 'Match_000011', 19, 1, 3, 1, 0);
INSERT INTO Statistic VALUES ('Stat_000206', 'Player_000020', 'Match_000012', 2, 0, 7, 1, 0);
INSERT INTO Statistic VALUES ('Stat_000207', 'Player_000020', 'Match_000013', 4, 12, 4, 0, 1);
INSERT INTO Statistic VALUES ('Stat_000208', 'Player_000020', 'Match_000014', 0, 0, 0, 0, 1);
