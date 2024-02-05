# Qatar Asian Cup 데이터베이스

# 주체
-- 참가국 (국가명, 조, 감독, 피파랭킹)
-- 경기장 (경기장명, 수용인원, 주소)
-- 축구선수 (이름, 나이, 포지션, 소속프로팀, 등번호, 국가)
-- 심판 (이름, 나이, 포지션)

# 관계 : 주체의 어떤 특정한 행동으로 보는 건 관계로 표시
-- 경기 (경기일정, 국가1, 국가2, 경기장, 주심, 부심, 경기결과)

-- qatar_asian_cup
CREATE DATABASE qatar_asian_cup;
USE qatar_asian_cup;

-- country (name[가변 문자열 30], group_name[가변 문자열 1], manager[가변 문자열 30], Ranking[정수])
CREATE TABLE country(
	name VARCHAR(30),
    group_name VARCHAR(1),
    manager VARCHAR(30),
    ranking INT
);
-- stadium (name[가변 문자열 50], capacity[정수], address[가변 문자열 255])
CREATE TABLE stadium (
	name VARCHAR(50),
    capacity INT,
    address VARCHAR(255)
);
-- player (name[가변 문자열 30], age[정수], position[가변 문자열 15], pro_team[가변 문자열 30], uniform_number[정수], country[가변 문자열 30])
CREATE TABLE player (
	name VARCHAR(30),
    age INT,
    position VARCHAR(14),
    pro_team VARCHAR(30),
    uniform_number INT,
    country VARCHAR(30)
);

-- referee (name[가변문자열 30], age[정수], position[가변문자열 30])
CREATE TABLE referee (
	name VARCHAR(30),
    age INT,
    position VARCHAR(30)
);
-- game(Schedule[날짜 및 시간], country1[가변 문자열 30], country2[가변 문자열 30], stadium[가변 문자열 50], 
-- chief_referee[가변 문자열 30], second_referee[가변 문자열 30], winning_country[가변 문자열 30] )
CREATE TABLE game (
	schedule DATETIME,
    country1 VARCHAR(30),
    country2 VARCHAR(30),
    stadium VARCHAR(50),
    chief_referee VARCHAR(30),
    second_referee VARCHAR(30),
    winning_country VARCHAR(30)
);
