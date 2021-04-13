Use Windows.pkg
Use DFClient.pkg

Use ComScriptControl\cComScriptControl.pkg

Class cJSONParser2 is a cComScriptControl

    Procedure Construct_Object
        Forward Send Construct_Object

    End_Procedure

    Procedure End_Construct_Object
        Forward Send End_Construct_Object
        Set ComLanguage to "JScript"
        Send ComAddCode "function getProperty(jsonObj, propertyName) { return jsonObj[propertyName]; } "
        Send ComAddCode "function getKeys(jsonObj) { var keys = new Array(); for (var i in jsonObj) { keys.push(i); } return keys; } "
    End_Procedure

    Function DecodeJsonString String JsonString Returns Variant
        Variant v
        Get ComEval ("(" + JsonString + ")") to v
        Function_Return v
    End_Function

    Function GetProperty Variant vJSONObject Variant vPropertyName Returns Variant
        Variant v
        Variant[] vParams

        Move vJSONObject to vParams[0]
        Move vPropertyName to vParams[1]

        Get ComRun "getProperty" (&vParams) to v

        Function_Return v
    End_Function

End_Class


Activate_View Activate_oJSONScriptControlView for oJSONScriptControlView
Object oJSONScriptControlView is a dbView

    Set Border_Style to Border_Thick
    Set Size to 200 300
    Set Location to 2 2
    Set Label to "JSONScriptControlView"

    Object oButton1 is a Button
        Set Location to 110 99
        Set Label to 'oButton1'
    
        // fires when the button is clicked
        Procedure OnClick
            Handle h
            Variant v
            String[] sa
    
            Get Create (RefClass(cJSONParser2)) to h
            Get DecodeJsonString of h '{"key1": "val1", "key2": { "key3": "val3" } }' to v  // I do get something in v
            Get GetProperty of h v "key1" to v // This returns nothing
            
        End_Procedure
    
    End_Object

End_Object

