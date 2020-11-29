%option noyywrap
%option header-file="lex.yy.h"

%{
#include <iostream>
#include <stdio.h>
#include "parser.tab.h"

const char* ID = "T_ID";
const char* boolLiteral = "T_BOOLEANLITERAL";
const char* integerLiteral = "T_INTLITERAL";
const char* doubleLiteral = "T_DOUBLELITERAL";
const char* stringLiteral = "T_STRINGLITERAL";
void printKeyword(const char* key);
void printID(const char* IDType,const char* value);
#define YY_DECL int yylex()
%}

seperators [\{\}\(\)\[\]\,\;\.]

operators [\+\*\-\=\>\<\|\%\/\?\&]
doubleOperators ((!=)|(==)|(<=)|(>=)|(\|\|)|(\&\&))?

delim [ \t\n\r\f]
ws {delim}+
not_new_line [^\n]
letter [a-zA-Z]
digit [0-9]
id {letter}({letter}|{digit})*
double (({digit}+)\.({digit}*)([eE][-+]?{digit}+)?)
ID ({letter})+({digit}|[_]|{letter})*
string \"{not_new_line}*\"
boolean (true|false)?
hex [a-fA-F0-9]
integer ({digit})+|(0[xX]({hex})+)
comment \/\*(.*)(\n)*\*\/
comment2 \/\/{not_new_line}+ 


%%
{ws} {/* ignore */}
void {return T_void;}
int  {return T_int;}
double  {return T_double;} 
bool  {return T_bool;} 
string  {return T_string; }
class  {return T_class;} 
interface  {return T_interface;} 
null  {return T_null;} 
this  {return T_this;} 
extends  {return T_extends; } 
implements  {return T_implements; } 
for  {return T_for; } 
while  {return T_while; } 
if  {return T_if; } 
else {return T_else;} 
return {return T_return; } 
break {return T_break; }
continue {return T_continue; } 
new {return T_new;}
NewArray { return T_NewArray; }
Print {return T_Print; } 
ReadInteger {return T_ReadInteger; }
ReadLine {return T_ReadLine; }
dtoi {return T_dtoi; }
itod {return T_itod;}
btoi {return T_btoi;}
itob {return T_itob;}
private {return T_private;}
protected {return T_protected;}
public {return T_public;}

{comment2} {}
{comment} {}
{double} {return T_doubleConstant;}
{boolean} {return T_boolConstant;}
{seperators} {printf("%c" , yytext[0]); return yytext[0];}
"<=" 						{return T_lte;}
">=" 						{return T_gte;}
"==" 						{return T_equal;}
"!=" 						{return T_notEqual;}
"\|\|" 						{return T_or;}
"&&" 						{return T_and;}
{operators} { printf("%c" , yytext[0]); return yytext[0];}
{integer} {return T_intConstant;}
{string} {return T_stringConstant; }
{ID} {return T_ident; }
. {printKeyword(yytext);}

%%
 void printKeyword(const char* key){
      fprintf(yyout,"%s\n", key);
 }


 void printID(const char* IDType,const char* value){
     fprintf(yyout, "%s %s\n", IDType, value);

 }

// int main(int argc, char){
//     yylex();
//     yyparse();
// }