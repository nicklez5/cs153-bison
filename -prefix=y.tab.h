/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

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

#ifndef YY_YY_PREFIX_Y_TAB_H_INCLUDED
# define YY_YY_PREFIX_Y_TAB_H_INCLUDED
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
    NUMBER = 258,
    IDENT = 259,
    L_PAREN = 260,
    R_PAREN = 261,
    MINUS = 262,
    MULT = 263,
    DIV = 264,
    MOD = 265,
    PLUS = 266,
    SUB = 267,
    LT = 268,
    LTE = 269,
    GT = 270,
    GTE = 271,
    EQUAL = 272,
    EQ = 273,
    NEQ = 274,
    NOT = 275,
    AND = 276,
    OR = 277,
    ASSIGN = 278,
    COMMENT = 279,
    END = 280,
    SEMICOLON = 281,
    COLON = 282,
    COMMA = 283,
    ENDLOOP = 284,
    CONTINUE = 285,
    READ = 286,
    WRITE = 287,
    error_1 = 288,
    error_2 = 289,
    error_3 = 290,
    IF = 291,
    FALSE = 292,
    END_PROGRAM = 293,
    ENDIF = 294,
    ELSE = 295,
    DO = 296,
    BEGIN_PROGRAM = 297,
    ARRAY = 298,
    WHILE = 299,
    TRUE = 300,
    THEN = 301,
    PROGRAM = 302,
    OF = 303,
    BEGINLOOP = 304,
    UMINUS = 305
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 18 "calc.y" /* yacc.c:1909  */

  double dval;
  int ival;
  char* tokenName;

#line 111 "-prefix=y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_PREFIX_Y_TAB_H_INCLUDED  */
