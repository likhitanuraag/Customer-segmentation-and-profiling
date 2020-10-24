*****************************************;
*** Begin Scoring Code from PROC DMVQ ***;
*****************************************;


*** Begin Class Look-up, Standardization, Replacement ;
drop _dm_bad; _dm_bad = 0;

*** Standardize Age ;
drop T_Age ;
if missing( Age ) then T_Age = .;
else T_Age = (Age - 39.8608707020525) * 0.09718656389406;

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
               Careeradministration = 0.50889118500978;
               Careerblue_collar = -0.16190726450904;
               Careerentrepreneur = -0.05789519750619;
               Careerhousemaid = -0.0490734720951;
               Careermanagement = -0.08356069142518;
               Careerretired = -0.06252737761989;
               Careerself_employed = -0.05765199118825;
               Careerservices = -0.09891082671327;
               Careerstudent = -0.04080813540891;
               Careertechnician = -0.13491224136642;
               Careerunemployed = -0.04845755775525;
               _dm_find = 1;
            end;
            else do;
               if _dm16 = 'BLUE-COLLAR'  then do;
                  Careeradministration = -0.17863684136789;
                  Careerblue_collar = 0.56147396576531;
                  Careerentrepreneur = -0.05789519750619;
                  Careerhousemaid = -0.0490734720951;
                  Careermanagement = -0.08356069142518;
                  Careerretired = -0.06252737761989;
                  Careerself_employed = -0.05765199118825;
                  Careerservices = -0.09891082671327;
                  Careerstudent = -0.04080813540891;
                  Careertechnician = -0.13491224136642;
                  Careerunemployed = -0.04845755775525;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm16 = 'ENTREPRENEUR'  then do;
               Careeradministration = -0.17863684136789;
               Careerblue_collar = -0.16190726450904;
               Careerentrepreneur = 1.5701943823646;
               Careerhousemaid = -0.0490734720951;
               Careermanagement = -0.08356069142518;
               Careerretired = -0.06252737761989;
               Careerself_employed = -0.05765199118825;
               Careerservices = -0.09891082671327;
               Careerstudent = -0.04080813540891;
               Careertechnician = -0.13491224136642;
               Careerunemployed = -0.04845755775525;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm16 <= 'MANAGEMENT'  then do;
            if _dm16 = 'HOUSEMAID'  then do;
               Careeradministration = -0.17863684136789;
               Careerblue_collar = -0.16190726450904;
               Careerentrepreneur = -0.05789519750619;
               Careerhousemaid = 1.85246142180295;
               Careermanagement = -0.08356069142518;
               Careerretired = -0.06252737761989;
               Careerself_employed = -0.05765199118825;
               Careerservices = -0.09891082671327;
               Careerstudent = -0.04080813540891;
               Careertechnician = -0.13491224136642;
               Careerunemployed = -0.04845755775525;
               _dm_find = 1;
            end;
            else do;
               if _dm16 = 'MANAGEMENT'  then do;
                  Careeradministration = -0.17863684136789;
                  Careerblue_collar = -0.16190726450904;
                  Careerentrepreneur = -0.05789519750619;
                  Careerhousemaid = -0.0490734720951;
                  Careermanagement = 1.08791241838279;
                  Careerretired = -0.06252737761989;
                  Careerself_employed = -0.05765199118825;
                  Careerservices = -0.09891082671327;
                  Careerstudent = -0.04080813540891;
                  Careertechnician = -0.13491224136642;
                  Careerunemployed = -0.04845755775525;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm16 = 'RETIRED'  then do;
               Careeradministration = -0.17863684136789;
               Careerblue_collar = -0.16190726450904;
               Careerentrepreneur = -0.05789519750619;
               Careerhousemaid = -0.0490734720951;
               Careermanagement = -0.08356069142518;
               Careerretired = 1.45387056599005;
               Careerself_employed = -0.05765199118825;
               Careerservices = -0.09891082671327;
               Careerstudent = -0.04080813540891;
               Careertechnician = -0.13491224136642;
               Careerunemployed = -0.04845755775525;
               _dm_find = 1;
            end;
         end;
      end;
   end;
   else do;
      if _dm16 <= 'STUDENT'  then do;
         if _dm16 <= 'SERVICES'  then do;
            if _dm16 = 'SELF-EMPLOYED'  then do;
               Careeradministration = -0.17863684136789;
               Careerblue_collar = -0.16190726450904;
               Careerentrepreneur = -0.05789519750619;
               Careerhousemaid = -0.0490734720951;
               Careermanagement = -0.08356069142518;
               Careerretired = -0.06252737761989;
               Careerself_employed = 1.57681828530897;
               Careerservices = -0.09891082671327;
               Careerstudent = -0.04080813540891;
               Careertechnician = -0.13491224136642;
               Careerunemployed = -0.04845755775525;
               _dm_find = 1;
            end;
            else do;
               if _dm16 = 'SERVICES'  then do;
                  Careeradministration = -0.17863684136789;
                  Careerblue_collar = -0.16190726450904;
                  Careerentrepreneur = -0.05789519750619;
                  Careerhousemaid = -0.0490734720951;
                  Careermanagement = -0.08356069142518;
                  Careerretired = -0.06252737761989;
                  Careerself_employed = -0.05765199118825;
                  Careerservices = 0.91907748535592;
                  Careerstudent = -0.04080813540891;
                  Careertechnician = -0.13491224136642;
                  Careerunemployed = -0.04845755775525;
                  _dm_find = 1;
               end;
            end;
         end;
         else do;
            if _dm16 = 'STUDENT'  then do;
               Careeradministration = -0.17863684136789;
               Careerblue_collar = -0.16190726450904;
               Careerentrepreneur = -0.05789519750619;
               Careerhousemaid = -0.0490734720951;
               Careermanagement = -0.08356069142518;
               Careerretired = -0.06252737761989;
               Careerself_employed = -0.05765199118825;
               Careerservices = -0.09891082671327;
               Careerstudent = 2.22766154295433;
               Careertechnician = -0.13491224136642;
               Careerunemployed = -0.04845755775525;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm16 = 'TECHNICIAN'  then do;
            Careeradministration = -0.17863684136789;
            Careerblue_collar = -0.16190726450904;
            Careerentrepreneur = -0.05789519750619;
            Careerhousemaid = -0.0490734720951;
            Careermanagement = -0.08356069142518;
            Careerretired = -0.06252737761989;
            Careerself_employed = -0.05765199118825;
            Careerservices = -0.09891082671327;
            Careerstudent = -0.04080813540891;
            Careertechnician = 0.67382109265536;
            Careerunemployed = -0.04845755775525;
            _dm_find = 1;
         end;
         else do;
            if _dm16 = 'UNEMPLOYED'  then do;
               Careeradministration = -0.17863684136789;
               Careerblue_collar = -0.16190726450904;
               Careerentrepreneur = -0.05789519750619;
               Careerhousemaid = -0.0490734720951;
               Careermanagement = -0.08356069142518;
               Careerretired = -0.06252737761989;
               Careerself_employed = -0.05765199118825;
               Careerservices = -0.09891082671327;
               Careerstudent = -0.04080813540891;
               Careertechnician = -0.13491224136642;
               Careerunemployed = 1.87600692443571;
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
            Educationilliterate = 20.6090596234465;
            Educationprimary_education = -0.19682294664746;
            Educationprofessional_educat = -0.17542254053591;
            Educationsecondary_education = -0.36121784809716;
            Educationuniversity_educatio = -0.29911428077881;
            _dm_find = 1;
         end;
         else do;
            if _dm24 = 'PRIMARY EDUCATION'  then do;
               Educationilliterate = -0.00970421621424;
               Educationprimary_education = 1.01611511241349;
               Educationprofessional_educat = -0.17542254053591;
               Educationsecondary_education = -0.36121784809716;
               Educationuniversity_educatio = -0.29911428077881;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm24 = 'PROFESSIONAL EDUCATION'  then do;
            Educationilliterate = -0.00970421621424;
            Educationprimary_education = -0.19682294664746;
            Educationprofessional_educat = 1.14007453060057;
            Educationsecondary_education = -0.36121784809716;
            Educationuniversity_educatio = -0.29911428077881;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm24 = 'SECONDARY EDUCATION'  then do;
         Educationilliterate = -0.00970421621424;
         Educationprimary_education = -0.19682294664746;
         Educationprofessional_educat = -0.17542254053591;
         Educationsecondary_education = 0.55366801948403;
         Educationuniversity_educatio = -0.29911428077881;
         _dm_find = 1;
      end;
      else do;
         if _dm24 = 'UNIVERSITY EDUCATION'  then do;
            Educationilliterate = -0.00970421621424;
            Educationprimary_education = -0.19682294664746;
            Educationprofessional_educat = -0.17542254053591;
            Educationsecondary_education = -0.36121784809716;
            Educationuniversity_educatio = 0.66862327682085;
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
      Marital_Statuesdivorced = -0.20553878536687;
      Marital_Statuesmarried = 0.46536123012655;
      Marital_Statuessingle = -0.36123677782606;
   end;
   else if _dm10 = 'SINGLE'  then do;
      Marital_Statuesdivorced = -0.20553878536687;
      Marital_Statuesmarried = -0.71627070761013;
      Marital_Statuessingle = 0.9227316764451;
   end;
   else if _dm10 = 'DIVORCED'  then do;
      Marital_Statuesdivorced = 1.62171152759367;
      Marital_Statuesmarried = -0.71627070761013;
      Marital_Statuessingle = -0.36123677782606;
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
   goto CLUS7vlex ;
