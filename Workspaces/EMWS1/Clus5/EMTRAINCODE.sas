*------------------------------------------------------------*;
* Clus5: Training;
*------------------------------------------------------------*;
*------------------------------------------------------------* ;
* Clus5: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Career(ASC) Contact_Type(ASC) Education(ASC) Marital_Statues(ASC) Mortage(ASC)
   Personal_Loan(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Clus5: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    Age Number_of_Contacts
%mend DMDBVar;
*------------------------------------------------------------*;
* Clus5: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=EMWS1.FIMPORT3_train
dmdbcat=WORK.Clus5_DMDB
maxlevel = 513
out=WORK.Clus5_DMDB
;
class %DMDBClass;
var %DMDBVar;
run;
quit;
*------------------------------------------------------------* ;
* Clus5: Interval Inputs Macro ;
*------------------------------------------------------------* ;
%macro DMVQINTERVAL;
    Age Number_of_Contacts
%mend DMVQINTERVAL;
*------------------------------------------------------------* ;
* Clus5: Nominal Inputs Macro ;
*------------------------------------------------------------* ;
%macro DMVQNOMINAL;
    Career Contact_Type Education Marital_Statues Mortage Personal_Loan
%mend DMVQNOMINAL;
*------------------------------------------------------------*;
* Clus5: Run DMVQ procedure;
*------------------------------------------------------------*;
title;
options nodate;
proc dmvq data=WORK.Clus5_DMDB dmdbcat=WORK.Clus5_DMDB std=STD nominal=GLM ordinal=RANK
;
input %DMVQINTERVAL / level=interval;
input %DMVQNOMINAL / level=nominal;
VQ maxc = 5 clusname=_SEGMENT_ CLUSLABEL="Segment Id" DISTLABEL="Distance";
MAKE outvar=EMWS1.Clus5_OUTVAR;
INITIAL radius=0
;
TRAIN tech=FORGY
;
SAVE outstat=EMWS1.Clus5_OUTSTAT outmean=EMWS1.Clus5_OUTMEAN;
code file="C:\Users\20161277\Documents\CA assign 2 data\20161277_CAassignment2\Workspaces\EMWS1\Clus5\DMVQSCORECODE.sas"
group=Clus5
;
run;
quit;
*------------------------------------------------------------* ;
* Clus5: DMVQ Variables;
*------------------------------------------------------------* ;
%macro dmvqvars;
    Age Number_of_Contacts Careeradministration Careerblue_collar
   Careerentrepreneur Careerhousemaid Careermanagement Careerretired
   Careerself_employed Careerservices Careerstudent Careertechnician
   Careerunemployed Contact_Typecellular Contact_Typetelephone Educationilliterate
   Educationprimary_education Educationprofessional_educat
   Educationsecondary_education Educationuniversity_educatio
   Marital_Statuesdivorced Marital_Statuesmarried Marital_Statuessingle Mortageno
   Mortageyes Personal_Loanno Personal_Loanyes
%mend ;
