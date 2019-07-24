/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison implementation for Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "3.0.4"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* Copy the first part of user declarations.  */
#line 4 "calc.y" /* yacc.c:339  */

	#include <stdio.h>
	#include <stdlib.h>
	#include "linked_list.h"	
	#include <string.h>
	void yyerror(const char *msg);
	double findMod(double a, double b);
	char *my_itoa(char *dest,int i);
	char *return_ascii(int i);
	int bool_value(int dest);
	extern int num_pos ;
	extern int num_line;
	const char *program_name; 
	char *totalLine;
	#define ITOA(n) my_itoa((char [41]) {0},(n))
	#define BUZZ_SIZE 1024
	char str[12];
	char str2[12];
	char str3[12]; 
	char str4[12];
	int point_number = 0;
	int term_number = 0;
	int current_value = 0;
	char *cur_string_value;
	int finished_looping = 0; 
	int fresh_term = 0;
	int dont_loop = 0;
	int check_bool_type = 0;
	int loop_token = 0;
	struct node *list_var;
	struct node *list_func;
	FILE *yyin;
	FILE *yyout;
	/*extern int yylex(void); */

#line 102 "y.tab.c" /* yacc.c:339  */

# ifndef YY_NULLPTR
#  if defined __cplusplus && 201103L <= __cplusplus
#   define YY_NULLPTR nullptr
#  else
#   define YY_NULLPTR 0
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 1
#endif

/* In a future release of Bison, this section will be replaced
   by #include "y.tab.h".  */
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
#line 40 "calc.y" /* yacc.c:355  */

  double dval;
  int ival;
  char* tokenName;

#line 200 "y.tab.c" /* yacc.c:355  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */

/* Copy the second part of user declarations.  */

#line 217 "y.tab.c" /* yacc.c:358  */

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef YY_ATTRIBUTE
# if (defined __GNUC__                                               \
      && (2 < __GNUC__ || (__GNUC__ == 2 && 96 <= __GNUC_MINOR__)))  \
     || defined __SUNPRO_C && 0x5110 <= __SUNPRO_C
#  define YY_ATTRIBUTE(Spec) __attribute__(Spec)
# else
#  define YY_ATTRIBUTE(Spec) /* empty */
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# define YY_ATTRIBUTE_PURE   YY_ATTRIBUTE ((__pure__))
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# define YY_ATTRIBUTE_UNUSED YY_ATTRIBUTE ((__unused__))
#endif

#if !defined _Noreturn \
     && (!defined __STDC_VERSION__ || __STDC_VERSION__ < 201112)
# if defined _MSC_VER && 1200 <= _MSC_VER
#  define _Noreturn __declspec (noreturn)
# else
#  define _Noreturn YY_ATTRIBUTE ((__noreturn__))
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN \
    _Pragma ("GCC diagnostic push") \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")\
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif


#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYSIZE_T yynewbytes;                                            \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / sizeof (*yyptr);                          \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, (Count) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYSIZE_T yyi;                         \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  4
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   132

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  52
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  28
/* YYNRULES -- Number of rules.  */
#define YYNRULES  65
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  136

