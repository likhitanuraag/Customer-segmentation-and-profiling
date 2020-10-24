*****************************************;
*** Begin Scoring Code from PROC DMVQ ***;
*****************************************;


*** Begin Class Look-up, Standardization, Replacement ;
drop _dm_bad; _dm_bad = 0;

*** Standardize Age ;
drop T_Age ;
if missing( Age ) then T_Age = .;
else T_Age = (Age - 40.7367308595584) * 0.07423424616033;

*** Generate dummy variables for Career ;
drop Careeradministration Careerblue_collar Careerentrepreneur Careerhousemaid
         Careermanagement Careerretired Careerself_employed Careerservices 
        Careerstudent Careertechnician Careerunemployed ;
if missing( Career ) then do;
   Careeradministration = .;
   Careerblue_collar = .;
   Careerentrepreneur = .;
   Careerhousemaid = .;
   Careermanagement = .;
   Careerretired = .;
   Careerself_employed = .;
   Careerservices = .;
   Careerstudent = .;
   Careertechnician = .;
   Careerunemployed = .;
end;
else do;
   length _dm16 $ 16; drop _dm16 ;
   _dm16 = put( Career , $16. );
   %DMNORMIP( _dm16 )
   _dm_find = 0; drop _dm_find;
   if _dm16 <= 'RETIRED'  then do;
      if _dm16 <= 'ENTREPRENEUR'  then do;
         if _dm16 <= 'BLUE-COLLAR'  then do;
            if _dm16 = 'ADMINISTRATION'  then do;
               Careeradministration = 0.45907412043477;
               Careerblue_collar = -0.12150458809345;
               Careerentrepreneur = -0.05045179254789;
               Careerhousemaid = -0.04627208046437;
               Careermanagement = -0.08359323130889;
               Careerretired = -0.09572860379648;
               Careerself_employed = -0.05680708819217;
               Careerservices = -0.08255216308554;
               Careerstudent = -0.06832140830084;
               Careertechnician = -0.13177255984613;
               Careerunemployed = -0.05517515846472;
               _dm_find = 1;
            end;
            else do;
               if _dm16 = 'BLUE-COLLAR'  then do;
                  Careeradministration = -0.19798053664464;
                  Careerblue_collar = 0.74801900199385;
                  Careerentrepreneur = -0.05045179254789;
                  Careerhousemaid = -0.04627208046437;
                  Careermanagement = -0.08359323130889;
                  Careerretired = -0.09572860379648;
                  Careerself_employed = -0.05680708819217;
                  Careerservices = -0.08255216308554;
                  Careerstudent = -0.06832140830084;
                  Careertechnician = -0.13177255984613;
                  Careerunemployed = -0.05517515846472;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm16 = 'ENTREPRENEUR'  then do;
               Careeradministration = -0.19798053664464;
               Careerblue_collar = -0.12150458809345;
               Careerentrepreneur = 1.80147693735678;
               Careerhousemaid = -0.04627208046437;
               Careermanagement = -0.08359323130889;
               Careerretired = -0.09572860379648;
               Careerself_employed = -0.05680708819217;
               Careerservices = -0.08255216308554;
               Careerstudent = -0.06832140830084;
               Careertechnician = -0.13177255984613;
               Careerunemployed = -0.05517515846472;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm16 <= 'MANAGEMENT'  then do;
            if _dm16 = 'HOUSEMAID'  then do;
               Careeradministration = -0.19798053664464;
               Careerblue_collar = -0.12150458809345;
               Careerentrepreneur = -0.05045179254789;
               Careerhousemaid = 1.9642025993042;
               Careermanagement = -0.08359323130889;
               Careerretired = -0.09572860379648;
               Careerself_employed = -0.05680708819217;
               Careerservices = -0.08255216308554;
               Careerstudent = -0.06832140830084;
               Careertechnician = -0.13177255984613;
               Careerunemployed = -0.05517515846472;
               _dm_find = 1;
            end;
            else do;
               if _dm16 = 'MANAGEMENT'  then do;
                  Careeradministration = -0.19798053664464;
                  Careerblue_collar = -0.12150458809345;
                  Careerentrepreneur = -0.05045179254789;
                  Careerhousemaid = -0.04627208046437;
                  Careermanagement = 1.08726196248472;
                  Careerretired = -0.09572860379648;
                  Careerself_employed = -0.05680708819217;
                  Careerservices = -0.08255216308554;
                  Careerstudent = -0.06832140830084;
                  Careertechnician = -0.13177255984613;
                  Careerunemployed = -0.05517515846472;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm16 = 'RETIRED'  then do;
               Careeradministration = -0.19798053664464;
               Careerblue_collar = -0.12150458809345;
               Careerentrepreneur = -0.05045179254789;
               Careerhousemaid = -0.04627208046437;
               Careermanagement = -0.08359323130889;
               Careerretired = 0.94943138329441;
               Careerself_employed = -0.05680708819217;
               Careerservices = -0.08255216308554;
               Careerstudent = -0.06832140830084;
               Careertechnician = -0.13177255984613;
               Careerunemployed = -0.05517515846472;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm16 <= 'STUDENT'  then do;
         if _dm16 <= 'SERVICES'  then do;
            if _dm16 = 'SELF-EMPLOYED'  then do;
               Careeradministration = -0.19798053664464;
               Careerblue_collar = -0.12150458809345;
               Careerentrepreneur = -0.05045179254789;
               Careerhousemaid = -0.04627208046437;
               Careermanagement = -0.08359323130889;
               Careerretired = -0.09572860379648;
               Careerself_employed = 1.59993662086455;
               Careerservices = -0.08255216308554;
               Careerstudent = -0.06832140830084;
               Careertechnician = -0.13177255984613;
               Careerunemployed = -0.05517515846472;
               _dm_find = 1;
            end;
            else do;
               if _dm16 = 'SERVICES'  then do;
                  Careeradministration = -0.19798053664464;
                  Careerblue_collar = -0.12150458809345;
                  Careerentrepreneur = -0.05045179254789;
                  Careerhousemaid = -0.04627208046437;
                  Careermanagement = -0.08359323130889;
                  Careerretired = -0.09572860379648;
                  Careerself_employed = -0.05680708819217;
                  Careerservices = 1.10097346121827;
                  Careerstudent = -0.06832140830084;
                  Careertechnician = -0.13177255984613;
                  Careerunemployed = -0.05517515846472;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm16 = 'STUDENT'  then do;
               Careeradministration = -0.19798053664464;
               Careerblue_collar = -0.12150458809345;
               Careerentrepreneur = -0.05045179254789;
               Careerhousemaid = -0.04627208046437;
               Careermanagement = -0.08359323130889;
               Careerretired = -0.09572860379648;
               Careerself_employed = -0.05680708819217;
               Careerservices = -0.08255216308554;
               Careerstudent = 1.33029665201171;
               Careertechnician = -0.13177255984613;
               Careerunemployed = -0.05517515846472;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm16 = 'TECHNICIAN'  then do;
            Careeradministration = -0.19798053664464;
            Careerblue_collar = -0.12150458809345;
            Careerentrepreneur = -0.05045179254789;
            Careerhousemaid = -0.04627208046437;
            Careermanagement = -0.08359323130889;
            Careerretired = -0.09572860379648;
            Careerself_employed = -0.05680708819217;
            Careerservices = -0.08255216308554;
            Careerstudent = -0.06832140830084;
            Careertechnician = 0.68973192013168;
            Careerunemployed = -0.05517515846472;
            _dm_find = 1;
         end;
         else do;
            if _dm16 = 'UNEMPLOYED'  then do;
               Careeradministration = -0.19798053664464;
               Careerblue_collar = -0.12150458809345;
               Careerentrepreneur = -0.05045179254789;
               Careerhousemaid = -0.04627208046437;
               Careermanagement = -0.08359323130889;
               Careerretired = -0.09572860379648;
               Careerself_employed = -0.05680708819217;
               Careerservices = -0.08255216308554;
               Careerstudent = -0.06832140830084;
               Careertechnician = -0.13177255984613;
               Careerunemployed = 1.64725835416415;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   if not _dm_find then do;
      Careeradministration = .;
      Careerblue_collar = .;
      Careerentrepreneur = .;
      Careerhousemaid = .;
      Careermanagement = .;
      Careerretired = .;
      Careerself_employed = .;
      Careerservices = .;
      Careerstudent = .;
      Careertechnician = .;
      Careerunemployed = .;
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for Education ;
drop Educationilliterate Educationprimary_education 
        Educationprofessional_educat Educationsecondary_education 
        Educationuniversity_educatio ;
