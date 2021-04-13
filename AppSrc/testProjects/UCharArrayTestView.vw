Use Windows.pkg
Use DFClient.pkg

Deferred_View Activate_oUCharArrayTestView for ;
Object oUCharArrayTestView is a dbView

    Set Border_Style to Border_Thick
    Set Size to 200 300
    Set Location to 2 2
    Set Label to "UCharArrayTestView"

    Object oButton1 is a Button
        Set Location to 42 131
        Set Label to 'Test UChar array'
    
        // fires when the button is clicked
        Procedure OnClick
            UChar[] sNewString
            Move "abcdef" to sNewString
            Showln sNewString
            
        End_Procedure
    
    End_Object

Cd_End_Object
