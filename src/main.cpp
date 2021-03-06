#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include "lex.yy.h"
#include "parser.tab.h"
using namespace std ;

int main(int argc, char* argv[]){
    if (argc < 5 ){
        cerr<< "Usage: " << argv[0] << " -i <input> -o <output>" << endl ;
        return 1;
    }

    char* input_file_path = argv[2];
    char* output_file_path = argv[4];
    ofstream output_file(output_file_path) ;
    // printf("input: %s\noutput: %s\n", input_file_path, output_file_path);
    yyin = fopen(input_file_path    , "r");
    yyout = fopen(output_file_path    , "w");
    yyparse();
    fclose(yyin);
    fclose(yyout);
}
extern FILE* yyin;
extern FILE* yyout;