if missing( Education ) then do;
   Educationilliterate = .;
   Educationprimary_education = .;
   Educationprofessional_educat = .;
   Educationsecondary_education = .;
   Educationuniversity_educatio = .;
end;
else do;
   length _dm24 $ 24; drop _dm24 ;
   _dm24 = put( Education , $24. );
   %DMNORMIP( _dm24 )
   _dm_find = 0; drop _dm_find;
   if _dm24 <= 'PROFESSIONAL EDUCATION'  then do;
      if _dm24 <= 'PRIMARY EDUCATION'  then do;
         if _dm24 = 'ILLITERATE'  then do;
            Educationilliterate = 14.5825253975574;
            Educationprimary_education = -0.17969194825559;
            Educationprofessional_educat = -0.17721643846104;
            Educationsecondary_education = -0.32368407414863;
            Educationuniversity_educatio = -0.3504161437781;
            _dm_find = 1;
         end;
         else do;
            if _dm24 = 'PRIMARY EDUCATION'  then do;
               Educationilliterate = -0.01371182453931;
               Educationprimary_education = 1.11275453092059;
               Educationprofessional_educat = -0.17721643846104;
               Educationsecondary_education = -0.32368407414863;
               Educationuniversity_educatio = -0.3504161437781;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm24 = 'PROFESSIONAL EDUCATION'  then do;
            Educationilliterate = -0.01371182453931;
            Educationprimary_education = -0.17969194825559;
            Educationprofessional_educat = 1.12829843172428;
            Educationsecondary_education = -0.32368407414863;
            Educationuniversity_educatio = -0.3504161437781;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm24 = 'SECONDARY EDUCATION'  then do;
         Educationilliterate = -0.01371182453931;
         Educationprimary_education = -0.17969194825559;
         Educationprofessional_educat = -0.17721643846104;
         Educationsecondary_education = 0.61774132730279;
         Educationuniversity_educatio = -0.3504161437781;
         _dm_find = 1;
      end;
      else do;
         if _dm24 = 'UNIVERSITY EDUCATION'  then do;
            Educationilliterate = -0.01371182453931;
            Educationprimary_education = -0.17969194825559;
            Educationprofessional_educat = -0.17721643846104;
            Educationsecondary_education = -0.32368407414863;
            Educationuniversity_educatio = 0.57061591807817;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      Educationilliterate = .;
      Educationprimary_education = .;
      Educationprofessional_educat = .;
      Educationsecondary_education = .;
      Educationuniversity_educatio = .;
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for Marital_Statues ;
drop Marital_Statuesdivorced Marital_Statuesmarried Marital_Statuessingle ;
if missing( Marital_Statues ) then do;
   Marital_Statuesdivorced = .;
   Marital_Statuesmarried = .;
   Marital_Statuessingle = .;
