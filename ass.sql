create table trip(TRIP_ID varchar(40),TRIP_SOURCE varchar(40),TRIP_DESTINATION varchar(40),TRIP_START_TIME time,TRIP_END_TIME time,TRIP_COST integer,DYNAMIC_FARE varchar(40));
insert into trip values('TP01','CHN','BGL','13:40','15:40',3500,'Y');
insert into trip values('TP02','BGL','MUM','18:20','19:20',6700,'Y');
insert into trip values('TP03','CHN','HYD','9:45','11:10',3000,'Y');
insert into trip values('TP04','HYD','BGL','12:20','13:25',2700,'N');
insert into trip values('TP05','MUM','NDL','23:00','1:25',4500,'Y');
insert into trip values('TP06','BGL','NDL','19:40','22:10',5000,'N');
insert into trip values('TP07','NDL','MUM','16:45','17:50',6000,'Y');
insert into trip values('TP08','MUM','BGL','20:20','23:45',5000,'N');
insert into trip values('TP09','CHN','HYD','11:25','13:45',3000,'N');
insert into trip values('TP10','HYD','CHN','20:30','22:20',4500,'Y');
insert into trip values('TP11','BGL','CHN','23:45','1:05',3900,'Y');

select * from trip;

select trip_id,trip_source,trip_destination,dense_rank() over( order by abs(trip_end_time)-(trip_start_time)) as time from trip
group by trip_id,trip_source,trip_destination;

select trip_id, trip_source,trip_destination,trip_start_time,trip_end_time,trip_cost from
(select trip_id, trip_source,trip_destination,trip_start_time,trip_end_time,trip_cost,
dense_rank() over(order by diff) as ra from
(select trip_id, trip_source,trip_destination,trip_start_time,trip_end_time,trip_cost, case
when (trip_end_time)-(trip_start_time) < 0 then 1000000000
 when (trip_end_time)-(trip_start_time) > 0 then  (trip_end_time)-(trip_start_time)
 end as diff from trip)d)d1 where ra=1;