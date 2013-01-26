use "ass-01.sml";

fun assert(result, expected) =
    if result = expected
    then true
    else false
    
val date1 = (1976, 1, 19)
val date2 = (1976, 1, 20)
val date3 = (1976, 2, 19)
val date4 = (1976, 3, 19)
val date5 = (1980, 2, 1)

(* test cases for is_older function *)
val test_case01 = assert( is_older(date1, date1), false)
val test_case02 = assert( is_older(date1, date2), true)
val test_case03 = assert( is_older(date1, date3), true)
val test_case04 = assert( is_older(date1, date4), true)
val test_case05 = assert( is_older(date1, date5), true)
val test_case06 = assert( is_older(date2, date1), false)
val test_case07 = assert( is_older(date2, date3), true)
val test_case08 = assert( is_older(date2, date4), true)
val test_case09 = assert( is_older(date2, date5), true)
val test_case10 = assert( is_older(date3, date2), false)
val test_case11 = assert( is_older(date3, date4), true)
val test_case12 = assert( is_older(date3, date5), true)
val test_case13 = assert( is_older(date4, date3), false)
val test_case14 = assert( is_older(date4, date5), true)
val test_case15 = assert( is_older(date5, date4), false)

(* test cases for number_in_month function *)
val test_case16 = assert( number_in_month([date1, date2, date3, date4, date5], 1), 2)
val test_case17 = assert( number_in_month([date1, date2, date3, date4, date5], 2), 2)
val test_case18 = assert( number_in_month([date1, date2, date3, date4, date5], 3), 1)
val test_case19 = assert( number_in_month([date1, date2, date3, date4, date5], 5), 0)
val test_case20 = assert( number_in_month([date1], 1), 1)
val test_case21 = assert( number_in_month([date1], 5), 0)
val test_case22 = assert( number_in_month([], 5), 0)

(* test cases for number_in_months function *)
val test_case23 = assert( number_in_months([date1, date2, date3, date4, date5], [1,2]), 4)
val test_case24 = assert( number_in_months([date1, date2, date3, date4, date5], [2]), 2)
val test_case25 = assert( number_in_months([date1, date2, date3, date4, date5], [1,2,3]), 5)
val test_case26 = assert( number_in_months([date1, date2, date3, date4, date5], [2,3]), 3)
val test_case27 = assert( number_in_months([date1], [1,2]), 1)
val test_case28 = assert( number_in_months([date1, date2, date3], [3,4]), 0)
val test_case29 = assert( number_in_months([], [5]), 0)

(* test cases for dates_in_month function *)
val test_case30 = assert( dates_in_month([date1, date2, date3, date4, date5], 1), [date1, date2])
val test_case31 = assert( dates_in_month([date1, date2, date3, date4, date5], 2), [date3, date5])
val test_case32 = assert( dates_in_month([date1, date2], 2), [])

(* test cases for dates_in_months function *)
val test_case33_val = dates_in_months([date1, date2, date3, date4, date5], [1,2,3])
val test_case33 = assert( dates_in_months([date1, date2, date3, date4, date5], [1,2,3]), [date1, date2, date3, date5, date4])
val test_case34_val = dates_in_months([date1, date2, date3, date4, date5], [2,3])
val test_case34 = assert( dates_in_months([date1, date2, date3, date4, date5], [2,3]), [date3, date5, date4])
val test_case35_val = dates_in_months([date1, date2], [4])
val test_case35 = assert( dates_in_months([date1, date2], [4]), [])

val str1 = "phobos"
val str2 = "deimos"
val str3 = "mars"

(* test cases for get_nth function *)
val test_case36 = assert( get_nth([str1, str2, str3],1), str1)
val test_case37 = assert( get_nth([str1, str2, str3],3), str3)

(* test cases for get_nth function *)
val test_case38 = assert ( number_before_reaching_sum(10,[1,2,3,4,5,6,7,8,9]), 3)
val test_case39 = assert ( number_before_reaching_sum(35,[5,5,10,10,20]), 4)

(* test cases for what_month function *)
val test_case40 = assert ( what_month(31), 1)
val test_case41 = assert ( what_month(59), 2)
val test_case42 = assert ( what_month(60), 3)

