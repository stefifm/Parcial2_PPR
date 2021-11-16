%Hechos:

%Familias de Ransomware

familia(1,grandcrab,78.5,fecha(10,1,2020),[enero,febrero,marzo,abril]).

familia(2,babuk,7.61,fecha(5,7,2020),[julio,agosto]).

familia(3,cerber,3.11,fecha(20,1,2020),[enero,febrero,diciembre]).

familia(4,matsnu,2.63,fecha(3,4,2020),[abril,octubre]).

familia(5,wannacry,2.41,fecha(29,6,2020),[junio,septiembre]).

familia(6,congur,1.52,fecha(5,7,2020),[julio]).

familia(7,locky,1.29,fecha(12,5,2020),[mayo,diciembre]).

familia(8,teslacrypt,1.12,fecha(4,11,2020),[noviembre,diciembre]).

familia(9,rkor,1.11,fecha(10,3,2020),[marzo,mayo]).

familia(10,reveton,0.70,fecha(29,8,2020),[agosto]).

 

%tipos de archivos

tipos(1,pe).

tipos(2,android).

tipos(3,dll).

tipos(4,gzip).

tipos(5,javascript).

 

%Malware detectable por firma que lleva ransomware

malware(emotet,true,1,[2,3,4]).

malware(ezbot,false,3,[6,1,10,2]).

malware(edridex,false,5,[9,5,3]).

malware(egozi,true,4,[7,10,4]).

malware(edanabot,true,2,[8,1,5]).

%Reglas
%1) Conocer si existe algún ransomware que haya aparecido entre Febrero del 2020 
%y un mes y año pasado como argumento, y cuya probabilidad de aparición sea mayor al 2%. Predicado sugerido para esta regla: regla1/2.

regla1(Mes,Anio) :- familia(_,_,Prob,fecha(_,M,A),_), M >= 2, A >=2020, M =< Mes, M =< Anio, Prob > 2,!.

%2) Mostrar el o los nombres de malware que distribuye el ransomware Matsnu, que sea detectable 
%por firma y cuyo tipo de archivo sea pe o gzip. Predicado sugerido para esta regla: regla2/1.
regla2(Malware) :- malware(Malware,true,NroTipo,Lis), familia(4,matsnu,_,_,_), member(4, Lis), tipos(NroTipo,Tipo), ((Tipo = pe); (Tipo = gzip)).

%Genere una lista con todos los nombres (no repetidos) de ransomware que hayan tenido actividad en Enero pero no en Diciembre, 
%o que haya tenido actividad en Junio y cuyo malware sea detectable por firma. Predicado sugerido para esta regla: regla3/1.
regla3(L) :- findall(Ras, ( (familia(_,Ras,_,_,Lis), member(enero, Lis), not(member(diciembre,Lis))) ;  
                            (familia(Nro,Ras,_,_,Lis), member(junio, Lis), malware(_,true,_,OtraLis), member(Nro, OtraLis))), NL), sort(NL, L).

