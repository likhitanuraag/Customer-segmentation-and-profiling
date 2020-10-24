

length _FILTERFMT1  $200;
drop _FILTERFMT1 ;
_FILTERFMT1= put(Subscribed,$5.);
if
_FILTERFMT1 not in ( 'yes')
;
