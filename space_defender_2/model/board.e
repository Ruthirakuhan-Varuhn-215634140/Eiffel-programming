note
	description: "Summary description for {BOARD}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BOARD

create {ETF_MODEL_ACCESS}
	make


feature {NONE} -- initialization
	make
		do
			create board.make_filled ('_', 10, 30)
			x_deficit := 0
			y_deficit := 0
			move_pos := 0
			deficit_total := 0
			vision_new := 0
			create temp_string.make_empty

		end
feature -- Model Attributes
	board : ARRAY2[character]
	x_deficit : INTEGER
	y_deficit : INTEGER
	move_pos : INTEGER
	deficit_total : INTEGER
	vision_new : INTEGER
	temp_string : STRING

feature -- model operations

	set_board
		do
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
		end

	print_board
		do
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
