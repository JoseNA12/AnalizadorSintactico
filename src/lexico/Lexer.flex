package lexico;
import java_cup.runtime.Symbol;
import sintactico.*;

%%
%class Lexer
%ignorecase
%cup
%line
%{
public String lexeme;
public int line;
%}

// LENGUAGE: ABC
LETRA = [a-zA-Z_]
DIGITO = [0-9]
ESPACIO = [ \t \r \n \f \r\n]
SIMBOLO = [#!$%&?¡_]
// con [ ] funciona mejor, pero son parte de los símbolos de operadores xD
// OPERADOR = "*"|"+"|"-"|"/"|"="|","|"."|";"|":"|"<"|">"|"("|")"|"["|"]"
OPERADOR = ","|";"|"++"|"--"|">="|">"|"<="|"<"|"<>"|"="|"+"|"-"|"*"|"/"|"("|")"|"["|"]"|":="|"."|":"|"+="|"-="|"*="|"/="|">>"|"<<"|"<<="|">>="
ACENTO = [ñÑáéíóúÁÉÍÓÚ]
%%

{ESPACIO} {/*No se procesa*/} // espacio en blanco
"//".* {/*No se procesa*/} // dos slash de comentario
("\(\*" ~"\*\)" | "\(\*" "\*"+ "\)") {/*No se procesa*/} // comentario multilínea
("{" ~"}" | "{" "}") {/*No se procesa*/} // comentario multilínea
"<<EOF>>" {return new Symbol(sym.OPERADOR, yyline, yychar, yytext());}
"," {return new Symbol(sym.OPERADOR, yyline, yychar, yytext());}
";" {return new Symbol(sym.OPERADOR, yyline, yychar, yytext());}
"++" {return new Symbol(sym.OPERADOR_INCREMENTO, yyline, yychar, yytext());}
"--" {return new Symbol(sym.OPERADOR_DISMINUCION, yyline, yychar, yytext());}
">=" {return new Symbol(sym.OPERADOR_MAYOR_IGUAL_QUE, yyline, yychar, yytext());}
">" {return new Symbol(sym.OPERADOR_MAYOR_QUE, yyline, yychar, yytext());}
"<=" {return new Symbol(sym.OPERADOR_MENOR_IGUAL_QUE, yyline, yychar, yytext());}
"<" {return new Symbol(sym.OPERADOR_MENOR_QUE, yyline, yychar, yytext());}
"<>" {return new Symbol(sym.OPERADOR, yyline, yychar, yytext());}
"=" {return new Symbol(sym.OPERADOR_ASIGNACION, yyline, yychar, yytext());}
"+" {return new Symbol(sym.OPERADOR_ADICION, yyline, yychar, yytext());}
"-" {return new Symbol(sym.OPERADOR_SUSTRACCION, yyline, yychar, yytext());}
"*" {return new Symbol(sym.OPERADOR_MULTIPLICACION, yyline, yychar, yytext());}
"/" {return new Symbol(sym.OPERADOR_DIVISION, yyline, yychar, yytext());}
"(" {return new Symbol(sym.OPERADOR_PARENTESIS_ABRIR, yyline, yychar, yytext());}
")" {return new Symbol(sym.OPERADOR_PARENTESIS_CERRAR, yyline, yychar, yytext());}
"[" {return new Symbol(sym.OPERADOR_CORCHETE_ABRIR, yyline, yychar, yytext());}
"]" {return new Symbol(sym.OPERADOR_CORCHETE_CERRAR, yyline, yychar, yytext());}
":=" {return new Symbol(sym.OPERADOR_ASIGNACION, yyline, yychar, yytext());}
"." {return new Symbol(sym.OPERADOR, yyline, yychar, yytext());}
":" {return new Symbol(sym.OPERADOR, yyline, yychar, yytext());}
"+=" {return new Symbol(sym.OPERADOR_ASIGNACION_ADICION, yyline, yychar, yytext());}
"-=" {return new Symbol(sym.OPERADOR_ASIGNACION_SUSTRACCION, yyline, yychar, yytext());}
"*=" {return new Symbol(sym.OPERADOR_ASIGNACION_MULTIPLICACION, yyline, yychar, yytext());}
"/=" {return new Symbol(sym.OPERADOR_ASIGNACION_DIVISION, yyline, yychar, yytext());}
">>" {return new Symbol(sym.OPERADOR_DESPLAZAMIENTO_DERECHA, yyline, yychar, yytext());}
"<<" {return new Symbol(sym.OPERADOR_DESPLAZAMIENTO_IZQUIERDA, yyline, yychar, yytext());}
"<<=" {return new Symbol(sym.OPERADOR_ASIGNACION_DESPLAZAMIENTO_DERECHA, yyline, yychar, yytext());}
">>=" {return new Symbol(sym.OPERADOR_ASIGNACION_DESPLAZAMIENTO_IZQUIERDA, yyline, yychar, yytext());}

"AND" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());}
"ARRAY" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());}
"BEGIN" {return new Symbol(sym.BEGIN, yyline, yychar, yytext());}
"BOOLEAN" {return new Symbol(sym.BOOLEAN, yyline, yychar, yytext());}
"BYTE" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());}
"CASE" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());}
"CHAR" {return new Symbol(sym.CHAR, yyline, yychar, yytext());}
"CONST" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());}
"DIV" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());} // operador
"DO" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());}
"DOWNTO" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());}
"ELSE" {return new Symbol(sym.ELSE, yyline, yychar, yytext());}
"END" {return new Symbol(sym.END, yyline, yychar, yytext());}
"FALSE" {return new Symbol(sym.FALSE, yyline, yychar, yytext());}
"FILE" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());}
"FOR" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());}
"FORWARD" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());}
"FUNCTION" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());}
"GOTO" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());}
"IF" {return new Symbol(sym.IF, yyline, yychar, yytext());}
"IN" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());}
"INLINE" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());}
"INT" {return new Symbol(sym.INT, yyline, yychar, yytext());}
"LABEL" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());}
"LONGINT" {return new Symbol(sym.LONGINT, yyline, yychar, yytext());}
"MOD" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());} // operador
"NIL" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());}
"NOT" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());} // operador
"OF" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());}
"OR" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());} // operador
"PACKED" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());}
"PROCEDURE" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());}
"PROGRAM" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());}
"READ" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());}
"REAL" {return new Symbol(sym.REAL, yyline, yychar, yytext());}
"RECORD" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());}
"REPEAT" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());}
"SET" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());}
"SHORTINT" {return new Symbol(sym.SHORTINT, yyline, yychar, yytext());}
"STRING" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());}
"THEN" {return new Symbol(sym.THEN, yyline, yychar, yytext());}
"TO" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());}
"TRUE" {return new Symbol(sym.TRUE, yyline, yychar, yytext());}
"TYPE" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());}
"UNTIL" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());}
"VAR" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());}
"WHILE" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());}
"WITH" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());}
"WRITE" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());}
"XOR" {return new Symbol(sym.PALABRA_RESERVADA, yyline, yychar, yytext());} // operador


