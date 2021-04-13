Use Windows.pkg
Use DFClient.pkg
Use FileFunctions.pkg

Activate_View Activate_oMainView for oMainView
Object oMainView is a dbView

    Set Border_Style to Border_Thick
    Set Size to 200 362
    Set Location to 2 2
    Set Label to "Compile HTML help"

    Object oOutputFolder is a Form
        Set Size to 13 261
        Set Location to 12 13
        Set Value to "C:\TestOutput"
    End_Object

    Object oSetOutputFolderBtn is a Button
        Set Size to 14 74
        Set Location to 12 284
        Set Label to 'Set output folder'
    
        // fires when the button is clicked
        Procedure OnClick
            String sFolder
            Get Value of oOutputFolder to sFolder
            Get BrowseFolder of oFileFunctions "Select output folder" sFolder to sFolder
            If (sFolder<>"") Begin
                Set Value of oOutputFolder to sFolder
            End
        End_Procedure
                     
    End_Object

    Property String[] paFiles

    Set pbAutoActivate to True

    Object oSelectFilesBtn is a Button
        Set Size to 14 153
        Set Location to 34 13
        Set Label to 'Select CHM files to compile'
        
        
        // fires when the button is clicked
        Procedure OnClick  
            Integer iItem iMax
            Boolean bContinue
            String[] aFiles
            Get BrowseFileOpenMultiSelect of oFileFunctions "Select CHM files to compile" "" "CHM files|*.chm" (&aFiles) to bContinue
            If (bContinue) Begin
                Move (SizeOfArray(aFiles)-1) to iMax
                For iItem from 0 to iMax
                    Showln aFiles[iItem]
                Loop    
                Set paFiles to aFiles
                Set Value of oNumberOfFiles to (String(SizeOfArray(aFiles))+" files selected")
            End
        End_Procedure
    End_Object

    Object oNumberOfFiles is a Form
        Set Size to 13 178
        Set Location to 34 179
        Set Enabled_State to False
    End_Object

    Object oCompileBtn is a Button
        Set Size to 14 114
        Set Location to 60 15
        Set Label to 'Compile'
    
        Procedure HtmlFilePostProduction String sFullPath tFileData stFileData
            Boolean bSaveFile
            Integer iPos iChannel
            Integer iItem iMax
            String[] aLines
            String sValue
            
            If (stFileData.sFileName="DataDictionary.htm") Begin
                Move 0 to WindowIndex
            End
            
            Move False to bSaveFile // Only write back the file if something was changed
            
            Get TextFileAsArray of oFileFunctions sFullPath to aLines
            Move (SizeOfArray(aLines)-1) to iMax
            
            For iItem from 0 to iMax
                If (aLines[iItem] contains ".chm::") Begin // Is this in the line?
                    Move True to bSaveFile
                    Move aLines[iItem] to sValue
                    While (sValue contains ".chm::")
                        Move (Pos(".chm::",sValue)) to iPos
                        Move (Replace(".chm::",sValue,"")) to sValue
                        While (Mid(sValue,1,iPos)<>'"')
                            Decrement iPos
                            If (iPos<=0) ;
                                    Break
                        Loop
                        If (iPos>0) Begin
                            Move (Insert("../",sValue,iPos+1)) to sValue
                        End
                    Loop
                    Move sValue to aLines[iItem]
                End
            Loop
//
            If (bSaveFile) Begin // Write back the array
                Get DirectOutput of oFileFunctions sFullPath to iChannel
                If (iChannel=>0) Begin

                    Move (SizeOfArray(aLines)-1) to iMax
                    For iItem from 0 to iMax
                        Writeln channel iChannel aLines[iItem]
                    Loop
                    Send CloseOutput of oFileFunctions iChannel

                End
                Else Begin
                    Send Info_Box "write error on " sFullPath
                End
            End
        End_Procedure
        
        Procedure ChmToHtml String sChmFile String sOutputFolder 
            String sCmdLine sFolder
            Get VdfFolderPath of oFileFunctions VDF_PROGRAM to sFolder
            Get AppendPath of oFileFunctions sFolder "\chmdecoder.exe" to sCmdLine
            Move ('"'+sCmdLine+'" -menu "'+sChmFile+'" "'+sOutputFolder+'"') to sCmdLine
//            Send ShellExecute of oFileFunctions sCmdLine "" ""
//            Send ShellCommandLine of oFileFunctions sCmdLine
            Showln sCmdLine
            RunProgram Background sCmdLine
//            
        End_Procedure

        Procedure OnClick
            Integer iItem iMax
            Boolean bConvertOnly
            String sFolder
            String[] aFiles
            tFileData[] aFileData
            
            Get Select_State of oCheckBox1 to bConvertOnly

            Get Value of oOutputFolder to sFolder
            If (not(bConvertOnly)) Begin
                Get paFiles to aFiles
                Move (SizeOfArray(aFiles)-1) to iMax
                For iItem from 0 to iMax
                    Send ChmToHtml aFiles[iItem] sFolder
                Loop
            End
            
            If (FileExists(oFileFunctions,sFolder)=2) Begin
                // Get all html files in folder and sub-folders:
                Send ReadFolderRecursive of oFileFunctions sFolder "*.htm" (&aFileData) 1 99
                // For each file found call HandleFileData:
                Send CallbackFileData of oFileFunctions sFolder aFileData 1 (RefProc(HtmlFilePostProduction)) Self
            End
            Send Info_Box "Done"

        End_Procedure
    
    End_Object

    Object oCheckBox1 is a CheckBox
        Set Size to 10 50
        Set Location to 63 147
        Set Label to 'Character convert only'
    
        // Fires whenever the value of the control is changed
    //    Procedure OnChange
    //        Boolean bChecked
    //    
    //        Get Checked_State to bChecked
    //    End_Procedure
    
    End_Object
End_Object

