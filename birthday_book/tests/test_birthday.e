note
	description: "[
		Test examples with arrays and regular expressions.
		First test fails as Result is False by default.
		Write your own tests.
		Included libraries:
			base and extension
			Espec unit testing
			Mathmodels
			Gobo structures
			Gobo regular expressions
		]"
	author: "Varuhn and Jackie"
	date: "$Date$"
	revision: "$Revision 19.05$"

class
	TEST_BIRTHDAY

inherit

	ES_TEST

create
	make

feature {NONE} -- Initialization

	make
			-- initialize tests
		do
			-- boolean tests
			add_boolean_case (agent t_always_passes)
			add_boolean_case (agent t_static_query)
			add_boolean_case (agent t_static_queryb)
			add_boolean_case (agent t_create_new_birthday)
--			add_boolean_case (agent t_create_invalid_birthday) -- commented out because violation test needed
			add_boolean_case (agent t_birthday_equality)

			--violation tests
			add_violation_case_with_tag ("valid_combination", agent t_precond_birthday_make)
			add_violation_case_with_tag ("day_set", agent t_postcond_birthday_make)
		end

feature -- boolean tests

	t_always_passes: BOOLEAN
		do
			comment ("t_always: a test always passing")
			Result := true
			-- return result
		end

	t_static_query: BOOLEAN
		do
			comment ("t_static_query: is_month_with_31_days")
			-- For a boolean test query yo pas:
			-- 1. no contract violations
			-- 2. last reaassigned value of result must be true
			Result := {BIRTHDAY}.is_month_with_31_days(1) -- January
			-- for each intermediate re-assignment to result,
			-- we must make sure its not re-assigned to false.
			check Result end
			Result := not {BIRTHDAY}.is_month_with_31_days(4) -- April
		end

	t_static_queryb: BOOLEAN
		do
			comment ("t_static_queryb: is_month_with_30_days")
			Result := not {BIRTHDAY}.is_month_with_30_days(1) -- January
			check Result end
			Result := {BIRTHDAY}.is_month_with_30_days(4) -- April
		end

	--TODO: write a boolean test query and add it as a test on is_month_with_30_days

	t_create_new_birthday: BOOLEAN
		local
			bd: BIRTHDAY
		do
			comment ("t_create_new_birthday: create a valid instance of birthday")
			create bd.make (10,15) -- command 'make' is used as constructor
			Result := bd.month = 10 and bd.day = 15
			check Result end
			create bd.make (9,14) -- command 'make' is used as constructor
			Result := bd.month = 9 and bd.day = 14
			check Result end
			bd.make (7,15)
			Result := bd.month = 7 and bd.day = 15
		end

--	t_create_invalid_birthday: BOOLEAN
--		local
--			bd: BIRTHDAY
--		do
--			comment ("t_create_invalid_birthday: creates an invlaid instance of birthday")
--			--precondition violation preventing implementation
--			create bd.make (11,31)
--		end

	t_birthday_equality: BOOLEAN
		local
			bd1, bd2: BIRTHDAY
		do
			comment ("t_birthday_equality: test reference and object equality of birthdays")
			create bd1.make (10,15)
			create bd2.make (10,15)

			-- different objects
			Result := bd1 /= bd2 -- /= is the same as 'not equal'
			check Result end

			Result := bd1.is_equal (bd2)
			check Result end

			Result := bd1 ~ bd2 -- bd1.is_equal(bd2) same as one above
		end

feature -- violation tests

	t_precond_birthday_make
	local
		bd: BIRTHDAY
	do
		comment ("t_precond_birthday_make: test that the precondition with tag valid_combination is violated as expected")
		-- since violation is expected
		-- only code that leads to particular violation must be written
		create bd.make (11,31)
	end

	t_postcond_birthday_make
		local
			bd: BAD_BIRTHDAY_VIOLATING_DAY_SET
		do
			comment("t_postcond_birthday_make: test the postcondition with tag day_set is violated as expected")
			create bd.make(10,14) -- wrong implementation should trigger postcond `day_set`
		end

end