end;
else do;
   length _dm10 $ 10; drop _dm10 ;
   _dm10 = put( Marital_Statues , $10. );
   %DMNORMIP( _dm10 )
   if _dm10 = 'MARRIED'  then do;
      Marital_Statuesdivorced = -0.19795427644524;
      Marital_Statuesmarried = 0.52239464785688;
      Marital_Statuessingle = -0.41896236257966;
   end;
   else if _dm10 = 'SINGLE'  then do;
      Marital_Statuesdivorced = -0.19795427644524;
      Marital_Statuesmarried = -0.63793733470681;
      Marital_Statuessingle = 0.7954295638085;
   end;
   else if _dm10 = 'DIVORCED'  then do;
      Marital_Statuesdivorced = 1.683495074233;
      Marital_Statuesmarried = -0.63793733470681;
      Marital_Statuessingle = -0.41896236257966;
   end;
   else do;
      Marital_Statuesdivorced = .;
      Marital_Statuesmarried = .;
      Marital_Statuessingle = .;
      _DM_BAD = 1;
   end;
end;

*** End Class Look-up, Standardization, Replacement ;


*** Omitted Cases;
if _dm_bad then do;
   _SEGMENT_ = .; Distance = .;
   goto CLUS3vlex ;
end; *** omitted;

