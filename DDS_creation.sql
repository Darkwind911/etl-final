create schema dds

create  table dds.dim_aircrafts
(aircraft_id serial primary key,
aircraft_code varchar(4) ,
model varchar(50) , 
aircraft_range int, 
seats_total int  )

create table dds.dim_airports
(airport_id serial primary key,
airport_code varchar (5) ,
airport_name varchar(50) ,
city varchar(100) , 
timezone varchar(100) 
)


create table dds.dim_tariff
(tarif_id serial primary key,
tarif varchar(50) 
)

create table dds.dim_calendar 
as 
with dates as
( select dd::date as dt
from generate_series('2016-08-01'::timestamp,
						'2016-12-01'::timestamp,
						'1 day'::interval) dd
)
select 
to_char(dt,'YYYYMMDD')::int as id ,
dt as date,
to_char(dt,'YYYY-MM-DD') as ansi_date,
date_part('isodow',dt)::int as day, 
date_part('week',dt)::int as week_number, 
date_part('month',dt)::int as month_number, 
date_part('year',dt)::int as year_number
from dates
order by dt

alter table dds.dim_calendar  add primary key (id)


create table dds.dim_passenger
(passenger_id serial primary key,
passenger_name varchar(200) ,
ticket_no varchar(100) ,
seat_no varchar(5) )

create table dds.fact_flights
(passenger int references dds.dim_passenger (passenger_id) ,
arrival_date_id int references dds.dim_calendar (id),
depature_date_id int references dds.dim_calendar (id),
date_depature timestamp ,
date_arrival timestamp ,
delay_depature_sec int ,
delay_arrival_sec int,
aircraft_id int references dds.dim_aircrafts (aircraft_id) ,
airport_depature int references  dds.dim_airports(airport_id), 
airport_arrival int references  dds.dim_airports(airport_id),
tarif int references dds.dim_tariff (tarif_id) , 
costs int  )
