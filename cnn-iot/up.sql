drop database IOTSoilValues if exists;
create database IOTSoilValues;
use IOTSoilValues;

create table soil_values(
    soil_id int(11) primary key AUTO_INCREMENT,
    relative_humidity float not null,
    nitrogen_percent float not null,
    temperature float not null,
    dates varchar(25) not null,
    soil_state int default 1
);