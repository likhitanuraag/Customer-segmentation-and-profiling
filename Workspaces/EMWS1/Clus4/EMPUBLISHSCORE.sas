*****************************************;
*** Begin Scoring Code from PROC DMVQ ***;
*****************************************;


*** Begin Class Look-up, Standardization, Replacement ;
drop _dm_bad; _dm_bad = 0;

*** Standardize Number_of_Contacts ;
drop T_Number_of_Contacts ;
if missing( Number_of_Contacts ) then T_Number_of_Contacts = .;
else T_Number_of_Contacts = (Number_of_Contacts
         - 2.05753875058713) * 0.60535013478507;

*** Generate dummy variables for Contact_Type ;
drop Contact_Typecellular Contact_Typetelephone ;
if missing( Contact_Type ) then do;
   Contact_Typecellular = .;
   Contact_Typetelephone = .;
end;
else do;
   length _dm11 $ 11; drop _dm11 ;
   _dm11 = put( Contact_Type , $11. );
   %DMNORMIP( _dm11 )
   if _dm11 = 'CELLULAR'  then do;
      Contact_Typecellular = 0.31974844293148;
      Contact_Typetelephone = -0.31974844293148;
   end;
   else if _dm11 = 'TELEPHONE'  then do;
      Contact_Typecellular = -1.56336202733443;
      Contact_Typetelephone = 1.56336202733443;
   end;
   else do;
      Contact_Typecellular = .;
      Contact_Typetelephone = .;
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for Mortage ;
drop Mortageno Mortageyes ;
if missing( Mortage ) then do;
   Mortageno = .;
   Mortageyes = .;
end;
else do;
   length _dm5 $ 5; drop _dm5 ;
   _dm5 = put( Mortage , $5. );
   %DMNORMIP( _dm5 )
   if _dm5 = 'YES'  then do;
      Mortageno = -0.63677063966891;
      Mortageyes = 0.63677063966891;
   end;
   else if _dm5 = 'NO'  then do;
      Mortageno = 0.78502767376068;
      Mortageyes = -0.78502767376068;
   end;
   else do;
      Mortageno = .;
      Mortageyes = .;
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for Personal_Loan ;
drop Personal_Loanno Personal_Loanyes ;
if missing( Personal_Loan ) then do;
   Personal_Loanno = .;
   Personal_Loanyes = .;
end;
else do;
   length _dm5 $ 5; drop _dm5 ;
   _dm5 = put( Personal_Loan , $5. );
   %DMNORMIP( _dm5 )
   if _dm5 = 'NO'  then do;
      Personal_Loanno = 0.29709143824442;
      Personal_Loanyes = -0.29709143824442;
   end;
   else if _dm5 = 'YES'  then do;
      Personal_Loanno = -1.68258828639526;
      Personal_Loanyes = 1.68258828639526;
   end;
   else do;
      Personal_Loanno = .;
      Personal_Loanyes = .;
      _DM_BAD = 1;
   end;
end;

*** End Class Look-up, Standardization, Replacement ;


*** Omitted Cases;
if _dm_bad then do;
   _SEGMENT_ = .; Distance = .;
   goto CLUS4vlex ;
end; *** omitted;

*** Compute Distances and Cluster Membership;
label _SEGMENT_ = 'Segment Id' ;
label Distance = 'Distance' ;
array CLUS4vads [5] _temporary_;
drop _vqclus _vqmvar _vqnvar;
_vqmvar = 0;
do _vqclus = 1 to 5; CLUS4vads [_vqclus] = 0; end;
if not missing( T_Number_of_Contacts ) then do;
   CLUS4vads [1] + ( T_Number_of_Contacts - 5.48744462894261 )**2;
   CLUS4vads [2] + ( T_Number_of_Contacts - 1.67977327486081 )**2;
   CLUS4vads [3] + ( T_Number_of_Contacts - 1.91307775913265 )**2;
   CLUS4vads [4] + ( T_Number_of_Contacts - -0.29140715709053 )**2;
   CLUS4vads [5] + ( T_Number_of_Contacts - -0.26221636642769 )**2;
end;
else _vqmvar + 1;
if not missing( Contact_Typecellular ) then do;
   CLUS4vads [1] + ( Contact_Typecellular - -0.56416055331578 )**2;
   CLUS4vads [2] + ( Contact_Typecellular - 0.31974844293148 )**2;
   CLUS4vads [3] + ( Contact_Typecellular - -1.56336202733443 )**2;
   CLUS4vads [4] + ( Contact_Typecellular - 0.31974844293145 )**2;
   CLUS4vads [5] + ( Contact_Typecellular - -1.56336202733441 )**2;