end; *** omitted;

*** Compute Distances and Cluster Membership;
label _SEGMENT_ = 'Segment Id' ;
label Distance = 'Distance' ;
array CLUS7vads [5] _temporary_;
drop _vqclus _vqmvar _vqnvar;
_vqmvar = 0;
do _vqclus = 1 to 5; CLUS7vads [_vqclus] = 0; end;
if not missing( T_Age ) then do;
   CLUS7vads [1] + ( T_Age - -0.40255113472262 )**2;
   CLUS7vads [2] + ( T_Age - 0.39315868658023 )**2;
   CLUS7vads [3] + ( T_Age - -0.73258092353267 )**2;
   CLUS7vads [4] + ( T_Age - 0.83960729150403 )**2;
   CLUS7vads [5] + ( T_Age - 1.28090455713015 )**2;
end;
else _vqmvar + 1;
if not missing( Careeradministration ) then do;
   CLUS7vads [1] + ( Careeradministration - -0.01135022935391 )**2;
   CLUS7vads [2] + ( Careeradministration - 0.0214070871274 )**2;
   CLUS7vads [3] + ( Careeradministration - 0.06098738450022 )**2;
   CLUS7vads [4] + ( Careeradministration - -0.14044083990246 )**2;
   CLUS7vads [5] + ( Careeradministration - -0.06050539258479 )**2;
