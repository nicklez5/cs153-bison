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

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
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
    INTEGER = 274,
    NEQ = 275,
    NOT = 276,
    AND = 277,
    OR = 278,
    ASSIGN = 279,
    COMMENT = 280,
    END = 281,
    SEMICOLON = 282,
    COLON = 283,
    COMMA = 284,
    ENDLOOP = 285,
    CONTINUE = 286,
    READ = 287,
    WRITE = 288,
    error_1 = 289,
    error_2 = 290,
    error_3 = 291,
    IF = 292,
    FALSE = 293,
    END_PROGRAM = 294,
    ENDIF = 295,
    ELSE = 296,
    DO = 297,
    BEGIN_PROGRAM = 298,
    ARRAY = 299,
    WHILE = 300,
    TRUE = 301,
    THEN = 302,
    PROGRAM = 303,
    OF = 304,
    BEGINLOOP = 305,
    UMINUS = 306
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 55 "calc3.y" /* yacc.c:1909  */

  double dval;
  int ival;
  char* tokenName;
  struct ExpStruct *ExpType;

#line 113 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
