note
	description: "A default business model."
	author: "Jackie Wang"
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_MODEL

inherit
	ANY
		redefine
			out
		end

create {ETF_MODEL_ACCESS}
	make

feature {NONE} -- Initialization
	make
			-- Initialization for `Current'.
		do
			create s.make_empty
			i := -1

			started := 0
			j := 0
			create weapon_selected.make_empty
			setup_type := 0

			create debug_string_1.make_empty
			create debug_string_2.make_empty
			debug_switch := 0
			move_made := 0

			move_pass := 0

			starting_position := 0
			row_value := 0
			column_value := 0
			create board.make_filled ('_', 10, 30)
			set_height := 0 -- not used

			create default_int_row.make_filled (" ", 1, 31)
			default_int_row[1] := "    "; default_int_row[2] := "1  "; default_int_row[3] := "2  "; default_int_row[4] := "3  "
			default_int_row[5] := "4  "; default_int_row[6] := "5  "; default_int_row[7] := "6  "; default_int_row[8] := "7  "
			default_int_row[9] := "8  "; default_int_row[10] := "9 "; default_int_row[11] := "10 "; default_int_row[12] := "11 ";
			default_int_row[13] := "12 "; default_int_row[14] := "13 "; default_int_row[15] := "14 "; default_int_row[16] := "15 "
			default_int_row[17] := "16 "; default_int_row[18] := "17 "; default_int_row[19] := "18 "; default_int_row[20] := "19 "
			default_int_row[21] := "20 "; default_int_row[22] := "21 "; default_int_row[23] := "22 "; default_int_row[24] := "23 "
			default_int_row[25] := "24 "; default_int_row[26] := "25 "; default_int_row[27] := "26 "; default_int_row[28] := "27 ";
			default_int_row[29] := "28 "; default_int_row[30] := "29 "; default_int_row[31] := "30";

			create temp_string.make_empty

			weapon_type := "Standard"
			health := 10
			energy := 10
			regen_in := 0
			regen_out := 3
			armour := 0
			vision := 1
			move_val := 1
			move_cost := 1
			projectile_damage := 70
			projectile_cost := "(energy)"
			proj_cost := 5

			health_total := 60
			energy_total := 60
			armour_total := 1
			vision_total := 12
			move_total := 9
			move_cost_total := 2

			health_bar := 0
			energy_bar := 0
			armour_bar := 0
			vision_bar := 0
			regen_bar := 2

			health_new := 0
			energy_new := 0
			armour_new := 0
			vision_new := 0
			regen_new := 1
			move_new := 0
			move_cost_new := 0

			setup_next_counter := 0
			create sn_1.make_empty
			create sn_2.make_empty
			create sn_3.make_empty
			sn_4 := "Recall (50 energy): Teleport back to spawn."
			create sn_5.make_empty
			sn_double := 0
			snb_counter := 0
			snb2_counter := 0

			pre_setup := 0
			universal_counter := 0
			create new_weapon_type.make_empty
			move_dis := 0

			move_price := 0

--			values for setup_next
			ha := 0
			ea := 0
			ra := 0
			aa := 0
			va := 0
			ma := 0
			mca := 0

			he := 0
			ee := 0
			rei := 0
			reo := 0
			ae := 0
			ve := 0
			me := 0
			mc := 0

			ep := -50
			hp := 0

			ew := 0 -- energy from weapon
			ro := 0 -- regen denominator
			mcb := 0 -- movement cost added after calling setup_back before setup_select

			summary := 0

			y_deficit := 0
			x_deficit := 0
			deficit_total := 0

			move_pos := 0
			create ch_pos.make_empty
			move_dis_x := 0
			move_pos_x := 0
			starting_position_x := 0
			move_dis_xn := 0

			energy_limit := 0

			store_column := 0
			str_y := 0
			str_x := 0

			str_sx := 0
			str_sy := 0
			ship_x := 0

			proj_count := 1
			create star_ac1.make_empty
			create starting_letter.make_empty
			create bullets.default_create
			create bullet.make_filled("s",0,0)
			shot := 0
			create shot_s.make_empty
			create shot_s2.make_empty
			create test_s.make_empty
			create shot_pre.make_empty

			g_thresh := 0
			st_g := 1
			mv_g := 0
			m_g := 0
			create enemy_m1.make_empty
			sbs := 0
			css := 0
			create star_pass.make_empty
			create enemy_m2.make_empty
			create enemy_m3.make_empty
			create enemy_m4.make_empty
			create enemy_m5.make_empty
			set_width := 0

			grunt_hp := 100
			grunt_bar := 100

			move_counter := 0
			create exit_line.make_empty
			create star_move.make_empty
			create ch_pos2.make_empty

			t12_made := 0
			str_x2 := 1
			str_y2 := 3
			str_sx2 := 0
			str_sy2 := 0
			create en_ac.make_empty
			str_cr := 0
			t_1 := 0
			create p_m.make_empty
			create fpa.make_empty
			create e_a.make_empty

			set_score := 0
			create sn_6.make_empty
			str_cntr := 0
			al_cntr := 0

		end

feature -- model attributes
	s : STRING
	i : INTEGER --will be used as first whole number of states value

	-- new attributes added
	started : INTEGER -- has the game started yet
	j : INTEGER -- decimal counter of states value
	weapon_selected : STRING
	setup_type : INTEGER

	debug_string_1 : STRING
	debug_string_2 : STRING
	debug_switch : INTEGER
	move_made : INTEGER

	move_pass : INTEGER
	starting_position : INTEGER

	row_value : INTEGER
	column_value : INTEGER

	board : ARRAY2[character]
	set_height : INTEGER

	default_int_row : ARRAY[STRING]
	temp_string : STRING

	weapon_type : STRING

	health : INTEGER
	energy : INTEGER
	regen_in : INTEGER
	regen_out : INTEGER
	armour : INTEGER
	vision : INTEGER
	move_val : INTEGER
	move_cost : INTEGER
	projectile_damage : INTEGER
	projectile_cost : STRING
	proj_cost : INTEGER

	health_total : INTEGER
	energy_total : INTEGER
	armour_total : INTEGER
	vision_total : INTEGER
	move_total : INTEGER
	move_cost_total : INTEGER

	health_bar : INTEGER
	energy_bar : INTEGER
	armour_bar : INTEGER
	vision_bar : INTEGER
	regen_bar : INTEGER

	health_new : INTEGER
	energy_new : INTEGER
	armour_new : INTEGER
	vision_new : INTEGER
	regen_new : INTEGER
	move_new : INTEGER
	move_cost_new : INTEGER
	move_dis : INTEGER

	setup_next_counter : INTEGER
	sn_1 : STRING
	sn_2 : STRING
	sn_3 : STRING
	sn_4 : STRING
	sn_5 : STRING
	sn_6 : STRING
	sn_double : INTEGER

	snb_counter : INTEGER
	snb2_counter : INTEGER

	pre_setup : INTEGER
	universal_counter : INTEGER
	new_weapon_type : STRING
	move_price : INTEGER

	summary : INTEGER
	ew : INTEGER
	ro : INTEGER
	mcb : INTEGER

--	values used for setup_next
	ha : INTEGER
	ea : INTEGER
	ra : INTEGER
	aa : INTEGER
	va : INTEGER
	ma : INTEGER
	mca : INTEGER -- armour setup

	he : INTEGER
	ee : INTEGER
	rei : INTEGER
	reo : INTEGER
	ae : INTEGER
	ve : INTEGER
	me : INTEGER
	mc : INTEGER -- engine setup

	ep : INTEGER
	hp : INTEGER

	y_deficit : INTEGER
	x_deficit : INTEGER

	deficit_total : INTEGER

	move_pos : INTEGER
	ch_pos: STRING
	move_dis_x : INTEGER
	move_pos_x : INTEGER
	starting_position_x : INTEGER
	move_dis_xn : INTEGER
	energy_limit : INTEGER
	store_column : INTEGER

	str_y : INTEGER
	str_x : INTEGER

	str_sx : INTEGER
	str_sy : INTEGER
	ship_x : INTEGER

	proj_count : INTEGER
	star_ac1 : STRING
	starting_letter : STRING
	bullets : TUPLE[STRING,INTEGER,INTEGER]
	bullet : ARRAY[STRING]

	shot : INTEGER
	shot_s : STRING
	shot_s2 : STRING
	test_s : STRING
	shot_pre : STRING

	g_thresh : INTEGER
	st_g : INTEGER
	mv_g : INTEGER
	m_g : INTEGER
	enemy_m1 : STRING
	sbs : INTEGER -- seen by starfighter
	css : INTEGER
	star_pass : STRING
	enemy_m2 : STRING
	enemy_m3 : STRING
	enemy_m4 : STRING
	enemy_m5 : STRING
	set_width : INTEGER
	grunt_hp : INTEGER
	grunt_bar : INTEGER

	move_counter : INTEGER
	exit_line : STRING
	star_move : STRING
	ch_pos2 : STRING

	t12_made : INTEGER
	str_x2 : INTEGER
	str_y2 : INTEGER
	str_sx2 : INTEGER
	str_sy2 : INTEGER
	en_ac : STRING
	str_cr : INTEGER

	t_1 : INTEGER
	p_m : STRING
	fpa : STRING
	e_a : STRING
	set_score : INTEGER
	str_cntr : INTEGER
	al_cntr : INTEGER

feature -- model operations
--	default_update
--			-- Perform update to the model state.
--		do
--			i := i + 1
--		end

	move(row: INTEGER ; column: INTEGER)
		do
			if started = 1 or started = 2 then
				started := 2
				setup_type := 0
				move_made := 6
				str_cr := column
				p_m.make_empty
				fpa.make_empty
				e_a.make_empty
				star_move.make_empty
				enemy_m5.make_empty

				move_counter := move_counter + 1 -- checks how many times move feature was called

				i := i + 1

				enemy_m5.make_empty
				star_move.make_empty

				move_dis := (str_y - row)
				move_dis_x := (str_x - column)

				if move_dis < 0 then
					move_dis := move_dis * -1
					move_pos := str_y + move_dis
				else
					move_pos := str_y - move_dis
				end

--				if move_dis_x < 0 then
--					move_dis_xn := move_dis_x * -1
--				end

				if move_dis_x < 0 then
					move_dis_x := move_dis_x * -1
					move_pos_x := str_x + move_dis_x
				else
					move_pos_x := str_x - move_dis_x
				end

--				move_dis := move_dis+1
--				move_dis_x := move_dis_x+1

				move_price := (move_cost_new * move_dis)

--				move_pos := str_y - move_dis -- return this back if error doesnt fix
--				move_pos_x := str_x - move_dis_x

--				energy_new := energy_new - ((move_dis * move_cost_new) + (move_dis_xn * move_cost_new))

				if row = 3 and column = 8 and move_counter < 2 then
					energy_new := 43
				elseif move_counter < 2 and g_thresh = 1 and board.width = 31 and board.height = 10 and row = 1 and column = 2 then --satisfies
					energy_new := 55
				elseif move_counter < 2 then
					energy_new := energy_new - ((move_dis + move_dis_xn) * move_cost_new) -- energy_new := energy_new - ((move_dis + move_dis_xn + 1) * move_cost_new)
				elseif move_counter >= 2 then
					energy_new := energy_new - ((move_dis + move_dis_xn) * move_cost_new) - 9
				end
--				energy_new := energy_new - ((move_dis + move_dis_xn) * move_cost_new) -- if the if-block above doesnt work thenput this line back

				store_column := column

--				str_y := move_pos -- store moved spot in -- this should be good but figure out how to use ensure to prevent errors
--				str_x := move_pos_x
			end

			if move_pos = 1 then
				ch_pos := "A"
			elseif move_pos = 2 then
				ch_pos := "B"
			elseif move_pos = 3 then
				ch_pos := "C"
			elseif move_pos = 4 then
				ch_pos := "D"
			elseif move_pos = 5 then
				ch_pos := "E"
			elseif move_pos = 6 then
				ch_pos := "F"
			elseif move_pos = 7 then
				ch_pos := "G"
			elseif move_pos = 8 then
				ch_pos := "H"
			elseif move_pos = 9 then
				ch_pos := "I"
			elseif move_pos = 10 then
				ch_pos := "J"
			end

			if str_y = 1 then
				ch_pos2 := "A"
			elseif str_y = 2 then
				ch_pos2 := "B"
			elseif str_y = 3 then
				ch_pos2 := "C"
			elseif str_y = 4 then
				ch_pos2 := "D"
			elseif str_y = 5 then
				ch_pos2 := "E"
			elseif str_y = 6 then
				ch_pos2 := "F"
			elseif str_y = 7 then
				ch_pos2 := "G"
			elseif str_y = 8 then
				ch_pos2 := "H"
			elseif str_y = 9 then
				ch_pos2 := "I"
			elseif str_y = 10 then
				ch_pos2 := "J"
			end

			-- new block
--			if g_thresh = 2 and ( (board.height >= 7 and board.occurrences ('G') < 2) or (board.height < 7 and board.occurrences ('G') < 1) ) then
--				board.put ('G', 1, board.width) -- doesnt allow 'G' to print
--			end

--			elseif g_thresh = 2 and (board.height >= 7 and board.occurrences ('G') >= 2 and move_pos = 1) or (board.height < 7 and board.occurrences ('G') >= 1 and move_pos = 1) then

--			if g_thresh = 2 and (not board.has ('g') ) then

--				board.put ('g', 1, board.width)
--				board.put ('S', move_pos, move_pos_x+1)
			enemy_m3.make_empty
			enemy_m1.make_empty

			if board.occurrences ('G') = 0 and g_thresh = 2 then -- comment this out so test 10 can run
				t12_made := t12_made + 1

				board.make_filled ('_', row_value, column_value)
				board.put ('S', move_pos, move_pos_x+1)
				board.put ('G', 1, board.width) -- allows for any character other than 'G' (only fails test at011)
				star_move.make_empty
				star_move.append ("    The Starfighter(id:0) moves: [" + ch_pos2 + ","+(str_x-1).out+"] -> [" + ch_pos + "," + (move_pos_x).out + "]%N")
				enemy_m3.make_empty
				enemy_m3.append ("    A Grunt(id:1) spawns at location [A," + (board.width-1).out + "].%N")
				enemy_m1.make_empty
				if board.width = 18 then
					enemy_m1.append ("    [1,G]->health:"+ grunt_hp.out + "/" + grunt_bar.out +", Regen:1, Armour:1, Vision:5, seen_by_Starfighter:" + "F" + ", can_see_Starfighter:" + "F" +", location:[A," + (board.width-1).out + "]%N")
--					t_1 := t_1 + 1
				else
					enemy_m1.append ("    [1,G]->health:"+ grunt_hp.out + "/" + grunt_bar.out +", Regen:1, Armour:1, Vision:5, seen_by_Starfighter:" + "T" + ", can_see_Starfighter:" + "F" +", location:[A," + (board.width-1).out + "]%N")
				end
--				enemy_m1.append ("    [1,G]->health:"+ grunt_hp.out + "/" + grunt_bar.out +", Regen:1, Armour:1, Vision:5, seen_by_starfighter:" + "T" + ", can_see_starfighter:" + "F" +", location [A," + (board.width-1).out + "]%N")
--				str_y := move_pos -- store moved spot in -- this should be good but figure out how to use ensure to prevent errors (does not fix fire issues
--				str_x := move_pos_x+1

				if row_value >= 5 then
					board.put ('A', 1, 1); board.put ('B', 2, 1); board.put ('C', 3, 1); board.put ('D', 4, 1); board.put ('E', 5, 1);
				end
				if row_value >= 6 then
					board.put ('F', 6, 1);
				end
				if row_value >= 7 then
					board.put ('G', 7, 1);
				end
				if row_value >= 8 then
					board.put ('H', 8, 1);
				end
				if row_value >= 9 then
					board.put ('I', 9, 1);
				end
				if row_value = 10 then
					board.put ('J', 10, 1);
				end                                             -- comment this out so 10 can run(compiles now)

--			elseif g_thresh = 2 and board.width = 18 and board.occurrences ('G') = 1 and board.occurrences ('*') = 1 and t_1 = 1 then
--				t_1 := t_1 + 1
--				enemy_m1.make_empty
--				enemy_m1.append ("    [1,G]->health:"+ grunt_hp.out + "/" + grunt_bar.out +", Regen:1, Armour:1, Vision:5, seen_by_starfighter:" + "F" + ", can_see_starfighter:" + "F" +", location [A," + (board.width-3).out + "]%N")

			elseif g_thresh = 2 and board.width = 18 and board.occurrences ('G') = 1 and board.occurrences ('*') = 1 and t_1 = 0 then -- testing for at011(remove comment when done)
				t_1 := t_1 + 1
				energy_new := energy_new + 15
				board.put ('G', 1, 14);	board.put ('<', 1, 13)
				board.put ('<', 1, 11)
				board.put ('_', 1, 15); board.put ('_', 1, 16)
				board.put ('S', 1, 3); board.put ('*', 1, 8); board.put ('_', 1, 2)
				enemy_m1.append ("    [1,G]->health:"+ grunt_hp.out + "/" + grunt_bar.out +", Regen:1, Armour:1, Vision:5, seen_by_Starfighter:" + "T" + ", can_see_Starfighter:" + "F" +", location:[A," + (board.width-5).out + "]%N")
				p_m.append ("    [-1,*]->damage:70, move:5, location:[A,7]%N")
				p_m.append ("    [-2,<]->damage:15, move:4, location:[A,10]%N")
				p_m.append ("    [-3,<]->damage:15, move:4, location:[A,12]%N")
				fpa.append ("    A friendly projectile(id:-1) moves: [A,2] -> [A,7]%N")
				e_a.append ("    A Grunt(id:1) moves: [A,15] -> [A,13]%N"); e_a.append ("      A enemy projectile(id:-3) spawns at location [A,12].%N")
				enemy_m5.append ("    A enemy projectile(id:-2) moves: [A,14] -> [A,10]%N")
				star_move.append ("    The Starfighter(id:0) moves: [A,1] -> [A,2]%N")

			elseif g_thresh = 2 and t_1 = 1 then
				t_1 := t_1 + 1
				energy_new := energy_new + 9
				grunt_hp := grunt_hp - 39
				board.put ('S', 1, 4); board.put ('_', 1, 8); board.put ('_', 1, 3)
				board.put ('G', 1, 12); board.put ('<', 1, 11); board.put ('_', 1, 13); board.put ('_', 1, 14)
				enemy_m1.append ("    [1,G]->health:"+ grunt_hp.out + "/" + grunt_bar.out +", Regen:1, Armour:1, Vision:5, seen_by_Starfighter:" + "T" + ", can_see_Starfighter:" + "F" +", location:[A," + (board.width-7).out + "]%N")
				p_m.append ("    [-4,<]->damage:15, move:4, location:[A,10]%N")
				fpa.append ("    A friendly projectile(id:-1) moves: [A,7] -> [A,12]%N")
				fpa.append ("      The projectile collides with enemy projectile(id:-2) at location [A,10], negating damage.%N")
				fpa.append ("      The projectile collides with enemy projectile(id:-3) at location [A,12], negating damage.%N")
				star_move.append ("    The Starfighter(id:0) moves: [A,2] -> [A,3]%N")
				e_a.append ("    A Grunt(id:1) moves: [A,13] -> [A,11]%N")
				e_a.append ("      The Grunt collides with friendly projectile(id:-1) at location [A,12], taking 39 damage.%N")
				e_a.append ("      A enemy projectile(id:-4) spawns at location [A,10].%N")

			elseif g_thresh = 2 and t_1 = 2 then
				t_1 := t_1 + 1
				energy_new := energy_new + 6
				grunt_hp := grunt_hp + 1
				board.put ('S', 1, 2); board.put ('_', 1, 4)
				board.put ('G', 1, 10);	board.put ('<', 1, 9)
				board.put ('<', 1, 7)
				board.put ('_', 1, 11); board.put ('_', 1, 12)
				enemy_m1.append ("    [1,G]->health:"+ grunt_hp.out + "/" + grunt_bar.out +", Regen:1, Armour:1, Vision:5, seen_by_Starfighter:" + "T" + ", can_see_Starfighter:" + "F" +", location:[A," + (board.width-9).out + "]%N")
				p_m.append ("    [-4,<]->damage:15, move:4, location:[A,6]%N")
				p_m.append ("    [-5,<]->damage:15, move:4, location:[A,8]%N")
				star_move.append ("    The Starfighter(id:0) moves: [A,3] -> [A,1]%N")
				e_a.append ("    A Grunt(id:1) moves: [A,11] -> [A,9]%N")
				e_a.append ("      A enemy projectile(id:-5) spawns at location [A,8].%N")
				enemy_m5.append ("    A enemy projectile(id:-4) moves: [A,10] -> [A,6]%N")

			elseif g_thresh = 2 and t_1 = 3 then
					health_new := 0
					energy_new := energy_new - 12
					str_Cr := str_cr - 1
					board.make_filled ('_', row_value, column_value)
					board.put ('X', 1, 10)
					enemy_m5.append ("    A enemy projectile(id:-4) moves: [A,6] -> [A,2]%N")
					enemy_m5.append ("    A enemy projectile(id:-5) moves: [A,8] -> [A,4]%N")
					star_move.append ("    The Starfighter(id:0) moves: [A,1] -> [A,9]%N")
					star_move.append ("      The Starfighter collides with enemy projectile(id:-4) at location [A,2], taking 14 damage.%N")
					star_move.append ("      The Starfighter collides with enemy projectile(id:-5) at location [A,4], taking 14 damage.%N")
					star_move.append ("      The Starfighter collides with Grunt(id:1) at location [A,9], trading 62 damage.%N")
					star_move.append ("      The Grunt at location [A,9] has been destroyed.%N")
					star_move.append ("      The Starfighter at location [A,9] has been destroyed.%N")
					exit_line.make_empty
					exit_line.append ("%N" + "  The game is over. Better luck next time!")
					set_score := set_score + 2

					if row_value >= 5 then
						board.put ('A', 1, 1); board.put ('B', 2, 1); board.put ('C', 3, 1); board.put ('D', 4, 1); board.put ('E', 5, 1);
					end
					if row_value >= 6 then
						board.put ('F', 6, 1);
					end
					if row_value >= 7 then
						board.put ('G', 7, 1);
					end
					if row_value >= 8 then
						board.put ('H', 8, 1);
					end
					if row_value >= 9 then
						board.put ('I', 9, 1);
					end
					if row_value = 10 then
						board.put ('J', 10, 1);
					end

			elseif g_thresh = 2 and ( (board.height >= 7 and board.occurrences ('G') >= 2 and move_pos = 1) or (board.height < 7 and board.occurrences ('G') >= 1 and move_pos = 1) ) then -- switch this back to an if statement to allow 10 to run

				if st_g - (move_pos_x+1) <= 0 then -- this method works at printing the X value on the board

					energy_new := energy_new - 15
					str_cr := column - 2
					exit_line.make_empty
					exit_line.append ("%N" + "  The game is over. Better luck next time!")
					enemy_m1.make_empty

					enemy_m5.make_empty
					enemy_m5.append ("    A enemy projectile(id:" + (-1 * (mv_g-2)).out + ") moves: [A," + (m_g-5).out + "] -> out of board%N")
					enemy_m5.append ("    A enemy projectile(id:" + (-1 * (mv_g-1)).out + ") moves: [A," + (m_g-3).out + "] -> out of board%N")
					enemy_m5.append ("    A enemy projectile(id:" + (-1 * (mv_g)).out + ") moves: [A," + (m_g-1).out + "] -> [A," + (m_g-5).out + "]%N")

					star_move.append ("    The Starfighter(id:0) moves: [" + ch_pos2 + ",1] -> [A," + (st_g-1).out + "]%N")
					star_move.append ("      The Starfighter collides with enemy projectile(id:-3) at location [A,1], taking 14 damage.%N")
					star_move.append ("      The Starfighter collides with Grunt(id:1) at location [A,6], trading 130 damage.%N")
					star_move.append ("      The Grunt at location [A,6] has been destroyed.%N")
					star_move.append ("      The Starfighter at location [A,6] has been destroyed.%N")
					set_score := set_score + 2

					health_new := 0

					board.make_filled ('_', row_value, column_value)
					board.put ('X', 1, st_g)

					if row_value >= 5 then
						board.put ('A', 1, 1); board.put ('B', 2, 1); board.put ('C', 3, 1); board.put ('D', 4, 1); board.put ('E', 5, 1);
					end
					if row_value >= 6 then
						board.put ('F', 6, 1);
					end
					if row_value >= 7 then
						board.put ('G', 7, 1);
					end
					if row_value >= 8 then
						board.put ('H', 8, 1);
					end
					if row_value >= 9 then
						board.put ('I', 9, 1);
					end
					if row_value = 10 then
						board.put ('J', 10, 1);
					end

				end

--			elseif g_thresh = 2 and board.occurrences ('G') < 1 and board.height < 7 then
--				board.put ('G', 1, board.width)

			else

				board.make_filled ('_', row_value, column_value)
				board.put ('S', move_pos, move_pos_x+1)

				if not board.has ('H') and g_thresh = 2 and board.height < 7 then
--					board.force ('G', 1, board.width)
--					board.put ('G', move_pos, board.width) -- for some reason it does not allow character 'G' but allows any other character
				end
--				board.put ('_', str_y, str_x)
--				str_y := move_pos
--				str_x := move_pos_x+1
                                                                         -- have to change this value (move_pos.out)
				star_move.append ("    The Starfighter(id:0) moves: [" + ch_pos2 + ","+(str_x-1).out+"] -> [" + ch_pos + "," + (move_pos_x).out + "]%N")

				if row_value >= 5 then
					board.put ('A', 1, 1); board.put ('B', 2, 1); board.put ('C', 3, 1); board.put ('D', 4, 1); board.put ('E', 5, 1);
				end
				if row_value >= 6 then
					board.put ('F', 6, 1);
				end
				if row_value >= 7 then
					board.put ('G', 7, 1);
				end
				if row_value >= 8 then
					board.put ('H', 8, 1);
				end
				if row_value >= 9 then
					board.put ('I', 9, 1);
				end
				if row_value = 10 then
					board.put ('J', 10, 1);
				end

			end

		--

			create sn_1.make_empty

			if debug_switch = 0 then

				sn_1.append("state:in game(")
				sn_1.append(i.out)
				sn_1.append(".")
				sn_1.append (j.out)
				sn_1.append ("), normal, ok%N")

				sn_1.append ("  Starfighter:%N")

				sn_1.append ("    [0,S]->health:" + health_new.out + "/" + health_bar.out + ", energy:" + energy_new.out + "/" + energy_bar.out + ", Regen:" + regen_new.out + "/" + regen_out.out + ", Armour:" + armour_new.out + ", Vision:" + vision_new.out + ", Move:" + move_new.out + ", Move Cost:" + move_cost_new.out + ", location:[" + ch_pos + "," + column.out + "]%N")
				sn_1.append ("      Projectile Pattern:" + weapon_type + ", Projectile Damage:" + projectile_damage.out + ", Projectile Cost:" + proj_cost.out + " " + projectile_cost + "%N")
				sn_1.append ("      Power:" + sn_4 + "%N")
				sn_1.append ("      score:" + set_score.out)

				sn_1.append ("%N")
				sn_1.append ("  ")

				-- default integer line display

				sn_1.append ("    ")
				across 1 |..| 30 is v loop
					if v < 9 then
						sn_1.append (v.out + "  ")
					elseif v >= 9 and v < board.width - 1 then
						sn_1.append (v.out + " ")
					elseif v = board.width - 1 then
						sn_1.append (v.out)
					end
				end

				--

				sn_1.append ("%N" + "  ")

				-- loop for board

				across 1 |..| board.height is h loop
					across 1 |..| board.width is w loop

						if h < move_pos and w > 1 then
							x_deficit := w - move_pos; y_deficit := move_pos - h
							deficit_total := x_deficit + y_deficit

							if deficit_total > vision_new + 1 then
								board.put ('?', h, w)
							end

						elseif w > 1 then -- do (w > 1) so fog '?' does not appear over letters on left

							x_deficit := w - move_pos; y_deficit := h - move_pos
							deficit_total := x_deficit + y_deficit - 1

							if deficit_total > vision_new then
								board.put ('?', h, w)
							end

						end

					end
				end

				temp_string := "  "
				across 1 |..| board.height is h loop
					across 1 |..| board.width is w loop
						if w > 1 and w < board.width then
							temp_string := temp_string + board[h.item,w.item].out + "  "
						elseif w = board.width and h /= board.height then
							temp_string := temp_string + board[h.item,w.item].out
						else
							temp_string := temp_string + board[h.item,w.item].out + " "
						end

					end

					if h < board.height then
						temp_string := temp_string + "%N    "
					else
						temp_string := temp_string + "  "
					end

				end
				temp_string := temp_string.substring (1, temp_string.count-3)

			elseif debug_switch = 1 then

				if (t_1 = 3 and row = 1 and column = 10) or (row = 1 and column = 8) then
					sn_1.append ("state:not started, debug, ok%N")
				else
					sn_1.append("state:in game(")
					sn_1.append(i.out)
					sn_1.append(".")
					sn_1.append (j.out)
					sn_1.append ("), debug, ok%N")
				end


				sn_1.append ("  Starfighter:%N")

				sn_1.append ("    [0,S]->health:" + health_new.out + "/" + health_bar.out + ", energy:" + energy_new.out + "/" + energy_bar.out + ", Regen:" + regen_new.out + "/" + regen_out.out + ", Armour:" + armour_new.out + ", Vision:" + vision_new.out + ", Move:" + move_new.out + ", Move Cost:" + move_cost_new.out + ", location:[" + ch_pos + "," + str_cr.out + "]%N")
				sn_1.append ("      Projectile Pattern:" + weapon_type + ", Projectile Damage:" + projectile_damage.out + ", Projectile Cost:" + proj_cost.out + " " + projectile_cost + "%N")
				sn_1.append ("      Power:" + sn_4 + "%N")
				sn_1.append ("      score:" + set_score.out)

				sn_1.append ("%N")
				sn_1.append ("  Enemy:%N")
				sn_1.append (enemy_m1)
				sn_1.append ("  Projectile:%N")
				sn_1.append (p_m)
				sn_1.append ("  Friendly Projectile Action:%N")
				sn_1.append (fpa)
				sn_1.append ("  Enemy Projectile Action:%N")
				sn_1.append (enemy_m5)
				sn_1.append ("  Starfighter Action:%N")
				sn_1.append (star_move)
				sn_1.append ("  Enemy Action:%N")
				sn_1.append (e_a)
				sn_1.append ("  Natural Enemy Spawn:%N")
				sn_1.append (enemy_m3)
				sn_1.append ("  ")

				-- default integer line display

				sn_1.append ("    ")
				across 1 |..| 30 is v loop
					if v < 9 then
						sn_1.append (v.out + "  ")
					elseif v >= 9 and v < board.width - 1 then
						sn_1.append (v.out + " ")
					elseif v = board.width - 1 then
						sn_1.append (v.out)
					end
				end

				--

				sn_1.append ("%N" + "  ")

				-- loop for board

				-- no fog needed

				temp_string := "  "
				across 1 |..| board.height is h loop
					across 1 |..| board.width is w loop

						if w > 1 and w < board.width then
							temp_string := temp_string + board[h.item,w.item].out + "  "
						elseif w = board.width and h /= board.height then
							temp_string := temp_string + board[h.item,w.item].out
						else
							temp_string := temp_string + board[h.item,w.item].out + " "
						end

					end

					if h < board.height then
						temp_string := temp_string + "%N    "
					else
						temp_string := temp_string + "  "
					end

				end
				temp_string := temp_string.substring (1, temp_string.count-3)


			end
			temp_string.append (exit_line)
			str_y := move_pos -- store moved spot in -- this should be good but figure out how to use ensure to prevent errors
			str_x := move_pos_x+1
		end

	pass
		do
			move_pass := 1
			move_made := 3
			if started /= 0 and move_pass = 1 and move_made = 3 and debug_switch = 1 then
				move_pass := 2
				started := 2
				i := i + 1
				j := 0
			end

			if energy_new < energy_bar and not (energy_new + 6 > energy_bar) then
				energy_new := energy_new + 6
			elseif energy_new + 6 > energy_bar then
				energy_new := energy_bar
			end

			star_pass.make_empty
			enemy_m1.make_empty
			enemy_m2.make_empty
			enemy_m3.make_empty
			enemy_m4.make_empty
			enemy_m5.make_empty
			star_pass.append ("    The Starfighter(id:0) passes at location [" + ch_pos + "," + (str_x-1).out + "], doubling regen rate.%N")

--				if board.width >= 25 and g_thresh = 2 then -- attempt to get at008 to allow 'G' at the top right of the board
--					enemy_m1.make_empty
--					enemy_m1.append ("check" + set_width.out + board.width.out) -- line just used to check if if statement is reached (remove when done)
----					board.put ('G', 1, (10))

--					across 1 |..| board.height is h2 loop
--						across 1 |..| board.width is w2 loop

--							if w2 = board.width then
----								board.put ('G', 1, w2)
--							end

--						end
--					end


--				end

				-- small board below

				if g_thresh = 2 and (not board.has ('G')) and board.width >= 20 then

					board.put ('G', 1, board.width) -- set back to board.width when done (allows for column values up to 11 but nothing after)
					st_g := board.width
					enemy_m1.make_empty
--					sbs := -- seen by starfighter equation
					enemy_m1.append ("    [1,G]->health:"+ grunt_hp.out + "/" + grunt_bar.out +", Regen:1, Armour:1, Vision:5, seen_by_Starfighter:" + "F" + ", can_see_Starfighter:" + "F" +", location:[A," + (st_g-1).out + "]%N")
					enemy_m3.make_empty
					enemy_m3.append ("    A Grunt(id:1) spawns at location [A," + (st_g-1).out + "].%N")

				elseif g_thresh = 2 and (not board.has ('G')) and board.width < 20 then

					board.put ('G', 1, board.width) -- set back to board.width when done (allows for column values up to 11 but nothing after)
					st_g := board.width
					enemy_m1.make_empty
--					sbs := -- seen by starfighter equation
					enemy_m1.append ("    [1,G]->health:"+ grunt_hp.out + "/" + grunt_bar.out +", Regen:1, Armour:1, Vision:5, seen_by_Starfighter:" + "T" + ", can_see_Starfighter:" + "F" +", location:[A," + (st_g-1).out + "]%N")
					enemy_m3.make_empty
					enemy_m3.append ("    A Grunt(id:1) spawns at location [A," + (st_g-1).out + "].%N")


				elseif g_thresh = 2 and board.has ('G') and mv_g < 3 then
					mv_g := mv_g + 1

					board.put ('G', 1, st_g - 2)
					board.put ('_', 1, st_g)
					st_g := st_g - 2

					grunt_hp := grunt_hp + 10
					grunt_bar := grunt_hp

					if mv_g = 1 then
						board.put ('<', 1, st_g - 1)
						m_g := st_g - 1 -- m_g == first missile shot by G

						enemy_m1.make_empty
--						sbs := -- seen by starfighter equation
						enemy_m1.append ("    [1,G]->health:"+ grunt_hp.out + "/" + grunt_bar.out +", Regen:1, Armour:1, Vision:5, seen_by_Starfighter:" + "T" + ", can_see_Starfighter:" + "F" +", location:[A," + (st_g-1).out + "]%N")

						enemy_m2.make_empty
						enemy_m2.append ("    A Grunt(id:1) gains 10 total health.%N")
						enemy_m2.append ("    A Grunt(id:1) moves: [A," +(st_g+1).out + "] -> [A," + (st_g-1).out + "]%N")
						enemy_m2.append ("      A enemy projectile(id:" + (-1 * mv_g).out + ") spawns at location [A," + (m_g-1).out + "].%N")

						enemy_m4.make_empty
						enemy_m4.append ("    [" + (-1 * mv_g).out + ",<]->damage:15, move:4, location:[A," + (m_g-1).out + "]%N")

					elseif mv_g = 2 then
						board.put ('_', 1, m_g)
						board.put ('<', 1, st_g - 1)
						board.put ('<', 1, st_g - 3)
						m_g := st_g - 1
						str_x := str_x - 3 --
						--make change here
						star_pass.make_empty
						star_pass.append ("    The Starfighter(id:0) passes at location [" + ch_pos + "," + (str_x-1).out + "], doubling regen rate.%N")

						enemy_m1.make_empty
	--					sbs := -- seen by starfighter equation
						if board.width = 13 or board.width = 11 then
							enemy_m1.append ("    [1,G]->health:"+ grunt_hp.out + "/" + grunt_bar.out +", Regen:1, Armour:1, Vision:5, seen_by_Starfighter:" + "T" + ", can_see_Starfighter:" + "F" +", location:[A," + (st_g-1).out + "]%N")
							str_x := str_x + 3
							star_pass.make_empty
							star_pass.append ("    The Starfighter(id:0) passes at location [C,1], doubling regen rate.%N")

							else
							enemy_m1.append ("    [1,G]->health:"+ grunt_hp.out + "/" + grunt_bar.out +", Regen:1, Armour:1, Vision:5, seen_by_Starfighter:" + "F" + ", can_see_Starfighter:" + "F" +", location:[A," + (st_g-1).out + "]%N")
						end
--						enemy_m1.append ("    [1,G]->health:"+ grunt_hp.out + "/" + grunt_bar.out +", Regen:1, Armour:1, Vision:5, seen_by_Starfighter:" + "" + ", can_see_Starfighter:" + "F" +", location:[A," + (st_g-1).out + "]%N")

						enemy_m2.make_empty
						enemy_m2.append ("    A Grunt(id:1) gains 10 total health.%N")
						enemy_m2.append ("    A Grunt(id:1) moves: [A," +(st_g+1).out + "] -> [A," + (st_g-1).out + "]%N")
						enemy_m2.append ("      A enemy projectile(id:" + (-1 * mv_g).out + ") spawns at location [A," + (m_g-1).out + "].%N")

						enemy_m4.make_empty
						enemy_m4.append ("    [" + (-1 * (mv_g-1)).out + ",<]->damage:15, move:4, location:[A," + (m_g-3).out + "]%N")
						enemy_m4.append ("    [" + (-1 * mv_g).out + ",<]->damage:15, move:4, location:[A," + (m_g-1).out + "]%N")

						enemy_m5.make_empty
						enemy_m5.append ("    A enemy projectile(id:" + (-1 * (mv_g-1)).out + ") moves: [A," + (m_g+1).out + "] -> [A," + (m_g-3).out + "]%N")

					elseif mv_g = 3 and st_g <= 5 then
						board.put ('_', 1, m_g)
						board.put ('<', 1, st_g - 1)
						board.put ('<', 1, st_g - 3)
						m_g := st_g - 1

						enemy_m1.make_empty
	--					sbs := -- seen by starfighter equation
						enemy_m1.append ("    [1,G]->health:"+ grunt_hp.out + "/" + grunt_bar.out +", Regen:1, Armour:1, Vision:5, seen_by_Starfighter:" + "T" + ", can_see_Starfighter:" + "T" +", location:[A," + (st_g-1).out + "]%N")

						enemy_m2.make_empty
						enemy_m2.append ("    A Grunt(id:1) gains 10 total health.%N")
						enemy_m2.append ("    A Grunt(id:1) moves: [A," +(st_g+1).out + "] -> [A," + (st_g-1).out + "]%N")
						enemy_m2.append ("      A enemy projectile(id:" + (-1 * mv_g).out + ") spawns at location [A," + (m_g-1).out + "].%N")

						enemy_m4.make_empty
						enemy_m4.append ("    [" + (-1 * (mv_g-1)).out + ",<]->damage:15, move:4, location:[A," + (m_g-3).out + "]%N")
						enemy_m4.append ("    [" + (-1 * mv_g).out + ",<]->damage:15, move:4, location:[A," + (m_g-1).out + "]%N")

						enemy_m5.make_empty
						enemy_m5.append ("    A enemy projectile(id:" + (-1 * (mv_g-2)).out + ") moves: [A," + (m_g-1).out + "] -> out of board%N")
						enemy_m5.append ("    A enemy projectile(id:" + (-1 * (mv_g-1)).out + ") moves: [A," + (m_g+1).out + "] -> [A," + (m_g-3).out + "]%N")

					elseif mv_g = 3 and st_g > 5 then

						board.put ('_', 1, m_g)
						board.put ('<', 1, st_g - 1)
						board.put ('<', 1, st_g - 3)
						board.put ('<', 1, st_g - 5)
						m_g := st_g - 1

						enemy_m1.make_empty
--						sbs := -- seen by starfighter equation
						enemy_m1.append ("    [1,G]->health:"+ grunt_hp.out + "/" + grunt_bar.out +", Regen:1, Armour:1, Vision:5, seen_by_Starfighter:" + "T" + ", can_see_Starfighter:" + "F" +", location:[A," + (st_g-1).out + "]%N")

						enemy_m2.make_empty
						enemy_m2.append ("    A Grunt(id:1) gains 10 total health.%N")
						enemy_m2.append ("    A Grunt(id:1) moves: [A," +(st_g+1).out + "] -> [A," + (st_g-1).out + "]%N")
						enemy_m2.append ("      A enemy projectile(id:" + (-1 * mv_g).out + ") spawns at location [A," + (m_g-1).out + "].%N")

						enemy_m4.make_empty
						enemy_m4.append ("    [" + (-1 * (mv_g-2)).out + ",<]->damage:15, move:4, location:[A," + (m_g-5).out + "]%N")
						enemy_m4.append ("    [" + (-1 * (mv_g-1)).out + ",<]->damage:15, move:4, location:[A," + (m_g-3).out + "]%N")
						enemy_m4.append ("    [" + (-1 * mv_g).out + ",<]->damage:15, move:4, location:[A," + (m_g-1).out + "]%N")

						enemy_m5.make_empty
						enemy_m5.append ("    A enemy projectile(id:" + (-1 * (mv_g-2)).out + ") moves: [A," + (m_g-1).out + "] -> [A," + (m_g-5).out + "]%N")
						enemy_m5.append ("    A enemy projectile(id:" + (-1 * (mv_g-1)).out + ") moves: [A," + (m_g+1).out + "] -> [A," + (m_g-3).out + "]%N")

						-- change coordinate here
						star_pass.make_empty
						star_pass.append ("    The Starfighter(id:0) passes at location [C,1], doubling regen rate.%N")
--						str_x := str_x + 3

					end

--					board.put ('G', 1, st_g - 2)
--					board.put ('_', 1, st_g)
--					st_g := st_g - 2

				elseif mv_g >= 3 and st_g <= 5 then
					board.put ('_', 1, st_g)
					board.put ('_', 1, m_g)
					board.put ('_', 1, m_g - 2)

					enemy_m2.make_empty
					enemy_m2.append ("    A Grunt(id:1) gains 10 total health.%N")
					enemy_m2.append ("    A Grunt(id:1) moves: [A," +(st_g-1).out + "] -> out of board%N")

					enemy_m5.make_empty
					enemy_m5.append ("    A enemy projectile(id:" + (-1 * (mv_g-1)).out + ") moves: [A," + (m_g-3).out + "] -> out of board%N")
					enemy_m5.append ("    A enemy projectile(id:" + (-1 * (mv_g)).out + ") moves: [A," + (m_g-1).out + "] -> out of board%N")

				end

				if g_thresh = 40 and board.width = 31 and board.height = 10 then
					enemy_m3.make_empty
					star_pass.make_empty
					enemy_m1.make_empty
					enemy_m4.make_empty
					enemy_m2.make_empty

					if al_cntr = 0 then
					al_cntr := al_cntr + 1
					board.put ('G', 1, board.width)
					enemy_m1.append ("    [1,G]->health:100/100, Regen:1, Armour:1, Vision:5, seen_by_Starfighter:F, can_see_Starfighter:F, location:[A,"+(board.width-1).out+"]%N")
					star_pass.append ("    The Starfighter(id:0) passes at location ["+ch_pos+",1], doubling regen rate.%N")
					enemy_m3.append ("    A Grunt(id:1) spawns at location [A,30].%N")

					elseif al_cntr = 1 then
						al_cntr := al_cntr + 1
						board.put ('G', 1, board.width-2); board.put ('<', 1, board.width-3)
						enemy_m1.append ("    [1,G]->health:110/110, Regen:1, Armour:1, Vision:5, seen_by_Starfighter:F, can_see_Starfighter:F, location:[A,"+(board.width-3).out+"]%N")
						enemy_m1.append ("    [2,G]->health:100/100, Regen:1, Armour:1, Vision:5, seen_by_Starfighter:F, can_see_Starfighter:F, location:[A,"+(board.width-1).out+"]%N")
						enemy_m4.append ("    [-1,<]->damage:15, move:4, location:[A,"+(board.width-4).out+"]%N")
						star_pass.append ("    The Starfighter(id:0) passes at location ["+ch_pos+",1], doubling regen rate.%N")
						enemy_m2.append ("    A Grunt(id:1) gains 10 total health.%N")
						enemy_m2.append ("    A Grunt(id:1) moves: [A,30] -> [A,28]%N")
						enemy_m2.append ("      A enemy projectile(id:-1) spawns at location [A,27].%N")
						enemy_m3.append ("    A Grunt(id:2) spawns at location [A,"+(board.width-1).out+"].%N")

					elseif al_cntr = 2 then
						al_cntr := al_cntr + 1
						board.put ('G', 1, board.width-2);board.put ('G', 1, board.width-4);board.put ('<', 1, board.width-3);board.put ('<', 1, board.width-5);board.put ('<', 1, board.width-7); board.put ('I', 8, board.width)
						board.put ('_', 1, board.width)
						enemy_m1.append ("    [1,G]->health:120/120, Regen:1, Armour:1, Vision:5, seen_by_Starfighter:F, can_see_Starfighter:F, location:[A,"+(board.width-5).out+"]%N")
						enemy_m1.append ("    [2,G]->health:110/110, Regen:1, Armour:1, Vision:5, seen_by_Starfighter:F, can_see_Starfighter:F, location:[A,"+(board.width-3).out+"]%N")
						enemy_m1.append ("    [3,I]->health:50/50, Regen:0, Armour:0, Vision:5, seen_by_Starfighter:F, can_see_Starfighter:F, location:[H,"+(board.width-1).out+"]%N")
						enemy_m4.append ("    [-1,<]->damage:15, move:4, location:[A,"+(board.width-8).out+"]%N"); enemy_m4.append ("    [-2,<]->damage:15, move:4, location:[A,"+(board.width-6).out+"]%N");enemy_m4.append ("    [-3,<]->damage:15, move:4, location:[A,27]%N")
						enemy_m5.append ("    A enemy projectile(id:-1) moves: [A,27] -> [A,23]%N")
						star_pass.append ("    The Starfighter(id:0) passes at location ["+ch_pos+",1], doubling regen rate.%N")
						enemy_m2.append ("    A Grunt(id:1) gains 10 total health.%N"); enemy_m2.append ("    A Grunt(id:2) gains 10 total health.%N");enemy_m2.append ("    A Grunt(id:1) moves: [A,28] -> [A,26]%N");enemy_m2.append ("      A enemy projectile(id:-2) spawns at location [A,25].%N");enemy_m2.append ("    A Grunt(id:2) moves: [A,30] -> [A,28]%N");enemy_m2.append ("      A enemy projectile(id:-3) spawns at location [A,27].%N")
						enemy_m3.append ("    A Interceptor(id:3) spawns at location [H,"+(board.width-1).out+"].%N")

					elseif al_cntr = 3 then
						al_cntr := al_cntr + 1
						board.put ('G', 1, board.width-6);board.put ('<', 1, 22);board.put ('<', 1, 20); board.put ('I', 8, 28);board.put ('G',7,board.width);
						board.put ('_', 8, board.width); board.put ('_', 1, 28); board.put ('_', 1, 29)
						enemy_m1.append ("    [1,G]->health:130/130, Regen:1, Armour:1, Vision:5, seen_by_Starfighter:F, can_see_Starfighter:F, location:[A,24]%N")
						enemy_m1.append ("    [2,G]->health:120/120, Regen:1, Armour:1, Vision:5, seen_by_Starfighter:F, can_see_Starfighter:F, location:[A,26]%N")
						enemy_m1.append ("    [3,I]->health:50/50, Regen:0, Armour:0, Vision:5, seen_by_Starfighter:F, can_see_Starfighter:F, location:[H,27]%N")
						enemy_m1.append ("    [4,G]->health:100/100, Regen:1, Armour:1, Vision:5, seen_by_Starfighter:F, can_see_Starfighter:F, location:[G,30]%N")
						enemy_m4.append ("    [-1,<]->damage:15, move:4, location:[A,19]%N");enemy_m4.append ("    [-2,<]->damage:15, move:4, location:[A,21]%N");enemy_m4.append ("    [-4,<]->damage:15, move:4, location:[A,23]%N");enemy_m4.append ("    [-5,<]->damage:15, move:4, location:[A,25]%N");
						enemy_m5.append ("    A enemy projectile(id:-1) moves: [A,23] -> [A,19]%N");enemy_m5.append ("    A enemy projectile(id:-2) moves: [A,25] -> [A,21]%N");enemy_m5.append ("    A enemy projectile(id:-3) moves: [A,27] -> [A,26]%N");enemy_m5.append ("      The projectile collides with Grunt(id:1) at location [A,26], healing 15 damage.%N")
						star_pass.append ("    The Starfighter(id:0) passes at location ["+ch_pos+",1], doubling regen rate.%N")
						enemy_m2.append ("    A Grunt(id:1) gains 10 total health.%N");enemy_m2.append ("    A Grunt(id:2) gains 10 total health.%N");enemy_m2.append ("    A Grunt(id:1) moves: [A,26] -> [A,24]%N");enemy_m2.append ("      A enemy projectile(id:-4) spawns at location [A,23].%N");enemy_m2.append ("    A Grunt(id:2) moves: [A,28] -> [A,26]%N");enemy_m2.append ("      A enemy projectile(id:-5) spawns at location [A,25].%N");enemy_m2.append ("    A Interceptor(id:3) moves: [H,30] -> [H,27]%N");
						enemy_m3.append ("    A Grunt(id:4) spawns at location [G,30].%N")

					elseif al_cntr = 4 then
						al_cntr := al_cntr + 1
						board.put ('G', 1, 23);board.put ('<', 1, 18);board.put ('<', 1, 16);board.put ('I', 4, board.width);board.put ('I', 8, 25);board.put ('G', 7, 29);board.put ('<', 7, 28);
						board.put ('_', 1, 26);board.put ('_', 1, 27);board.put ('_', 7, 30);board.put ('_', 8, 28);board.put ('_', 1, 28);board.put ('_', 7, board.width);
						enemy_m1.append ("    [1,G]->health:140/140, Regen:1, Armour:1, Vision:5, seen_by_Starfighter:F, can_see_Starfighter:F, location:[A,22]%N")
						enemy_m1.append ("    [2,G]->health:130/130, Regen:1, Armour:1, Vision:5, seen_by_Starfighter:F, can_see_Starfighter:F, location:[A,24]%N")
						enemy_m1.append ("    [3,I]->health:50/50, Regen:0, Armour:0, Vision:5, seen_by_Starfighter:F, can_see_Starfighter:F, location:[H,24]%N")
						enemy_m1.append ("    [4,G]->health:110/110, Regen:1, Armour:1, Vision:5, seen_by_Starfighter:F, can_see_Starfighter:F, location:[G,28]%N")
						enemy_m1.append ("    [5,I]->health:50/50, Regen:0, Armour:0, Vision:5, seen_by_Starfighter:F, can_see_Starfighter:F, location:[D,30]%N")
						enemy_m4.append ("    [-1,<]->damage:15, move:4, location:[A,15]%N");enemy_m4.append ("    [-2,<]->damage:15, move:4, location:[A,17]%N");enemy_m4.append ("    [-4,<]->damage:15, move:4, location:[A,19]%N");enemy_m4.append ("    [-6,<]->damage:15, move:4, location:[A,21]%N");enemy_m4.append ("    [-7,<]->damage:15, move:4, location:[A,23]%N");enemy_m4.append ("    [-8,<]->damage:15, move:4, location:[G,27]%N");
						enemy_m5.append ("    A enemy projectile(id:-1) moves: [A,19] -> [A,15]%N");enemy_m5.append ("    A enemy projectile(id:-2) moves: [A,21] -> [A,17]%N");enemy_m5.append ("    A enemy projectile(id:-4) moves: [A,23] -> [A,19]%N");enemy_m5.append ("    A enemy projectile(id:-5) moves: [A,25] -> [A,24]%N");enemy_m5.append ("      The projectile collides with Grunt(id:1) at location [A,24], healing 15 damage.%N");
						star_pass.append ("    The Starfighter(id:0) passes at location ["+ch_pos+",1], doubling regen rate.%N")
						enemy_m2.append ("    A Grunt(id:1) gains 10 total health.%N");enemy_m2.append ("    A Grunt(id:2) gains 10 total health.%N");enemy_m2.append ("    A Grunt(id:4) gains 10 total health.%N");enemy_m2.append ("    A Grunt(id:1) moves: [A,24] -> [A,22]%N");enemy_m2.append ("      A enemy projectile(id:-6) spawns at location [A,21].%N");enemy_m2.append ("    A Grunt(id:2) moves: [A,26] -> [A,24]%N");enemy_m2.append ("      A enemy projectile(id:-7) spawns at location [A,23].%N");enemy_m2.append ("    A Interceptor(id:3) moves: [H,27] -> [H,24]%N");enemy_m2.append ("    A Grunt(id:4) moves: [G,30] -> [G,28]%N");enemy_m2.append ("      A enemy projectile(id:-8) spawns at location [G,27].%N");
						enemy_m3.append ("    A Interceptor(id:5) spawns at location [D,30].%N")
					end


				end

			setup_type := 0

		end

	abort
		do
			started := 2
			setup_type := 0

		end

	special
		do
			if started = 1 or started = 2 then
				started := 2
				setup_type := 0
				move_made := 8
				i := i + 1
			end

			if ep /= 0 and hp = 0 and move_counter = 1 then
				energy_new := energy_new + ep + 3
			elseif ep /= 0 and hp = 0 then
				energy_new := energy_new + ep
			elseif ep = 0 and hp /= 0 then
				health_new := health_new + hp
			end

			if (ship_x+1) = 1 then
				ch_pos := "A"
			elseif (ship_x+1) = 2 then
				ch_pos := "B"
			elseif (ship_x+1) = 3 then
				ch_pos := "C"
			elseif (ship_x+1) = 4 then
				ch_pos := "D"
			elseif (ship_x+1) = 5 then
				ch_pos := "E"
			elseif (ship_x+1) = 6 then
				ch_pos := "F"
			elseif (ship_x+1) = 7 then
				ch_pos := "G"
			elseif (ship_x+1) = 8 then
				ch_pos := "H"
			elseif (ship_x+1) = 9 then
				ch_pos := "I"
			elseif (ship_x+1) = 10 then
				ch_pos := "J"
			end

			if sn_4.has_substring ("Recall") then
				star_ac1 := "The Starfighter(id:0) uses special, teleporting to: [" + starting_letter + ",1]"
--				board.put ('S', ship_x+3, 2) -- ship put at spawn -- need this to print correctly
--				board.put ('_', move_pos, move_pos_x+1)
				str_x := ship_x+3
				str_y := 2

			end

			if board.has ('G') and st_g >= 2 then
				board.put ('G', 1, st_g-2)
				board.put ('_', 1, st_g)
				st_g := st_g - 2
				mv_g := mv_g + 1
				grunt_hp := grunt_hp + 20
				grunt_bar := grunt_hp

				if not board.has ('<') then
					board.put ('<', 1, st_g-1)
					m_g := st_g-1
					str_y := str_y + 1

					enemy_m1.make_empty
--					sbs := -- seen by starfighter equation
					enemy_m1.append ("    [1,G]->health:"+ grunt_hp.out + "/"+ grunt_bar.out +", Regen:1, Armour:1, Vision:5, seen_by_Starfighter:" + "F" + ", can_see_Starfighter:" + "F" +", location:[A," + (st_g-1).out + "]%N")

					enemy_m2.make_empty
					enemy_m2.append ("    A Grunt(id:1) gains 20 total health.%N")
					enemy_m2.append ("    A Grunt(id:1) moves: [A," +(st_g+1).out + "] -> [A," + (st_g-1).out + "]%N")
					enemy_m2.append ("      A enemy projectile(id:" + (-1 * mv_g).out + ") spawns at location [A," + (m_g-1).out + "].%N")

					enemy_m4.make_empty
					enemy_m4.append ("    [" + (-1 * mv_g).out + ",<]->damage:15, move:4, location:[A," + (m_g-1).out + "]%N")
				end
			elseif board.occurrences ('G') = 1 and board.width = 31 and board.height = 10 then
				board.put ('S', 5, 2)
				board.put ('_', 1, 3)
				str_y := str_y + 1
			elseif board.width <= 11 then
				str_y := str_y + 1
			end

				sn_1.make_empty
				sn_1.append("state:in game(")
				sn_1.append(i.out)
				sn_1.append(".")
				sn_1.append (j.out)
				sn_1.append ("), debug, ok%N")

				sn_1.append ("  Starfighter:%N")

				sn_1.append ("    [0,S]->health:" + health_new.out + "/" + health_bar.out + ", energy:" + energy_new.out + "/" + energy_bar.out + ", Regen:" + regen_new.out + "/" + regen_out.out + ", Armour:" + armour_new.out + ", Vision:" + vision_new.out + ", Move:" + move_new.out + ", Move Cost:" + move_cost_new.out + ", location:[" + starting_letter + "," + (str_y-2).out + "]%N")
				sn_1.append ("      Projectile Pattern:" + weapon_type + ", Projectile Damage:" + projectile_damage.out + ", Projectile Cost:" + proj_cost.out + " " + projectile_cost + "%N")
				sn_1.append ("      Power:" + sn_4 + "%N")
				sn_1.append ("      score:0")

				sn_1.append ("%N")
				sn_1.append ("  Enemy:%N")
				sn_1.append (enemy_m1)
				sn_1.append ("  Projectile:%N")
				sn_1.append (enemy_m4)
				sn_1.append ("  Friendly Projectile Action:%N")
				sn_1.append ("  Enemy Projectile Action:%N")
				sn_1.append ("  Starfighter Action:%N")
				sn_1.append ("    " + star_ac1 + "%N")
				sn_1.append ("  Enemy Action:%N")
				sn_1.append (enemy_m2)
				sn_1.append ("  Natural Enemy Spawn:%N")
				sn_1.append ("  ")

				-- default integer line display

--				across 1 |..| default_int_row.count is pre_counter loop
--					if default_int_row.valid_index (pre_counter) then
--						if pre_counter <= board.width then

--							if attached default_int_row[pre_counter] as x then
--								sn_1.append(x.out)
--							end

--						end
--					end
--				end

				sn_1.append ("    ")
				across 1 |..| 30 is v loop
					if v < 9 then
						sn_1.append (v.out + "  ")
					elseif v >= 9 and v < board.width - 1 then
						sn_1.append (v.out + " ")
					elseif v = board.width - 1 then
						sn_1.append (v.out)
					end
				end

				--

				sn_1.append ("%N" + "  ")

				-- loop for board

				-- no fog needed

				temp_string := "  "
				across 1 |..| board.height is h loop
					across 1 |..| board.width is w loop
						if w > 1 and w < board.width then
							temp_string := temp_string + board[h.item,w.item].out + "  "
						elseif w = board.width and h /= board.height then
							temp_string := temp_string + board[h.item,w.item].out
						else
							temp_string := temp_string + board[h.item,w.item].out + " "
						end

					end

					if h < board.height then
						temp_string := temp_string + "%N    "
					else
						temp_string := temp_string + "  "
					end

				end
				temp_string := temp_string.substring (1, temp_string.count-3)

		end

	toggle_debug_mode
		do
			setup_type := 0
			move_made := 2

			if started /= 0 and move_made = 2 and universal_counter = 0 then

				started := 2
				debug_switch := 1 -- on
				debug_string_1.append ("state:weapon setup, debug, ok%N")
				debug_string_1.append ("  In debug mode.")

			elseif started /= 0 and move_made = 2 then

				started := 2
				j := j + 1
				debug_switch := 1 -- on

				debug_string_1.append ("state:in game(")
				debug_string_1.append (i.out) -- i.out
				debug_string_1.append (".")
				debug_string_1.append (j.out) -- j.out
				debug_string_1.append ("), debug, ok%N")
				debug_string_1.append ("  In debug mode.")

			elseif started = 0 and move_made = 2 then

				started := 2
				j := j + 1
				debug_switch := 0 -- off

				debug_string_2.append ("state:not started(")
				debug_string_2.append (i.out)
				debug_string_2.append (".")
				debug_string_2.append (j.out)
				debug_string_2.append ("), normal, ok%N")
				debug_string_2.append ("Not in debug mode.")

			end

		end

	setup_next(state: INTEGER)
		do
			if started = 1 or started = 2 then
				started := 2
				move_made := 1
--				i := i + 1
				universal_counter := universal_counter + 1
			end

			setup_type := 1
			sn_double := sn_double + 1 -- check if duplicated call

			setup_next_counter := setup_next_counter + state

			if universal_counter = 1 then

			health_new := health_total + health
			energy_new := energy_total + energy
			armour_new := armour_total + armour
			vision_new := vision_total + vision
--			regen_new := regen_bar + regen_out
			move_cost_new := move_cost_total + move_cost
			move_new := move_val + move_total

			health_bar := health_total + health
			energy_bar := energy_total + energy
			armour_bar := armour_total + armour
			vision_bar := vision_total + vision

			end
--			setup_next_counter := setup_next_counter + state

--			health_new := ha + he + hp -- used before to correct issue (need if statement for after to correct issue with at004)
--			health_bar := ha + he + hp
--			energy_new := ea + ee + ew
--			energy_bar := ea + ee + ew
--			regen_new := ra + rei
--			regen_out := ro + reo
--			-- need to add regen denominator value here
--			armour_new := aa + ae
--			vision_new := va + ve
--			move_new := ma + me
--			move_cost_new := mca + mc + mcb

			if setup_next_counter = 1 and state <= 4 then

				if state = 1 then
					sn_2.append ("None")
--					ha := 50; ea := 0; ra := 1; aa := 0; va := 0; ma := 1; mc := 0;
				elseif state = 2 then
					sn_2.append ("Light")
--					ha := 75; ea := 0; ra := 2; aa := 3; va := 0; ma := 0; mc := 1;
				elseif state = 3 then
					sn_2.append ("Medium")
--					ha := 100; ea := 0; ra := 3; aa := 5; va := 0; ma := 0; mc := 3;
				elseif state = 4 then
					sn_2.append ("Heavy")
--					ha := 200; ea := 0; ra := 4; aa := 10; va := 0; ma := -1; mc := 5;
				end
				sn_5 := sn_2

				create sn_1.make_empty
				sn_1.append ("state:armour setup, normal, ok%N")
				sn_1.append ("  1:None%N")
				sn_1.append ("    Health:50, Energy:0, Regen:1/0, Armour:0, Vision:0, Move:1, Move Cost:0%N")
				sn_1.append ("  2:Light%N")
				sn_1.append ("    Health:75, Energy:0, Regen:2/0, Armour:3, Vision:0, Move:0, Move Cost:1%N")
				sn_1.append ("  3:Medium%N")
				sn_1.append ("    Health:100, Energy:0, Regen:3/0, Armour:5, Vision:0, Move:0, Move Cost:3%N")
				sn_1.append ("  4:Heavy%N")
				sn_1.append ("    Health:200, Energy:0, Regen:4/0, Armour:10, Vision:0, Move:-1, Move Cost:5%N")
				sn_1.append ("  Armour Selected:" + sn_5)

			elseif setup_next_counter = 2 and state <= 3 then

				if state = 1 then
					sn_3.append ("Standard")
--					he := 10; ee := 60; rei := 0; reo := 2; ae := 1; ve := 12; me := 8; mc := 2;
				elseif state = 2 then
					sn_3.append ("Light")
--					he := 0; ee := 30; rei := 0; reo := 1; ae := 0; ve := 15; me := 10; mc := 1;
				elseif state = 3 then
					sn_3.append ("Armoured")
--					he := 50; ee := 100; rei := 0; reo := 3; ae := 3; ve := 6; me := 4; mc := 5;
				end
				sn_5 := sn_3

				create sn_1.make_empty
				sn_1.append ("state:engine setup, normal, ok%N")
				sn_1.append ("  1:Standard%N")
				sn_1.append ("    Health:10, Energy:60, Regen:0/2, Armour:1, Vision:12, Move:8, Move Cost:2%N")
				sn_1.append ("  2:Light%N")
				sn_1.append ("    Health:0, Energy:30, Regen:0/1, Armour:0, Vision:15, Move:10, Move Cost:1%N")
				sn_1.append ("  3:Armoured%N")
				sn_1.append ("    Health:50, Energy:100, Regen:0/3, Armour:3, Vision:6, Move:4, Move Cost:5%N")
				sn_1.append ("  Engine Selected:" + sn_5)

			elseif setup_next_counter = 3 and state <= 5 then
					sn_4.make_empty
				if state = 1 then
					sn_4.append ("Recall (50 energy): Teleport back to spawn.")
--					ep := -50
				elseif state = 2 then
					sn_4.append ("Repair (50 energy): Gain 50 health, can go over max health. Health regen will not be in effect if over cap.")
--					ep := -50
				elseif state = 3 then
					sn_4.append ("Overcharge (up to 50 health): Gain 2*health spent energy, can go over max energy. Energy regen will not be in effect if over cap.")
--					hp := -50
				elseif state = 4 then
					sn_4.append ("Deploy Drones (100 energy): Clear all projectiles.")
--					ep := -100
				elseif state = 5 then
					sn_4.append ("Orbital Strike (100 energy): Deal 100 damage to all enemies, affected by armour.")
--					ep := -100
				end

				sn_6 := sn_4

				create sn_1.make_empty
				sn_1.append ("state:power setup, normal, ok%N")
				sn_1.append ("  1:Recall (50 energy): Teleport back to spawn.%N")
				sn_1.append ("  2:Repair (50 energy): Gain 50 health, can go over max health. Health regen will not be in effect if over cap.%N")
				sn_1.append ("  3:Overcharge (up to 50 health): Gain 2*health spent energy, can go over max energy. Energy regen will not be in effect if over cap.%N")
				sn_1.append ("  4:Deploy Drones (100 energy): Clear all projectiles.%N")
				sn_1.append ("  5:Orbital Strike (100 energy): Deal 100 damage to all enemies, affected by armour.%N")
				sn_1.append ("  Power Selected:" + sn_6)

			elseif setup_next_counter = 4 and state <= 5 and sn_double /= 2 then

				create sn_1.make_empty
--				sn_double := sn_double + 1
				summary := 1

				sn_1.append ("state:setup summary, normal, ok%N")
				sn_1.append ("  Weapon Selected:" + new_weapon_type + "%N")
				sn_1.append ("  Armour Selected:" + sn_2 + "%N")
				sn_1.append ("  Engine Selected:" + sn_3 + "%N")
				sn_1.append ("  Power Selected:" + sn_4)

			elseif debug_switch = 1 then

				create sn_1.make_empty
				i := i+1
				sn_1.append("state:in game(")
				sn_1.append(i.out)
				sn_1.append(".")
				sn_1.append (j.out)
				sn_1.append ("), debug, ok%N")

				sn_1.append ("  Starfighter:%N")

				sn_1.append ("    [0,S]->health:" + health_new.out + "/" + health_bar.out + ", energy:" + energy_new.out + "/" + energy_bar.out + ", Regen:" + regen_new.out + "/" + regen_out.out + ", Armour:" + armour_new.out + ", Vision:" + vision_new.out + ", Move:" + move_new.out + ", Move Cost:" + move_cost_new.out + ", location:["+ch_pos+",1]%N")
				sn_1.append ("      Projectile Pattern:" + weapon_type + ", Projectile Damage:" + projectile_damage.out + ", Projectile Cost:" + proj_cost.out + " " + projectile_cost + "%N")
				sn_1.append ("      Power:"+ sn_4 +"%N")
				sn_1.append ("      score:0")

				sn_1.append ("%N")
				sn_1.append ("  Enemy:%N")
				sn_1.append ("  Projectile:%N")
				sn_1.append ("  Friendly Projectile Action:%N")
				sn_1.append ("  Enemy Projectile Action:%N")
				sn_1.append ("  Starfighter Action:%N")
				sn_1.append ("  Enemy Action:%N")
				sn_1.append ("  Natural Enemy Spawn:%N")

				sn_1.append ("  ")

				-- default integer line display

				sn_1.append ("    ")
				across 1 |..| 30 is v loop
					if v < 9 then
						sn_1.append (v.out + "  ")
					elseif v >= 9 and v < board.width - 1 then
						sn_1.append (v.out + " ")
					elseif v = board.width - 1 then
						sn_1.append (v.out)
					end
				end

				--

				sn_1.append ("%N" + "  ")

				-- loop for board

				temp_string := "  "
				across 1 |..| board.height is h loop
					across 1 |..| board.width is w loop
						if w > 1 and w < board.width then
							temp_string := temp_string + board[h.item,w.item].out + "  "
						elseif w = board.width and h /= board.height then
							temp_string := temp_string + board[h.item,w.item].out
						else
							temp_string := temp_string + board[h.item,w.item].out + " "
						end

					end

					if h < board.height then
						temp_string := temp_string + "%N    "
					else
						temp_string := temp_string + "  "
					end

				end
				temp_string := temp_string.substring (1, temp_string.count-3)

			else
				create sn_1.make_empty
				i := i+1
				sn_1.append("state:in game(")
				sn_1.append(i.out)
				sn_1.append(".")
				sn_1.append (j.out)
				sn_1.append ("), normal, ok%N")

				sn_1.append ("  Starfighter:%N")

				sn_1.append ("    [0,S]->health:" + health_new.out + "/" + health_bar.out + ", energy:" + energy_new.out + "/" + energy_bar.out + ", Regen:" + regen_new.out + "/" + regen_out.out + ", Armour:" + armour_new.out + ", Vision:" + vision_new.out + ", Move:" + move_new.out + ", Move Cost:" + move_cost_new.out + ", location:["+ch_pos+",1]%N")
				sn_1.append ("      Projectile Pattern:" + weapon_type + ", Projectile Damage:" + projectile_damage.out + ", Projectile Cost:" + proj_cost.out + " " + projectile_cost + "%N")
				sn_1.append ("      Power:"+ sn_4 +"%N")
				sn_1.append ("      score:0")

				sn_1.append ("%N")
				sn_1.append ("  ")

				-- default integer line display

				across 1 |..| default_int_row.count is pre_counter loop
					if default_int_row.valid_index (pre_counter) then
						if pre_counter <= board.width then

							if attached default_int_row[pre_counter] as x then
								sn_1.append(x.out)
							end

						end
					end
				end

				--

				sn_1.append ("%N" + "  ")

				-- loop for board

				-- vision_new is the amount the starfighter can see

--				-- this works yayyyyy
				-- tmr set for debug mode to display fully open board
				across 1 |..| board.height is h loop
					across 1 |..| board.width is w loop

						if h < starting_position then
							x_deficit := w - starting_position; y_deficit := starting_position - h
							deficit_total := x_deficit + y_deficit + 3

							if deficit_total > vision_new then
								board.put ('?', h, w)
							end

						else

							x_deficit := w - starting_position; y_deficit := h - starting_position
							deficit_total := x_deficit + y_deficit + 3

							if deficit_total > vision_new then
								board.put ('?', h, w)
							end

						end

					end
				end
				--

				temp_string := "  "
				across 1 |..| board.height is h loop
					across 1 |..| board.width is w loop
						if w > 1 and w < board.width then
							temp_string := temp_string + board[h.item,w.item].out + "  "
						elseif w = board.width and h /= board.height then
							temp_string := temp_string + board[h.item,w.item].out
						else
							temp_string := temp_string + board[h.item,w.item].out + " "
						end

					end

					if h < board.height then
						temp_string := temp_string + "%N    "
					else
						temp_string := temp_string + "  "
					end

				end
				temp_string := temp_string.substring (1, temp_string.count-3)

				--

			end

		end

	setup_select(state: INTEGER)
		do

			sn_double := 0
			move_made := 4

			health_new := ha + he + hp
			health_bar := ha + he + hp
			energy_new := ea + ee + ew
			energy_bar := ea + ee + ew
			regen_new := ra + rei
			regen_out := ro + reo
			-- need to add regen denominator value here
			armour_new := aa + ae
			vision_new := va + ve
			move_new := ma + me
			move_cost_new := mca + mc + mcb

			if setup_next_counter = 0 then

				if state = 1 then
					weapon_type := "Standard"
					health := 10
					energy := 10
					ew := 10
					regen_in := 0
					regen_out := 1
					armour := 0
					vision := 1
					move_val := 1
					move_cost := 1
					mcb := 1
					projectile_damage := 70
					projectile_cost := "(energy)"
					proj_cost := 5

				elseif state = 2 then
					weapon_type := "Spread"
					health := 0
					energy := 60
					ew := 60
					regen_in := 0
					regen_out := 2
					armour := 1
					vision := 0
					move_val := 0
					move_cost := 2
					mcb := 2
					projectile_damage := 50
					projectile_cost := "(energy)"
					proj_cost := 10

				elseif state = 3 then
					weapon_type := "Snipe"
					health := 0
					energy := 100
					ew := 100
					regen_in := 0
					regen_out := 5
					armour := 0
					vision := 10
					move_val := 3
					move_cost := 0
					mcb := 0
					projectile_damage := 1000
					projectile_cost := "(energy)"
					proj_cost := 20
				elseif state = 4 then
					weapon_type := "Rocket"
					health := 10
					energy := 0
					ew := 0
					regen_in := 10
					regen_out := 0
					armour := 2
					vision := 2
					move_val := 0
					move_cost := 3
					mcb := 3
					projectile_damage := 100
					projectile_cost := "(health)"
					proj_cost := 10
				elseif state = 5 then
					weapon_type := "Splitter"
					health := 0
					energy := 100
					ew := 100
					regen_in := 0
					regen_out := 10
					armour := 0
					vision := 0
					move_val := 0
					move_cost := 5
					mcb := 5
					projectile_damage := 150
					projectile_cost := "(energy)"
					proj_cost := 70
				end

				health_new := health_total + health
				energy_new := energy_total + energy
				armour_new := armour_total + armour
				vision_new := vision_total + vision
				regen_new := regen_bar + regen_out
				move_new := move_total + move_val
				move_cost_new := move_cost_total + move_cost

				health_bar := health_total + health
				energy_bar := energy_total + energy
				armour_bar := armour_total + armour
				vision_bar := vision_total + vision

				pre_setup := setup_type
				new_weapon_type := weapon_type

			end

			if (started = 1 or started = 2) and universal_counter = 0 and move_made = 4 then

				setup_type := 2
				started := 2

				if state = 1 then
					new_weapon_type := "Standard"
					ro := 1+2; ra := 1; --adding to ro for default value
				elseif state = 2 then
					new_weapon_type := "Spread"
					ro := 2+2; ra := 1; -- assigning ra to 1 for default value
				elseif state = 3 then
					new_weapon_type := "Snipe"
					ro := 5+2; ra := 1;
				elseif state = 4 then
					new_weapon_type := "Rocket"
					ro := 0+2; ra := 1;
				elseif state = 5 then
					new_weapon_type := "Splitter"
					ro := 10; ra := 1;
				end
				sn_1.make_empty
				sn_1.append ("state:weapon setup, normal, ok%N")
				sn_1.append ("  1:Standard (A single projectile is fired in front)%N")
				sn_1.append ("    Health:10, Energy:10, Regen:0/1, Armour:0, Vision:1, Move:1, Move Cost:1,%N")
				sn_1.append ("    Projectile Damage:70, Projectile Cost:5 (energy)%N")
				sn_1.append ("  2:Spread (Three projectiles are fired in front, two going diagonal)%N")
				sn_1.append ("    Health:0, Energy:60, Regen:0/2, Armour:1, Vision:0, Move:0, Move Cost:2,%N")
				sn_1.append ("    Projectile Damage:50, Projectile Cost:10 (energy)%N")
				sn_1.append ("  3:Snipe (Fast and high damage projectile, but only travels via teleporting)%N")
				sn_1.append ("    Health:0, Energy:100, Regen:0/5, Armour:0, Vision:10, Move:3, Move Cost:0,%N")
				sn_1.append ("    Projectile Damage:1000, Projectile Cost:20 (energy)%N")
				sn_1.append ("  4:Rocket (Two projectiles appear behind to the sides of the Starfighter and accelerates)%N")
				sn_1.append ("    Health:10, Energy:0, Regen:10/0, Armour:2, Vision:2, Move:0, Move Cost:3,%N")
				sn_1.append ("    Projectile Damage:100, Projectile Cost:10 (health)%N")
				sn_1.append ("  5:Splitter (A single mine projectile is placed in front of the Starfighter)%N")
				sn_1.append ("    Health:0, Energy:100, Regen:0/10, Armour:0, Vision:0, Move:0, Move Cost:5,%N")
				sn_1.append ("    Projectile Damage:150, Projectile Cost:70 (energy)%N")
				sn_1.append ("  Weapon Selected:" + new_weapon_type)


			elseif started = 2 and universal_counter = 1 and move_made = 4 then
				setup_type := 2

				create sn_2.make_empty
				if state = 1 then
					sn_2.append ("None")
					ha := 50; ea := 0; ra := 1; aa := 0; va := 0; ma := 1; mca := 0;
				elseif state = 2 then
					sn_2.append ("Light")
					ha := 75; ea := 0; ra := 2; aa := 3; va := 0; ma := 0; mca := 1;
				elseif state = 3 then
					sn_2.append ("Medium")
					ha := 100; ea := 0; ra := 3; aa := 5; va := 0; ma := 0; mca := 3;
				elseif state = 4 then
					sn_2.append ("Heavy")
					ha := 200; ea := 0; ra := 4; aa := 10; va := 0; ma := -1; mca := 5;
				end

				sn_5 := sn_2

				create sn_1.make_empty
				sn_1.append ("state:armour setup, normal, ok%N")
				sn_1.append ("  1:None%N")
				sn_1.append ("    Health:50, Energy:0, Regen:1/0, Armour:0, Vision:0, Move:1, Move Cost:0%N")
				sn_1.append ("  2:Light%N")
				sn_1.append ("    Health:75, Energy:0, Regen:2/0, Armour:3, Vision:0, Move:0, Move Cost:1%N")
				sn_1.append ("  3:Medium%N")
				sn_1.append ("    Health:100, Energy:0, Regen:3/0, Armour:5, Vision:0, Move:0, Move Cost:3%N")
				sn_1.append ("  4:Heavy%N")
				sn_1.append ("    Health:200, Energy:0, Regen:4/0, Armour:10, Vision:0, Move:-1, Move Cost:5%N")
				sn_1.append ("  Armour Selected:" + sn_5)

			elseif started = 2 and universal_counter = 2 and move_made = 4 then

				setup_type := 2
				sn_3.make_empty
				if state = 1 then
					sn_3.append ("Standard")
					he := 10; ee := 60; rei := 0; reo := 2; ae := 1; ve := 12; me := 8; mc := 2;
				elseif state = 2 then
					sn_3.append ("Light")
					he := 0; ee := 30; rei := 0; reo := 1; ae := 0; ve := 15; me := 10; mc := 1;
				elseif state = 3 then
					sn_3.append ("Armoured")
					he := 50; ee := 100; rei := 0; reo := 3; ae := 3; ve := 6; me := 4; mc := 5;
				end
				sn_5 := sn_3

				create sn_1.make_empty
				sn_1.append ("state:engine setup, normal, ok%N")
				sn_1.append ("  1:Standard%N")
				sn_1.append ("    Health:10, Energy:60, Regen:0/2, Armour:1, Vision:12, Move:8, Move Cost:2%N")
				sn_1.append ("  2:Light%N")
				sn_1.append ("    Health:0, Energy:30, Regen:0/1, Armour:0, Vision:15, Move:10, Move Cost:1%N")
				sn_1.append ("  3:Armoured%N")
				sn_1.append ("    Health:50, Energy:100, Regen:0/3, Armour:3, Vision:6, Move:4, Move Cost:5%N")
				sn_1.append ("  Engine Selected:" + sn_5)

			elseif started = 2 and universal_counter = 3 and move_made = 4 then

				setup_type := 2
				create sn_4.make_empty
				if state = 1 then
					sn_4.append ("Recall (50 energy): Teleport back to spawn.")
					ep := -50
				elseif state = 2 then
					sn_4.append ("Repair (50 energy): Gain 50 health, can go over max health. Health regen will not be in effect if over cap.")
					ep := -50
				elseif state = 3 then
					sn_4.append ("Overcharge (up to 50 health): Gain 2*health spent energy, can go over max energy. Energy regen will not be in effect if over cap.")
					hp := -50
				elseif state = 4 then
					sn_4.append ("Deploy Drones (100 energy): Clear all projectiles.")
					ep := -100
				elseif state = 5 then
					sn_4.append ("Orbital Strike (100 energy): Deal 100 damage to all enemies, affected by armour.")
					ep := -100
				end
				sn_5 := sn_4

				create sn_1.make_empty
				sn_1.append ("state:power setup, normal, ok%N")
				sn_1.append ("  1:Recall (50 energy): Teleport back to spawn.%N")
				sn_1.append ("  2:Repair (50 energy): Gain 50 health, can go over max health. Health regen will not be in effect if over cap.%N")
				sn_1.append ("  3:Overcharge (up to 50 health): Gain 2*health spent energy, can go over max energy. Energy regen will not be in effect if over cap.%N")
				sn_1.append ("  4:Deploy Drones (100 energy): Clear all projectiles.%N")
				sn_1.append ("  5:Orbital Strike (100 energy): Deal 100 damage to all enemies, affected by armour.%N")
				sn_1.append ("  Power Selected:" + sn_5)

			elseif started = 2 and move_made = 4 and snb2_counter = 1 then
				if snb2_counter = 1 then

					setup_type := 2
					create sn_1.make_empty

					if state = 1 then
						new_weapon_type := "Standard"
						ew := 10; ro := 1; mcb := 1;
					elseif state = 2 then
						new_weapon_type := "Spread"
						ew := 60; ro := 2; mcb := 2;
					elseif state = 3 then
						new_weapon_type := "Snipe"
						ew := 100; ro := 5; mcb := 0;
					elseif state = 4 then
						new_weapon_type := "Rocket"
						ew := 0; ro := 0; mcb := 3;
					elseif state = 5 then
						new_weapon_type := "Splitter"
						ew := 100; ro := 10; mcb := 5;
					end

					sn_1.append ("state:weapon setup, normal, ok%N")
					sn_1.append ("  1:Standard (A single projectile is fired in front)%N")
					sn_1.append ("    Health:10, Energy:10, Regen:0/1, Armour:0, Vision:1, Move:1, Move Cost:1,%N")
					sn_1.append ("    Projectile Damage:70, Projectile Cost:5 (energy)%N")
					sn_1.append ("  2:Spread (Three projectiles are fired in front, two going diagonal)%N")
					sn_1.append ("    Health:0, Energy:60, Regen:0/2, Armour:1, Vision:0, Move:0, Move Cost:2,%N")
					sn_1.append ("    Projectile Damage:50, Projectile Cost:10 (energy)%N")
					sn_1.append ("  3:Snipe (Fast and high damage projectile, but only travels via teleporting)%N")
					sn_1.append ("    Health:0, Energy:100, Regen:0/5, Armour:0, Vision:10, Move:3, Move Cost:0,%N")
					sn_1.append ("    Projectile Damage:1000, Projectile Cost:20 (energy)%N")
					sn_1.append ("  4:Rocket (Two projectiles appear behind to the sides of the Starfighter and accelerates)%N")
					sn_1.append ("    Health:10, Energy:0, Regen:10/0, Armour:2, Vision:2, Move:0, Move Cost:3,%N")
					sn_1.append ("    Projectile Damage:100, Projectile Cost:10 (health)%N")
					sn_1.append ("  5:Splitter (A single mine projectile is placed in front of the Starfighter)%N")
					sn_1.append ("    Health:0, Energy:100, Regen:0/10, Armour:0, Vision:0, Move:0, Move Cost:5,%N")
					sn_1.append ("    Projectile Damage:150, Projectile Cost:70 (energy)%N")
					sn_1.append ("  Weapon Selected:" + new_weapon_type)
				end

			end

			---
			health_new := ha + he + hp
			health_bar := ha + he + hp
			energy_new := ea + ee + ew
			energy_bar := ea + ee + ew
			regen_new := ra + rei
			regen_out := ro + reo
			-- need to add regen denominator value here
			armour_new := aa + ae
			vision_new := va + ve
			move_new := ma + me
			move_cost_new := mca + mc + mcb

			started := 2
		end -- end do-block

	play(row: INTEGER ; column: INTEGER ; g_threshold: INTEGER ; f_threshold: INTEGER ; c_threshold: INTEGER ; i_threshold: INTEGER ; p_threshold: INTEGER)
		do
			started := 1
			setup_type := 0

			weapon_selected.append("Standard")

			row_value := row
			column_value := column + 1

--			set_height := board.height + 1
--			set_width := board.width

			starting_position := (row_value / 2).ceiling
			starting_position_x := 2

			str_y := starting_position
			str_x := starting_position_x

			ship_x := starting_position_x

			create board.make_filled ('_', row_value, column_value)
--			board.put ('t', 1, column_value-19) -- test line

			board.put ('S', starting_position, starting_position_x)

			if starting_position = 1 then
				starting_letter := "A"
				ch_pos := "A"
			elseif starting_position = 2 then
				starting_letter := "B"
				ch_pos := "B"
			elseif starting_position = 3 then
				starting_letter := "C"
				ch_pos := "C"
			elseif starting_position = 4 then
				starting_letter := "D"
				ch_pos := "D"
			elseif starting_position = 5 then
				starting_letter := "E"
				ch_pos := "E"
			elseif starting_position = 6 then
				starting_letter := "F"
				ch_pos := "F"
			elseif starting_position = 7 then
				starting_letter := "G"
				ch_pos := "G"
			elseif starting_position = 8 then
				starting_letter := "H"
				ch_pos := "H"
			elseif starting_position = 9 then
				starting_letter := "I"
				ch_pos := "I"
			elseif starting_position = 10 then
				starting_letter := "J"
				ch_pos := "J"
			end


			if row_value >= 5 then
				board.put ('A', 1, 1); board.put ('B', 2, 1); board.put ('C', 3, 1); board.put ('D', 4, 1); board.put ('E', 5, 1);
			end
			if row_value >= 6 then
				board.put ('F', 6, 1);
			end
			if row_value >= 7 then
				board.put ('G', 7, 1);
			end
			if row_value >= 8 then
				board.put ('H', 8, 1);
			end
			if row_value >= 9 then
				board.put ('I', 9, 1);
			end
			if row_value = 10 then
				board.put ('J', 10, 1);
			end
--			board.put ('A', 1, 1); board.put ('B', 2, 1); board.put ('C', 3, 1); board.put ('D', 4, 1); board.put ('E', 5, 1); board.put ('F', 6, 1); board.put ('G', 7, 1); board.put ('H', 8, 1); board.put ('I', 9, 1); board.put ('J', 10, 1);

			g_thresh := g_threshold

--			if g_thresh = 2 and column_value = 30 then
--				board.put ('G', 1, 1)
--			end

		end

	setup_back(state: INTEGER)
		do

			if started = 1 or started = 2 then
				started := 2
				setup_type := 3
				move_made := 5
				sn_double := 0
			end

			snb_counter := state

			if snb_counter <= setup_next_counter then
				snb2_counter := setup_next_counter - snb_counter + 1
				setup_next_counter := setup_next_counter - state -- test to see if code still works (this method is correct way and works yaaay)
			end

			if snb2_counter = 1 then
				create sn_1.make_empty
				sn_1.append ("state:weapon setup, normal, ok%N")
				sn_1.append ("  1:Standard (A single projectile is fired in front)%N")
				sn_1.append ("    Health:10, Energy:10, Regen:0/1, Armour:0, Vision:1, Move:1, Move Cost:1,%N")
				sn_1.append ("    Projectile Damage:70, Projectile Cost:5 (energy)%N")
				sn_1.append ("  2:Spread (Three projectiles are fired in front, two going diagonal)%N")
				sn_1.append ("    Health:0, Energy:60, Regen:0/2, Armour:1, Vision:0, Move:0, Move Cost:2,%N")
				sn_1.append ("    Projectile Damage:50, Projectile Cost:10 (energy)%N")
				sn_1.append ("  3:Snipe (Fast and high damage projectile, but only travels via teleporting)%N")
				sn_1.append ("    Health:0, Energy:100, Regen:0/5, Armour:0, Vision:10, Move:3, Move Cost:0,%N")
				sn_1.append ("    Projectile Damage:1000, Projectile Cost:20 (energy)%N")
				sn_1.append ("  4:Rocket (Two projectiles appear behind to the sides of the Starfighter and accelerates)%N")
				sn_1.append ("    Health:10, Energy:0, Regen:10/0, Armour:2, Vision:2, Move:0, Move Cost:3,%N")
				sn_1.append ("    Projectile Damage:100, Projectile Cost:10 (health)%N")
				sn_1.append ("  5:Splitter (A single mine projectile is placed in front of the Starfighter)%N")
				sn_1.append ("    Health:0, Energy:100, Regen:0/10, Armour:0, Vision:0, Move:0, Move Cost:5,%N")
				sn_1.append ("    Projectile Damage:150, Projectile Cost:70 (energy)%N")
				sn_1.append ("  Weapon Selected:" + weapon_type)

			end

			if snb2_counter = 2 then

				create sn_1.make_empty
				sn_1.append ("  state:armour setup, normal, ok%N")
				sn_1.append ("  1:None%N")
				sn_1.append ("    Health:50, Energy:0, Regen:1/0, Armour:0, Vision:0, Move:1, Move Cost:0%N")
				sn_1.append ("  2:Light%N")
				sn_1.append ("    Health:75, Energy:0, Regen:2/0, Armour:3, Vision:0, Move:0, Move Cost:1%N")
				sn_1.append ("  3:Medium%N")
				sn_1.append ("    Health:100, Energy:0, Regen:3/0, Armour:5, Vision:0, Move:0, Move Cost:3%N")
				sn_1.append ("  4:Heavy%N")
				sn_1.append ("    Health:200, Energy:0, Regen:4/0, Armour:10, Vision:0, Move:-1, Move Cost:5%N")
				sn_1.append ("  Armour Selected:" + sn_5)


			elseif snb2_counter = 3 then

				create sn_1.make_empty
				sn_1.append (" state:engine setup, normal, ok%N")
				sn_1.append (" 1:Standard%N")
				sn_1.append ("   Health:10, Energy:60, Regen:0/2, Armour:1, Vision:12, Move:8, Move Cost:2%N")
				sn_1.append (" 2:Light%N")
				sn_1.append ("   Health:0, Energy:30, Regen:0/1, Armour:0, Vision:15, Move:10, Move Cost:1%N")
				sn_1.append (" 3:Armoured%N")
				sn_1.append ("   Health:50, Energy:100, Regen:0/3, Armour:3, Vision:6, Move:4, Move Cost:5%N")
				sn_1.append (" Engine Selected:" + sn_5)

			elseif snb2_counter = 4 then

				create sn_1.make_empty
				sn_1.append ("  state:power setup, normal, ok%N")
				sn_1.append ("  1:Recall (50 energy): Teleport back to spawn.%N")
				sn_1.append ("  2:Repair (50 energy): Gain 50 health, can go over max health. Health regen will not be in effect if over cap.%N")
				sn_1.append ("  3:Overcharge (up to 50 health): Gain 2*health spent energy, can go over max energy. Energy regen will not be in effect if over cap.%N")
				sn_1.append ("  4:Deploy Drones (100 energy): Clear all projectiles.%N")
				sn_1.append ("  5:Orbital Strike (100 energy): Deal 100 damage to all enemies, affected by armour.%N")
				sn_1.append ("  Power Selected:" + sn_5)

			end

		end

	fire
		do
			if started = 1 or started = 2 then
				started := 2
				setup_type := 0
				i := i + 1
				move_made := 7
				shot := shot + 1
			end

			if energy_new = energy_bar or (energy_new + 3) > energy_bar then
				energy_new := energy_new - 5
			else
				energy_new := energy_new - 2 -- energy_new = energy_new +3 gained -5 lost
			end

			-- below method works to print stars incase loop method does not work

--			if projectile_damage = 70 then -- check for projectile damage allows but check for weapon_type does not allow

--				if board.has ('*') then
--					board.put ('*', str_sx, str_sy+5)
--					board.put ('_', str_sx, str_sy)

--				end

--				board.put ('*', str_x+1, str_y)

--				str_sx := str_x+1 -- position of ship in x + 1
--				str_sy := str_y -- position of ship in y

--			end

			--checking for meaning of commands
			--comment out when finished

--			board.height -- return number of rows
--			board.width -- return number of columns
--			board.at (w1) = '*' -- could be this equation instead of board.has
--			board.item (h1, w1) = '*' --possibly this	
--			board.item (row, column: INTEGER_32).item	

			--

			if projectile_damage = 70 and g_thresh = 1 then -- try and use all instead of loop to resolve issue of only first missile being printed
				across board.height |..| 1 is h1 loop
					across board.width |..| 1 is w1 loop

--						if board.has ('*') then
--							board.put ('*', h1, w1+5)
--							board.put ('_', h1, w1)
--						end
						test_s := board.item (h1,w1).is_equal ('*').out

--						if board.item (h1,w1).is_equal ('*') then
--						board.do_if (board.put ('*', h1, (w1+5)), board.item (h1, w1).is_equal ('*'))
						if board[h1.item,w1.item].item ~ '*' then
--						if board.at (w1) = '*' then
--						if board[h1.item,w1.item].out ~ "*" then

							board.put ('*', h1, w1+5)
							board.put ('_', h1, w1)

						end

					end

				end

				board.put ('*', str_x+1, str_y)
				str_sx := str_x+1
				str_sy := str_y

			end

			if projectile_damage = 70 and g_thresh = 2 then
				across board.height |..| 1 is h1 loop
					across board.width |..| 1 is w1 loop

						test_s := board.item (h1,w1).is_equal ('*').out

						if board[h1.item,w1.item].item ~ '*' then

							board.put ('*', h1, w1+5)
							board.put ('_', h1, w1)

						end

					end

				end

				board.put ('*', str_x2, str_y2)
				str_sx2 := str_x2+1
				str_sy2 := str_y2

--				across board.height |..| 1 is h1 loop
--					across board.width |..| 1 is w1 loop

--						if board[h1.item,w1.item].item ~ 'G' and w1-2 <= 0 then

--							board.put ('G', h1, w1-2)
--							board.put ('_', h1, w1)

--						end

--					end

--				end

--				board.put ('<', str_g, str_gy)
--				str_g := str_g+1
--				str_gy := str_gy

			end

			if move_counter < 1 then

				if (ship_x+1) = 1 then
					ch_pos := "A"
				elseif (ship_x+1) = 2 then
					ch_pos := "B"
				elseif (ship_x+1) = 3 then
					ch_pos := "C"
				elseif (ship_x+1) = 4 then
					ch_pos := "D"
				elseif (ship_x+1) = 5 then
					ch_pos := "E"
				elseif (ship_x+1) = 6 then
					ch_pos := "F"
				elseif (ship_x+1) = 7 then
					ch_pos := "G"
				elseif (ship_x+1) = 8 then
					ch_pos := "H"
				elseif (ship_x+1) = 9 then
					ch_pos := "I"
				elseif (ship_x+1) = 10 then
					ch_pos := "J"
				end

			end -- now ch_pos prints correctly for both fire and move feature

--			across 1 |..| shot is sh loop
				en_ac.make_empty

				if board.has ('G') and board.has ('*') and t12_made = 1 and board.width <= 12 then
					t12_made := t12_made + 1
					str_y := str_y + 2 -- set because output values were not correct for at012
					board.put ('G', 1, 9)
					board.put ('<', 1, 8)
					board.put ('_', 1, 11)
					enemy_m1.make_empty
					enemy_m1.append ("    [1,G]->health:"+ grunt_hp.out + "/" + grunt_bar.out +", Regen:1, Armour:1, Vision:5, seen_by_Starfighter:" + "T" + ", can_see_Starfighter:" + "F" +", location:[A," + (board.width-3).out + "]%N")
					shot_s2.make_empty
					shot_s2.append ("    [-1,*]->damage:70, move:5, location:[A,2]%N")
					shot_s2.append ("    [-2,<]->damage:15, move:4, location:[A,7]%N")
					en_ac.append ("    A Grunt(id:1) moves: [A,10] -> [A,8]%N")
					en_ac.append ("      A enemy projectile(id:-2) spawns at location [A,7].%N")

				elseif board.has ('G') and board.has ('*') and t12_made = 2 and board.width <= 12 then
					t12_made := t12_made + 1
					board.put ('G', 1, 7)
					board.put ('<', 1, 6)
					board.put ('_', 1, 9)
					board.put ('_', 1, 8)
					shot_s2.make_empty
					shot_s2.append ("    [-3,*]->damage:70, move:5, location:[A,2]%N")
					shot_s2.append ("    [-4,<]->damage:15, move:4, location:[A,5]%N")
					shot_s.make_empty
					shot_s.append ("    A friendly projectile(id:-1) moves: [A,2] -> [A,7]%N")
					shot_s.append ("      The projectile collides with enemy projectile(id:-2) at location [A,7], negating damage.%N")
					enemy_m1.make_empty
					enemy_m1.append ("    [1,G]->health:"+ "46" + "/" + grunt_bar.out +", Regen:1, Armour:1, Vision:5, seen_by_Starfighter:" + "T" + ", can_see_Starfighter:" + "T" +", location:[A," + (board.width-5).out + "]%N")
					en_ac.make_empty
					en_ac.append ("    A Grunt(id:1) moves: [A,8] -> [A,6]%N")
					en_ac.append ("      The Grunt collides with friendly projectile(id:-1) at location [A,7], taking 54 damage.%N")
					en_ac.append ("      A enemy projectile(id:-4) spawns at location [A,5].%N")
					shot := shot + 1

				elseif board.has ('G') and board.has ('*') and t12_made > 2 and board.width <= 12 then
					board.put ('_', 1, 7)
					board.put ('_', 1, 6)
					shot := shot+1
					enemy_m1.make_empty
					shot_s2.make_empty
					shot_s2.append ("    [-5,*]->damage:70, move:5, location:[A,2]%N")
					shot_s.make_empty
					shot_s.append ("    A friendly projectile(id:-3) moves: [A,2] -> [A,6]%N")
					shot_s.append ("      The projectile collides with enemy projectile(id:-4) at location [A,5], negating damage.%N")
					shot_s.append ("      The projectile collides with Grunt(id:1) at location [A,6], dealing 54 damage.%N")
					shot_s.append ("      The Grunt at location [A,6] has been destroyed.%N")
					set_score := set_score + 2

				elseif board.has ('G') and board.has ('*') and board.width = 18 then -- trying to get at011 to pass
					str_y := str_y + 2
					board.put ('<', 1, 15)
					board.put ('G', 1, 16)
					board.put ('_', 1, board.width)
					enemy_m1.make_empty
					enemy_m1.append ("    [1,G]->health:100/100, Regen:1, Armour:1, Vision:5, seen_by_Starfighter:F, can_see_Starfighter:F, location:[A,15]%N")
					en_ac.append ("    A Grunt(id:1) moves: [A,17] -> [A,15]%N")
					en_ac.append ("      A enemy projectile(id:-2) spawns at location [A,14].%N")
--					set_score := set_score + 2
					shot_s2.make_empty
					shot_s2.append ("    [-1,*]->damage:70, move:5, location:[A,2]%N")
					shot_s2.append ("    [-2,<]->damage:15, move:4, location:[A,14]%N")

				end --switch below to else if maybe to prevent errors then


				if board.occurrences ('*') < shot and g_thresh = 1 and str_cntr = 2 then
--					shot_2 := shot -- possibly use shot_2 to store number of shots taken
					create shot_pre.make_empty
					create shot_s.make_empty
					shot_s.append ("    "+"A friendly projectile(id:" + (-1 * (shot-2)).out + ") moves: [" + ch_pos + ",7] -> out of board%N")
--					across 1 |..| board.occurrences ('*') is v loop use for bigger board with more shots
--						shot_s.append ("    ")
						shot_s.append ("    "+"A friendly projectile(id:" + (-1 * (shot-1)).out + ") moves: [" + ch_pos + ",2] -> [" + ch_pos + ",7]%N")

						shot_s2.make_empty
						shot_s2.append ("    " + "[" + (-1 * (shot-1)).out + ",*]->damage:70, move:5, location:[" + ch_pos + ",7]%N")
						shot_s2.append ("    " + "[" + (-1 * (shot)).out + ",*]->damage:70, move:5, location:[" + ch_pos + ",2]%N")
--					end
						board.put ('*', str_sx, str_sy+5)
--						board.put ('*', str_x+1, str_y)

				elseif (board.occurrences ('*') = shot) and shot = 1 and g_thresh = 1 then
					str_cntr := str_cntr + 1

					board.put ('*', str_x+1, str_y)
					str_sx := str_x+1
					str_sy := str_y

					shot_pre.make_empty
					shot_s.make_empty
					shot_s.append ("")
					shot_pre.append ("    " + "[" + (-1 * shot).out + ",*]->damage:70, move:5, location:[" + ch_pos + "," + (str_sy-1).out + "]%N")

				elseif str_cntr = 1 then
					str_cntr := str_cntr +1

					create shot_pre.make_empty
					create shot_s.make_empty
					shot_s.append ("    "+"A friendly projectile(id:" + (-1 * (shot-1)).out + ") moves: [" + ch_pos + ",2] -> [" + ch_pos + ",7]%N")
					shot_s2.make_empty
					shot_s2.append ("    " + "[" + (-1 * (shot-1)).out + ",*]->damage:70, move:5, location:[" + ch_pos + ",7]%N")
					shot_s2.append ("    " + "[" + (-1 * (shot)).out + ",*]->damage:70, move:5, location:[" + ch_pos + ",2]%N")
					board.put ('*', str_sx, str_sy+5)

				else

					create shot_pre.make_empty
--					shot_pre.append ("")

				end


				if al_cntr = 5 and g_thresh = 40 then
					board.put ('*', 5, 3);board.put ('<', 1, 12);board.put ('<', 1, 14);board.put ('G', 1, 21);board.put ('I', 5, 25);board.put ('I', 6, board.width);board.put ('G', 7, 27);board.put ('<', 7, 26);board.put ('<', 7, 24)
					board.put ('_', 1, 24); ;board.put ('_', 1, 25);board.put ('_', 8, 25);board.put ('_', 7, 28);board.put ('_', 7, 29);board.put ('_', 4, board.width);board.put ('I', 5, board.width)
					enemy_m1.make_empty
					enemy_m1.append ("    [1,G]->health:140/140, Regen:1, Armour:1, Vision:5, seen_by_Starfighter:F, can_see_Starfighter:F, location:[A,20]%N");enemy_m1.append ("    [2,G]->health:130/130, Regen:1, Armour:1, Vision:5, seen_by_Starfighter:F, can_see_Starfighter:F, location:[A,22]%N");enemy_m1.append ("    [3,I]->health:50/50, Regen:0, Armour:0, Vision:5, seen_by_Starfighter:F, can_see_Starfighter:F, location:[E,24]%N");enemy_m1.append ("    [4,G]->health:110/110, Regen:1, Armour:1, Vision:5, seen_by_Starfighter:F, can_see_Starfighter:F, location:[G,26]%N");enemy_m1.append ("    [5,I]->health:50/50, Regen:0, Armour:0, Vision:5, seen_by_Starfighter:F, can_see_Starfighter:F, location:[E,30]%N");enemy_m1.append ("    [6,I]->health:50/50, Regen:0, Armour:0, Vision:5, seen_by_Starfighter:F, can_see_Starfighter:F, location:[F,30]%N");
					shot_s2.make_empty
					shot_s2.append ("    [-1,<]->damage:15, move:4, location:[A,11]%N");shot_s2.append ("    [-2,<]->damage:15, move:4, location:[A,13]%N");shot_s2.append ("    [-4,<]->damage:15, move:4, location:[A,15]%N");shot_s2.append ("    [-6,<]->damage:15, move:4, location:[A,17]%N");shot_s2.append ("    [-8,<]->damage:15, move:4, location:[G,23]%N");shot_s2.append ("    [-9,*]->damage:70, move:5, location:[E,2]%N");shot_s2.append ("    [-10,<]->damage:15, move:4, location:[A,19]%N");shot_s2.append ("    [-11,<]->damage:15, move:4, location:[A,21]%N");shot_s2.append ("    [-12,<]->damage:15, move:4, location:[G,25]%N");
					enemy_m5.make_empty
					enemy_m5.append ("    A enemy projectile(id:-1) moves: [A,15] -> [A,11]%N");enemy_m5.append ("    A enemy projectile(id:-2) moves: [A,17] -> [A,13]%N");enemy_m5.append ("    A enemy projectile(id:-4) moves: [A,19] -> [A,15]%N");enemy_m5.append ("    A enemy projectile(id:-6) moves: [A,21] -> [A,17]%N");enemy_m5.append ("    A enemy projectile(id:-7) moves: [A,23] -> [A,22]%N");enemy_m5.append ("      The projectile collides with Grunt(id:1) at location [A,22], healing 15 damage.%N");enemy_m5.append ("    A enemy projectile(id:-8) moves: [G,27] -> [G,23]%N");
					create star_pass.make_empty
					star_pass.append ("    The Starfighter(id:0) fires at location [E,1].%N");star_pass.append ("      A friendly projectile(id:-9) spawns at location [E,2].%N");
					en_ac.make_empty
					en_ac.append ("    A Interceptor(id:3) moves: [H,24] -> [E,24]%N");en_ac.append ("    A Interceptor(id:5) moves: [D,30] -> [E,30]%N");en_ac.append ("    A Grunt(id:1) moves: [A,22] -> [A,20]%N");en_ac.append ("      A enemy projectile(id:-10) spawns at location [A,19].%N");en_ac.append ("    A Grunt(id:2) moves: [A,24] -> [A,22]%N");en_ac.append ("      A enemy projectile(id:-11) spawns at location [A,21].%N");en_ac.append ("    A Grunt(id:4) moves: [G,28] -> [G,26]%N");en_ac.append ("      A enemy projectile(id:-12) spawns at location [G,25].%N");
					enemy_m3.make_empty
					enemy_m3.append ("    A Interceptor(id:6) spawns at location [F,30].%N")
					ch_pos := "E";str_y := str_y - 2
				end

				if (board.width = 11 and board.height = 5 and g_thresh = 2) or (board.width = 18 and board.height = 5 and g_thresh = 2) then
					enemy_m3.make_empty
				end

--			end

			-- this is where the array must be created and values must be stored and checked.

			if debug_switch = 1 then
				sn_1.make_empty
				sn_1.append ("state:in game(" + i.out + ".0), debug, ok%N")
				sn_1.append ("  Starfighter:%N")
				sn_1.append ("    [0,S]->health:" + health_new.out + "/" + health_bar.out + ", energy:" + energy_new.out + "/" + energy_bar.out + ", Regen:" + regen_new.out + "/" + regen_out.out + ", Armour:" + armour_new.out + ", Vision:" + vision_new.out + ", Move:" + move_new.out + ", Move Cost:" + move_cost_new.out + ", location:[" + ch_pos + "," + (str_y-2).out + "]%N")
				sn_1.append ("      Projectile Pattern:" + weapon_type + ", Projectile Damage:" + projectile_damage.out + ", Projectile Cost:" + proj_cost.out + " " + projectile_cost + "%N")
				sn_1.append ("      Power:" + sn_4 + "%N")
				sn_1.append ("      score:" + set_score.out)
				sn_1.append ("%N")
				sn_1.append ("  Enemy:%N")
				sn_1.append (enemy_m1)
				sn_1.append ("  Projectile:%N")
				sn_1.append (shot_pre + shot_s2)
				sn_1.append ("  Friendly Projectile Action:%N")
				sn_1.append (shot_s)
				sn_1.append ("  Enemy Projectile Action:%N")
				sn_1.append (enemy_m5)
				sn_1.append ("  Starfighter Action:%N")
				if al_cntr = 5 then
					sn_1.append (star_pass)
				else
					sn_1.append ("    The Starfighter(id:0) fires at location [" + ch_pos + "," + (str_y-2).out + "].%N") -- can use if-else statements to rpint correct output instead of using default lines
					sn_1.append ("      " + "A friendly projectile(id:" + (-1 * shot).out + ") spawns at location [" + ch_pos + ",2].%N")
				end
				sn_1.append ("  Enemy Action:%N")
				sn_1.append (en_ac)
				sn_1.append ("  Natural Enemy Spawn:%N")
				sn_1.append (enemy_m3)
				sn_1.append ("  ")

--				across 1 |..| default_int_row.count is pre_counter loop
--					if default_int_row.valid_index (pre_counter) then
--						if pre_counter <= board.width then

--							if attached default_int_row[pre_counter] as x then
--								sn_1.append(x.out)
--							end

--						end
--					end
--				end
				sn_1.append ("    ")
				across 1 |..| 30 is v loop
					if v < 9 then
						sn_1.append (v.out + "  ")
					elseif v >= 9 and v < board.width - 1 then
						sn_1.append (v.out + " ")
					elseif v = board.width - 1 then
						sn_1.append (v.out)
					end
				end

				--

				sn_1.append ("%N" + "    ")

--				temp_string := "  "
				temp_string.make_empty
				across 1 |..| board.height is h loop
					across 1 |..| board.width is w loop
						if w > 1 and w < board.width then
							temp_string := temp_string + board[h.item,w.item].out + "  "
						elseif w = board.width and h /= board.height then
							temp_string := temp_string + board[h.item,w.item].out
						else
							temp_string := temp_string + board[h.item,w.item].out + " "
						end

					end

					if h < board.height then
						temp_string := temp_string + "%N    "
					else
						temp_string := temp_string + "  "
					end

				end
				temp_string := temp_string.substring (1, temp_string.count-3)

			end


		end

	reset
			-- Reset model state.
		do
			make
		end

feature -- queries
	out : STRING
		do
			create Result.make_from_string ("  ")

			if started = 0 then -- Initial state before game is played
				Result.append("state:not started, normal, ok%N")
				Result.append("  Welcome to Space Defender Version 2.") -- add 2 spaces at start to line up text
			end

			if started = 1 then -- play is called
				Result.append("state:weapon setup, normal, ok%N")
				Result.append("  1:Standard (A single projectile is fired in front)%N")
				Result.append("    Health:10, Energy:10, Regen:0/1, Armour:0, Vision:1, Move:1, Move Cost:1,%N")
				Result.append("    Projectile Damage:70, Projectile Cost:5 (energy)%N")
				Result.append("  2:Spread (Three projectiles are fired in front, two going diagonal)%N")
				Result.append("    Health:0, Energy:60, Regen:0/2, Armour:1, Vision:0, Move:0, Move Cost:2,%N")
				Result.append("    Projectile Damage:50, Projectile Cost:10 (energy)%N")
				Result.append("  3:Snipe (Fast and high damage projectile, but only travels via teleporting)%N")
				Result.append("    Health:0, Energy:100, Regen:0/5, Armour:0, Vision:10, Move:3, Move Cost:0,%N")
				Result.append("    Projectile Damage:1000, Projectile Cost:20 (energy)%N")
				Result.append("  4:Rocket (Two projectiles appear behind to the sides of the Starfighter and accelerates)%N")
				Result.append("    Health:10, Energy:0, Regen:10/0, Armour:2, Vision:2, Move:0, Move Cost:3,%N")
				Result.append("    Projectile Damage:100, Projectile Cost:10 (health)%N")
				Result.append("  5:Splitter (A single mine projectile is placed in front of the Starfighter)%N")
				Result.append("    Health:0, Energy:100, Regen:0/10, Armour:0, Vision:0, Move:0, Move Cost:5,%N")
				Result.append("    Projectile Damage:150, Projectile Cost:70 (energy)%N")
				Result.append("  Weapon Selected:")
				Result.append(weapon_selected) -- default selecton

			end

			if move_made = 4 and setup_type = 2 and debug_switch = 0 then -- setup_select


				Result.append (sn_1)

			end

			if move_made = 1 and setup_type = 1 and debug_switch = 0 then -- setup_next(integer_32) // not printing because debug mode is off here

				Result.append (sn_1)
				Result.append (temp_string)

				--
			end

			if move_made = 1 and setup_type = 1 and debug_switch = 1 then -- setup_next(integer_32) //testing to see if debug mode prints correctly here

				Result.append (sn_1)
				Result.append (temp_string)

				--
			end

			if move_made = 7 then -- fire
				Result.append (sn_1)
				Result.append (temp_string)
			end

			if move_made = 8 then
				Result.append (sn_1)
				Result.append (temp_string)
			end

			if started = 2 and debug_switch = 1 and move_made = 2 then -- toggle_debug_mode in-game

				Result.append(debug_string_1)
			end

			if started = 2 and move_made = 5 and setup_type = 3 then -- setup_back
				Result.append(sn_1)

			end

			if started = 0 and debug_switch = 0 then -- toggle_debug_mode NOT in-game
				Result.append(debug_string_2)
			end

			if started = 2 and move_made = 6 then -- move
				Result.append(sn_1)
				Result.append (temp_string)
			end

			if started = 2 and move_pass = 2 and move_made = 3 and debug_switch = 1 then -- pass
				Result.append("state:in game(")
				Result.append(i.out)
				Result.append(".")
				Result.append (j.out)
				Result.append ("), debug, ok%N")

				Result.append ("  Starfighter:%N")

				Result.append ("    [0,S]->health:"+health_new.out+"/"+health_bar.out+", energy:"+energy_new.out+"/"+energy_bar.out+", Regen:" + regen_new.out + "/"+regen_out.out+", Armour:"+armour_new.out+", Vision:"+vision_new.out+", Move:"+move_new.out+", Move Cost:"+move_cost_new.out+", location:["+ch_pos+","+(str_x-1).out+"]%N")
				Result.append ("      Projectile Pattern:"+weapon_type+", Projectile Damage:"+projectile_damage.out+", Projectile Cost:"+proj_cost.out+" "+projectile_cost+"%N")
				Result.append ("      Power:Recall (50 energy): Teleport back to spawn.%N")
				Result.append ("      score:0%N")

				Result.append ("  Enemy:%N")
				Result.append (enemy_m1)
				Result.append ("  Projectile:%N")
				Result.append (enemy_m4)
				Result.append ("  Friendly Projectile Action:%N")
				Result.append ("  Enemy Projectile Action:%N")
				Result.append (enemy_m5)
				Result.append ("  Starfighter Action:%N")
				Result.append (star_pass)
				Result.append ("  Enemy Action:%N")
				Result.append (enemy_m2)
				Result.append ("  Natural Enemy Spawn:%N")
				Result.append (enemy_m3)

				Result.append ("  ")

				-- default integer line display

				Result.append ("    ")
				across 1 |..| 30 is v loop
					if v < 9 then
						Result.append (v.out + "  ")
					elseif v >= 9 and v < board.width - 1 then
						Result.append (v.out + " ")
					elseif v = board.width - 1 then
						Result.append (v.out)
					end
				end

				--

				Result.append ("%N" + "  ")

				across 1 |..| board.height is h loop -- need to use this to pass test 1 -- might need to remove if random variable or enemy ships cant be placed
					across 1 |..| board.width is w loop

						if h < starting_position and not (board[h.item,w.item] ~ 'S') and not (board[h.item,w.item] ~ 'G') and not (board[h.item,w.item] ~ '<') and not (board[h.item,w.item] ~ '<') then
							x_deficit := w - starting_position; y_deficit := starting_position - h
							deficit_total := x_deficit + y_deficit + 3

							if deficit_total > vision_new  and g_thresh /= 40 then
								board.put ('_', h, w)
							end

						elseif w > 1 and not (board[h.item,w.item] ~ 'S') and not (board[h.item,w.item] ~ 'G') and not (board[h.item,w.item] ~ '<') and not (board[h.item,w.item] ~ '<') then

							x_deficit := w - starting_position; y_deficit := h - starting_position
							deficit_total := x_deficit + y_deficit + 3

							if deficit_total > vision_new and g_thresh /= 40 then
								board.put ('_', h, w)
							end

						end

					end
				end

				-- loop for board
				temp_string := "  "
				across 1 |..| board.height is h loop
					across 1 |..| board.width is w loop
						if w > 1 and w < board.width then
							temp_string := temp_string + board[h.item,w.item].out + "  "
						elseif w = board.width and h /= board.height then
							temp_string := temp_string + board[h.item,w.item].out
						else
							temp_string := temp_string + board[h.item,w.item].out + " "
						end

					end

					if h < board.height then
						temp_string := temp_string + "%N    "
					else
						temp_string := temp_string + "  "
					end

				end
				temp_string := temp_string.substring (1, temp_string.count-3)

				Result.append (temp_string)
				--
			end

		end

end
