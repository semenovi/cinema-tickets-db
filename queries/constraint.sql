ALTER TABLE requests
ADD CONSTRAINT requests_fk0
FOREIGN KEY(rs_id)
REFERENCES shows(s_id);

ALTER TABLE requests
ADD CONSTRAINT requests_fk1
FOREIGN KEY(rp_id)
REFERENCES places(p_id);

ALTER TABLE shows
ADD CONSTRAINT shows_fk0
FOREIGN KEY(sh_id)
REFERENCES halls(h_id);

ALTER TABLE halls
ADD CONSTRAINT halls_fk0
FOREIGN KEY(p_range_start)
REFERENCES places(p_id);

ALTER TABLE halls
ADD CONSTRAINT halls_fk1
FOREIGN KEY(p_range_end)
REFERENCES places(p_id);

ALTER TABLE reserved
ADD CONSTRAINT reserved_fk0
FOREIGN KEY(p_id)
REFERENCES places(p_id);

ALTER TABLE reserved
ADD CONSTRAINT reserved_fk1
FOREIGN KEY(s_id)
REFERENCES shows(s_id);