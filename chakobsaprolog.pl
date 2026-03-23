% Codigo que le dice cuales son las letras (symbolos) aceptados en el automata
symbol(a).
symbol(b).
symbol(d).
symbol(h).
symbol(i).
symbol(l).
symbol(m).
symbol(q).
symbol(r).
symbol(t).
symbol(u).

% Estado Inicial
start(q0).
% Estados finales
accept(q_maqbara).
accept(q_mahdi).
accept(q_matar).
accept(q_maula).
accept(q_midri).

% AUTOMATA

% Todas empiezan con m
move(q0,m,q1).

% m(a)
move(q1,a,q2).

% maqbara
move(q2, q, q5).
move(q5, b, q6).
move(q6, a, q7).
move(q7, r, q8).
move(q8, a, q_maqbara).
% mahdi
move(q2, h, q3).
move(q3, d, q4).
move(q4, i, q_mahdi).
% matar
move(q2, t, q9).
move(q9, a, q10).
move(q10, r, q_matar).
% maula
move(q2, u, q11).
move(q11, l, q12).
move(q12, a, q_maula).

% m(i)
move(q1, i, q13).

% midri
move(q13, d, q14).
move(q14, r, q15).
move(q15, i, q_midri).

% Parse para recorrer el input y validar palabra
parse(Input) :-
    start(Start),
    parse_temp(Input, Start).

parse_temp([], State) :-
    accept(State),
    write('Accepted'), nl.

parse_temp([Symbol|Rest], CurrentState) :-
    move(CurrentState, Symbol, NextState),
    parse_temp(Rest, NextState).

% Preubas
% parse([m,a,h,d,i]).
% parse([m,a,h,c]).