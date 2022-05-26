note
	description: "Summary description for {TEST_LIBRARY}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TEST_LIBRARY

inherit
	ES_TEST

create
	make

feature -- constructor
	make
	do
		add_boolean_case (agent test_arrays)
		add_boolean_case (agent test_lists)
		add_boolean_case (agent test_across_loops)
		add_boolean_case (agent test_quantifications)
	end

feature -- boolean query
	test_arrays: BOOLEAN
		local
			s1, s2: ARRAY[STRING]
			i: INTEGER -- loop counter
		do
			comment ("test_arrays: test basic operation of arrays")
			create s1.make_empty
			Result :=
				-- size of array: upper - lower + 1
				s1.lower = 1 and s1.upper = 0 and s1.count = 0 and s1.is_empty
				and
				not s1.valid_index (0) and not s1.valid_index (1)
			check Result end

			s1.force ("alan",s1.count + 1)
			s1.force ("mark",s1.count + 1)
			s1.force ("tom",s1.count + 1)
			Result :=
				s1.lower = 1 and s1.upper = 3 and s1.count = 3 and not s1.is_empty
				and
				not s1.valid_index (0) and s1.valid_index (1) and s1.valid_index (2) and s1.valid_index (3)
				and
				s1[1] ~ "alan" and s1[2] ~ "mark" and s1[3] ~ "tom"
			check Result end

			Result :=
				s1.object_comparison = false
				and
				s1.has ("alan") = false
				and
				s1.occurrences("alan") = 0
			check Result end

			s1.compare_objects
			Result :=
				s1.object_comparison = true
				and
				s1.has ("alan") = true
				and
				s1.occurrences("alan") = 1
			check Result end

			create s2.make_empty
			from
				i := 1
			until
				i > s1.count -- exit condition
			loop
				s2.force (s1[i], s2.count+1)
				i := i + 1
			end
			Result :=
				s2.lower = 1 and s2.upper = 3 and s2.count = 3 and not s2.is_empty
				and
				not s2.valid_index (0) and s2.valid_index (1) and s2.valid_index (2) and s2.valid_index (3)
				and
				s2[1] ~ "alan" and s2[2] ~ "mark" and s2[3] ~ "tom"
			check Result end

			Result := s1 /= s2 -- comparing addresses
			check Result end

			Result := s1 /~ s2 -- s1.object_comparison is true buit s2.object_comparison is false
			check Result end

			s2.compare_objects
			Result := s1 ~ s2

			check Result end

			s2[2] := "jim"
			s2.put("jeremy", 3)
			Result :=
				s2.count = 3 and s2[1] ~ "alan" and s2[2] ~ "jim" and s2[3] ~ "jeremy"
		end

	test_lists: BOOLEAN
		local
			s1, s2, s3: LINKED_LIST[STRING]
			i: INTEGER -- loop counter
		do
			comment ("test_lists: test basic operation of lists")
			create s1.make
			Result :=
				s1.count = 0 and s1.is_empty
				and
				not s1.valid_index (0) and not s1.valid_index (1)
			check Result end

			s1.extend ("alan")
			s1.extend ("mark")
			s1.extend ("tom")
			Result :=
				s1.count = 3 and not s1.is_empty
				and
				not s1.valid_index (0) and s1.valid_index (1) and s1.valid_index (2) and s1.valid_index (3)
				and
				s1[1] ~ "alan" and s1[2] ~ "mark" and s1[3] ~ "tom"
			check Result end

			Result :=
				s1.object_comparison = false
				and
				s1.has ("alan") = false
				and
				s1.occurrences("alan") = 0
			check Result end

			s1.compare_objects
			Result :=
				s1.object_comparison = true
				and
				s1.has ("alan") = true
				and
				s1.occurrences("alan") = 1
			check Result end

			create s2.make
			from
				i := 1
			until
				i > s1.count -- exit condition
			loop
				s2.extend (s1[i])
				i := i + 1
			end
			Result :=
				s2.count = 3 and not s2.is_empty
				and
				not s2.valid_index (0) and s2.valid_index (1) and s2.valid_index (2) and s2.valid_index (3)
				and
				s2[1] ~ "alan" and s2[2] ~ "mark" and s2[3] ~ "tom"
			check Result end

			Result := s1 /= s2 -- comparing addresses
			check Result end

			Result := s1 /~ s2 -- s1.object_comparison is true buit s2.object_comparison is false
			check Result end

			s2.compare_objects
			Result := s1 ~ s2
			check Result end

			create s3.make
			from
				s1.start -- move cursor to first position
			until
				s1.after -- exit when cursor is beyond list
			loop
				s3.extend (s1.item) -- extend s3 by where s1 cursor is pointing
				s1.forth
			end

			Result :=
				s3.count = 3 and not s3.is_empty
				and
				not s3.valid_index (0) and s3.valid_index (1) and s3.valid_index (2) and s3.valid_index (3)
				and
				s3[1] ~ "alan" and s3[2] ~ "mark" and s3[3] ~ "tom"
			check Result end

			--s3.compare_objects
			Result :=
				s1 /= s3 and s2 /= s3
				and
				s1 /~ s3 and s2 /~ s3
			check Result end

			s3.compare_objects
			Result :=
				s1 /= s3 and s2 /= s3
				and
				s1 ~ s3 and s2 ~ s3
			check Result end

			s2[2] := "jim"
			Result :=
				s2.count = 3 and s2[1] ~ "alan" and s2[2] ~ "jim" and s2[3] ~ "tom"
		end

	test_across_loops: BOOLEAN
		local
			a: ARRAY[STRING]
			list1, list2, list3: LINKED_LIST[STRING]
		do
			comment ("test_across_loops: use of across as loop instructions")
			a := <<"alan", "mark", "tom">>

			create list1.make
			across
				1 |..| a.count as l_i -- l_i denotes a cursor pointing to an integer
			loop
				list1.extend (a[l_i.item]) -- must point to object cursor is pointing to which is l_i.item
			end
			Result := list1.count = 3 and list1[1] ~ "alan" and list1[2] ~ "mark" and list1[3] ~ "tom"
			check Result end

			create list2.make
			across
				1 |..| a.count is l_i -- l_i denotes an integer
			loop
				list2.extend (a[l_i])
			end
			Result := list2.count = 3 and list2[1] ~ "alan" and list2[2] ~ "mark" and list2[3] ~ "tom"
			check Result end

			create list3.make
			across
				a is l_name -- `a` is an array and iterable, `l_name` denotes a member string of the array
			loop
				list3.extend (l_name)
			end
			Result := list3.count = 3 and list3[1] ~ "alan" and list3[2] ~ "mark" and list3[3] ~ "tom"
		end

	test_quantifications: BOOLEAN
		local
			a: ARRAY[STRING]
		do
			comment ("test_quantification: use of across as boolean expression")

			Result :=
				not (across
					1 |..| 10 is l_i -- l_i denotes a member of the interval frtom 1 to 10
				all
					l_i > 5
				end) -- anser is expected to be false

				and

				across
					1 |..| 10 is l_i -- l_i denotes a member of the interval frtom 1 to 10
				some
					l_i > 5
				end
			check Result end

			a := <<"yuna","suyeon","heeyeon">>
		Result := -- version 1 across over valid index set of array `a`
			not (across 1 |..| a.count is l_i all a[l_i].count > 4 end)
			and
			across 1 |..| a.count is l_i some a[l_i].count > 4 end
		check Result end

		Result := -- version 2 accross over members of array `a`
			not (across a is l_s all l_s.count > 4 end)
			and
			across a is l_s some l_s.count > 4 end
		check Result end

		Result :=
			across 1 |..| (a.count - 1) is l_index all a[l_index].count <= a[l_index + 1].count end
		end
end
