create schema dds
 
create  table dds.dim_aircrafts
(aircraft_id serial primary key,
aircraft_code varchar(4) not null,
model varchar(50) not null, 
aircraft_range int not null, 
seats_econom int ,
seats_bussiness int )

create table dds.dim_airports
(airport_id serial primary key,
airport_code varchar (5) not null,
airport_name varchar(50) not null,
city varchar(100) not null, 
timezone varchar(100) not null
)

create table dds.dim_tariff
(tarif_id serial primary key,
fare_conditional varchar(50) not null
)

--create table dds.dim_calendar

create table dds.dim_passenger
(passenger_id serial primary key,
passenger_name varchar(200) not null,
ticket_no int not null,
seat_no varchar(5),
contact_date json,
tarif int,
costs int
)

drop table dds.dim_passenger

create table dds.fact_flights
(passenger int references dds.dim_passenger (passenger_id)  ,
date_depature timestamp,
date_arrival timestamp,
delay_depature_sec int,
delay_arrival_sec int,
aircraft_id int references dds.dim_aircrafts (aircraft_id) ,
airport_depature int references  dds.dim_airports(airport_id), 
airport_arrival int references  dds.dim_airports(airport_id),
tarif int references dds.dim_tariff (tarif_id) , 
costs int  )
