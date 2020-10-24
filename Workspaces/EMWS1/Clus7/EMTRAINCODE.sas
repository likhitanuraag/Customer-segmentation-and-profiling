*------------------------------------------------------------*;
* Clus7: Training;
*------------------------------------------------------------*;
*------------------------------------------------------------* ;
* Clus7: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Career(ASC) Education(ASC) Marital_Statues(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Clus7: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    Age
%mend DMDBVar;
*------------------------------------------------------------*;
* Clus7: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=EMWS1.FIMPORT4_train
dmdbcat=WORK.Clus7_DMDB
maxlevel = 513
out=WORK.Clus7_DMDB
;
class %DMDBClass;
var %DMDBVar;
run;
quit;
*------------------------------------------------------------* ;
* Clus7: Interval Inputs Macro ;
*------------------------------------------------------------* ;
%macro DMVQINTERVAL;
    Age
%mend DMVQINTERVAL;
*------------------------------------------------------------* ;
* Clus7: Nominal Inputs Macro ;
*------------------------------------------------------------* ;
%macro DMVQNOMINAL;
    Career Education Marital_Statues
%mend DMVQNOMINAL;
*------------------------------------------------------------*;
* Clus7: Run DMVQ procedure;
*------------------------------------------------------------*;
title;
options nodate;
proc dmvq data=WORK.Clus7_DMDB dmdbcat=WORK.Clus7_DMDB std=STD nominal=GLM ordinal=RANK
;
input %DMVQINTERVAL / level=interval;
input %DMVQNOMINAL / level=nominal;
VQ maxc = 5 clusname=_SEGMENT_ CLUSLABEL="Segment Id" DISTLABEL="Distance";
MAKE outvar=EMWS1.Clus7_OUTVAR;
INITIAL radius=0
;
TRAIN tech=FORGY
;
SAVE outstat=EMWS1.Clus7_OUTSTAT outmean=EMWS1.Clus7_OUTMEAN;
code file="C:\Users\20161277\Documents\CA assign 2 data\20161277_CAassignment2\Workspaces\EMWS1\Clus7\DMVQSCORECODE.sas"
group=Clus7
;
run;
quit;
*------------------------------------------------------------* ;
* Clus7: DMVQ Variables;
*------------------------------------------------------------* ;
%macro dmvqvars;
    Age Careeradministration Careerblue_collar Careerentrepreneur Careerhousemaid
   Careermanagement Careerretired Careerself_employed Careerservices Careerstudent
   Careertechnician Careerunemployed Educationilliterate
   Educationprimary_education Educationprofessional_educat
   Educationsecondary_education Educationuniversity_educatio
   Marital_Statuesdivorced Marital_Statuesmarried Marital_Statuessingle
%mend ;