/* YYTRANSLATE[YYX] -- Symbol number corresponding to YYX as returned
   by yylex, with out-of-bounds checking.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   306

#define YYTRANSLATE(YYX)                                                \
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, without out-of-bounds checking.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_uint8 yyrline[] =
{
       0,    68,    68,    72,    75,    76,    79,    82,    83,    84,
      87,    88,    91,    92,    93,    94,    95,    96,    99,   103,
     104,   107,   110,   113,   114,   117,   118,   121,   124,   125,
     128,   131,   134,   135,   138,   139,   143,   145,   147,   149,
     151,   153,   155,   156,   159,   160,   161,   162,   163,   164,
     167,   171,   173,   175,   178,   182,   185,   187,   189,   192,
     194,   196,   198,   200,   204,   207
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 1
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "NUMBER", "IDENT", "L_PAREN", "R_PAREN",
  "MINUS", "MULT", "DIV", "MOD", "PLUS", "SUB", "LT", "LTE", "GT", "GTE",
  "EQUAL", "EQ", "INTEGER", "NEQ", "NOT", "AND", "OR", "ASSIGN", "COMMENT",
  "END", "SEMICOLON", "COLON", "COMMA", "ENDLOOP", "CONTINUE", "READ",
  "WRITE", "error_1", "error_2", "error_3", "IF", "FALSE", "END_PROGRAM",
  "ENDIF", "ELSE", "DO", "BEGIN_PROGRAM", "ARRAY", "WHILE", "TRUE", "THEN",
  "PROGRAM", "OF", "BEGINLOOP", "UMINUS", "$accept", "program", "block",
  "block_helper", "declaration", "declaration_helper",
  "declaration_helper2", "statement", "expression_statement",
  "ifelse_statement", "while_statement", "dobegin_statement",
  "readwrite_statement", "readwrite_helper", "continue_statement",
  "statement_helper", "bool_exp", "relation_and_exp",
  "relation_and_helper", "bool_exp_helper", "relation_exp", "comp",
  "expression", "expression_helper", "mult_exp", "mult_exp_helper", "term",
  "var", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302,   303,   304,
     305,   306
};
# endif

#define YYPACT_NINF -66

#define yypact_value_is_default(Yystate) \
  (!!((Yystate) == (-66)))

#define YYTABLE_NINF -8

#define yytable_value_is_error(Yytable_value) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int8 yypact[] =
{
     -39,    57,    71,    50,   -66,    20,    10,    44,    42,    64,
      65,    94,   -66,   -66,    31,    20,     9,   -66,    95,   -66,
      97,    97,     8,    52,     8,    76,   -66,   -66,   -66,   -66,
     -66,   -66,   -66,    80,   -66,   -66,   100,   -66,    92,    79,
      79,   -66,     8,    47,    13,   -66,   -66,    62,    87,    89,
      74,    19,    28,   -66,    31,    63,    31,    92,   109,    92,
     108,    97,   -66,   -66,   110,    66,   -66,    92,     8,   -66,
     -66,    74,    31,     8,   -66,     8,   -66,   -66,   -66,   -66,
     -66,   -66,   -66,    92,    92,    92,   -66,    92,    92,    92,
     -66,    85,    31,   -66,   -66,   111,   112,   -66,    79,   -66,
     -66,   113,   114,    92,    -9,    87,    89,   -66,    19,    19,
      28,    28,    28,    77,    91,    75,   -66,   -66,   -66,   -66,
     -66,    31,   -66,   -66,   -66,   -66,   -66,   -66,   -66,     8,
     -66,   104,    86,   -66,   -66,   -66
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,     0,     0,     0,     1,     4,     7,     0,     0,     0,
       0,     7,     8,     2,    28,     4,     0,     9,    64,    27,
       0,     0,     0,     0,     0,     0,    12,    13,    14,    15,
      16,    17,     3,     0,     5,    11,     0,     6,     0,    25,
      25,    60,     0,     0,     0,    37,    36,     0,    34,    32,
       0,    51,    55,    59,    28,     0,    28,     0,     0,     0,
       0,     0,    23,    24,     0,     0,    61,     0,     0,    41,
      40,     0,    28,     0,    30,     0,    31,    46,    48,    47,
      49,    44,    45,     0,     0,     0,    50,     0,     0,     0,
      54,     0,    28,    29,    18,     0,     0,    65,    25,    42,
      62,     0,     0,     0,     0,    34,    32,    38,    51,    51,
      55,    55,    55,     0,     0,     0,    26,    63,    43,    39,
      19,    28,    35,    33,    53,    52,    56,    57,    58,     0,
      21,     0,     0,    22,    10,    20
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -66,   -66,   -66,   115,   -66,    16,   -66,   -66,   -66,   -66,
     -66,   -66,   -66,   -38,   -66,   -51,   -23,    54,    22,    24,
      56,    61,   -34,   -65,   -10,   -55,   -22,   -14
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
      -1,     2,     7,     8,     9,    10,    37,    25,    26,    27,
      28,    29,    30,    62,    31,    32,    47,    48,    76,    74,
      49,    83,    50,    86,    51,    90,    52,    53
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
      33,    55,    63,    91,    60,    93,    39,    40,    65,     1,
      71,    41,    18,    42,     6,    43,    41,    18,    68,    64,
      43,   104,    12,    94,     6,    96,    84,    17,    35,    44,
      85,   120,   121,   101,    65,    18,    87,    88,    89,    11,
      33,   114,    33,   124,   125,   102,    45,    98,    -7,   107,
      66,    69,    67,    36,    46,   126,   127,   128,    33,    70,
     116,     3,    19,    20,    21,   110,   111,   112,    22,   119,
     132,     4,   100,    23,   108,   109,    24,     5,    33,    77,
      78,    79,    80,    13,    81,    14,    82,    77,    78,    79,
      80,    15,    81,    16,    82,    41,    18,    59,     6,    43,
      38,    18,    54,    56,    57,    58,   133,    33,    61,    72,
      73,    75,    95,    92,    97,   113,    99,   115,   100,   117,
     118,   130,   129,   134,   131,     0,   135,   105,   123,   122,
      34,   106,   103
};

static const yytype_int16 yycheck[] =
{
      14,    24,    40,    54,    38,    56,    20,    21,    42,    48,
      44,     3,     4,     5,     4,     7,     3,     4,     5,    42,
       7,    72,     6,    57,     4,    59,     7,    11,    19,    21,
      11,    40,    41,    67,    68,     4,     8,     9,    10,    29,
      54,    92,    56,   108,   109,    68,    38,    61,    28,    83,
       3,    38,     5,    44,    46,   110,   111,   112,    72,    46,
      98,     4,    31,    32,    33,    87,    88,    89,    37,   103,
     121,     0,     6,    42,    84,    85,    45,    27,    92,    13,
      14,    15,    16,    39,    18,    43,    20,    13,    14,    15,
      16,    27,    18,    28,    20,     3,     4,     5,     4,     7,
       5,     4,    50,    27,    24,     5,   129,   121,    29,    47,
      23,    22,     3,    50,     6,    30,     6,     6,     6,     6,
       6,    30,    45,    19,    49,    -1,    40,    73,   106,   105,
      15,    75,    71
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    48,    53,     4,     0,    27,     4,    54,    55,    56,
      57,    29,    57,    39,    43,    27,    28,    57,     4,    31,
      32,    33,    37,    42,    45,    59,    60,    61,    62,    63,
      64,    66,    67,    79,    55,    19,    44,    58,     5,    79,
      79,     3,     5,     7,    21,    38,    46,    68,    69,    72,
      74,    76,    78,    79,    50,    68,    27,    24,     5,     5,
      74,    29,    65,    65,    68,    74,     3,     5,     5,    38,
      46,    74,    47,    23,    71,    22,    70,    13,    14,    15,
      16,    18,    20,    73,     7,    11,    75,     8,     9,    10,
      77,    67,    50,    67,    74,     3,    74,     6,    79,     6,
       6,    74,    68,    73,    67,    69,    72,    74,    76,    76,
      78,    78,    78,    30,    67,     6,    65,     6,     6,    74,
      40,    41,    71,    70,    75,    75,    77,    77,    77,    45,
      30,    49,    67,    68,    19,    40
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    52,    53,    54,    55,    55,    56,    57,    57,    57,
      58,    58,    59,    59,    59,    59,    59,    59,    60,    61,
      61,    62,    63,    64,    64,    65,    65,    66,    67,    67,
      68,    69,    70,    70,    71,    71,    72,    72,    72,    72,
      72,    72,    72,    72,    73,    73,    73,    73,    73,    73,
      74,    75,    75,    75,    76,    77,    77,    77,    77,    78,
      78,    78,    78,    78,    79,    79
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     5,     3,     0,     3,     3,     0,     2,     3,
       6,     1,     1,     1,     1,     1,     1,     1,     3,     5,
       7,     5,     6,     3,     3,     0,     3,     1,     0,     3,
       2,     2,     0,     3,     0,     3,     1,     1,     3,     4,
       2,     2,     3,     4,     1,     1,     1,     1,     1,     1,
       2,     0,     3,     3,     2,     0,     3,     3,     3,     1,
       1,     2,     3,     4,     1,     4
};


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                  \
do                                                              \
  if (yychar == YYEMPTY)                                        \
    {                                                           \
      yychar = (Token);                                         \
      yylval = (Value);                                         \
      YYPOPSTACK (yylen);                                       \
      yystate = *yyssp;                                         \
      goto yybackup;                                            \
    }                                                           \
  else                                                          \
    {                                                           \
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;                                                  \
    }                                                           \
while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256



/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)

/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*----------------------------------------.
| Print this symbol's value on YYOUTPUT.  |
`----------------------------------------*/

