note
	description: "Summary description for {BIRTHDAY_BOOK}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BIRTHDAY_BOOK

create
	make_empty

feature -- attributes
	names: ARRAY[STRING]
	birthdays: LIST[BIRTHDAY] -- program from the interface and not from the implementation

	count: INTEGER
		-- number of stored name-birthday records

feature -- queries

	get_birthday(name: STRING): BIRTHDAY

		require
			existing_name:
				names.has (name)
		local
			i: INTEGER
		do
			create Result.make(10, 15)
--			Result := birthdays[1]
			from
				i := 1
			until
				i > names.count
			loop
				if names[i] ~ name then
					Result := birthdays[i]
				end
				i := i + 1
			end
		ensure
			 correct_result:
			 	Result ~ birthdays[index_of_name(name)]
		end

	get_detachable_birthday(name: STRING): detachable BIRTHDAY
		local
			i: INTEGER
		do
--			from
--				i := 1
--			until
--				i > names.count
--			loop
--				if names[i] ~ name then
--					Result := birthdays[i]
--				end
--				i := i + 1
--			end
			i := index_of_name (name)
			if i > 0 then
				Result := birthdays[i]
			end

		ensure
			case_of_non_void_result:
--				Result /= void implies Result ~ birthdays[index_of_name(name)]
				attached Result /= void implies Result ~ birthdays[index_of_name(name)]
			case_of_void_result:
--				Result = void implies not names.has (name)
				not attached Result implies names.has (name)
		end

	celebrate (today: BIRTHDAY): like names -- return type should be same as `names`
		-- given todays date, check to celelbrate
		local
			l_i, birthday_today: INTEGER
		do
			create Result.make_empty
--			i := 1
			birthday_today := 1
			--TODO: complete the implmentation of this query
			-- Version 1:			
--			across
--				names as l_n
--			loop
--				if today ~ birthdays[l_n] then
--					Result.force (names[l_n], birthday_today)
--					birthday_today := birthday_today + 1
--				end
----				i := i + 1
--			end

--

			from
				l_i := 1
			until
				l_i > birthdays.count
			loop
				if birthdays[l_i] ~ today then
					Result.force (names[l_i], birthday_today)
					birthday_today := birthday_today + 1
				end
				l_i := l_i + 1
			end

		ensure
			lower_of_result:
				Result.lower = 1

			every_name_in_result_is_an_existing_name:
--				True -- TODO
				across
					Result is l_names
				all
					names.has (l_names)
				end

			every_name_in_result_has_birthday_today:
				True -- TODO
				across
					Result is l_names
				all
					get_birthday (l_names) ~ today
				end

		end
	-- OPTIONAL: should write a boolean test query to test implmentation of `celebrate`
	-- write violation test commands to test the two post conditions of `celebrate`

feature -- auxiliary queries

	index_of_name(name: STRING): INTEGER
		-- returns index of name if exists else return 0
		local
			i: INTEGER
		do
			i := 1
			Result := 0
			across
				names is l_n
			loop
				if l_n ~ name then
					Result := i
				end
				i := i + 1
			end
		end

feature -- commands

	make_empty
		--creates an empty birthday book.
		do
			create names.make_empty
			names.compare_objects
			create {LINKED_LIST[BIRTHDAY]}birthdays.make
			birthdays.compare_objects
		end

	add(name: STRING; birthday: BIRTHDAY)
			-- adds a new record with `name` and `birthday`
		require
			non_existing_name:
--				not names.has (name)
--				not(across names is l_n some l_n ~ name end)
				across names is l_n all l_n /~ name end
		do
			names.force (name, names.count + 1)
			birthdays.extend (birthday)
			count := count + 1
		ensure
			count_incremented:
				count = old count + 1
			names_added_to_end:
				names[count] ~ name
			birthday_added_to_end:
				birthdays[count] ~ birthday
		end

invariant
	consistent_counts: -- increments names and birthdays equally
		Current.count = names.count and Current.count = birthdays.count

	no_duplicate_names:
		across 1 |..| names.count is l_i all -- from 1 to names.count using l_i as counter
		across 1 |..| names.count is l_j all
			l_i /= l_j implies names[l_i] /~ names[l_j]
		end
		end

end
