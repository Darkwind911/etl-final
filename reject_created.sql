create schema rejected 


create  table rejected .dim_aircrafts
(error_id serial,
aircraft_code varchar(4) not null,
model varchar(50) not null, 
aircraft_range int not null, 
seats_total int  )


select * from rejected .dim_aircrafts

