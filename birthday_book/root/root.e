note
	description: "[
		ROOT class for project
		See tests in TEST_EXAMPLE
		Place your own classes in cluster model (recursive).
		There is no precompile.
	]"
	author: "JSO"
	date: "$Date$"
	revision: "$Revision$"

class
	ROOT

inherit

	ES_SUITE -- for unit testing

create
	make

feature {NONE} -- Initialization

	make
			-- Run app
		do
			add_test (create {TEST_BIRTHDAY_BOOK}.make)
			add_test (create {TEST_LIBRARY}.make)
			add_test (create {TEST_BIRTHDAY}.make) --suite of tests
			show_browser
			run_espec
		end

end
