/*
 * This file is part of GDL.
 *
 * GDL is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * GDL is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with GDL.  If not, see <http://www.gnu.org/licenses/>.
 */

// Graph Definition Language
grammar GDL;

// starting point for parsing a GDL script
database
    : elementList ('WHERE' whereClause)? EOF
    ;

elementList
    : (element ';'?)*
    ;

element
    : graph
    | path
    ;

graph
    : header properties? '[' (path ';'?)* ']'
    ;

path
    : vertex (edge vertex)*
    ;

vertex
    : '(' header properties? ')'
    ;

edge
    : '<-' edgeBody? '-'    #incomingEdge
    | '-' edgeBody? '->'    #outgoingEdge
    ;

edgeBody
    : '[' header properties? ']'
    ;

header
    : Identifier? Label?
    ;

properties
    : '{' (property (',' property)*)? '}'
    ;

property
    : Identifier '=' literal
    ;

literal
    : StringLiteral
    | BooleanLiteral
    | IntegerLiteral
    | FloatingPointLiteral
    | Null
    ;

whereClause
    : (predicate (',' predicate)*)?
    ;

predicate
    : predicate5
    ;

predicate5
    : predicate4 (OR predicate4 )*
    ;

predicate4
    : predicate3 (XOR predicate3)*
    ;

predicate3
    : predicate2 (AND predicate2)*
    ;

predicate2
    : (NOT)* predicate1
    ;

OR
    : ( 'O' | 'o' ) ( 'R' | 'r' )
    ;

XOR
    : ( 'X' | 'x' ) ( 'O' | 'o' ) ( 'R' | 'r' )
    ;

AND
    : ( 'A' | 'a' ) ( 'N' | 'n' ) ( 'D' | 'd' )
    ;

NOT
    : ( 'N' | 'n' ) ( 'O' | 'o' ) ( 'T' | 't' )
    ;

predicate1
    : parenthesizedPredicate
    | atom
    ;

parenthesizedPredicate
    : '(' predicate ')'
    ;

atom
    : Identifier.Identifier '=' literal
    ;

//-------------------------------
// String Literal
//-------------------------------

StringLiteral
    : '"' ('\\"'|.)*? '"'
    ;

//-------------------------------
// Boolean Literal
//-------------------------------

BooleanLiteral
    : 'true'
    | 'TRUE'
    | 'false'
    | 'FALSE'
    ;

//-------------------------------
// Integer Literal
//-------------------------------

IntegerLiteral
    : DecimalIntegerLiteral
    ;

fragment
DecimalIntegerLiteral
    : DecimalNumeral IntegerTypeSuffix?
    ;

fragment
DecimalNumeral
    : '0'
    | '-'? NonZeroDigit Digit*
    ;
fragment
IntegerTypeSuffix
    : [lL]
    ;

//-------------------------------
// Floating Point Literal
//-------------------------------

FloatingPointLiteral
    :   DecimalFloatingPointLiteral
    ;

fragment
DecimalFloatingPointLiteral
    :   DecimalFloatingPointNumeral? '.' Digits?  FloatTypeSuffix?
    ;

fragment
DecimalFloatingPointNumeral
    : '0'
    | '-'? Digits
    ;

fragment
FloatTypeSuffix
    :   [fFdD]
    ;

//-------------------------------
// Label & Identifier
//-------------------------------

Label
    : Colon UpperCaseLetter (LowerCaseLetter | UpperCaseLetter)*  // graph and vertex label (e.g. Person, BlogPost)
    | Colon LowerCaseLetter (LowerCaseLetter | UpperCaseLetter)*  // edge label (e.g. knows, hasInterest)
    ;

Identifier
    : (UnderScore | LowerCaseLetter) (UnderScore | Character)*   // e.g. _temp, _0, t_T, g0, alice, birthTown
    ;

//-------------------------------
// General fragments
//-------------------------------

fragment
Characters
    : Character+
    ;

fragment
Character
    : UpperCaseLetter
    | LowerCaseLetter
    | Digit
    ;

fragment
UpperCaseLetters
    : UpperCaseLetter+
    ;

fragment
UpperCaseLetter
    : [A-Z]
    ;

fragment
LowerCaseLetters
    : LowerCaseLetter+
    ;

fragment
LowerCaseLetter
    : [a-z]
    ;

fragment
Digits
    : Digit+
    ;

fragment
Digit
    : [0-9]
    ;

fragment
NonZeroDigit
    : [1-9]
    ;

fragment
UnderScore
    : '_'
    ;

fragment
Colon
    : ':'
    ;

Null
    : 'NULL'
    ;

WS
    : [ \t\n\r]+ -> skip
    ;

COMMENT
    : '/*' .*? '*/' -> skip
    ;

LINE_COMMENT
    : '//' ~[\r\n]* -> skip
    ;