end;
else _vqmvar + 0.09090909090909;
if not missing( Careerblue_collar ) then do;
   CLUS7vads [1] + ( Careerblue_collar - 0.04178889401241 )**2;
   CLUS7vads [2] + ( Careerblue_collar - -0.04942346719474 )**2;
   CLUS7vads [3] + ( Careerblue_collar - -0.04853686639569 )**2;
   CLUS7vads [4] + ( Careerblue_collar - 0.15959550450178 )**2;
   CLUS7vads [5] + ( Careerblue_collar - 0.01121903602917 )**2;
end;
else _vqmvar + 0.09090909090909;
if not missing( Careerentrepreneur ) then do;
   CLUS7vads [1] + ( Careerentrepreneur - 0.00891552514965 )**2;
   CLUS7vads [2] + ( Careerentrepreneur - 0.00578395610668 )**2;
   CLUS7vads [3] + ( Careerentrepreneur - -0.02902112688486 )**2;
   CLUS7vads [4] + ( Careerentrepreneur - 0.12300364470167 )**2;
   CLUS7vads [5] + ( Careerentrepreneur - 0.01585102039736 )**2;
end;
else _vqmvar + 0.09090909090909;
if not missing( Careerhousemaid ) then do;
   CLUS7vads [1] + ( Careerhousemaid - -0.00703608583967 )**2;
   CLUS7vads [2] + ( Careerhousemaid - 0.01487034379795 )**2;
   CLUS7vads [3] + ( Careerhousemaid - -0.0311119858684 )**2;
   CLUS7vads [4] + ( Careerhousemaid - 0.05656735534367 )**2;
   CLUS7vads [5] + ( Careerhousemaid - 0.03933630574618 )**2;
end;
else _vqmvar + 0.09090909090909;
if not missing( Careermanagement ) then do;
   CLUS7vads [1] + ( Careermanagement - 0.00271152515894 )**2;
   CLUS7vads [2] + ( Careermanagement - 0.00193198007523 )**2;
   CLUS7vads [3] + ( Careermanagement - -0.03162067884575 )**2;
   CLUS7vads [4] + ( Careermanagement - -0.08356069142518 )**2;
   CLUS7vads [5] + ( Careermanagement - 0.03072936806827 )**2;
