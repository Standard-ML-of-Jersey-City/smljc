signature SML_Tokens =
sig
type ('a, 'b) token
type svalue

(* CORE Special Constants *)
val INT:          (int) *  'a * 'a -> (svalue,'a) token
val WORD:         (word) * 'a * 'a -> (svalue,'a) token
val REAL:         (real) * 'a * 'a -> (svalue, 'a) token
val STRING:       (string) * 'a * 'a -> (svalue, 'a) token
val CHAR:         (char) * 'a * 'a -> (svalue, 'a) token

(* CORE Identifiers *)
val ID:           (string) * 'a * 'a -> (svalue, 'a) token

(* Operators *)
val EQ:           'a * 'a -> (svalue, 'a) token
val NEQ:          'a * 'a -> (svalue, 'a) token
val ASSIGN:       'a * 'a -> (svalue, 'a) token
val UMINUS:       'a * 'a -> (savlue, 'a) token
val PLUS:         'a * 'a -> (savlue, 'a) token
val MINUS:        'a * 'a -> (savlue, 'a) token
val MUL:          'a * 'a -> (savlue, 'a) token
val DIV:          'a * 'a -> (savlue, 'a) token
val GT:           'a * 'a -> (savlue, 'a) token
val LT:           'a * 'a -> (savlue, 'a) token
val GE:           'a * 'a -> (savlue, 'a) token
val LE:           'a * 'a -> (savlue, 'a) token

(* CORE Reserved Words *)
val ABSTYPE:      'a * 'a -> (svalue, 'a) token
val AND:          'a * 'a -> (svalue, 'a) token
val ANDALSO:      'a * 'a -> (svalue, 'a) token
val AS:           'a * 'a -> (svalue, 'a) token
val CASE:         'a * 'a -> (svalue, 'a) token
val DATATYPE:     'a * 'a -> (svalue, 'a) token
val DO:           'a * 'a -> (svalue, 'a) token
val ELSE:         'a * 'a -> (svalue, 'a) token
val END:          'a * 'a -> (svalue, 'a) token
val EXCEPTION:    'a * 'a -> (svalue, 'a) token
val FN:           'a * 'a -> (svalue, 'a) token
val FUN:          'a * 'a -> (svalue, 'a) token
val HANDLE:       'a * 'a -> (svalue, 'a) token
val IF:           'a * 'a -> (svalue, 'a) token
val IN:           'a * 'a -> (svalue, 'a) token
val INFIX:        'a * 'a -> (svalue, 'a) token
val INFIXR:       'a * 'a -> (svalue, 'a) token
val LET:          'a * 'a -> (svalue, 'a) token
val LOCAL:        'a * 'a -> (svalue, 'a) token
val NONFIX:       'a * 'a -> (svalue, 'a) token
val OF:           'a * 'a -> (svalue, 'a) token
val OP:           'a * 'a -> (svalue, 'a) token
val OPEN:         'a * 'a -> (svalue, 'a) token
val ORELSE:       'a * 'a -> (svalue, 'a) token
val RAISE:        'a * 'a -> (svalue, 'a) token
val REC:          'a * 'a -> (svalue, 'a) token
(* TODO: Ref isn't a reserved word in the definition of Core *)
(*val REF:          'a * 'a -> (svalue, 'a) token*)
val THEN:         'a * 'a -> (svalue, 'a) token
val TYPE:         'a * 'a -> (svalue, 'a) token
val VAL:          'a * 'a -> (Svalue, 'a) Token
val WITH:         'a * 'a -> (svalue, 'a) token
val WITHTYPE:     'a * 'a -> (svalue, 'a) token
val WHILE:        'a * 'a -> (svalue, 'a) token
val LPAREN:       'a * 'a -> (svalue, 'a) token
val RPAREN:       'a * 'a -> (svalue, 'a) token
val LBRACK:       'a * 'a -> (svalue, 'a) token
val RBRACK:       'a * 'a -> (svalue, 'a) token
val LBRACE:       'a * 'a -> (svalue, 'a) token
val RBRACE:       'a * 'a -> (svalue, 'a) token
val COMMA:        'a * 'a -> (svalue, 'a) token
val COLON:        'a * 'a -> (svalue, 'a) token
val SEMICOLON:    'a * 'a -> (svalue, 'a) token
val ELLIPSIS:     'a * 'a -> (svalue, 'a) token
val WILDCARD:     'a * 'a -> (svalue, 'a) token
val BAR:          'a * 'a -> (svalue, 'a) token
val BIGARROW:     'a * 'a -> (svalue, 'a) token
val LITTLEARROW:  'a * 'a -> (svalue, 'a) token
val HASH:         'a * 'a -> (svalue, 'a) token
val EOF:          'a * 'a -> (svalue, 'a) token
end
