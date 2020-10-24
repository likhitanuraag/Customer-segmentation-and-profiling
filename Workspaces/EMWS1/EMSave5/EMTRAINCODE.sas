*** MAIN MACRO FOR EMSAVE EXTENSION NODE;

%macro EM_SAVEXT_MAIN;

   %if %upcase("&EM_ACTION") = "CREATE" %then %do;
       filename _create catalog 'sashelp.emutil.savext_create.source';
       %include _create;
       filename _create;
       %EM_SAVEXT_CREATE;
   %end;
   %else
   %if %upcase("&EM_ACTION") = "TRAIN" %then %do;
       filename _train catalog 'sashelp.emutil.savext_train.source';
       %include _train;
       filename _train;
       %EM_SAVEXT_TRAIN;
   %end;

%mend EM_SAVEXT_MAIN;

%EM_SAVEXT_MAIN;

