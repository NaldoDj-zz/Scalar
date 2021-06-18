#include 'hbclass.ch'

Function Main()
    
    Local cInitTime := Time()
    SET DATE BRITISH               
    SET CENTURY ON                 
    SET EXACT ON                   

    ?'Inicio:' + cInitTime

    oSuite := TestSuite():New()
    oRunner := TestTestRunner():New()
    oSuite:setCategories( {'TODOS'} ) 

    oSuite:addTest( Test_Character():New() )
    oSuite:addTest( Test_Date():New() )
    oSuite:addTest( Test_Logical():New() )
    oSuite:addTest( Test_Numeric():New() )
    oSuite:addTest( Test_TimeStamp():New() )
    oSuite:addTest( Test_NIL():New() )
    oSuite:addTest( Test_Array():New() )
    oSuite:addTest( Test_Hash():New() )

    oRunner:Run( oSuite )
    oSuite:End()

    ?'Fin:' + Time()
    ?'Duracion:' + ElapTime( cInitTime, Time() )
    
Return ( Nil )