## Exploring Cassini mission data


This repo is an exploration of the Cassini mission to Saturn's moon, Enceladus, using a PostgreSQL database. 

The raw data is in the [master_plan](https://github.com/mjplacroix/cassini_mission_2/blob/main/master_plan.csv) file 

It's imported and used to initialize and construct the primary database with [build](https://github.com/mjplacroix/cassini_mission_2/blob/main/build.sql).

A variety of tables are created with [table_creation](https://github.com/mjplacroix/cassini_mission_2/blob/main/table_creation.sql). 

And a further exploration of [specific events](https://github.com/mjplacroix/cassini_mission_2/blob/main/events.sql), [fly-by](https://github.com/mjplacroix/cassini_mission_2/blob/main/fly_by_view.sql), gravity, and [instrument data](https://github.com/mjplacroix/cassini_mission_2/blob/main/instrument_data.sql) are in the remaining SQL docs. 

I aim to add additional queries as I explore further. 
