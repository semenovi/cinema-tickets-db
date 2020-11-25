-- abbreviation used:
-- r - Request
-- s - Show (cinema session)
-- p - Place (seat)
-- f - Film
-- c - ticket Cost
-- h - cinema Hall

CREATE TABLE requests
(
    r_id VARCHAR(8) NOT NULL,
    r_name VARCHAR(32),
    r_surname VARCHAR(32),
    r_middlename VARCHAR(32),
    rs_id VARCHAR(8) NOT NULL,
    rp_id VARCHAR(8),
    PRIMARY KEY(r_id)
);
CREATE TABLE shows
(
    s_id VARCHAR(8) NOT NULL,
    f_name VARCHAR(32) NOT NULL,
    time_start TIMESTAMP NOT NULL,
    time_end TIMESTAMP NOT NULL,
    c_elite DECIMAL(12, 2) NOT NULL,
    c_comfort DECIMAL(12, 2) NOT NULL,
    c_normal DECIMAL(12, 2) NOT NULL,
    sh_id VARCHAR(8) NOT NULL,
    PRIMARY KEY(s_id)
);
CREATE TABLE halls
(
    h_id VARCHAR(8) NOT NULL,
    p_range_start VARCHAR(8) NOT NULL,
    p_range_end VARCHAR(8) NOT NULL,
    PRIMARY KEY(h_id)
);
CREATE TABLE places
(
    p_id VARCHAR(8) NOT NULL,
    p_type VARCHAR(1) NOT NULL,
    p_displayed VARCHAR(8) NOT NULL,
    PRIMARY KEY(p_id)
);
CREATE TABLE reserved
(
    p_id VARCHAR(8) NOT NULL,
    s_id VARCHAR(8) NOT NULL,
    is_reserved VARCHAR(1) NOT NULL
);
