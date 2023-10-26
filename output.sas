begin_version
3
end_version
begin_metric
0
end_metric
7
begin_variable
var0
-1
4
Atom at(cop1, n1)
Atom at(cop1, n2)
Atom at(cop1, n3)
Atom at(cop1, n4)
end_variable
begin_variable
var1
-1
4
Atom at(rob1, n1)
Atom at(rob1, n2)
Atom at(rob1, n3)
Atom at(rob1, n4)
end_variable
begin_variable
var2
-1
2
Atom turn(cop1)
NegatedAtom turn(cop1)
end_variable
begin_variable
var3
-1
2
Atom survived()
NegatedAtom survived()
end_variable
begin_variable
var4
-1
2
Atom nil()
NegatedAtom nil()
end_variable
begin_variable
var5
-1
2
Atom caught()
NegatedAtom caught()
end_variable
begin_variable
var6
-1
2
Atom done()
NegatedAtom done()
end_variable
0
begin_state
0
2
1
1
1
1
1
end_state
begin_goal
1
6 0
end_goal
33
begin_operator
cop_move1_DETDUP_1 cop1
0
3
0 0 0 1
1 1 1 5 -1 0
0 2 0 1
1
end_operator
begin_operator
cop_move1_DETDUP_2 cop1
0
3
0 0 0 3
1 1 3 5 -1 0
0 2 0 1
1
end_operator
begin_operator
cop_move2_DETDUP_1 cop1
0
3
0 0 1 0
1 1 0 5 -1 0
0 2 0 1
1
end_operator
begin_operator
cop_move2_DETDUP_2 cop1
0
3
0 0 1 2
1 1 2 5 -1 0
0 2 0 1
1
end_operator
begin_operator
cop_move3_DETDUP_1 cop1
0
3
0 0 2 1
1 1 1 5 -1 0
0 2 0 1
1
end_operator
begin_operator
cop_move3_DETDUP_2 cop1
0
3
0 0 2 3
1 1 3 5 -1 0
0 2 0 1
1
end_operator
begin_operator
cop_move4_DETDUP_1 cop1
0
3
0 0 3 0
1 1 0 5 -1 0
0 2 0 1
1
end_operator
begin_operator
cop_move4_DETDUP_2 cop1
0
3
0 0 3 2
1 1 2 5 -1 0
0 2 0 1
1
end_operator
begin_operator
game_terminate 
1
5 0
1
0 6 -1 0
1
end_operator
begin_operator
robber_move_DETDUP_1 n1 n2
0
4
0 1 0 1
1 0 1 5 -1 0
0 3 -1 0
0 2 1 0
1
end_operator
begin_operator
robber_move_DETDUP_1 n1 n4
0
4
0 1 0 3
1 0 3 5 -1 0
0 3 -1 0
0 2 1 0
1
end_operator
begin_operator
robber_move_DETDUP_1 n2 n1
0
4
0 1 1 0
1 0 0 5 -1 0
0 3 -1 0
0 2 1 0
1
end_operator
begin_operator
robber_move_DETDUP_1 n2 n3
0
4
0 1 1 2
1 0 2 5 -1 0
0 3 -1 0
0 2 1 0
1
end_operator
begin_operator
robber_move_DETDUP_1 n3 n2
0
4
0 1 2 1
1 0 1 5 -1 0
0 3 -1 0
0 2 1 0
1
end_operator
begin_operator
robber_move_DETDUP_1 n3 n4
0
4
0 1 2 3
1 0 3 5 -1 0
0 3 -1 0
0 2 1 0
1
end_operator
begin_operator
robber_move_DETDUP_1 n4 n1
0
4
0 1 3 0
1 0 0 5 -1 0
0 3 -1 0
0 2 1 0
1
end_operator
begin_operator
robber_move_DETDUP_1 n4 n3
0
4
0 1 3 2
1 0 2 5 -1 0
0 3 -1 0
0 2 1 0
1
end_operator
begin_operator
robber_move_DETDUP_2 n1 n2
0
4
0 1 0 1
1 0 1 5 -1 0
0 4 -1 0
0 2 1 0
1
end_operator
begin_operator
robber_move_DETDUP_2 n1 n4
0
4
0 1 0 3
1 0 3 5 -1 0
0 4 -1 0
0 2 1 0
1
end_operator
begin_operator
robber_move_DETDUP_2 n2 n1
0
4
0 1 1 0
1 0 0 5 -1 0
0 4 -1 0
0 2 1 0
1
end_operator
begin_operator
robber_move_DETDUP_2 n2 n3
0
4
0 1 1 2
1 0 2 5 -1 0
0 4 -1 0
0 2 1 0
1
end_operator
begin_operator
robber_move_DETDUP_2 n3 n2
0
4
0 1 2 1
1 0 1 5 -1 0
0 4 -1 0
0 2 1 0
1
end_operator
begin_operator
robber_move_DETDUP_2 n3 n4
0
4
0 1 2 3
1 0 3 5 -1 0
0 4 -1 0
0 2 1 0
1
end_operator
begin_operator
robber_move_DETDUP_2 n4 n1
0
4
0 1 3 0
1 0 0 5 -1 0
0 4 -1 0
0 2 1 0
1
end_operator
begin_operator
robber_move_DETDUP_2 n4 n3
0
4
0 1 3 2
1 0 2 5 -1 0
0 4 -1 0
0 2 1 0
1
end_operator
begin_operator
robber_stay_DETDUP_1 n1
1
1 0
2
0 3 -1 0
0 2 1 0
1
end_operator
begin_operator
robber_stay_DETDUP_1 n2
1
1 1
2
0 3 -1 0
0 2 1 0
1
end_operator
begin_operator
robber_stay_DETDUP_1 n3
1
1 2
2
0 3 -1 0
0 2 1 0
1
end_operator
begin_operator
robber_stay_DETDUP_1 n4
1
1 3
2
0 3 -1 0
0 2 1 0
1
end_operator
begin_operator
robber_stay_DETDUP_2 n1
1
1 0
2
0 4 -1 0
0 2 1 0
1
end_operator
begin_operator
robber_stay_DETDUP_2 n2
1
1 1
2
0 4 -1 0
0 2 1 0
1
end_operator
begin_operator
robber_stay_DETDUP_2 n3
1
1 2
2
0 4 -1 0
0 2 1 0
1
end_operator
begin_operator
robber_stay_DETDUP_2 n4
1
1 3
2
0 4 -1 0
0 2 1 0
1
end_operator
0
