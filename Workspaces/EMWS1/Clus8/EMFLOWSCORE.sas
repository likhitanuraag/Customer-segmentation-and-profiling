*****************************************;
*** Begin Scoring Code from PROC DMVQ ***;
*****************************************;


*** Begin Class Look-up, Standardization, Replacement ;
drop _dm_bad; _dm_bad = 0;

*** Standardize Number_of_Contacts ;
drop T_Number_of_Contacts ;
if missing( Number_of_Contacts ) then T_Number_of_Contacts = .;
else T_Number_of_Contacts = (Number_of_Contacts
         - 2.56666230879853) * 0.36134043338427;

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
      Contact_Typecellular = 0.5314009348507;
      Contact_Typetelephone = -0.5314009348507;
   end;
   else if _dm11 = 'TELEPHONE'  then do;
      Contact_Typecellular = -0.94088454423979;
      Contact_Typetelephone = 0.94088454423979;
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
      Mortageno = -0.65517776074461;
      Mortageyes = 0.65517776074461;
   end;
   else if _dm5 = 'NO'  then do;
      Mortageno = 0.76313171226595;
      Mortageyes = -0.76313171226595;
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
      Personal_Loanno = 0.30377980276534;
      Personal_Loanyes = -0.30377980276534;
   end;
   else if _dm5 = 'YES'  then do;
      Personal_Loanno = -1.64588600639067;
      Personal_Loanyes = 1.64588600639067;
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
   goto CLUS8vlex ;
end; *** omitted;

*** Compute Distances and Cluster Membership;
label _SEGMENT_ = 'Segment Id' ;
label Distance = 'Distance' ;
array CLUS8vads [5] _temporary_;
drop _vqclus _vqmvar _vqnvar;
_vqmvar = 0;
do _vqclus = 1 to 5; CLUS8vads [_vqclus] = 0; end;
if not missing( T_Number_of_Contacts ) then do;
   CLUS8vads [1] + ( T_Number_of_Contacts - 10.7903151830205 )**2;
   CLUS8vads [2] + ( T_Number_of_Contacts - 2.52017908239013 )**2;
   CLUS8vads [3] + ( T_Number_of_Contacts - -0.12550862331438 )**2;
   CLUS8vads [4] + ( T_Number_of_Contacts - -0.20398232926234 )**2;
   CLUS8vads [5] + ( T_Number_of_Contacts - 6.26509244330862 )**2;
end;
else _vqmvar + 1;
if not missing( Contact_Typecellular ) then do;
   CLUS8vads [1] + ( Contact_Typecellular - -0.309905053201 )**2;
   CLUS8vads [2] + ( Contact_Typecellular - -0.03254726128919 )**2;
   CLUS8vads [3] + ( Contact_Typecellular - -0.94088454423959 )**2;
   CLUS8vads [4] + ( Contact_Typecellular - 0.5314009348508 )**2;
   CLUS8vads [5] + ( Contact_Typecellular - -0.36477283503046 )**2;
end;
else _vqmvar + 0.5;
if not missing( Contact_Typetelephone ) then do;
   CLUS8vads [1] + ( Contact_Typetelephone - 0.309905053201 )**2;
   CLUS8vads [2] + ( Contact_Typetelephone - 0.03254726128919 )**2;
   CLUS8vads [3] + ( Contact_Typetelephone - 0.94088454423959 )**2;
   CLUS8vads [4] + ( Contact_Typetelephone - -0.5314009348508 )**2;
   CLUS8vads [5] + ( Contact_Typetelephone - 0.36477283503046 )**2;
end;
else _vqmvar + 0.5;
if not missing( Mortageno ) then do;
   CLUS8vads [1] + ( Mortageno - 0.00332306601029 )**2;
   CLUS8vads [2] + ( Mortageno - 0.00834885982196 )**2;
   CLUS8vads [3] + ( Mortageno - 0.07599294978511 )**2;
   CLUS8vads [4] + ( Mortageno - -0.04412093601248 )**2;
   CLUS8vads [5] + ( Mortageno - 0.10723365557727 )**2;
end;
else _vqmvar + 0.5;
if not missing( Mortageyes ) then do;
   CLUS8vads [1] + ( Mortageyes - -0.00332306601029 )**2;
   CLUS8vads [2] + ( Mortageyes - -0.00834885982196 )**2;
   CLUS8vads [3] + ( Mortageyes - -0.07599294978511 )**2;
   CLUS8vads [4] + ( Mortageyes - 0.04412093601248 )**2;
   CLUS8vads [5] + ( Mortageyes - -0.10723365557727 )**2;
end;
else _vqmvar + 0.5;
if not missing( Personal_Loanno ) then do;
   CLUS8vads [1] + ( Personal_Loanno - 0.12970249837641 )**2;
   CLUS8vads [2] + ( Personal_Loanno - -0.00221104280874 )**2;
   CLUS8vads [3] + ( Personal_Loanno - 0.00849877812928 )**2;
   CLUS8vads [4] + ( Personal_Loanno - -0.00459083268591 )**2;
   CLUS8vads [5] + ( Personal_Loanno - -0.02758632290148 )**2;
end;
else _vqmvar + 0.5;
if not missing( Personal_Loanyes ) then do;
   CLUS8vads [1] + ( Personal_Loanyes - -0.12970249837641 )**2;
   CLUS8vads [2] + ( Personal_Loanyes - 0.00221104280874 )**2;
   CLUS8vads [3] + ( Personal_Loanyes - -0.00849877812928 )**2;
   CLUS8vads [4] + ( Personal_Loanyes - 0.00459083268591 )**2;
   CLUS8vads [5] + ( Personal_Loanyes - 0.02758632290148 )**2;
end;
else _vqmvar + 0.5;
_vqnvar = 4 - _vqmvar;
if _vqnvar <= 3.1832314562052E-12 then do;
   _SEGMENT_ = .; Distance = .;
end;
else do;
   _SEGMENT_ = 1; Distance = CLUS8vads [1];
   _vqfzdst = Distance * 0.99999999999988; drop _vqfzdst;
   do _vqclus = 2 to 5;
      if CLUS8vads [_vqclus] < _vqfzdst then do;
         _SEGMENT_ = _vqclus; Distance = CLUS8vads [_vqclus];
         _vqfzdst = Distance * 0.99999999999988;
      end;
   end;
   Distance = sqrt(Distance * (4 / _vqnvar));
end;
CLUS8vlex :;

***************************************;
*** End Scoring Code from PROC DMVQ ***;
***************************************;
*------------------------------------------------------------*;
* Clus8: Creating Segment Label;
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