static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  FILE *yyo = yyoutput;
  YYUSE (yyo);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# endif
  YYUSE (yytype);
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyoutput, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yytype_int16 *yyssp, YYSTYPE *yyvsp, int yyrule)
{
  unsigned long int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[yyssp[yyi + 1 - yynrhs]],
                       &(yyvsp[(yyi + 1) - (yynrhs)])
                                              );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
static YYSIZE_T
yystrlen (const char *yystr)
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
static char *
yystpcpy (char *yydest, const char *yysrc)
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
        switch (*++yyp)
          {
          case '\'':
          case ',':
            goto do_not_strip_quotes;

          case '\\':
            if (*++yyp != '\\')
              goto do_not_strip_quotes;
            /* Fall through.  */
          default:
            if (yyres)
              yyres[yyn] = *yyp;
            yyn++;
            break;

          case '"':
            if (yyres)
              yyres[yyn] = '\0';
            return yyn;
          }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYSIZE_T yysize1 = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (! (yysize <= yysize1
                         && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                    return 2;
                  yysize = yysize1;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    YYSIZE_T yysize1 = yysize + yystrlen (yyformat);
    if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
      return 2;
    yysize = yysize1;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
{
  YYUSE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        YYSTYPE *yyvs1 = yyvs;
        yytype_int16 *yyss1 = yyss;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * sizeof (*yyssp),
                    &yyvs1, yysize * sizeof (*yyvsp),
                    &yystacksize);

        yyss = yyss1;
        yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yytype_int16 *yyss1 = yyss;
        union yyalloc *yyptr =
          (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
                  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 68 "calc.y" /* yacc.c:1646  */
    {  }
#line 1392 "y.tab.c" /* yacc.c:1646  */
    break;

  case 3:
#line 72 "calc.y" /* yacc.c:1646  */
    { (yyval.tokenName) = "";  }
#line 1398 "y.tab.c" /* yacc.c:1646  */
    break;

  case 4:
#line 75 "calc.y" /* yacc.c:1646  */
    {(yyval.tokenName) = ""; }
#line 1404 "y.tab.c" /* yacc.c:1646  */
    break;

  case 5:
#line 76 "calc.y" /* yacc.c:1646  */
    {(yyval.tokenName) = "";    }
#line 1410 "y.tab.c" /* yacc.c:1646  */
    break;

  case 6:
#line 79 "calc.y" /* yacc.c:1646  */
    { if(strcmp((yyvsp[0].tokenName),"integer") == 1) {sprintf(str, "   .[] _%s, %s", (yyvsp[-2].tokenName),(yyvsp[0].tokenName)); sprintf(str2," _%s",(yyvsp[-2].tokenName)); sprintf(str3,"%s",(yyvsp[-2].tokenName)); node_insert(&list_var,str2,str,str3);    (yyval.tokenName) = str; } (yyval.tokenName) = (yyvsp[-2].tokenName); dont_loop = 0;}
#line 1416 "y.tab.c" /* yacc.c:1646  */
    break;

  case 7:
#line 82 "calc.y" /* yacc.c:1646  */
    {(yyval.tokenName) = ""; }
#line 1422 "y.tab.c" /* yacc.c:1646  */
    break;

  case 8:
#line 83 "calc.y" /* yacc.c:1646  */
    {dont_loop = 0; (yyval.tokenName) = (yyvsp[-1].tokenName); int x; x = *(yyvsp[-1].tokenName); dont_loop = 1; sprintf(str,"   . _%s",(yyvsp[-1].tokenName)); sprintf(str2," _%s",(yyvsp[-1].tokenName)); sprintf(str3,"%d",x); if(search_value(list_var,str3) == 1){ node_insert(&list_var,str2,str,str3); }    }
#line 1428 "y.tab.c" /* yacc.c:1646  */
    break;

  case 9:
#line 84 "calc.y" /* yacc.c:1646  */
    {  int x; x = *(yyvsp[-2].tokenName); dont_loop = 1; sprintf(str,"   . _%s",(yyvsp[-2].tokenName)); sprintf(str2," _%s",(yyvsp[-2].tokenName)); sprintf(str3,"%d",x); if(search_value(list_var,str3) == 1){ node_insert(&list_var,str2,str,str3);   }  (yyval.tokenName) = (yyvsp[-2].tokenName); }
#line 1434 "y.tab.c" /* yacc.c:1646  */
    break;

  case 10:
#line 87 "calc.y" /* yacc.c:1646  */
    { sprintf(str, "%d",(yyvsp[-3].ival)); (yyval.tokenName) = str;  }
#line 1440 "y.tab.c" /* yacc.c:1646  */
    break;

  case 11:
#line 88 "calc.y" /* yacc.c:1646  */
    {(yyval.tokenName) = "integer";  }
#line 1446 "y.tab.c" /* yacc.c:1646  */
    break;

  case 12:
#line 91 "calc.y" /* yacc.c:1646  */
    {(yyval.tokenName) = "";  }
#line 1452 "y.tab.c" /* yacc.c:1646  */
    break;

  case 13:
#line 92 "calc.y" /* yacc.c:1646  */
    {(yyval.tokenName) = "";  }
#line 1458 "y.tab.c" /* yacc.c:1646  */
    break;

  case 14:
#line 93 "calc.y" /* yacc.c:1646  */
    { (yyval.tokenName) = (yyvsp[0].tokenName); }
#line 1464 "y.tab.c" /* yacc.c:1646  */
    break;

  case 15:
#line 94 "calc.y" /* yacc.c:1646  */
    {(yyval.tokenName) = ""; }
#line 1470 "y.tab.c" /* yacc.c:1646  */
    break;

  case 16:
#line 95 "calc.y" /* yacc.c:1646  */
    {(yyval.tokenName) = (yyvsp[0].tokenName); }
#line 1476 "y.tab.c" /* yacc.c:1646  */
    break;

  case 17:
#line 96 "calc.y" /* yacc.c:1646  */
    {(yyval.tokenName) = ""; }
#line 1482 "y.tab.c" /* yacc.c:1646  */
    break;

  case 18:
#line 99 "calc.y" /* yacc.c:1646  */
    { char* x; x = return_ascii((yyvsp[-2].ival)); sprintf(str,"%d",(yyvsp[0].ival)); sprintf(str2," =%s,%s",value_return(list_var,x),value_return(list_var,str)); node_insert(&list_var,"","",str2); (yyval.tokenName) = value_return(list_var,x);   }
#line 1488 "y.tab.c" /* yacc.c:1646  */
    break;

  case 19:
#line 103 "calc.y" /* yacc.c:1646  */
    { (yyval.tokenName) = "";  }
#line 1494 "y.tab.c" /* yacc.c:1646  */
    break;

  case 20:
#line 104 "calc.y" /* yacc.c:1646  */
    { (yyval.tokenName) = ""; }
#line 1500 "y.tab.c" /* yacc.c:1646  */
    break;

  case 21:
#line 107 "calc.y" /* yacc.c:1646  */
    {char* predicate_id; predicate_id = value_return(list_var,(yyvsp[-3].tokenName)); char* label; label = value_return(list_var,(yyvsp[-1].tokenName)); sprintf(str,"?:= L%d,%s",loop_token,predicate_id); node_insert(&list_func,"","",str); node_insert(&list_func,"","","L");  sprintf(str2,"L%d",loop_token);  (yyval.tokenName) = str2; loop_token++;         }
#line 1506 "y.tab.c" /* yacc.c:1646  */
    break;

  case 22:
#line 110 "calc.y" /* yacc.c:1646  */
    { (yyval.tokenName) = "";   }
#line 1512 "y.tab.c" /* yacc.c:1646  */
    break;

  case 23:
#line 113 "calc.y" /* yacc.c:1646  */
    {char* x; x = return_ascii((yyvsp[-1].ival)); sprintf(str,"   .<%s",value_return(list_var,x)); sprintf(str2," t%d",term_number); sprintf(str3,".<%s",value_return(list_var,x)); node_insert(&list_var,str2,str,str3); node_insert(&list_func,"","",str3);   (yyval.tokenName) = str3;    }
#line 1518 "y.tab.c" /* yacc.c:1646  */
    break;

  case 24:
#line 114 "calc.y" /* yacc.c:1646  */
    {char* x; x = return_ascii((yyvsp[-1].ival)); sprintf(str,"   .>%s",value_return(list_var,x)); sprintf(str2," t%d",term_number); sprintf(str3,".>%s",value_return(list_var,x)); node_insert(&list_var,str2,str,str3); node_insert(&list_func,"","",str3);  (yyval.tokenName) = str3;  }
#line 1524 "y.tab.c" /* yacc.c:1646  */
    break;

  case 25:
#line 117 "calc.y" /* yacc.c:1646  */
    {(yyval.tokenName) = ""; }
#line 1530 "y.tab.c" /* yacc.c:1646  */
    break;

  case 26:
#line 118 "calc.y" /* yacc.c:1646  */
    {  }
#line 1536 "y.tab.c" /* yacc.c:1646  */
    break;

  case 27:
#line 121 "calc.y" /* yacc.c:1646  */
    {(yyval.tokenName) = "";  }
#line 1542 "y.tab.c" /* yacc.c:1646  */
    break;

  case 28:
#line 124 "calc.y" /* yacc.c:1646  */
    { (yyval.tokenName) = ""; }
#line 1548 "y.tab.c" /* yacc.c:1646  */
    break;

  case 29:
#line 125 "calc.y" /* yacc.c:1646  */
    { (yyval.tokenName) = (yyvsp[-2].tokenName); /* char *x; x = value_return(temp,$1);   sprintf(str,":L%d\n",loop_num);  fprintf(fp,str) */ }
#line 1554 "y.tab.c" /* yacc.c:1646  */
    break;

  case 30:
#line 128 "calc.y" /* yacc.c:1646  */
    {char *left_id; left_id = value_return(list_var,(yyvsp[-1].tokenName)); if(strlen((yyvsp[0].tokenName)) == 0){ (yyval.tokenName) = (yyvsp[-1].tokenName); } else {char *right_id; right_id = value_return(list_var,(yyvsp[0].tokenName)); sprintf(str2," t%d",term_number); sprintf(str3,"|| t%d,%s,%s",term_number,left_id,right_id); sprintf(str4,"   %s",str3); if(search_value(list_var,str3) == 1){ node_insert(&list_var,str2,str4,str3); node_insert(&list_func,"","",str3);   term_number++; } (yyval.tokenName) = str3; } }
#line 1560 "y.tab.c" /* yacc.c:1646  */
    break;

  case 31:
#line 131 "calc.y" /* yacc.c:1646  */
    { char* left_id; left_id = value_return(list_var,(yyvsp[-1].tokenName)); if(strlen((yyvsp[0].tokenName)) == 0){ (yyval.tokenName) = (yyvsp[-1].tokenName); }else{char* right_id; right_id = value_return(list_var,(yyvsp[0].tokenName)); sprintf(str2," t%d",term_number); sprintf(str3,"&& t%d,%s,%s",term_number,left_id,right_id); sprintf(str4,"   %s",str3); if(search_value(list_var,str3) == 1){ node_insert(&list_var,str2,str4,str3); node_insert(&list_func,"","",str3);  term_number++; } (yyval.tokenName) = str3;   }   }
#line 1566 "y.tab.c" /* yacc.c:1646  */
    break;

  case 32:
#line 134 "calc.y" /* yacc.c:1646  */
    {(yyval.tokenName) = "";  }
#line 1572 "y.tab.c" /* yacc.c:1646  */
    break;

  case 33:
#line 135 "calc.y" /* yacc.c:1646  */
    { (yyval.tokenName) = (yyvsp[-1].tokenName);  }
#line 1578 "y.tab.c" /* yacc.c:1646  */
    break;

  case 34:
#line 138 "calc.y" /* yacc.c:1646  */
    {(yyval.tokenName) = "";   }
#line 1584 "y.tab.c" /* yacc.c:1646  */
    break;

  case 35:
#line 139 "calc.y" /* yacc.c:1646  */
    { (yyval.tokenName) = (yyvsp[-1].tokenName);  }
#line 1590 "y.tab.c" /* yacc.c:1646  */
    break;

  case 36:
#line 143 "calc.y" /* yacc.c:1646  */
    {(yyval.tokenName) = "True";  char *x = "True"; sprintf(str,"%s",x); sprintf(str2," t%d",term_number); if(search_value(list_var,str) == 1){ sprintf(str3,"   . t%d",term_number); node_insert(&list_var,str2,str3,x);  term_number++;   }  }
#line 1596 "y.tab.c" /* yacc.c:1646  */
    break;

  case 37:
#line 145 "calc.y" /* yacc.c:1646  */
    { (yyval.tokenName) = "False"; char *x = "False"; sprintf(str,"%s",x); sprintf(str2," t%d",term_number); if(search_value(list_var,str) == 1){ sprintf(str3,"   . t%d",term_number); node_insert(&list_var,str2,str3,x); term_number++; } }
#line 1602 "y.tab.c" /* yacc.c:1646  */
    break;

  case 38:
#line 147 "calc.y" /* yacc.c:1646  */
    {sprintf(str,"%c",(yyvsp[-2].ival)); if(bool_value((yyvsp[0].ival)) == 1){ sprintf(str2,"%c",(yyvsp[0].ival)); }else { sprintf(str2,"%d",(yyvsp[0].ival)); } char *src2; src2 = value_return(list_var,str); char *src3;  src3 = value_return(list_var,str2); sprintf(str3,"   %s t%d,%s,%s",(yyvsp[-1].tokenName),term_number,src2,src3); sprintf(str2," t%d",term_number); sprintf(str,"  . t%d",term_number); (yyval.tokenName) = str3;  node_insert(&list_var,str2,str,str3); node_insert(&list_func,"","",str3); term_number++; (yyval.tokenName) = str3;   }
#line 1608 "y.tab.c" /* yacc.c:1646  */
    break;

  case 39:
#line 149 "calc.y" /* yacc.c:1646  */
    {sprintf(str,"%c",(yyvsp[-2].ival)); if(bool_value((yyvsp[0].ival)) == 1){ sprintf(str2,"%c",(yyvsp[0].ival)); }else { sprintf(str2,"%d",(yyvsp[0].ival)); } char *src2; src2 = value_return(list_var,str); char *src3; src3 = value_return(list_var,str2); sprintf(str3,"   %s t%d,%s,%s",(yyvsp[-1].tokenName),term_number,src2,src3); sprintf(str2," t%d",term_number); sprintf(str,"   . t%d",term_number); (yyval.tokenName) = str3;  node_insert(&list_var,str2,str,str3); node_insert(&list_func,"","",str3);  term_number++; sprintf(str4,"! t%d,%s",term_number,str2); term_number++; sprintf(str2," t%d",term_number); sprintf(str,"   . t%d",term_number); node_insert(&list_var,str2,str,str4); node_insert(&list_func,"","",str4);  (yyval.tokenName) = str4;  }
#line 1614 "y.tab.c" /* yacc.c:1646  */
    break;

  case 40:
#line 151 "calc.y" /* yacc.c:1646  */
    { (yyval.tokenName) = "Not True"; char *x = "Not True"; sprintf(str,"%s",x); sprintf(str2," t%d",term_number); sprintf(str3,"   t%d",term_number); if(search_value(list_var,str) == 1){ node_insert(&list_var,str2,str3,x); term_number++; } }
#line 1620 "y.tab.c" /* yacc.c:1646  */
    break;

  case 41:
#line 153 "calc.y" /* yacc.c:1646  */
    { (yyval.tokenName) = "Not False"; char *x = "Not False"; sprintf(str,"%s",x); sprintf(str2," t%d",term_number); sprintf(str3,"   t%d\n",term_number); if(search_value(list_var,str) == 1){ node_insert(&list_var,str2,str3,x);   term_number++; } }
#line 1626 "y.tab.c" /* yacc.c:1646  */
    break;

  case 42:
#line 155 "calc.y" /* yacc.c:1646  */
    { sprintf(str,"%s",(yyvsp[-1].tokenName)); (yyval.tokenName) = (yyvsp[-1].tokenName);  }
#line 1632 "y.tab.c" /* yacc.c:1646  */
    break;

  case 43:
#line 156 "calc.y" /* yacc.c:1646  */
    { sprintf(str,"%s",(yyvsp[-1].tokenName));  (yyval.tokenName) = (yyvsp[-1].tokenName); }
#line 1638 "y.tab.c" /* yacc.c:1646  */
    break;

  case 44:
#line 159 "calc.y" /* yacc.c:1646  */
    {(yyval.tokenName) = "==";  }
#line 1644 "y.tab.c" /* yacc.c:1646  */
    break;

  case 45:
#line 160 "calc.y" /* yacc.c:1646  */
    {(yyval.tokenName) = "!="; }
#line 1650 "y.tab.c" /* yacc.c:1646  */
    break;

  case 46:
#line 161 "calc.y" /* yacc.c:1646  */
    { (yyval.tokenName) = "<"; }
#line 1656 "y.tab.c" /* yacc.c:1646  */
    break;

  case 47:
#line 162 "calc.y" /* yacc.c:1646  */
    { (yyval.tokenName) = ">"; }
#line 1662 "y.tab.c" /* yacc.c:1646  */
    break;

  case 48:
#line 163 "calc.y" /* yacc.c:1646  */
    { (yyval.tokenName) = "<="; }
#line 1668 "y.tab.c" /* yacc.c:1646  */
    break;

  case 49:
#line 164 "calc.y" /* yacc.c:1646  */
    { (yyval.tokenName) = ">="; }
#line 1674 "y.tab.c" /* yacc.c:1646  */
    break;

  case 50:
#line 167 "calc.y" /* yacc.c:1646  */
    {(yyval.ival) = (yyvsp[-1].ival); }
#line 1680 "y.tab.c" /* yacc.c:1646  */
    break;

  case 51:
#line 171 "calc.y" /* yacc.c:1646  */
    {(yyval.ival) = 0;  }
#line 1686 "y.tab.c" /* yacc.c:1646  */
    break;

  case 52:
#line 173 "calc.y" /* yacc.c:1646  */
    { fresh_term = 0; if(bool_value((yyvsp[-1].ival)) == 1){ sprintf(str,"%c",(yyvsp[-1].ival)); } else {sprintf(str,"%d",(yyvsp[-1].ival)); } char *src2; src2 = value_return(list_var,str);  sprintf(str2,"+ t%d,%s,%s",term_number, cur_string_value , src2); sprintf(str3," t%d",term_number); sprintf(str4,"   .%s",str2); node_insert(&list_var,str3,str4,str2); node_insert(&list_func,"","",str2); term_number++;   (yyval.ival) = (yyvsp[-1].ival); }
#line 1692 "y.tab.c" /* yacc.c:1646  */
    break;

  case 53:
#line 175 "calc.y" /* yacc.c:1646  */
    { fresh_term = 0; if(bool_value((yyvsp[-1].ival)) == 1){ sprintf(str,"%c",(yyvsp[-1].ival)); } else {sprintf(str,"%d",(yyvsp[-1].ival)); } char *src2; src2 = value_return(list_var,str);  sprintf(str2,"- t%d,%s,%s",term_number, cur_string_value , src2); sprintf(str3," t%d",term_number); sprintf(str4,"   .%s",str2); node_insert(&list_var,str3,str4,str2); node_insert(&list_func,"","",str2); term_number++; (yyval.ival) = (yyvsp[-1].ival);  }
#line 1698 "y.tab.c" /* yacc.c:1646  */
    break;

  case 54:
#line 178 "calc.y" /* yacc.c:1646  */
    {(yyval.ival) = (yyvsp[-1].ival); }
#line 1704 "y.tab.c" /* yacc.c:1646  */
    break;

  case 55:
#line 182 "calc.y" /* yacc.c:1646  */
    {  }
#line 1710 "y.tab.c" /* yacc.c:1646  */
    break;

  case 56:
#line 185 "calc.y" /* yacc.c:1646  */
    {fresh_term = 0; if(bool_value((yyvsp[-1].ival)) == 1){ sprintf(str,"%c",(yyvsp[-1].ival)); }else {sprintf(str,"%d",(yyvsp[-1].ival)); } char* src2; src2 = value_return(list_var,str); sprintf(str2,"* t%d,%s,%s",term_number, cur_string_value, src2); sprintf(str3," t%d",term_number); sprintf(str4,"   .%s",str2); node_insert(&list_var,str3,str4,str2); node_insert(&list_func,"","",str2); term_number++;  (yyval.ival) = (yyvsp[-1].ival); }
#line 1716 "y.tab.c" /* yacc.c:1646  */
    break;

  case 57:
#line 187 "calc.y" /* yacc.c:1646  */
    { fresh_term = 0; if(bool_value((yyvsp[-1].ival)) == 1){ sprintf(str,"%c",(yyvsp[-1].ival)); }else { sprintf(str,"%d",(yyvsp[-1].ival)); } char* src2; src2 = value_return(list_var,str); sprintf(str2,"/ t%d,%s,%s", term_number, cur_string_value , src2); sprintf(str3," t%d",term_number); sprintf(str4,"   .%s",str2); node_insert(&list_var,str3,str4,str2); node_insert(&list_func,"","",str2);  term_number++; (yyval.ival) = (yyvsp[-1].ival);  }
#line 1722 "y.tab.c" /* yacc.c:1646  */
    break;

  case 58:
#line 189 "calc.y" /* yacc.c:1646  */
    { fresh_term = 0; if(bool_value((yyvsp[-1].ival)) == 1){ sprintf(str,"%c",(yyvsp[-1].ival)); }else { sprintf(str,"%d",(yyvsp[-1].ival)); } char* src2; src2 = value_return(list_var,str); sprintf(str2,"%% t%d,%s,%s", term_number, cur_string_value, src2); sprintf(str3," t%d",term_number); sprintf(str4,"   .%s",str2);  node_insert(&list_var,str3,str4,str2); node_insert(&list_func,"","",str2); term_number++;  (yyval.ival) = (yyvsp[-1].ival);   }
#line 1728 "y.tab.c" /* yacc.c:1646  */
    break;

  case 59:
#line 192 "calc.y" /* yacc.c:1646  */
    {  (yyval.ival) = (yyvsp[0].ival);  }
#line 1734 "y.tab.c" /* yacc.c:1646  */
    break;

  case 60:
#line 194 "calc.y" /* yacc.c:1646  */
    { sprintf(str, "   . p%d",point_number); sprintf(str2," p%d",point_number); sprintf(str3,"%d",(yyvsp[0].ival)); if(search_value(list_var, str3) == 1) { node_insert(&list_var,str2,str,str3); cur_string_value = str2; point_number++;  } else { if(fresh_term == 0){ cur_string_value = value_return(list_var,str3); fresh_term = 1; }} (yyval.ival)= (yyvsp[0].ival); }
#line 1740 "y.tab.c" /* yacc.c:1646  */
    break;

  case 61:
#line 196 "calc.y" /* yacc.c:1646  */
    {sprintf(str,"   . p%d",point_number); sprintf(str2," p%d",point_number); sprintf(str3,"-%d",(yyvsp[0].ival)); if(search_value(list_var,str3) == 1) { node_insert(&list_var,str2,str,str3); cur_string_value = str2;  point_number++; }else { if(fresh_term == 0){ cur_string_value = value_return(list_var,str3); fresh_term = 1; } } (yyval.ival) = -(yyvsp[0].ival);  }
#line 1746 "y.tab.c" /* yacc.c:1646  */
    break;

  case 62:
#line 198 "calc.y" /* yacc.c:1646  */
    {sprintf(str,"   . p%d",point_number); sprintf(str2," t%d",point_number); sprintf(str3,"%d",(yyvsp[-1].ival)); if(search_value(list_var,str3) == 1){  node_insert(&list_var,str2,str,str3); cur_string_value = str2;  term_number++;}else { if(fresh_term == 0) {  cur_string_value = value_return(list_var,str3); fresh_term = 1; }} (yyval.ival) = (yyvsp[-1].ival);  }
#line 1752 "y.tab.c" /* yacc.c:1646  */
    break;

  case 63:
#line 200 "calc.y" /* yacc.c:1646  */
    {sprintf(str,"   . p%d",point_number); sprintf(str2," t%d",point_number); sprintf(str3,"-%d",(yyvsp[-1].ival));if(search_value(list_var,str3) == 1) { node_insert(&list_var,str2,str,str3); point_number++; }else { if(fresh_term == 0) { cur_string_value = value_return(list_var,str3); fresh_term = 1; } } (yyval.ival) = -(yyvsp[-1].ival);  }
#line 1758 "y.tab.c" /* yacc.c:1646  */
    break;

  case 64:
#line 204 "calc.y" /* yacc.c:1646  */
    {int x; x = *(yyvsp[0].tokenName); (yyval.ival) = x; sprintf(str,"   . %s",(yyvsp[0].tokenName)); sprintf(str2," _%s",(yyvsp[0].tokenName)); sprintf(str3,"%d",x); cur_string_value = str2; if(search_value(list_var,str3) == 1){ node_insert(&list_var,str2,str,str3); }else {  if(fresh_term == 0) {cur_string_value = value_return(list_var,str3); fresh_term = 1; } }   }
#line 1764 "y.tab.c" /* yacc.c:1646  */
    break;

  case 65:
#line 207 "calc.y" /* yacc.c:1646  */
    { (yyval.ival) = 0; /*char *xyz; xyz = return_ascii($3); sprintf(str,"   . %s",xyz); sprintf(str2," _%s",xyz); sprintf(str3,"%d",$3); cur_string_value = str2; if(search_value(T,str3) == 1){ node_insert(&T,str2,str,str3); fprint(yyout,str); cur_string_value = str2; }else { if(fresh_term == 0) {cur_string_value = value_return(str3); fresh_term = 1; }} $$ = $1; */   }
#line 1770 "y.tab.c" /* yacc.c:1646  */
    break;


#line 1774 "y.tab.c" /* yacc.c:1646  */
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYTERROR;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  return yyresult;
}
#line 209 "calc.y" /* yacc.c:1906  */


int main(int argc,char **argv){
	
	if(argc == 2){
		yyin = fopen(argv[1],"r");
		if(yyin == NULL){
			printf("syntax: %s filename\n",argv[0]);
		}//endif
		yyparse();
	}else if(argc == 1){

		yyparse();

	}else if(argc == 3){

		/* Writing to a file */
		char *output_file = argv[2];
		char *file_ext = ".mil";

		char result[100];

		strcpy(result,output_file);
		strcat(result,file_ext);
		 
		yyout = fopen(result,"w");
		
		/* Reading the file and parsing it */
		yyin = fopen(argv[1],"r");

		/* Create a single linked list */

		list_var = create(); 
		list_func = create();

		if(yyin == NULL){
			printf("syntax: %s filename\n",argv[0]);
		}
		 
		yyparse();

		fclose(yyin);
	        print_all_id(list_var,yyout);
		
		print_all_value(list_var,yyout);					
		fclose(yyout);



		/*
		fclose(yyin); 
		
		
		/* After reading all the variables and written into a different file 
		* Take in all the input and then write it to here 
		char buff[BUZZ_SIZE];

		char result2[100];
		char *mil_ext = ".mil";
		strcpy(result2,output_file);
		strcat(result2,mil_ext);
		yyin = fopen(result , "r");
		yyout = fopen(result2, "w");
		finished_looping = 1;
		if(yyin == NULL){
			printf("File Opening Error!!");
		}
		 Reading all of the strings and printing on the mil file 
		while(fgets(buff,BUZZ_SIZE,yyin) != NULL){
			fprintf(yyout,"%s\n",buff); 
		}

		fclose(yyin);
		yyparse();		
		fclose(yyout);
		*/
		
	}
	
 //Calls yylex for tokens.
		
	 
	  
	return 0;
}
char *return_ascii(int i){
	sprintf(str,"%d",i);
	char *pChar = str;
	return pChar;	
}
char *my_itoa(char *dest,int i){
	sprintf(dest, "%d", i);
	return dest;
}

/* return a 1 if the character is an ascii value */ 
int bool_value(int dest){
	if((dest >= 97 && dest <= 122) || (dest >= 65 && dest <= 90)){
		return 1;
	}
	return 0;

}
double findMod(double a, double b){
	if( a < 0)
		a = -a;
	if( b < 0)
		b = -b;
	double mod = a;
	while( mod >= b)
		mod = mod - b;
	if(a < 0)
		return -mod;
	return mod;
}
void yyerror(const char *msg){
	printf("** Line %d, position %d: %s\n", num_line, num_pos, msg);
}


