--drop table if exists ridership;

create table if not exists ridership(
	id integer primary key, -- каждой твари по id
	event_time timestamp,   -- когда случилось
	event_kind int,         -- 1 -- вход, 2 -- выход
	in_neuro int,		-- выход соответствующего нейрона
	out_neuro int,
	sent int -- отправляли ли
);
create index if not exists ridership_time_idx on ridership(sent, event_time);
