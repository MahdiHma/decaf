
%{

#include <stdio.h>
#include <stdlib.h>

extern int yylex();
extern int yyparse();
extern FILE *yyin, *yyout;

void yyerror(const char* s);

%}

%token T_void T_int T_double T_bool T_string T_class T_interface T_null T_this T_extends T_implements T_for
%token T_while T_if T_else T_return T_break T_continue T_new T_NewArray T_Print T_ReadInteger T_ReadLine 
%token T_dtoi T_itod T_btoi T_itob T_private T_protected T_public T_intConstant T_doubleConstant T_boolConstant T_stringConstant
%token T_ident T_or T_and T_equal T_notEqual T_gte T_lte

%start Start

%%

Start: 
    Decl Program {fprintf(yyout, "OK");}
;
Program: 
    Decl Program | 
;

Decl: 
    VariableDecl | FunctionDecl | ClassDecl | InterfaceDecl
;

VariableDecl: 
    Variable ';'
;

Variable: 
    Type T_ident
;

Type: 
    T_int | T_double | T_bool | T_string | T_ident | Type '[' ']'
;

FunctionDecl: 
    Type T_ident '(' Formals ')' StmtBlock | T_void T_ident '(' Formals ')' StmtBlock
;

Variables: 
     | ',' Variable Variables 
;

Formals:  
    | Variable Variables
;

ClassDecl: T_class T_ident Extend  Implements '{' Fields '}' ;

Implements: 
     | T_implements T_ident Ids 
;

Ids:
    | ',' T_ident Ids
;

Extend:
    | T_extends T_ident
;

Fields: 
    | Field Fields
;

Field: AccessMode VariableDecl | AccessMode FunctionDecl;

AccessMode: 
    | T_private | T_protected | T_public
;

InterfaceDecl: 
    T_interface T_ident '{' Prototypes '}'
;

Prototypes: 
    | Prototype Prototypes
;

Prototype: 
    Type T_ident '(' Formals ')' ';' | T_void T_ident '(' Formals ')' ';'
;


/* need change */
StmtBlock: 
    '{' VariableDecls Stmts '}'
;

VariableDecls:
    | Variable ';' VariableDecls
;

Stmts: 
    | Stmt Stmts
;

Stmt: 
    SExpr ';' | IfStmt | WhileStmt | ForStmt | BreakStmt | ContinueStmt | ReturnStmt | PrintStmt | StmtBlock
;

SExpr: 
    | Expr
;

IfStmt: 
    T_if '(' Expr ')' Stmt SElse
;

SElse:
    | T_else Stmt
;

WhileStmt: 
    T_while '(' Expr ')' Stmt
;

/* need change */
ForStmt: 
    T_for '(' SExpr ';' Expr ';' SExpr ')' Stmt
;

/* need change */
ReturnStmt: 
    T_return SExpr ';'
;

BreakStmt: 
    T_break ';'
;

ContinueStmt: 
    T_continue ';'
;

/* need change */
PrintStmt: 
    T_Print '(' Expr CExpr ')' ';'
;

CExpr: 
    | ',' Expr CExpr
; 

Expr: 
    LValue '=' Expr | Constant | LValue | T_this | Call | '(' Expr ')'
    | Expr '+' Expr | Expr '-' Expr | Expr '*' Expr | Expr '/' Expr 
    | Expr '%' Expr | '-' Expr | Expr '<' Expr | Expr T_lte Expr 
    | Expr '>' Expr | Expr T_gte Expr | Expr T_equal Expr | Expr T_notEqual Expr 
    | Expr T_and Expr | Expr T_or Expr | '!' Expr | T_ReadInteger '(' ')' 
    | T_ReadLine '(' ')' | T_new T_ident | T_NewArray '(' Expr ',' Type ')' 
    | T_itod '(' Expr ')' | T_dtoi '(' Expr ')' | T_itob '(' Expr ')' | T_btoi '(' Expr ')'
;

LValue: 
    T_ident | Expr '.' T_ident | Expr '[' Expr ']'
;

Call: 
    T_ident '(' Actuals ')' | Expr '.' T_ident '(' Actuals ')'
;

/* need change */
Actuals: 
        | Expr CExpr
;

Constant: 
    T_intConstant | T_doubleConstant | T_boolConstant | T_stringConstant | T_null
;

%%

// int yyerror(char *s)
// {
// 	printf("Syntax Error");
// 	exit(-1);
// }

// int main()
// {
//     yyparse();
//     printf("OK");
//     return 0;
// }

// int main(int argc, char* argv[]) {
//         char* input_file_path = argv[2];
//         char* output_file_path = argv[4];
//         yyin = fopen(input_file_path, "r");
//         yyout = fopen(output_file_path, "w");
//         yyparse();
//         fclose(yyin);
//         fclose(yyout);
// }

// void yyerror(char * s) {
//     fprintf(yyout, "Syntax Error");
// 	exit(1);
// }

// int main(int argc, char* argv[]) {
        // char* input_file_path = argv[2];
        // char* output_file_path = argv[4];
        // yyin = fopen(input_file_path, "r");
        // yyout = fopen(output_file_path, "w");
        // yyparse();
        // fprintf(yyout, "OK");
        // fclose(yyout);
// }
// 
void yyerror(const char *s) {
    fprintf(yyout, "Syntax Error");
	exit(0);
}