*** Compute Distances and Cluster Membership;
label _SEGMENT_ = 'Segment Id' ;
label Distance = 'Distance' ;
array CLUS3vads [5] _temporary_;
drop _vqclus _vqmvar _vqnvar;
_vqmvar = 0;
do _vqclus = 1 to 5; CLUS3vads [_vqclus] = 0; end;
if not missing( T_Age ) then do;
   CLUS3vads [1] + ( T_Age - 2.91467918643109 )**2;
   CLUS3vads [2] + ( T_Age - -0.71951099185845 )**2;
   CLUS3vads [3] + ( T_Age - 0.1185225810584 )**2;
   CLUS3vads [4] + ( T_Age - -0.12712684481703 )**2;
   CLUS3vads [5] + ( T_Age - 1.64580247248182 )**2;
end;
else _vqmvar + 1;
if not missing( Careeradministration ) then do;
   CLUS3vads [1] + ( Careeradministration - -0.19798053664464 )**2;
   CLUS3vads [2] + ( Careeradministration - 0.04619825287206 )**2;
   CLUS3vads [3] + ( Careeradministration - -0.19798053664464 )**2;
   CLUS3vads [4] + ( Careeradministration - 0.00826252180589 )**2;
   CLUS3vads [5] + ( Careeradministration - -0.10519037514869 )**2;
end;
else _vqmvar + 0.09090909090909;
if not missing( Careerblue_collar ) then do;
   CLUS3vads [1] + ( Careerblue_collar - -0.12150458809345 )**2;
   CLUS3vads [2] + ( Careerblue_collar - -0.03003913086628 )**2;
   CLUS3vads [3] + ( Careerblue_collar - -0.12150458809345 )**2;
   CLUS3vads [4] + ( Careerblue_collar - 0.03881785338087 )**2;
   CLUS3vads [5] + ( Careerblue_collar - -0.04406610042665 )**2;
end;
else _vqmvar + 0.09090909090909;
if not missing( Careerentrepreneur ) then do;
   CLUS3vads [1] + ( Careerentrepreneur - -0.05045179254789 )**2;
   CLUS3vads [2] + ( Careerentrepreneur - -0.02610117256991 )**2;
   CLUS3vads [3] + ( Careerentrepreneur - 0.56685778408699 )**2;
   CLUS3vads [4] + ( Careerentrepreneur - 0.02186771791303 )**2;
   CLUS3vads [5] + ( Careerentrepreneur - -0.01039735436929 )**2;
end;
else _vqmvar + 0.09090909090909;
if not missing( Careerhousemaid ) then do;
   CLUS3vads [1] + ( Careerhousemaid - -0.04627208046437 )**2;
   CLUS3vads [2] + ( Careerhousemaid - -0.02679343304793 )**2;
   CLUS3vads [3] + ( Careerhousemaid - -0.04627208046437 )**2;
   CLUS3vads [4] + ( Careerhousemaid - -0.01844544129803 )**2;
   CLUS3vads [5] + ( Careerhousemaid - 0.09696784582956 )**2;
end;
else _vqmvar + 0.09090909090909;
if not missing( Careermanagement ) then do;
   CLUS3vads [1] + ( Careermanagement - -0.08359323130889 )**2;
   CLUS3vads [2] + ( Careermanagement - -0.0349764066531 )**2;
   CLUS3vads [3] + ( Careermanagement - -0.08359323130889 )**2;
   CLUS3vads [4] + ( Careermanagement - 0.02637339588872 )**2;
   CLUS3vads [5] + ( Careermanagement - -0.00315279814749 )**2;
end;
else _vqmvar + 0.09090909090909;
if not missing( Careerretired ) then do;
   CLUS3vads [1] + ( Careerretired - 0.94943138329441 )**2;
   CLUS3vads [2] + ( Careerretired - -0.09500530968777 )**2;
   CLUS3vads [3] + ( Careerretired - 0.25265805856714 )**2;
   CLUS3vads [4] + ( Careerretired - -0.09417868784924 )**2;
   CLUS3vads [5] + ( Careerretired - 0.41488390898074 )**2;
