%{
#include "y.tab.h"
%}

%%

exit                  { return EXIT; }
fever                 { return SYMPTOM; }
headache              { return SYMPTOM; }
cold                  { return SYMPTOM; }
cough                 { return SYMPTOM; }
stomachache           { return SYMPTOM; }
sorethroat            { return SYMPTOM; }
backpain              { return SYMPTOM; }
toothache             { return SYMPTOM; }
allergy               { return SYMPTOM; }
vomiting              { return SYMPTOM; }
diarrhea              { return SYMPTOM; }
dizziness             { return SYMPTOM; }
insomnia              { return SYMPTOM; }
anxiety               { return SYMPTOM; }
[ \t\n]+              { /* Ignore whitespace */ }
.                     { return yytext[0]; }

%%

int yywrap() {
    return 1;
}
