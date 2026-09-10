(*******************************************************************************
                           user declarations
********************************************************************************)
type pos = int
type svalue = Tokens.svalue
type ('a, 'b) token = ('a, 'b) Tokens.token

val line_num = ErrorMsg.lineNum
val line_pos = ErrorMsg.linePos
fun err(p1, p2) = ErrorMsg.error p1

val comment_depth = ref 0
val str_acc = ref ""
val str_pos = ref 0
val in_string = ref false

fun eof() =
    let val pos = hd(!line_pos)
	val _ =
	    if !comment_depth > 0 then
		ErrorMsg.error pos "unclosed comment at EOF"
	    else if !in_string = true then
		ErrorMsg.error pos "unclosed string at EOF"
	    else ();
    in
	Tokens.EOF(pos, pos)
    end

val kword_table : (string, (int * int -> lexresult)) HashTable.hash_table =
    HashTable.mkTable (HashString.hashString, op=) (17, Fail "not found")
val _ = map (HashTable.insert kword_table)
	    [("abstype", Tokens.ABSTYPE),
	     ("and", Tokens.AND),
	     ("andalso", Tokens.ANDALSO),
	     ("as", Tokens.AS),
	     ("case", Tokens.CASE),
	     ("datatype", Tokens.DATATYPE),
	     ("do", Tokens.DO),
	     ("else", Tokens.ELSE),
	     ("end", Tokens.END),
	     ("exception", Tokens.EXCEPTION),
	     ("fn", Tokens.FN),
	     ("fun", Tokens.FUN),
	     ("handle", Tokens.HANDLE),
	     ("if", Tokens.IF),
	     ("in", Tokens.IN),
	     ("infix", Tokens.INFIX),
	     ("infixr", Tokens.INFIXR),
	     ("let", Tokens.LET),
	     ("local", Tokens.LOCAL),
	     ("nonfix", Tokens.NONFIX),
	     ("of", Tokens.OF),
	     ("op", Tokens.OP),
	     ("open", Tokens.OPEN),
	     ("orelse", Tokens.ORELSE),
	     ("raise", Tokens.RAISE),
	     ("rec", Tokens.REC),
	     ("then", Tokens.THEN),
	     ("type", Tokens.TYPE),
	     ("val", Tokens.VAL),
	     ("with", Tokens.WITH),
	     ("withtype", Tokens.WITHTYPE),
	     ("while", Tokens.WHILE)]
	    
fun resolve_id (s, slen, col) =
    case (HashTable.find kwordHashTable s) of
	SOME tok => tok(col, col+slen)
      | NONE     => Tokens.ID(s, col, col+slen)

(*******************************************************************************
                         ML-Lex Definitions + Rules
********************************************************************************)

%% 

%s INITIAL COMMENT STRING;

alphanumeric_ident=([a-zA-Z]|['])[_a-ZA-Z0-9']*;
symbolic_ident=[\\\-^!%&$#+/:<=>?@~`|*]+;
ident={alphanumeric_ident}|{symbolic_ident};

ws=[\ \t];

%%

<INITIAL> \n       => (line_num := !line_num + 1;
		       line_pos := yypos :: !line_pos;
		       continue());
<INITIAL> {ws}+    => (continue());
<INITIAL> "("      => (Tokens.LPAREN(yypos, yypos+1));
<INITIAL> ")"      => (Tokens.RPAREN(yypos, yypos+1));
<INITIAL> "["      => (Tokens.LBRACK(yypos, yypos+1));
<INITIAL> "]"      => (Tokens.RBRACK(yypos, yypos+1));
<INITIAL> "{"      => (Tokens.LBRACE(yypos, yypos+1));
<INITIAL> "}"      => (Tokens.RBRACE(yypos, yypos+1));
<INITIAL> ","      => (Tokens.COMMA(yypos, yypos+1));
<INITIAL> ":"      => (Tokens.COLON(yypos, yypos+1));
<INITIAL> ";"      => (Tokens.SEMICOLON(yypos, yypos+1));
<INITIAL> "..."    => (Tokens.ELLIPSIS(yypos, yypos+3));
<INITIAL> "_"      => (Tokens.WILDCAD(yypos, yypos+1));
<INITIAL> "|"      => (Tokens.BAR(yypos, yypos+1));
<INITIAL> "="      => (Tokens.EQ(yypos, yypos+1));
<INITIAL> "<>"      => (Tokens.NEQ(yypos, yypos+1));
<INITIAL> "=>"     => (Tokens.BIGARROW(yypos, yypos+2));
<INITIAL> "->"     => (Tokens.LITTLEARROW(yypos, yypos+2));
<INITIAL> "#"      => (Tokens.HASH(yypos, yypos+1));
<INITIAL> "<"      => (Tokens.LT(yypos, yypos+1));
<INITIAL> ">"      => (Tokens.GT(yypos, yypos+1));
<INITIAL> ">="      => (Tokens.GE(yypos, yypos+2));
<INITIAL> "<="      => (Tokens.LE(yypos, yypos+2));
<INITIAL> "+"      => (Tokens.PLUS(yypos, yypos+1));
<INITIAL> "-"      => (Tokens.MINUS(yypos, yypos+1));
<INITIAL> "*"      => (Tokens.MUL(yypos, yypos+1));
<INITIAL> "/"      => (Tokens.DIV(yypos, yypos+1));
<INITIAL> {ident}  => (resolve_id(yytext, size(yytext), yypos));