end;
else _vqmvar + 0.5;
if not missing( Contact_Typetelephone ) then do;
   CLUS4vads [1] + ( Contact_Typetelephone - 0.56416055331578 )**2;
   CLUS4vads [2] + ( Contact_Typetelephone - -0.31974844293148 )**2;
   CLUS4vads [3] + ( Contact_Typetelephone - 1.56336202733443 )**2;
   CLUS4vads [4] + ( Contact_Typetelephone - -0.31974844293145 )**2;
   CLUS4vads [5] + ( Contact_Typetelephone - 1.56336202733441 )**2;
end;
else _vqmvar + 0.5;
if not missing( Mortageno ) then do;
   CLUS4vads [1] + ( Mortageno - 0.03060407887967 )**2;
   CLUS4vads [2] + ( Mortageno - -0.03914662330977 )**2;
   CLUS4vads [3] + ( Mortageno - 0.15155317767818 )**2;
   CLUS4vads [4] + ( Mortageno - -0.01560978667932 )**2;
   CLUS4vads [5] + ( Mortageno - 0.07768894687918 )**2;
end;
else _vqmvar + 0.49999999999999;
if not missing( Mortageyes ) then do;
   CLUS4vads [1] + ( Mortageyes - -0.03060407887967 )**2;
   CLUS4vads [2] + ( Mortageyes - 0.03914662330977 )**2;
   CLUS4vads [3] + ( Mortageyes - -0.15155317767818 )**2;
   CLUS4vads [4] + ( Mortageyes - 0.01560978667932 )**2;
   CLUS4vads [5] + ( Mortageyes - -0.07768894687918 )**2;
end;
else _vqmvar + 0.49999999999999;
if not missing( Personal_Loanno ) then do;
   CLUS4vads [1] + ( Personal_Loanno - 0.13548493011057 )**2;
   CLUS4vads [2] + ( Personal_Loanno - -0.04554543717398 )**2;
   CLUS4vads [3] + ( Personal_Loanno - -0.09492434881293 )**2;
   CLUS4vads [4] + ( Personal_Loanno - 0.00124105014246 )**2;
   CLUS4vads [5] + ( Personal_Loanno - 0.02608352936219 )**2;
end;
else _vqmvar + 0.5;
if not missing( Personal_Loanyes ) then do;
   CLUS4vads [1] + ( Personal_Loanyes - -0.13548493011057 )**2;
   CLUS4vads [2] + ( Personal_Loanyes - 0.04554543717398 )**2;
   CLUS4vads [3] + ( Personal_Loanyes - 0.09492434881293 )**2;
   CLUS4vads [4] + ( Personal_Loanyes - -0.00124105014246 )**2;
   CLUS4vads [5] + ( Personal_Loanyes - -0.02608352936219 )**2;
end;
else _vqmvar + 0.5;
_vqnvar = 4 - _vqmvar;
if _vqnvar <= 3.1832314562052E-12 then do;
   _SEGMENT_ = .; Distance = .;
end;
else do;
   _SEGMENT_ = 1; Distance = CLUS4vads [1];
   _vqfzdst = Distance * 0.99999999999988; drop _vqfzdst;
   do _vqclus = 2 to 5;
      if CLUS4vads [_vqclus] < _vqfzdst then do;
         _SEGMENT_ = _vqclus; Distance = CLUS4vads [_vqclus];
         _vqfzdst = Distance * 0.99999999999988;
      end;
   end;
   Distance = sqrt(Distance * (4 / _vqnvar));
end;
CLUS4vlex :;

***************************************;
*** End Scoring Code from PROC DMVQ ***;
***************************************;
*------------------------------------------------------------*;
* Clus4: Creating Segment Label;
*------------------------------------------------------------*;
length _SEGMENT_LABEL_ $80;
label _SEGMENT_LABEL_='Segment Description';
if _SEGMENT_ = 1 then _SEGMENT_LABEL_="Cluster1";
else
if _SEGMENT_ = 2 then _SEGMENT_LABEL_="Cluster2";
else
if _SEGMENT_ = 3 then _SEGMENT_LABEL_="Cluster3";
else
if _SEGMENT_ = 4 then _SEGMENT_LABEL_="Cluster4";
else
if _SEGMENT_ = 5 then _SEGMENT_LABEL_="Cluster5";
