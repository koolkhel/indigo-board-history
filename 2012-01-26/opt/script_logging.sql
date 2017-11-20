--drop table if exists log;

create table if not exists log (id integer primary key, -- id
		loglevel integer,         -- 0, 1, 2, 3, 4
		event_time timestamp,     -- когда случилось
		source text,              -- где случилось
		message text,             -- что сказали врачи
		line integer,             -- из какой строчки в файле пришло
		function_name text,       -- из какой функции пришло
		source_file text          -- из какого файла пришло
);
create index if not exists log_time_reverse_idx on log (event_time desc);
