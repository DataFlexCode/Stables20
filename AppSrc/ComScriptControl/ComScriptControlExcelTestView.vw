Use Windows.pkg
Use DFClient.pkg
Use FileFunctions.pkg

Use ComScriptControl\cComScriptControl.pkg
Use cExcelScriptor.pkg

Deferred_View Activate_oComScriptControlExcelTestView for ;
Object oComScriptControlExcelTestView is a dbView
    
    Object oScriptControl is a cComScriptControl
        Procedure NewExcelApp
            Handle hHandle
            Delegate Get Window_Handle to hHandle
            Set ComSitehWnd to hHandle
            Set ComLanguage to "VBScript"
            Set ComAllowUI to True
            Send ComExecuteStatement ('Set objExcel = CreateObject("Excel.Application")' + Character(10) + 'objExcel.Visible = True')
            Send ComExecuteStatement ('objExcel.Workbooks.Add')
        End_Procedure
        Procedure Set CellValue String sRow String sCol String sVal
//            Move (sVal+Character(128)) to sVal
            Send ComExecuteStatement ('objExcel.Cells(' + sRow + ',' + sCol + ').Value="' + sVal+'"')
        End_Procedure
    End_Object

    Set Border_Style to Border_Thick
    Set Size to 200 300
    Set Location to 2 2

    Object oButton1 is a Button
        Set Size to 14 151
        Set Location to 5 32
        Set Label to 'Open Excel and fill in'
    
        // fires when the button is clicked
        Procedure OnClick
            Send NewExcelApp of oScriptControl
            Set CellValue of oScriptControl 1 1 to "Hokus"            
            Set CellValue of oScriptControl 2 1 to "pokus"
            Set CellValue of oScriptControl 3 1 to "filiokus"
            Set CellValue of oScriptControl 1 2 to "1"
            Set CellValue of oScriptControl 2 2 to "2"            
            Set CellValue of oScriptControl 3 2 to "3"            
            Set CellValue of oScriptControl 1 3 to "1.01"
            Set CellValue of oScriptControl 2 3 to "2.12"         
            Set CellValue of oScriptControl 3 3 to "3.20"         
        End_Procedure
    
    End_Object

    Object oButton2 is a Button
        Set Size to 14 151
        Set Location to 23 32
        Set Label to 'Format 3rd column'
    
        // fires when the button is clicked
        Procedure OnClick
            Send ComExecuteStatement of oScriptControl 'objExcel.Columns("C:C").Select'
            Send ComExecuteStatement of oScriptControl 'objExcel.Selection.NumberFormat = "0.00"'
            Send ComExecuteStatement of oScriptControl 'objExcel.Range("A1").Select'
        End_Procedure
    
    End_Object
    
    Object oExcelScriptor is a cExcelScriptor
        Set pbExcelVisible to False
    End_Object

    Object oButton3 is a Button
        Set Size to 14 148
        Set Location to 66 37
        Set Label to 'Open Excel sheet'
    
        // fires when the button is clicked
        Procedure OnClick
            Boolean bWhat
            String sExcelSheet sValue
            Get BrowseFileOpen of oFileFunctions "Open Excel sheet" "." "*.xls|*.xls" to sExcelSheet
            If (sExcelSheet<>"") Begin
                Send NewExcelApp of oExcelScriptor False
                Get OpenExcelSheet of oExcelScriptor sExcelSheet to bWhat
                Get CellValue of oExcelScriptor 12 3 to sValue
                Send Info_Box sValue "value of cell 12,3"
            End
        End_Procedure
    
    End_Object

Cd_End_Object
