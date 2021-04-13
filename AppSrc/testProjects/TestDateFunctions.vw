Use DfAllEnt.pkg
Use Win\GridFunctions.pkg
Use Windows.pkg
Use cTextEdit.pkg    

Use DateFunctions.pkg

Deferred_View Activate_DateFunctionsTestView for ;
Object oDateFunctionsTestView is a View
    Set Size to 221 344
    Set Location to 12 6
    Set Label to "Test oDateFunctions object in DateFunctions.pkg"
    Set Border_Style to Border_Thick
    Set piMinSize to 209 344
    On_Key kCancel Send close_panel    

    Object oTabDialog is a TabDialog
        Set Size to 190 317
        Set Location to 14 12
        Set peAnchors to anAll

        Object oTabPage2 is a TabPage
            Set Label to "DateTime"

            Object oGroup2 is a Group
                Set Size to 131 279
                Set Location to 8 11
                Set Label to 'DateTimeIncrement'
                
                Object oForm1 is a Form
                    Set Size to 13 134
                    Set Location to 22 32
                    Set label_justification_mode to jmode_top 
                    Set label_col_offset to 0 
                    Set Label to "Date23 input (YYYY-MM-DDThh:mm:ss.ttt):"
                End_Object
    
                Object oForm2 is a Form
                    Set Size to 13 100
                    Set Location to 64 32
                End_Object
    
                Object oForm3 is a Form
                    Set Size to 13 100
                    Set Location to 85 32
                End_Object

                Object oButton1 is a Button
                    Set Location to 94 215
                    Set Label to 'oButton1'
                
                    // fires when the button is clicked
                    Procedure OnClick
                        DateTime dtOne dtTwo
                        Move (String23ToDateTime(oDateFunctions,"2016-06-30T00:00:00.000")) to dtOne // Move (A2DT("2016-06-30T00:00:00.000")) to dtOne
                        Showln "(1) " dtOne // => 30-06-2016 00:00:00
                        
                        Move (DateTimeIncrement(oDateFunctions, dtOne, DS_MINUTE, -1440)) to dtTwo
                        Showln "(2) " dtTwo // => 28-06-2016 24:00:00
                        
                        Move (DateTimeIncrement(oDateFunctions, dtOne, DS_MINUTE, -1439)) to dtTwo
                        Showln "(3) " dtTwo // => 28-06-2016 24:00:00
                        
                        Move (DateTimeIncrement(oDateFunctions, dtOne, DS_MINUTE, -1441)) to dtTwo
                        Showln "(4) " dtTwo // => 28-06-2016 24:00:00                   
                        
                        Move (DateTimeIncrement(oDateFunctions, dtOne, DS_DAY, -1)) to dtTwo
                        Showln "(5) " dtTwo // => 28-06-2016 24:00:00
                        
                    End_Procedure
                
                End_Object
    
            End_Object
        
        
        End_Object

        Object oTabPage1 is a TabPage
            Set Label to "Date"

            Object oDateForm is a cDateForm
                Set Size to 13 100
                Set Location to 38 76
                Set Label to "This is a date form"
                Set Label_Justification_Mode to JMode_Top
                Set Label_Col_Offset to 0
            
                // OnChange is called on every changed character
            //    Procedure OnChange
            //        String sValue
            //    
            //        Get Value to sValue
            //    End_Procedure
            
            End_Object



        End_Object
        
        

    End_Object
    
Cd_End_Object
