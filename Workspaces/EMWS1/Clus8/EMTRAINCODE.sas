*------------------------------------------------------------*;
* Clus8: Training;
*------------------------------------------------------------*;
*------------------------------------------------------------* ;
* Clus8: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Contact_Type(ASC) Mortage(ASC) Personal_Loan(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Clus8: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    Number_of_Contacts
%mend DMDBVar;
*------------------------------------------------------------*;
* Clus8: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=EMWS1.FIMPORT5_TRAIN
dmdbcat=WORK.Clus8_DMDB
maxlevel = 513
out=WORK.Clus8_DMDB
;
class %DMDBClass;
var %DMDBVar;
run;
quit;
*------------------------------------------------------------* ;
* Clus8: Interval Inputs Macro ;
*------------------------------------------------------------* ;
%macro DMVQINTERVAL;
    Number_of_Contacts
%mend DMVQINTERVAL;
*------------------------------------------------------------* ;
* Clus8: Nominal Inputs Macro ;
*------------------------------------------------------------* ;
%macro DMVQNOMINAL;
    Contact_Type Mortage Personal_Loan
%mend DMVQNOMINAL;
*------------------------------------------------------------*;
* Clus8: Run DMVQ procedure;
*------------------------------------------------------------*;
title;
options nodate;
proc dmvq data=WORK.Clus8_DMDB dmdbcat=WORK.Clus8_DMDB std=STD nominal=GLM ordinal=RANK
;
input %DMVQINTERVAL / level=interval;
input %DMVQNOMINAL / level=nominal;
VQ maxc = 5 clusname=_SEGMENT_ CLUSLABEL="Segment Id" DISTLABEL="Distance";
MAKE outvar=EMWS1.Clus8_OUTVAR;
INITIAL radius=0
;
TRAIN tech=FORGY
;
SAVE outstat=EMWS1.Clus8_OUTSTAT outmean=EMWS1.Clus8_OUTMEAN;
code file="C:\Users\20161277\Documents\CA assign 2 data\20161277_CAassignment2\Workspaces\EMWS1\Clus8\DMVQSCORECODE.sas"
group=Clus8
;
run;
quit;
*------------------------------------------------------------* ;
* Clus8: DMVQ Variables;
*------------------------------------------------------------* ;
%macro dmvqvars;
    Number_of_Contacts Contact_Typecellular Contact_Typetelephone Mortageno
   Mortageyes Personal_Loanno Personal_Loanyes
%mend ;
