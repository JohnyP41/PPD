--zad 1
newtype Parser a = Parser (String -> [(a,String)])
parse :: Parser a -> String -> [(a, String)]
parse (Parser p) inp = p inp

expr ::= term ('+' expr | e)
term ::= factor ('*' term | e)
factor ::= digit| '(' expr ')'
digit::= 'p' | 'q' | ... | 'z'



eval :: String -> Bool
eval input = case parse expr input of 
              [(n,[])] -> n
              [(_,out)] -> error ("nieskonsumowane" ++out)
              [] -> error "bledne wejscie"
