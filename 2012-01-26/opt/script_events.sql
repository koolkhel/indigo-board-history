--drop table if exists event;

create table if not exists event(id integer primary key,
							event_time timestamp, -- когда событие наступило
							event_code int,						-- код события (см. confluence)
							sent int									-- отправлено ли
);
create index if not exists event_time_idx on event (sent, event_time);
