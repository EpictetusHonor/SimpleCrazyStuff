program conversorDecimalBinarios;
type
	lista = ^nodo;
	nodo = record
		dato:integer;
		sig:lista;
	end;
procedure liberaMemoria(var list:lista); //in here i dispose all the spaces for doing the things great!
var lsig:lista;
begin
	while list<>nil do begin
		lsig:=list^.sig;
		dispose(list);
		list:=lsig;
	end;
end;
procedure agregarAtras(var l:lista;d:integer); //add after, adding nodes after nodes
var n:lista;
begin
	new(n);
	n^.dato:=d;
	n^.sig:=l;
	l:=n;
end;
procedure convR(var bin:lista;var n:integer); //conversor with recursivity efforts, maked with a dynamic list
var b:integer;
begin
	b:=n mod 2;
	if n <> 0 then begin
		agregarAtras(bin,b);
		n:=n div 2;
		convR(bin,n);
	end;
end;
procedure muestra(bin:lista);
begin
	writeln;
	writeln('-------------------------------------'); 
	while bin<>nil do begin
		write(bin^.dato,' ');
		bin:=bin^.sig;
	end;
	writeln;
	writeln('-------------------------------------'); 
	writeln;
end;
procedure creaYMuestraBinarios; // main axis
var
	numero:integer;
	binarios:lista;
begin
	binarios:=nil;
	writeln('-----------------------------------');
	writeln('Conversor de "Decimal" a "Binario".');
	writeln('-----------------------------------');
	writeln;
	write('Escriba numero a convertir (o el 0 para salir): '); //this works while the user don't input 0.
	readln(numero);
	while numero<>0 do begin
		convR(binarios,numero);
		muestra(binarios);
		liberaMemoria(binarios);
		writeln;
		write('Escriba numero a convertir (o el 0 para salir): ');
		readln(numero);
	end;
	writeln('Codigo Finalizado.');
end;
begin
	creaYMuestraBinarios;
end.