end;
else _vqmvar + 0.09090909090909;
if not missing( Careerretired ) then do;
   CLUS7vads [1] + ( Careerretired - -0.06022266226517 )**2;
   CLUS7vads [2] + ( Careerretired - 0.02209869411984 )**2;
   CLUS7vads [3] + ( Careerretired - -0.059896518537 )**2;
   CLUS7vads [4] + ( Careerretired - 0.19020561298176 )**2;
   CLUS7vads [5] + ( Careerretired - 0.15211954384056 )**2;
end;
else _vqmvar + 0.09090909090909;
if not missing( Careerself_employed ) then do;
   CLUS7vads [1] + ( Careerself_employed - 0.0019680644933 )**2;
   CLUS7vads [2] + ( Careerself_employed - -0.00853602294626 )**2;
   CLUS7vads [3] + ( Careerself_employed - -0.00377354930275 )**2;
   CLUS7vads [4] + ( Careerself_employed - 0.21475972156128 )**2;
   CLUS7vads [5] + ( Careerself_employed - 0.00463727239776 )**2;
end;
else _vqmvar + 0.09090909090909;
if not missing( Careerservices ) then do;
   CLUS7vads [1] + ( Careerservices - 0.00932295651812 )**2;
   CLUS7vads [2] + ( Careerservices - 0.02320892548581 )**2;
   CLUS7vads [3] + ( Careerservices - 0.00225022868367 )**2;
   CLUS7vads [4] + ( Careerservices - -0.09891082671327 )**2;
   CLUS7vads [5] + ( Careerservices - -0.02763834362742 )**2;
end;
else _vqmvar + 0.09090909090909;
if not missing( Careerstudent ) then do;
   CLUS7vads [1] + ( Careerstudent - -0.03469619637911 )**2;
   CLUS7vads [2] + ( Careerstudent - -0.03756205430465 )**2;
   CLUS7vads [3] + ( Careerstudent - 0.09978232272964 )**2;
   CLUS7vads [4] + ( Careerstudent - -0.04080813540891 )**2;
   CLUS7vads [5] + ( Careerstudent - -0.04080813540891 )**2;
end;
else _vqmvar + 0.09090909090909;
if not missing( Careertechnician ) then do;
   CLUS7vads [1] + ( Careertechnician - -0.00126870872531 )**2;
   CLUS7vads [2] + ( Careertechnician - 0.00473071924215 )**2;
   CLUS7vads [3] + ( Careertechnician - 0.0304980848788 )**2;
   CLUS7vads [4] + ( Careertechnician - -0.13491224136642 )**2;
   CLUS7vads [5] + ( Careertechnician - -0.03434892827268 )**2;
end;
else _vqmvar + 0.09090909090909;
if not missing( Careerunemployed ) then do;
   CLUS7vads [1] + ( Careerunemployed - 0.00166493687589 )**2;
   CLUS7vads [2] + ( Careerunemployed - 0.0052420235508 )**2;
   CLUS7vads [3] + ( Careerunemployed - -0.00486727791767 )**2;
   CLUS7vads [4] + ( Careerunemployed - -0.04845755775525 )**2;
   CLUS7vads [5] + ( Careerunemployed - 0.00057605383366 )**2;
end;
else _vqmvar + 0.09090909090909;
if not missing( Educationilliterate ) then do;
   CLUS7vads [1] + ( Educationilliterate - -0.00970421621424 )**2;
   CLUS7vads [2] + ( Educationilliterate - -0.00970421621424 )**2;
   CLUS7vads [3] + ( Educationilliterate - -0.00970421621424 )**2;
   CLUS7vads [4] + ( Educationilliterate - 20.6090596234465 )**2;
   CLUS7vads [5] + ( Educationilliterate - -0.00970421621424 )**2;
end;
else _vqmvar + 0.19999999999999;
if not missing( Educationprimary_education ) then do;
   CLUS7vads [1] + ( Educationprimary_education - -0.01272450687151 )**2;
   CLUS7vads [2] + ( Educationprimary_education - -0.03540643413708 )**2;
   CLUS7vads [3] + ( Educationprimary_education - -0.12048091748438 )**2;
   CLUS7vads [4] + ( Educationprimary_education - -0.19682294664746 )**2;
   CLUS7vads [5] + ( Educationprimary_education - 0.17271110052725 )**2;