// |-------------------- RECONOCER EXPRESIONES --------------------| // {return new Symbol(sym.OPERADOR, yyline, yychar, yytext());}
// Identificadores
{LETRA}(({LETRA}|{DIGITO}){0, 126})? {return new Symbol(sym.IDENTIFICADOR, yyline, yychar, yytext());}

// Flotantes
(({DIGITO}+"."{DIGITO}+)) |
    (({DIGITO}"."{DIGITO}+)([eE][-]?{DIGITO}+)) {return new Symbol(sym.LITERAL_NUM_FLOTANTE, yyline, yychar, yytext());}

// Literales
((\"[^\"] ~\")|(\"\")) {return new Symbol(sym.LITERAL_STRING, yyline, yychar, yytext());}
//\"({LETRA}|{DIGITO}|{ESPACIO}|{SIMBOLO})*+\" | ("#"{DIGITO}{DIGITO}) {lexeme=yytext(); line=yyline; return LITERAL_STRING;}
("#"{DIGITO}+) {return new Symbol(sym.LITERAL_STRING, yyline, yychar, yytext());}
("(-"{DIGITO}+")")|{DIGITO}+ {return new Symbol(sym.LITERAL_NUM_ENTERO, yyline, yychar, yytext());} // Un numero entero


// |-------------------- RECONOCER ERRORES --------------------| //
// Identificadores
//identificador mayor a 127 caracteres
{LETRA}(({LETRA}|{DIGITO}){127})({LETRA}|{DIGITO})* {return new Symbol(sym.ERROR_IDENTIFICADOR, yyline, yychar, yytext());}
//identificador no comienza con digito
(({DIGITO}+)({LETRA}|{ACENTO}))(({LETRA}|{DIGITO}|{SIMBOLO}|{ACENTO}))* {return new Symbol(sym.ERROR_IDENTIFICADOR, yyline, yychar, yytext());}
//identificador no lleva simbolos
({LETRA}|{ACENTO}|{SIMBOLO})(({LETRA}|{DIGITO}|{SIMBOLO}|{ACENTO}))+ {return new Symbol(sym.ERROR_IDENTIFICADOR, yyline, yychar, yytext());}

// Flotantes
// 12.12.12...
{DIGITO}+"."{DIGITO}+("."{DIGITO}*)+ {return new Symbol(sym.ERROR_LITERAL, yyline, yychar, yytext());}
// .12e12 / .12e / .12  | 12.23e-23.12
("."{DIGITO}+([eE][-]?{DIGITO}*)?) | ({DIGITO}+"."{DIGITO}+([eE][-]?)({DIGITO}*"."{DIGITO}*))* {return new Symbol(sym.ERROR_LITERAL, yyline, yychar, yytext());}
// 12ab.12 | ab12.12
({DIGITO}+{LETRA}+"."{DIGITO}+) | ({LETRA}+{DIGITO}+"."{DIGITO}+) {return new Symbol(sym.ERROR_LITERAL, yyline, yychar, yytext());}
// 12.12ab | 12.ab12
({DIGITO}+"."{DIGITO}+{LETRA}+) | ({DIGITO}+"."{LETRA}+{DIGITO}+) {return new Symbol(sym.ERROR_LITERAL, yyline, yychar, yytext());}
// ab.12ab | ab.ab12
({LETRA}+"."{DIGITO}+{LETRA}+) | ({LETRA}+"."{LETRA}+{DIGITO}+) {return new Symbol(sym.ERROR_LITERAL, yyline, yychar, yytext());}
// 12. | 12e.
({DIGITO}+{LETRA}*".") {return new Symbol(sym.ERROR_LITERAL, yyline, yychar, yytext());}
// 3,14
{DIGITO}+","{DIGITO}+ {return new Symbol(sym.ERROR_LITERAL, yyline, yychar, yytext());}

// Literales
"#"{LETRA}+ {return new Symbol(sym.ERROR_LITERAL, yyline, yychar, yytext());}
'[^'] ~' {return new Symbol(sym.ERROR_LITERAL, yyline, yychar, yytext());}

// Comentarios
\"[^\"]* {return new Symbol(sym.error, yyline, yychar, yytext());}
\(\*[^\)\*]* {return new Symbol(sym.error, yyline, yychar, yytext());}
\{[^\}]* {return new Symbol(sym.error, yyline, yychar, yytext());}

. {return new Symbol(sym.error, yyline, yychar, yytext());}
