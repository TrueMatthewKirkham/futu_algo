/*
 * Futu Algo: Algorithmic High-Frequency Trading Framework
 * Copyright (c)  billpwchan - All Rights Reserved
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Written by Bill Chan <billpwchan@hotmail.com>, 2021
 */

create table stock_data
(
    id               integer not null
        constraint stock_data_pk
            primary key autoincrement,
    code             text    not null,
    time_key         text    not null,
    open_price       real,
    close_price      real,
    high_price       real,
    low_price        real,
    pe_ratio         real,
    turnover_rate    real,
    volume           integer,
    turnover         integer,
    change_rate      real,
    last_close_price real,
    k_type           text
);

create index stock_code
    on stock_data (code);

create index stock_code_interval
    on stock_data (code, k_type);

create unique index stock_data_id_uindex
    on stock_data (id);

create unique index stock_time
    on stock_data (code, time_key, k_type);

create table stock_pool
(
    id     integer not null
        constraint stock_pool_pk
            primary key autoincrement,
    date   text    not null,
    filter text    not null,
    code   text    not null
);

create unique index stock_pool_id_uindex
    on stock_pool (id);

