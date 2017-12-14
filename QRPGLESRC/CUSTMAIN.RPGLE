000100171213     //****************************************************************
000101171213     // PROGRAM NAME:   CUSMAIN                                       *
000102171213     // RELATED FILES:  MAINMENU (DSPF)                               *
000103171213     // RELATED PGMS:   CUSMNT (ILERPGPGM)                            *
000104171213     //                 SCHZIP (ILERPGPGM)                            *
000105171214      //                 SCHNAM (ILERPGPGM)                            *
000106171214      // DESCRIPTION:    This is a customer main inquiry program.      *
000107171214      //                 It prompts the user to choose from one of the *
000108171214      //                 following actions:                            *
000113171214      //                 1.Maintain (add, update, delete and display)  *
000114171214      //                   customer records.                           *
000115171214      //                 2.Search customer record by zip code.         *
000116171214      //                 3.Search customer record by name.             *
000117171214      //****************************************************************
000118171213     Fmainmenu  cf   e             workstn indds(indicators)
000119171213      // Prototype definitions:
000120171213     D CustMaintain    pr                  extproc('CUSMNT')
000121171213     D SearchZip       pr                  extproc('SCHZIP')
000122171213     D SearchName      pr                  extproc('SCHNAM')
000123171213      // Field definitions:
000124171213     D indicators      ds
000125171213     D    exitKey                      n   overlay(indicators:3)
000126171213     D    maintainKey                  n   overlay(indicators:5)
000127171213     D    srchZipKey                   n   overlay(indicators:6)
000128171213     D    srchCustKey                  n   overlay(indicators:7)
000129171213
000137171213       /free
000138171213            // Keep looping until exit key is pressed
000139171213            dow  '1';
000140171213               // Display main menu
000141171213               exfmt hdrscn;
000142171213               // Perform requested action
000143171213               if exitKey;
000144171213                  // Exit program
000145171213                  leave;
000146171213               elseif maintainKey;
000147171213                  // Maintain customer data
000148171213                  CustMaintain();
000149171213               elseif srchZipKey;
000150171213                  // Search customer data on ZIP code
000151171213                  SearchZip();
000152171213               elseif srchCustKey;
000153171213                  // Search customer data on customer name
000154171213                  SearchName();
000155171213               endif;
000156171213            enddo;
000157171213            *inlr = *on;
000158171213       /end-free