end;
else _vqmvar + 0.09090909090909;
if not missing( Careerself_employed ) then do;
   CLUS3vads [1] + ( Careerself_employed - -0.05680708819217 )**2;
   CLUS3vads [2] + ( Careerself_employed - -0.00062685169128 )**2;
   CLUS3vads [3] + ( Careerself_employed - 0.49544081482673 )**2;
   CLUS3vads [4] + ( Careerself_employed - 0.01116608425058 )**2;
   CLUS3vads [5] + ( Careerself_employed - -0.0294054746836 )**2;
end;
else _vqmvar + 0.09090909090909;
if not missing( Careerservices ) then do;
   CLUS3vads [1] + ( Careerservices - -0.08255216308554 )**2;
   CLUS3vads [2] + ( Careerservices - 0.00508606653418 )**2;
   CLUS3vads [3] + ( Careerservices - -0.08255216308554 )**2;
   CLUS3vads [4] + ( Careerservices - 0.01924391137262 )**2;
   CLUS3vads [5] + ( Careerservices - -0.05846003841777 )**2;
end;
else _vqmvar + 0.09090909090909;
if not missing( Careerstudent ) then do;
   CLUS3vads [1] + ( Careerstudent - -0.06832140830084 )**2;
   CLUS3vads [2] + ( Careerstudent - 0.12235524075214 )**2;
   CLUS3vads [3] + ( Careerstudent - -0.06832140830084 )**2;
   CLUS3vads [4] + ( Careerstudent - -0.06071646580779 )**2;
   CLUS3vads [5] + ( Careerstudent - -0.06832140830084 )**2;
end;
else _vqmvar + 0.09090909090909;
if not missing( Careertechnician ) then do;
   CLUS3vads [1] + ( Careertechnician - -0.13177255984613 )**2;
   CLUS3vads [2] + ( Careertechnician - 0.01831545587299 )**2;
   CLUS3vads [3] + ( Careertechnician - -0.13177255984613 )**2;
   CLUS3vads [4] + ( Careertechnician - 0.02091438255211 )**2;
   CLUS3vads [5] + ( Careertechnician - -0.086830202799 )**2;
end;
else _vqmvar + 0.09090909090909;
if not missing( Careerunemployed ) then do;
   CLUS3vads [1] + ( Careerunemployed - -0.05517515846472 )**2;
   CLUS3vads [2] + ( Careerunemployed - -0.00215819786382 )**2;
   CLUS3vads [3] + ( Careerunemployed - -0.05517515846472 )**2;
   CLUS3vads [4] + ( Careerunemployed - 0.00457411459343 )**2;
   CLUS3vads [5] + ( Careerunemployed - -0.00752434767867 )**2;
end;
else _vqmvar + 0.09090909090909;
if not missing( Educationilliterate ) then do;
   CLUS3vads [1] + ( Educationilliterate - 14.5825253975574 )**2;
   CLUS3vads [2] + ( Educationilliterate - -0.01371182453931 )**2;
   CLUS3vads [3] + ( Educationilliterate - 14.5825253975574 )**2;
   CLUS3vads [4] + ( Educationilliterate - -0.01371182453931 )**2;
   CLUS3vads [5] + ( Educationilliterate - -0.01371182453931 )**2;
end;
else _vqmvar + 0.2;
if not missing( Educationprimary_education ) then do;
   CLUS3vads [1] + ( Educationprimary_education - -0.17969194825559 )**2;
   CLUS3vads [2] + ( Educationprimary_education - -0.12602635050433 )**2;
   CLUS3vads [3] + ( Educationprimary_education - -0.17969194825559 )**2;
   CLUS3vads [4] + ( Educationprimary_education - -0.04680570620485 )**2;
   CLUS3vads [5] + ( Educationprimary_education - 0.35307224926741 )**2;
