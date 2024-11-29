%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h> 

extern char *yytext;

void yyerror(const char *s);
int yylex();

void suggest_medicine(char *symptom);
%}

%token SYMPTOM EXIT

%%

symptom_input:
    symptoms
    {
        printf("\nMedicine suggestions completed.\n");
    }
    ;

symptoms:
    SYMPTOM
    {
        suggest_medicine(yytext);
    }
    |
    symptoms SYMPTOM
    {
        suggest_medicine(yytext);
    }
    |
    EXIT
    {
        printf("Exiting program. Goodbye!\n");
        exit(0);
    }
    ;

%%

void suggest_medicine(char *symptom) {
    if (strcmp(symptom, "fever") == 0) {
        printf("Symptom: %s -> Suggested Medicine: Paracetamol\n", symptom);
    } else if (strcmp(symptom, "headache") == 0) {
        printf("Symptom: %s -> Suggested Medicine: Aspirin\n", symptom);
    } else if (strcmp(symptom, "cold") == 0) {
        printf("Symptom: %s -> Suggested Medicine: Antihistamines\n", symptom);
    } else if (strcmp(symptom, "cough") == 0) {
        printf("Symptom: %s -> Suggested Medicine: Cough Syrup\n", symptom);
    } else if (strcmp(symptom, "stomachache") == 0) {
        printf("Symptom: %s -> Suggested Medicine: Antacids\n", symptom);
    } else if (strcmp(symptom, "sorethroat") == 0) {
        printf("Symptom: %s -> Suggested Medicine: Lozenges\n", symptom);
    } else if (strcmp(symptom, "backpain") == 0) {
        printf("Symptom: %s -> Suggested Medicine: Ibuprofen\n", symptom);
    } else if (strcmp(symptom, "toothache") == 0) {
        printf("Symptom: %s -> Suggested Medicine: Clove Oil or Ibuprofen\n", symptom);
    } else if (strcmp(symptom, "allergy") == 0) {
        printf("Symptom: %s -> Suggested Medicine: Antihistamines\n", symptom);
    } else if (strcmp(symptom, "vomiting") == 0) {
        printf("Symptom: %s -> Suggested Medicine: Ondansetron\n", symptom);
    } else if (strcmp(symptom, "diarrhea") == 0) {
        printf("Symptom: %s -> Suggested Medicine: ORS and Loperamide\n", symptom);
    } else if (strcmp(symptom, "dizziness") == 0) {
        printf("Symptom: %s -> Suggested Medicine: Meclizine\n", symptom);
    } else if (strcmp(symptom, "insomnia") == 0) {
        printf("Symptom: %s -> Suggested Medicine: Melatonin\n", symptom);
    } else if (strcmp(symptom, "anxiety") == 0) {
        printf("Symptom: %s -> Suggested Medicine: Diazepam (consult a doctor)\n", symptom);
    } else {
        printf("Symptom: %s -> Suggested Medicine: Not Found\n", symptom);
    }
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter symptoms (type 'exit' to terminate):\n");
    yyparse();
    return 0;
}
