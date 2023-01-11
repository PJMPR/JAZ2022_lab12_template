create table actor (id bigint not null auto_increment, also_known_as varchar(255), biography text, birthday date, deathday date, name varchar(255), popularity float(53) not null, profile_path varchar(255), source_id integer not null, primary key (id)) engine=InnoDB;
create table character_role (id bigint not null auto_increment, name varchar(255), actor_id bigint, movie_id bigint, primary key (id)) engine=InnoDB;
create table company (id integer not null auto_increment, logo_path varchar(255), name varchar(255), origin_country varchar(255), source_id integer not null, primary key (id)) engine=InnoDB;
create table company_movies (movies_id integer not null, production_companies_id bigint not null) engine=InnoDB;
create table country (id integer not null auto_increment, name varchar(255), primary key (id)) engine=InnoDB;
create table country_movies (production_countries_id integer not null, movies_id bigint not null) engine=InnoDB;
create table genre (id integer not null auto_increment, name varchar(255), source_id integer not null, primary key (id)) engine=InnoDB;
create table genre_movies (genres_id integer not null, movies_id bigint not null) engine=InnoDB;
create table movie (id bigint not null auto_increment, adult bit not null, backdrop_path varchar(255), budget integer not null, homepage varchar(255), original_language varchar(255), original_title varchar(255), overview text, popularity float(53) not null, poster_path varchar(255), release_date date, runtime integer not null, source_id bigint not null, vote_average float(53) not null, vote_count integer not null, primary key (id)) engine=InnoDB;
create table spoken_language (id integer not null auto_increment, name varchar(255), primary key (id)) engine=InnoDB;
create table spoken_language_movies (spoken_spoken_languages_id integer not null, movies_id bigint not null) engine=InnoDB;
alter table character_role add constraint FK12jxlphendn29pudohnio8ymm foreign key (actor_id) references actor (id);
alter table character_role add constraint FKdn791samgdthk1gqaasgepvxk foreign key (movie_id) references movie (id);
alter table company_movies add constraint FKmmc8rt6ss635b1nrybown4va2 foreign key (production_companies_id) references movie (id);
alter table company_movies add constraint FKknnnj0j6wcph9jgfn2bcd4ky6 foreign key (movies_id) references company (id);
alter table country_movies add constraint FKpygrtf1pvsg7g61jprlk308m8 foreign key (movies_id) references movie (id);
alter table country_movies add constraint FKpxkrflndnuuvgs4n7pj2sqlpx foreign key (production_countries_id) references country (id);
alter table genre_movies add constraint FKtgatsvi7lb98phh9ft1gogkep foreign key (movies_id) references movie (id);
alter table genre_movies add constraint FKe8j9am8l355522fj88clwhbt8 foreign key (genres_id) references genre (id);
alter table spoken_language_movies add constraint FK8hthayk0ncohnquu6m4awhjby foreign key (movies_id) references movie (id);
alter table spoken_language_movies add constraint FK89oep3w39yoikhvgykrq16mb1 foreign key (spoken_spoken_languages_id) references spoken_language (id);
