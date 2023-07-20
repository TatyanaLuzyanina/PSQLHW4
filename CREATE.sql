create table if not exists collection(
	id serial primary key,
	year_collection integer not null,
	name_collection varchar(40) not null
);

create table if not exists musicalbum(
	id serial primary key,
	name_album varchar(40) not null,
	year_album integer not null
);

create table if not exists singer(
	id serial primary key,
	name_singer varchar(40) unique not null
);

create table if not exists style_singer(
	id serial primary key,
	name_style varchar(40) unique not null
);

create table if not exists musicalbum_singer(
	musicalbum_id integer REFERENCES musicalbum(id),
	singer_id integer REFERENCES singer(id),
	constraint pk primary key (musicalbum_id, singer_id)
);

create table if not exists singer_style(
	style_singer_id integer REFERENCES style_singer(id),
	singer_id integer REFERENCES singer(id),
	constraint lk primary key (style_singer_id, singer_id)
);

create table if not exists musictrack(
	id serial primary key,
	name_track varchar(40) not null,
	duration integer not null,
	musicalbum_id integer REFERENCES musicalbum(id)
);

create table if not exists collection_musictrack(
	collection_id integer REFERENCES collection(id),
	musictrack_id integer REFERENCES musictrack(id),
	constraint mk primary key (musictrack_id, collection_id)
);