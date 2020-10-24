*****************************************;
*** Begin Scoring Code from PROC DMVQ ***;
*****************************************;


*** Begin Class Look-up, Standardization, Replacement ;
drop _dm_bad; _dm_bad = 0;

*** Standardize Number_of_Contacts ;
drop T_Number_of_Contacts ;
if missing( Number_of_Contacts ) then T_Number_of_Contacts = .;
else T_Number_of_Contacts = (Number_of_Contacts
         - 2.63044693559302) * 0.34836416010646;

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
      Contact_Typecellular = 0.55932420336349;
      Contact_Typetelephone = -0.55932420336349;
   end;
   else if _dm11 = 'TELEPHONE'  then do;
      Contact_Typecellular = -0.89390962430374;
      Contact_Typetelephone = 0.89390962430374;
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
      Mortageno = -0.6575050953291;
      Mortageyes = 0.6575050953291;
   end;
   else if _dm5 = 'NO'  then do;
      Mortageno = 0.76042800587332;
      Mortageyes = -0.76042800587332;
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
      Personal_Loanno = 0.30460940329387;
      Personal_Loanyes = -0.30460940329387;
   end;
   else if _dm5 = 'YES'  then do;
      Personal_Loanno = -1.64139807598223;
      Personal_Loanyes = 1.64139807598223;
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
   goto CLUSvlex ;
end; *** omitted;

*** Compute Distances and Cluster Membership;
label _SEGMENT_ = 'Segment Id' ;
label Distance = 'Distance' ;
array CLUSvads [5] _temporary_;
drop _vqclus _vqmvar _vqnvar;
_vqmvar = 0;
do _vqclus = 1 to 5; CLUSvads [_vqclus] = 0; end;
if not missing( T_Number_of_Contacts ) then do;
   CLUSvads [1] + ( T_Number_of_Contacts - -0.24543788122031 )**2;
   CLUSvads [2] + ( T_Number_of_Contacts - 9.00740082260139 )**2;
   CLUSvads [3] + ( T_Number_of_Contacts - 1.8127882969574 )**2;
   CLUSvads [4] + ( T_Number_of_Contacts - 4.43256184372335 )**2;
   CLUSvads [5] + ( T_Number_of_Contacts - -0.17353892987368 )**2;
end;
else _vqmvar + 1;
if not missing( Contact_Typecellular ) then do;
   CLUSvads [1] + ( Contact_Typecellular - 0.5593242033634 )**2;
   CLUSvads [2] + ( Contact_Typecellular - -0.25088580675186 )**2;
   CLUSvads [3] + ( Contact_Typecellular - 0.0881811646128 )**2;
   CLUSvads [4] + ( Contact_Typecellular - -0.38187408013585 )**2;
   CLUSvads [5] + ( Contact_Typecellular - -0.89390962430363 )**2;
end;
else _vqmvar + 0.5;
if not missing( Contact_Typetelephone ) then do;
   CLUSvads [1] + ( Contact_Typetelephone - -0.5593242033634 )**2;
   CLUSvads [2] + ( Contact_Typetelephone - 0.25088580675186 )**2;
   CLUSvads [3] + ( Contact_Typetelephone - -0.0881811646128 )**2;
   CLUSvads [4] + ( Contact_Typetelephone - 0.38187408013585 )**2;
   CLUSvads [5] + ( Contact_Typetelephone - 0.89390962430363 )**2;
end;
else _vqmvar + 0.5;
if not missing( Mortageno ) then do;
   CLUSvads [1] + ( Mortageno - -0.04861412943451 )**2;
   CLUSvads [2] + ( Mortageno - -0.01755298770676 )**2;
   CLUSvads [3] + ( Mortageno - -0.01350360713357 )**2;
   CLUSvads [4] + ( Mortageno - 0.13665295524252 )**2;
   CLUSvads [5] + ( Mortageno - 0.07482104698831 )**2;
end;
else _vqmvar + 0.5;
if not missing( Mortageyes ) then do;
   CLUSvads [1] + ( Mortageyes - 0.04861412943451 )**2;
   CLUSvads [2] + ( Mortageyes - 0.01755298770676 )**2;
   CLUSvads [3] + ( Mortageyes - 0.01350360713357 )**2;
   CLUSvads [4] + ( Mortageyes - -0.13665295524252 )**2;
   CLUSvads [5] + ( Mortageyes - -0.07482104698831 )**2;
end;
else _vqmvar + 0.49999999999999;
if not missing( Personal_Loanno ) then do;
   CLUSvads [1] + ( Personal_Loanno - -0.00431903230682 )**2;
   CLUSvads [2] + ( Personal_Loanno - 0.11517504690416 )**2;
   CLUSvads [3] + ( Personal_Loanno - -0.02489385514929 )**2;
   CLUSvads [4] + ( Personal_Loanno - 0.02717452844799 )**2;
   CLUSvads [5] + ( Personal_Loanno - 0.00888862193819 )**2;
end;
else _vqmvar + 0.5;
if not missing( Personal_Loanyes ) then do;
   CLUSvads [1] + ( Personal_Loanyes - 0.00431903230682 )**2;
   CLUSvads [2] + ( Personal_Loanyes - -0.11517504690416 )**2;
   CLUSvads [3] + ( Personal_Loanyes - 0.02489385514929 )**2;
   CLUSvads [4] + ( Personal_Loanyes - -0.02717452844799 )**2;
   CLUSvads [5] + ( Personal_Loanyes - -0.00888862193819 )**2;
end;
else _vqmvar + 0.5;
_vqnvar = 4 - _vqmvar;
if _vqnvar <= 3.1832314562052E-12 then do;
   _SEGMENT_ = .; Distance = .;
end;
else do;
   _SEGMENT_ = 1; Distance = CLUSvads [1];
   _vqfzdst = Distance * 0.99999999999988; drop _vqfzdst;
   do _vqclus = 2 to 5;
      if CLUSvads [_vqclus] < _vqfzdst then do;
         _SEGMENT_ = _vqclus; Distance = CLUSvads [_vqclus];
         _vqfzdst = Distance * 0.99999999999988;
      end;
   end;
   Distance = sqrt(Distance * (4 / _vqnvar));
end;
CLUSvlex :;

***************************************;
*** End Scoring Code from PROC DMVQ ***;
***************************************;
*------------------------------------------------------------*;
* Clus: Creating Segment Label;
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