end;
else _vqmvar + 0.2;
if not missing( Educationprofessional_educat ) then do;
   CLUS7vads [1] + ( Educationprofessional_educat - -0.00002293105105 )**2;
   CLUS7vads [2] + ( Educationprofessional_educat - 0.02317265288869 )**2;
   CLUS7vads [3] + ( Educationprofessional_educat - -0.00716571032886 )**2;
   CLUS7vads [4] + ( Educationprofessional_educat - -0.17542254053591 )**2;
   CLUS7vads [5] + ( Educationprofessional_educat - -0.00210465551031 )**2;
end;
else _vqmvar + 0.2;
if not missing( Educationsecondary_education ) then do;
   CLUS7vads [1] + ( Educationsecondary_education - 0.03494827404438 )**2;
   CLUS7vads [2] + ( Educationsecondary_education - 0.01058408807225 )**2;
   CLUS7vads [3] + ( Educationsecondary_education - 0.01108558640189 )**2;
   CLUS7vads [4] + ( Educationsecondary_education - -0.36121784809716 )**2;
   CLUS7vads [5] + ( Educationsecondary_education - -0.07172978938734 )**2;
end;
else _vqmvar + 0.19999999999999;
if not missing( Educationuniversity_educatio ) then do;
   CLUS7vads [1] + ( Educationuniversity_educatio - -0.02634265832584 )**2;
   CLUS7vads [2] + ( Educationuniversity_educatio - 0.00046200106339 )**2;
   CLUS7vads [3] + ( Educationuniversity_educatio - 0.09012608817189 )**2;
   CLUS7vads [4] + ( Educationuniversity_educatio - -0.29911428077881 )**2;
   CLUS7vads [5] + ( Educationuniversity_educatio - -0.05991956652018 )**2;
end;
else _vqmvar + 0.19999999999999;
if not missing( Marital_Statuesdivorced ) then do;
   CLUS7vads [1] + ( Marital_Statuesdivorced - -0.2055387853669 )**2;
   CLUS7vads [2] + ( Marital_Statuesdivorced - 1.62171152759379 )**2;
   CLUS7vads [3] + ( Marital_Statuesdivorced - -0.20553878536685 )**2;
   CLUS7vads [4] + ( Marital_Statuesdivorced - -0.0025109728157 )**2;
   CLUS7vads [5] + ( Marital_Statuesdivorced - -0.18425004587569 )**2;
end;
else _vqmvar + 0.33333333333333;
if not missing( Marital_Statuesmarried ) then do;
   CLUS7vads [1] + ( Marital_Statuesmarried - 0.4653612301265 )**2;
   CLUS7vads [2] + ( Marital_Statuesmarried - -0.71627070761011 )**2;
   CLUS7vads [3] + ( Marital_Statuesmarried - -0.71627070761022 )**2;
   CLUS7vads [4] + ( Marital_Statuesmarried - 0.2684225738371 )**2;
   CLUS7vads [5] + ( Marital_Statuesmarried - 0.40218818119057 )**2;
end;
else _vqmvar + 0.33333333333333;
if not missing( Marital_Statuessingle ) then do;
   CLUS7vads [1] + ( Marital_Statuessingle - -0.36123677782599 )**2;
   CLUS7vads [2] + ( Marital_Statuessingle - -0.36123677782604 )**2;
   CLUS7vads [3] + ( Marital_Statuessingle - 0.92273167644514 )**2;
   CLUS7vads [4] + ( Marital_Statuessingle - -0.28990519703322 )**2;
   CLUS7vads [5] + ( Marital_Statuessingle - -0.30755168566136 )**2;
end;
else _vqmvar + 0.33333333333333;
_vqnvar = 4 - _vqmvar;
if _vqnvar <= 9.0949470177293E-12 then do;
   _SEGMENT_ = .; Distance = .;
end;
else do;
   _SEGMENT_ = 1; Distance = CLUS7vads [1];
   _vqfzdst = Distance * 0.99999999999988; drop _vqfzdst;
   do _vqclus = 2 to 5;
      if CLUS7vads [_vqclus] < _vqfzdst then do;
         _SEGMENT_ = _vqclus; Distance = CLUS7vads [_vqclus];
         _vqfzdst = Distance * 0.99999999999988;
      end;
   end;
   Distance = sqrt(Distance * (4 / _vqnvar));
end;
CLUS7vlex :;

***************************************;
*** End Scoring Code from PROC DMVQ ***;
***************************************;