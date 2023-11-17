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
estado(mato grosso do sul).
estado(minas gerais).
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


    % Em uma das pontas está o jogador que está usando a munhequeira Branca.


    % O jogador de 23 anos está ao lado do jogador da munhequeira Verde.


    % Marcelo está na quarta posição.
    Nome4 = marcelo,

    % Na quarta posição está quem nasceu em Recife.
    Estado4 = pernambuco,

    % O jogador de munhequeira Amarela está exatamente à direita do jogador de munhequeira Verde.


    % O camisa 8 está em algum lugar entre os camisas 45 e 23, nessa ordem.
    
    
    % O jogador mais baixo está exatamente à esquerda do jogador mais velho.
    
    
    % O jogador de 26 anos está exatamente à direita do jogador de 2,05 m.


    % O Paranaense usa a camisa 32.


    % Na quarta posição está o jogador de 31 anos.
    Idade4 = 31,

    % O jogador que nasceu no Acre está ao lado do jogador de 2,05 m.


    % O jogador de 2,00 m está ao lado do jogador que é 10 cm menor que ele.


    % Marcelo está em algum lugar entre o jogador de 2,05 m e o Bruno, nessa ordem.


    % O Mineiro está ao lado do jogador de 2,10 m.


    % Leandro está na terceira posição.
    Nome3 = leandro,

    % O jogador da região Centro-oeste está exatamente à esquerda do jogador da munhequeira Vermelha.


    % O jogador de 23 anos está em algum lugar entre o jogador da camisa 45 e o jogador mais novo, nessa ordem.


    % Tiago está exatamente à direita do jogador da camisa 6.

