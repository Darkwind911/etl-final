create schema rejected 

drop table rejected .dim_aircrafts

create  table rejected .dim_aircrafts
(error_id serial,
aircraft_code varchar(4) ,
model varchar(50) , 
aircraft_range int, 
seats_total int  ) 

drop table rejected.dim_airports

create table rejected.dim_airports
(airport_id serial ,
airport_code varchar (5) ,
airport_name varchar(50) ,
city varchar(100) , 
timezone varchar(100) 
)

drop table rejected.dim_tariff

create table rejected.dim_tariff
(tarif_id serial ,
tarif varchar(50) 
)

drop table rejected.dim_passenger

select * from rejected.dim_passenger dp 

create table rejected.dim_passenger
(passenger_id serial ,
passenger_name varchar(200) ,
ticket_no varchar(100) ,
seat_no varchar(5) 
)

select * from rejected.fact_flights

drop table rejected.fact_flights

create table rejected.fact_flights
(passenger int  ,
arrival_date_id int ,
depature_date_id int ,
date_depature timestamp ,
date_arrival timestamp ,
delay_depature_sec int ,
delay_arrival_sec int,
aircraft_id int  ,
airport_depature int , 
airport_arrival int ,
tarif int  , 
costs int  )





