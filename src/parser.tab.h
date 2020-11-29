/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_PARSER_TAB_H_INCLUDED
# define YY_YY_PARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    T_void = 258,
    T_int = 259,
    T_double = 260,
    T_bool = 261,
    T_string = 262,
    T_class = 263,
    T_interface = 264,
    T_null = 265,
    T_this = 266,
    T_extends = 267,
    T_implements = 268,
    T_for = 269,
    T_while = 270,
    T_if = 271,
    T_else = 272,
    T_return = 273,
    T_break = 274,
    T_continue = 275,
    T_new = 276,
    T_NewArray = 277,
    T_Print = 278,
    T_ReadInteger = 279,
    T_ReadLine = 280,
    T_dtoi = 281,
    T_itod = 282,
    T_btoi = 283,
    T_itob = 284,
    T_private = 285,
    T_protected = 286,
    T_public = 287,
    T_intConstant = 288,
    T_doubleConstant = 289,
    T_boolConstant = 290,
    T_stringConstant = 291,
    T_ident = 292,
    T_or = 293,
    T_and = 294,
    T_equal = 295,
    T_notEqual = 296,
    T_gte = 297,
    T_lte = 298,
    T_lt = 299
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */
