program conversorDecimalBinarios;
uses crt;
type
	lista = ^nodo;
	nodo = record
		dato:integer;
		sig:lista;
	end;
procedure clearscreen;
var
  i: integer;
begin
  for i := 1 to 50 do
    writeln;
end;
procedure agregarAdelante(var l:lista;d:integer); //add before, adding nodes after nodes
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
		agregarAdelante(bin,b);
		n:=n div 2;
		convR(bin,n);
	end;
end;
procedure muestraYLibera(bin:lista);
var ant:lista;
begin
	writeln;
	writeln('-------------------------------------'); 
	while bin<>nil do begin
		ant:=bin;
  		write(bin^.dato,' ');
		bin:=bin^.sig;
  		dispose(ant);
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
	writeln('-----------------------------------');
	writeln('Conversor de "Decimal" a "Binario".');
	writeln('-----------------------------------');
	writeln;
	write('Escriba numero a convertir (o el 0 para salir): '); //this works while the user don't input 0.
	readln(numero);
	while numero<>0 do begin 
	    binarios:=nil;
		convR(binarios,numero);
		muestraYLibera(binarios);
		writeln;
		writeln('Presione ENTER.');
		readln;
		clrscr;
		write('Escriba numero a convertir (o el 0 para salir): ');
		readln(numero);
	end;
	writeln('Codigo Finalizado.');
end;
begin
	creaYMuestraBinarios;
 	readln;
end.
