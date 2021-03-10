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
    TKN_NUM_ROMANO = 258,
    TKN_NUM = 259,
    TKN_ASIGNACION = 260,
    TKN_PTOCOMA = 261,
    TKN_MULT = 262,
    TKN_DIV = 263,
    TKN_SQRT = 264,
    TKN_CBRT = 265,
    TKN_MAS = 266,
    TKN_MENOS = 267,
    TKN_PARENTESISA = 268,
    TKN_PARENTESISC = 269,
    TKN_COS = 270,
    TKN_SEN = 271,
    TKN_EULER = 272,
    TKN_LN = 273,
    TKN_POTENCIA = 274,
    TKN_ID = 275,
    TKN_NOMBRE = 276,
    TKN_Potencia = 277
	NUMERO = 278,
    TKN_PAA = 279,
    TKN_PAC = 280,
    TKN_COS = 281,
    TKN_SEN = 282,
    TKN_SQRT = 283,
    TKN_CORI = 284,
    TKN_CORD = 285,
    TKN_LLAI = 286,
    TKN_LLAD = 287,
    TKN_LOG = 288,
    TKN_ID = 289
  };
#endif
/* Tokens.  */
#define TKN_NUM_ROMANO 258
#define TKN_NUM 259
#define TKN_ASIGNACION 260
#define TKN_PTOCOMA 261
#define TKN_MULT 262
#define TKN_DIV 263
#define TKN_SQRT 264
#define TKN_CBRT 265
#define TKN_MAS 266
#define TKN_MENOS 267
#define TKN_PARENTESISA 268
#define TKN_PARENTESISC 269
#define TKN_COS 270
#define TKN_SEN 271
#define TKN_EULER 272
#define TKN_LN 273
#define TKN_POTENCIA 274
#define TKN_ID 275
#define TKN_NOMBRE 276
#define TKN_Potencia 277

#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{
/* Line 2058 of yacc.c  */
#line 9 "par.y"

	 double real;


/* Line 2058 of yacc.c  */
#line 90 "y.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;

#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */


/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 12 "romanosYdecilames.y"

	double real;

#line 105 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */