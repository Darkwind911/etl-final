create schema rejected 

create  table rejected .dim_aircrafts
(error_id serial,
aircraft_code varchar(4) ,
model varchar(50) , 
aircraft_range int, 
seats_total int  ) 

create table rejected.dim_airports
(airport_id serial ,
airport_code varchar (5) ,
airport_name varchar(50) ,
city varchar(100) , 
timezone varchar(100) 
)

create table rejected.dim_tariff
(tarif_id serial ,
tarif varchar(50) 
)

create table dds.dim_passenger
(passenger_id serial,
passenger_name varchar(200) ,
flight_id int , 
ticket_no varchar(100) ,
seat_no varchar(5),
tarif int,
costs int
)


create table rejected.fact_flights
(passenger int  ,
action_day int ,
date_depature timestamp,
date_arrival timestamp,
delay_depature_sec int,
delay_arrival_sec int,
aircraft_id int  ,
airport_depature , 
airport_arrival ,
tarif int  , 
costs int  )




SELECT * FROM dds.dim_airports
where airport_code = 'DME'
