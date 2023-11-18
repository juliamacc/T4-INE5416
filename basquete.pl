munhequeira(azul).
munhequeira(branca).
munhequeira(verde).
munhequeira(vermelha).
munhequeira(preta).

nome(anderson).
nome(bruno).
nome(leandro).
nome(marcelo).
nome(tiago).

camisa(6).
camisa(8).
camisa(23).
camisa(32).
camisa(45).

altura(1.90).
altura(1.95).
altura(2.00).
altura(2.05).
altura(2.10).

idade(20).
idade(23).
idade(26).
idade(29).
idade(31).

estado(acre).
estado(matoGrossoDoSul).
estado(minasGerais).
estado(parana).
estado(pernambuco).

% X está à ao lado de Y
aoLado(X,Y,Lista) :- nextto(X,Y,Lista);nextto(Y,X,Lista).
                       
% X está à esquerda de Y (qualquer posição à esquerda)
aEsquerda(X,Y,Lista) :- nth0(IndexX,Lista,X), 
                        nth0(IndexY,Lista,Y), 
                        IndexX < IndexY.
                        
% X está à direita de Y (qualquer posição à direita)
aDireita(X,Y,Lista) :- aEsquerda(Y,X,Lista). 

% X está na borda se ele é o primeiro ou o último da lista
naBorda(X,Lista) :- last(Lista,X).
naBorda(X,[X|_]).

% X está entre Y e Z
entre(X,Y,Z,Lista) :- aDireita(X,Y,Lista), aEsquerda(X,Z,Lista).

todosDiferentes([]).
todosDiferentes([H|T]) :- not(member(H,T)), todosDiferentes(T).

solucao(ListaSolucao) :- 

    ListaSolucao = [
        jogador(Munhequeira1, Nome1, Camisa1, Altura1, Idade1, Estado1),
        jogador(Munhequeira2, Nome2, Camisa2, Altura2, Idade2, Estado2),
        jogador(Munhequeira3, Nome3, Camisa3, Altura3, Idade3, Estado3),
        jogador(Munhequeira4, Nome4, Camisa4, Altura4, Idade4, Estado4),
        jogador(Munhequeira5, Nome5, Camisa5, Altura5, Idade5, Estado5)
    ],

    % Na terceira posição está o jogador que nasceu na região Sul.
    Estado3 = parana,

    % Tiago está exatamente à esquerda do jogador de 23 anos.
    aoLado(jogador(_,tiago,_,_,_,_), jogador(_,_,_,_,23,_), ListaSolucao),

    % Em uma das pontas está o jogador que está usando a munhequeira Branca.
    naBorda(jogador(branca,_,_,_,_,_), ListaSolucao),

    % O jogador de 23 anos está ao lado do jogador da munhequeira Verde.
    aoLado(jogador(_,_,_,_,23,_), jogador(verde,_,_,_,_,_), ListaSolucao),

    % Marcelo está na quarta posição.
    Nome4 = marcelo,

    % Na quarta posição está quem nasceu em Recife.
    Estado4 = pernambuco,

    % O jogador de munhequeira Amarela está exatamente à direita do jogador de munhequeira Verde.
    aDireita(jogador(verde,_,_,_,_,_), jogador(amarela,_,_,_,_,_), ListaSolucao),

    % O camisa 8 está em algum lugar entre os camisas 45 e 23, nessa ordem.
    entre(jogador(_,_,8,_,_,_), jogador(_,_,45,_,_,_), jogador(_,_,23,_,_,_), ListaSolucao),
    
    % O jogador mais baixo está exatamente à esquerda do jogador mais velho.
    aoLado(jogador(_,_,_,1.90,_,_), jogador(_,_,_,_,31,_), ListaSolucao),
    
    % O jogador de 26 anos está exatamente à direita do jogador de 2,05 m.
    aoLado(jogador(_,_,_,2.05,_,_), jogador(_,_,_,_,26,_), ListaSolucao),

    % O Paranaense usa a camisa 32.
    member(jogador(_,_,32,_,_,parana), ListaSolucao),

    % Na quarta posição está o jogador de 31 anos.
    Idade4 = 31,

    % O jogador que nasceu no Acre está ao lado do jogador de 2,05 m.
    aoLado(jogador(_,_,_,2.05,_,_), jogador(_,_,_,_,_,acre), ListaSolucao),

    % O jogador de 2,00 m está ao lado do jogador que é 10 cm menor que ele.
    aoLado(jogador(_,_,_,2.00,_,_), jogador(_,_,_,1.90,_,_), ListaSolucao),

    % Marcelo está em algum lugar entre o jogador de 2,05 m e o Bruno, nessa ordem.
    entre(jogador(_,marcelo,_,_,_,_), jogador(_,_,_,2.05,_,_), jogador(_,bruno,_,_,_,_), ListaSolucao),

    % O Mineiro está ao lado do jogador de 2,10 m.
    aoLado(jogador(_,_,_,2.10,_,_), jogador(_,_,_,_,_,minasGerais), ListaSolucao),

    % Leandro está na terceira posição.
    Nome3 = leandro,

    % O jogador da região Centro-oeste está exatamente à esquerda do jogador da munhequeira Vermelha.
    aoLado(jogador(_,_,_,_,_,matoGrossoDoSul), jogador(vermelha,_,_,_,_,_), ListaSolucao),

    % O jogador de 23 anos está em algum lugar entre o jogador da camisa 45 e o jogador mais novo, nessa ordem.
    entre(jogador(_,_,45,_,_,_), jogador(_,_,45,_,_,_), jogador(_,_,20,_,_,_), ListaSolucao),

    % Tiago está exatamente à direita do jogador da camisa 6.
    aoLado(jogador(_,tiago,_,_,_,_), jogador(_,_,6,_,_,_), ListaSolucao),

    % Testa todas as possibilidades
    munhequeira(Munhequeira1), munhequeira(Munhequeira2), munhequeira(Munhequeira3), munhequeira(Munhequeira4), munhequeira(Munhequeira5),
    todosDiferentes([Munhequeira1, Munhequeira2, Munhequeira3, Munhequeira4, Munhequeira5]),

    nome(Nome1), nome(Nome2), nome(Nome3), nome(Nome4), nome(Nome5),
    todosDiferentes([Nome1, Nome2, Nome3, Nome4, Nome5]),

    camisa(Camisa1), camisa(Camisa2), camisa(Camisa3), camisa(Camisa4), camisa(Camisa5),
    todosDiferentes([Camisa1, Camisa2, Camisa3, Camisa4, Camisa5]),

    altura(Altura1), altura(Altura2), altura(Altura3), altura(Altura4), altura(Altura5),
    todosDiferentes([Altura1, Altura2, Altura3, Altura4, Altura5]),

    idade(Idade1), idade(Idade2), idade(Idade3), idade(Idade4), idade(Idade5),
    todosDiferentes([Idade1, Idade2, Idade3, Idade4, Idade5]),

    estado(Estado1), estado(Estado2), estado(Estado3), estado(Estado4), estado(Estado5),
    todosDiferentes([Estado1, Estado2, Estado3, Estado4, Estado5]).
