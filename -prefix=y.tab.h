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
    MULT = 260,
    DIV = 261,
    PLUS = 262,
    INTEGER = 263,
    SUB = 264,
    EQUAL = 265,
    L_PAREN = 266,
    R_PAREN = 267,
    END = 268,
    MOD = 269,
    EQ = 270,
    NEQ = 271,
    LT = 272,
    GT = 273,
    LTE = 274,
    GTE = 275,
    SEMICOLON = 276,
    COLON = 277,
    COMMA = 278,
    ASSIGN = 279,
    ENDLOOP = 280,
    CONTINUE = 281,
    READ = 282,
    WRITE = 283,
    error_1 = 284,
    error_2 = 285,
    error_3 = 286,
    COMMENT = 287,
    IF = 288,
    NOT = 289,
    FALSE = 290,
    END_PROGRAM = 291,
    ENDIF = 292,
    ELSE = 293,
    DO = 294,
    BEGIN_PROGRAM = 295,
    ARRAY = 296,
    AND = 297,
    WHILE = 298,
    TRUE = 299,
    THEN = 300,
    PROGRAM = 301,
    OR = 302,
    OF = 303,
    BEGINLOOP = 304,
    MINUS = 305,
    UMINUS = 306
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

#line 112 "-prefix=y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_PREFIX_Y_TAB_H_INCLUDED  */
