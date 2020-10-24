*------------------------------------------------------------*;
* Clus2: Training;
*------------------------------------------------------------*;
*------------------------------------------------------------* ;
* Clus2: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    Career(ASC) Education(ASC) Marital_Statues(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Clus2: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    Age
%mend DMDBVar;
*------------------------------------------------------------*;
* Clus2: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=EMWS1.Filter2_TRAIN
dmdbcat=WORK.Clus2_DMDB
maxlevel = 513
out=WORK.Clus2_DMDB
;
class %DMDBClass;
var %DMDBVar;
run;
quit;
*------------------------------------------------------------* ;
* Clus2: Interval Inputs Macro ;
*------------------------------------------------------------* ;
%macro DMVQINTERVAL;
    Age
%mend DMVQINTERVAL;
*------------------------------------------------------------* ;
* Clus2: Nominal Inputs Macro ;
*------------------------------------------------------------* ;
%macro DMVQNOMINAL;
    Career Education Marital_Statues
%mend DMVQNOMINAL;
*------------------------------------------------------------*;
* Clus2: Run DMVQ procedure;
*------------------------------------------------------------*;
title;
options nodate;
proc dmvq data=WORK.Clus2_DMDB dmdbcat=WORK.Clus2_DMDB std=STD nominal=GLM ordinal=RANK
;
input %DMVQINTERVAL / level=interval;
input %DMVQNOMINAL / level=nominal;
VQ maxc = 5 clusname=_SEGMENT_ CLUSLABEL="Segment Id" DISTLABEL="Distance";
MAKE outvar=EMWS1.Clus2_OUTVAR;
INITIAL radius=0
;
TRAIN tech=FORGY
;
SAVE outstat=EMWS1.Clus2_OUTSTAT outmean=EMWS1.Clus2_OUTMEAN;
code file="C:\Users\20161277\Documents\CA assign 2 data\20161277_CAassignment2\Workspaces\EMWS1\Clus2\DMVQSCORECODE.sas"
group=Clus2
;
run;
quit;
*------------------------------------------------------------* ;
* Clus2: DMVQ Variables;
*------------------------------------------------------------* ;
%macro dmvqvars;
    Age Careeradministration Careerblue_collar Careerentrepreneur Careerhousemaid
   Careermanagement Careerretired Careerself_employed Careerservices Careerstudent
   Careertechnician Careerunemployed Educationilliterate
   Educationprimary_education Educationprofessional_educat
   Educationsecondary_education Educationuniversity_educatio
   Marital_Statuesdivorced Marital_Statuesmarried Marital_Statuessingle
%mend ;