end;
else _vqmvar + 0.2;
if not missing( Educationprofessional_educat ) then do;
   CLUS3vads [1] + ( Educationprofessional_educat - -0.17721643846104 )**2;
   CLUS3vads [2] + ( Educationprofessional_educat - -0.02724033572694 )**2;
   CLUS3vads [3] + ( Educationprofessional_educat - -0.17721643846104 )**2;
   CLUS3vads [4] + ( Educationprofessional_educat - 0.02283774332711 )**2;
   CLUS3vads [5] + ( Educationprofessional_educat - -0.00779847820798 )**2;
end;
else _vqmvar + 0.2;
if not missing( Educationsecondary_education ) then do;
   CLUS3vads [1] + ( Educationsecondary_education - -0.32368407414863 )**2;
   CLUS3vads [2] + ( Educationsecondary_education - 0.04571952628247 )**2;
   CLUS3vads [3] + ( Educationsecondary_education - -0.32368407414863 )**2;
   CLUS3vads [4] + ( Educationsecondary_education - 0.01649485242624 )**2;
   CLUS3vads [5] + ( Educationsecondary_education - -0.12485886213726 )**2;
end;
else _vqmvar + 0.2;
if not missing( Educationuniversity_educatio ) then do;
   CLUS3vads [1] + ( Educationuniversity_educatio - -0.3504161437781 )**2;
   CLUS3vads [2] + ( Educationuniversity_educatio - 0.06516372081033 )**2;
   CLUS3vads [3] + ( Educationuniversity_educatio - -0.3504161437781 )**2;
   CLUS3vads [4] + ( Educationuniversity_educatio - 0.00197081414416 )**2;
   CLUS3vads [5] + ( Educationuniversity_educatio - -0.12308761960492 )**2;
end;
else _vqmvar + 0.19999999999999;
if not missing( Marital_Statuesdivorced ) then do;
   CLUS3vads [1] + ( Marital_Statuesdivorced - -0.19795427644524 )**2;
   CLUS3vads [2] + ( Marital_Statuesdivorced - -0.19795427644524 )**2;
   CLUS3vads [3] + ( Marital_Statuesdivorced - 0.42919550711417 )**2;
   CLUS3vads [4] + ( Marital_Statuesdivorced - 0.04199329274654 )**2;
   CLUS3vads [5] + ( Marital_Statuesdivorced - 0.25445530024456 )**2;
end;
else _vqmvar + 0.33333333333333;
if not missing( Marital_Statuesmarried ) then do;
   CLUS3vads [1] + ( Marital_Statuesmarried - 0.52239464785688 )**2;
   CLUS3vads [2] + ( Marital_Statuesmarried - -0.63793733470683 )**2;
   CLUS3vads [3] + ( Marital_Statuesmarried - 0.13561732033565 )**2;
   CLUS3vads [4] + ( Marital_Statuesmarried - 0.37441360410928 )**2;
   CLUS3vads [5] + ( Marital_Statuesmarried - 0.20795353807817 )**2;
end;
else _vqmvar + 0.33333333333333;
if not missing( Marital_Statuessingle ) then do;
   CLUS3vads [1] + ( Marital_Statuessingle - -0.41896236257966 )**2;
   CLUS3vads [2] + ( Marital_Statuessingle - 0.79542956380851 )**2;
   CLUS3vads [3] + ( Marital_Statuessingle - -0.41896236257966 )**2;
   CLUS3vads [4] + ( Marital_Statuessingle - -0.41896236257968 )**2;
   CLUS3vads [5] + ( Marital_Statuessingle - -0.38188169307163 )**2;
end;
else _vqmvar + 0.33333333333333;
_vqnvar = 4 - _vqmvar;
if _vqnvar <= 9.0949470177293E-12 then do;
   _SEGMENT_ = .; Distance = .;
end;
else do;
   _SEGMENT_ = 1; Distance = CLUS3vads [1];
   _vqfzdst = Distance * 0.99999999999988; drop _vqfzdst;
   do _vqclus = 2 to 5;
      if CLUS3vads [_vqclus] < _vqfzdst then do;
         _SEGMENT_ = _vqclus; Distance = CLUS3vads [_vqclus];
         _vqfzdst = Distance * 0.99999999999988;
      end;
   end;
   Distance = sqrt(Distance * (4 / _vqnvar));
end;
CLUS3vlex :;

***************************************;
*** End Scoring Code from PROC DMVQ ***;
***************************************;