(* test cases for month_range function *)
val test_case43 = assert( month_range_alt(1, 32), [1, 2])
val test_case44 = assert( month_range_alt(31, 60), [1, 2, 3])
val test_case45 = assert( month_range_alt(122, 365), [5, 6, 7, 8, 9, 10, 11, 12])

(* test case for oldest *)
val test_case46 = assert(valOf(oldest([date1, date2, date3, date4, date5])), date1) 
val test_case47 = assert(valOf(oldest([date4, date1, date3, date5, date2])), date1) 
val test_case48 = assert(valOf(oldest([date4, date3])), date3) 

(* test case for Challenge problem 12 *)
val test_case49a = assert( number_in_months_challenge([date1, date2, date3, date4, date5], [1,2]), 4)
val test_case50a = assert( number_in_months_challenge([date1, date2, date3, date4, date5], [2]), 2)
val test_case51a = assert( number_in_months_challenge([date1, date2, date3, date4, date5], [1,2,3]), 5)
val test_case52a = assert( number_in_months_challenge([date1, date2, date3, date4, date5], [2,3]), 3)
val test_case53a = assert( number_in_months_challenge([date1], [1,2]), 1)
val test_case54a = assert( number_in_months_challenge([date1, date2, date3], [3,4]), 0)
val test_case55a = assert( number_in_months_challenge([], [5]), 0)
val test_case49b = assert( number_in_months_challenge([date1, date2, date3, date4, date5], [1,2,1,2]), 4)
val test_case50b = assert( number_in_months_challenge([date1, date2, date3, date4, date5], [2,2,2]), 2)
val test_case51b = assert( number_in_months_challenge([date1, date2, date3, date4, date5], [1,2,3,1,2,3]), 5)
val test_case52b = assert( number_in_months_challenge([date1, date2, date3, date4, date5], [2,3,2,2,3]), 3)
val test_case53b = assert( number_in_months_challenge([date1], [1,2,1]), 1)
val test_case54b = assert( number_in_months_challenge([date1, date2, date3], [3,3,4,4]), 0)
val test_case55b = assert( number_in_months_challenge([], [5,5,5]), 0)

val test_case56a = assert( dates_in_months_challenge([date1, date2, date3, date4, date5], [1,2,3]), [date1, date2, date3, date5, date4])
val test_case57a = assert( dates_in_months_challenge([date1, date2, date3, date4, date5], [2,3]), [date3, date5, date4])
val test_case58a = assert( dates_in_months_challenge([date1, date2], [4]), [])
val test_case56b_val_1 = remove_duplicates([1,2,3,1,2])
val test_case56b_val_2 = dates_in_months_challenge([date1, date2, date3, date4, date5], [1,2,3,1,2])
val test_case56b = assert( dates_in_months_challenge([date1, date2, date3, date4, date5], [1,2,3,1,2]), [date4, date1, date2, date3, date5])
val test_case57b = assert( dates_in_months_challenge([date1, date2, date3, date4, date5], [2,3,2,3]), [date3, date5, date4])
val test_case58b = assert( dates_in_months_challenge([date1, date2], [4,4,4]), [])


(* test case for Reasonable date problem 13 *)
val test_case59 = assert (reasonable_date(0,12,1), false)
val test_case60 = assert (reasonable_date(1400,0,1), false)
val test_case61 = assert (reasonable_date(1970,11,31), false)
val test_case62 = assert (reasonable_date(1970,1,0), false)
val test_case63 = assert (reasonable_date(2012,2,29), true)
val test_case64 = assert (reasonable_date(2013,2,29), false)


(* submission failed checks *)
val test_case_failed_1_val = month_range(1, 365)
val test_case_failed_2_val = month_range(1, 31)
val test_case_failed_2 = assert( month_range(1, 31), [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1] )
val test_case_failed_3_val = month_range(335, 365)
val test_case_failed_3 = assert( month_range(335, 365), [12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12] )
val test_case_failed_4_val = month_range(5, 3)
val test_case_failed_4 = assert( month_range(5, 3), [] )
val test_case_failed_5_val = month_range(85, 145)
val test_case_failed_5 = assert( month_range(85, 145), [3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5] )
