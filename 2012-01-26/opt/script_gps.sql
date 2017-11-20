--drop table if exists record;

-- все данные gps
create table if not exists record(id integer primary key,
			record_time timestamp, -- когда
			satellites_used int,   -- использовано спутников для построения
			satellites int,        -- а вообще видно столько спутников
			latitude double,       -- широта
			longitude double,      -- долгота
			altitude double,       -- высота
			track double,          -- курс (в радианах?)
			speed double,	       -- швiдкость
			climb double,          -- скорость подъёма
			sent int               -- отправили ли инфу
);
create index if not exists record_time_idx on record (sent, record_time);
