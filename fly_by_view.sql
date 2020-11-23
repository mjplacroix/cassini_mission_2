drop table if exists import.inms cascade;
CREATE TABLE import.inms (
	sclk text,
	uttime text,
	target text,
	time_ca text,
	targ_pos_x text,
	targ_pos_y text,
	targ_pos_z text,
	source text,
	data_reliability text,
	table_set_id text,
	coadd_cnt text,
	osp_fil_1_status text,
	oss_fil_2_status text,
	csp_fil_3_status text,
	css_fil_4_status text,
	seq_table text,
	cyc_num text,
	cyc_table text,
	scan_num text,
	trap_table text,
	sw_table text,
	mass_table text,
	focus_table text,
	da_table text,
	velocity_comp text,
	ipnum text,
	mass_per_charge text,
	os_lens2 text,
	os_lens1 text,
	os_lens4 text,
	os_lens3 text,
	qp_lens2 text,
	qp_lens1 text,
	qp_lens4 text,
	qp_lens3 text,
	qp_bias text,
	ion_defl2 text,
	ion_defl1 text,
	ion_defl4 text,
	ion_defl3 text,
	top_plate text,
	p_energy text,
	alt_t text,
	view_dir_t_x text,
	view_dir_t_y text,
	view_dir_t_z text,
	sc_pos_t_x text,
	sc_pos_t_y text,
	sc_pos_t_z text,
	sc_vel_t_x text,
	sc_vel_t_y text,
	sc_vel_t_z text,
	sc_vel_t_scx text,
	sc_vel_t_scy text,
	sc_vel_t_scz text,
	lst_t text,
	sza_t text,
	ss_long_t text,
	distance_s text,
	view_dir_s_x text,
	view_dir_s_y text,
	view_dir_s_z text,
	sc_pos_s_x text,
	sc_pos_s_y text,
	sc_pos_s_z text,
	sc_vel_s_x text,
	sc_vel_s_y text,
	sc_vel_s_z text,
	lst_s text,
	sza_s text,
	ss_long_s text,
	sc_att_angle_ra text,
	sc_att_angle_dec text,
	sc_att_angle_tw text,
	c1counts text,
	c2counts text
);

COPY import.inms 
FROM '[ABS PATH TO]/inms.csv'
DELIMITER ',' HEADER CSV;


delete from import.inms
where sclk IS NULL or sclk = 'sclk';



select 
  (sclk::timestamp) as time_stamp,
  alt_t::numeric(10,3) as altitude
from import.inms
where target='ENCELADUS'
and alt_t IS NOT NULL;

-- now create a view for flybys
drop materialized view if exists flyby_altitudes;
create materialized view flyby_altitudes as
select 
  (sclk::timestamp) as time_stamp,
  alt_t::numeric(10,3) as altitude
from import.inms
where target='ENCELADUS'
and alt_t IS NOT NULL;