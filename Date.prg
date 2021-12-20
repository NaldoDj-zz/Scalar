/* CLASS: Scalar Date
          Clase que define los métodos para el tipo de dato Date
*/
#include 'hbclass.ch'
#include 'hbcompat.ch'
#include 'date.inc'

CREATE CLASS Date INHERIT HBScalar FUNCTION HBDate

    EXPORTED:
        METHOD Year()
        METHOD FirstDayOfYear()
        METHOD LastDayOfYear()
        METHOD Month()
        METHOD Day()
        METHOD AddDay( nDaysToAdd )
        METHOD SubDay( nDaysToSubstract )
        METHOD Tomorrow()
        METHOD Yesterday()
        METHOD DiffDays( dDate )
        METHOD AddWeek( nWeeksToAdd )
        METHOD SubWeek( nWeeksToSubstract )
        METHOD Str()
        METHOD StrFormat( cFormat )
        METHOD StrSql()
        METHOD StrSqlQuoted()
        METHOD IsEmpty()
        METHOD NotEmpty()

        METHOD StrDay()
        METHOD StrMonth()
        METHOD StrYear()

        METHOD StrYearMonth()

        METHOD AddMonth( nMonth )
        METHOD SubMonth( nMonth )

        METHOD AddYear( nYear )
        METHOD SubYear( nYear )

        METHOD DateDiffDay( dDate )
        METHOD DateDiffMonth( dDate )
        METHOD DateDiffYear( dDate )

        METHOD DateDiffYMD( dDate )

        METHOD LastDayOfMonth()

        METHOD FirstDateOfMonth()
        METHOD LastDateOfMonth()

        METHOD FirstDateOfYear()
        METHOD LastDateOfYear()

ENDCLASS

// Group: EXPORTED METHODS

/* METHOD: Year()
    Método que devuelve el año del valor del dato

Devuelve:
    Numérico
*/
METHOD Year() CLASS Date
RETURN Year( Self )

/* METHOD: FirstDayOfYear()
    Método que devuelve el primer día del año

Devuelve:
    Fecha
*/
METHOD FirstDayOfYear() CLASS Date
RETURN Ctod ( '01/01/' + ::Year():Strint() )

/* METHOD: LastDayOfYear()
    Método que devuelve el último día del año

Devuelve:
    Fecha
*/
METHOD LastDayOfYear() CLASS Date
RETURN Ctod ( '31/12/' + ::Year():Strint() )

/* METHOD: Month()
    Método que devuelve el número de mes del dato

Devuelve:
    Numérico
*/
METHOD Month() CLASS Date
RETURN Month( Self )

/* METHOD: Day()
    Método que devuelve el día del mes correspondiente al dato

Devuelve:
    Numérico
*/
METHOD Day() CLASS Date
RETURN Day( Self )


/* METHOD: AddDay( ndaysToAdd )
    Devuelve la fecha del dato dentro de ndaystoAdd

Parámetros:
    nDaystoAdd - Número de días a sumar, si no se le pasa suma 1 día

Devuelve:
    Fecha
*/
METHOD AddDay( nDaysToAdd ) CLASS Date

    hb_Default( @nDaysToAdd, 1 )

Return Self + nDaysToAdd

/* METHOD: SubDay( nDaysToSubstract )
    Devuelve la fecha del dato antes de nDaysToSubstract

Parámetros:
    nDaysToSubstract - Número de días a restar, si no se le pasa resta 1 día

Devuelve:
    Fecha
*/
METHOD SubDay ( nDaysToSubstract ) CLASS Date

    hb_Default( @nDaysToSubstract, 1 )

Return Self - nDaysToSubstract

/* METHOD: Tomorrow()
    Devuelve el día posterioer al dato

Devuelve:
    Fecha
*/
METHOD Tomorrow() CLASS Date
Return ::AddDay()

/* METHOD: Yesterday()
    Devuelve el día anterior al dato

Devuelve:
    Fecha
*/
METHOD Yesterday() CLASS Date
Return ::SubDay()

/* METHOD: DiffDays( dDate )
    Devuelve el número de días de diferencia entre el dato y date.
    Si dDate es posterior al dato el valore será positivo y si es anterior el valor será negativo

Parámetros:
    dDate - Fecha a tomar como diferencia al valor

Devuelve:
    Numérico
*/
METHOD DiffDays( dDate ) CLASS Date

    hb_Default( @dDate, Date() )

Return dDate - Self

/* METHOD: AddWeek( nWeekstoAdd )
    Método que añade nWeekstoAdd a la fecha del valor

Parámetros:
    nWeeksToAdd - Número de semanas a sumar, si se omite tomará 1 por defecto

Devuelve:
    Numérico
*/
METHOD AddWeek( nWeeksToAdd ) CLASS Date

    hb_Default( @nWeeksToAdd, 1 )

Return Self + ( nWeeksToAdd*7 )

/* METHOD: SubWeek( nWeekstoSubstract )
    Método que resta tantas semanas como nweekstoSubstract a la fecha del valor

Parámetros:
    nWeeksToSubstract - Número de semanas a restar, si se omite tomará 1 por defecto

Devuelve:
    Numérico
*/
METHOD SubWeek( nWeeksToSubstract ) CLASS Date

    hb_Default( @nWeeksToSubstract, 1 )

Return Self - ( nWeeksToSubstract*7 )


/* METHOD: Str()
    Devuelve el string del valor de la fecha

    Devuelve:
        String
*/
METHOD Str() CLASS Date
Return dtoc( Self )


/* METHOD: StrSql()
    Devuelve el string del valor en formato fecha SQL  YYYY-MM-DD

    Devuelve String
*/
METHOD StrSql()
Return ( Self:StrFormat( 'aaaa-0m-0d') )


/* METHOD: StrSqlQuoted()
    Devuelve StrSql entre comillado

    Devuelve String
*/
METHOD StrSqlQuoted()
Return Chr( 39 ) + Self:StrSql() + Chr( 39 )


/* METHOD: IsEmpty()
    Indica si en el Valor de fecha está vacío devolviendo .T. en este caso y .F. si contiene un valor válido de fecha

    Devuelve:
        Lógico
*/
METHOD IsEmpty() CLASS Date
Return ( Self:Str() == FECHAVACIA )


/* METHOD: NotEmpty
    Indica si hay un valor de fecha válido devolviendo .T. en este caso y .F. si el valor de la fecha está vacío.

    Devuelve:
        Lógico
*/
METHOD NotEmpty() CLASS Date
Return ( Self:Str() != FECHAVACIA )


/* METHOD: StrFormat
    Devuelve la fecha formateada según "dd de mmmm de aaaa"
    Adaptación inicial de: Bingen Ugaldebere

    Parámetros:
        cFormat - Formato según:
            0d -- día anteponiendo 0 en los días de un dígito
            dd -- día
            0m -- número del mes anteponiendo 0 en los meses de un dígito
            mm -- número del mes
           mmm -- las primeras tres letras del mes en minusculas
           Mmm -- las primeras tres letras del mes en comenzando con mayuscula
           MMM -- las primeras tres letras del mes en mayusculas
          mmmm -- el nombre del mes en minusculas
          Mmmm -- el nombre del mes comenzando con mayuscula
          MMMM -- el nombre del mes en mayusculas
            aa -- año con dos dígitos
          aaaa -- año con cuatro dígitos

    Devuelve:
        String
    */
METHOD StrFOrmat( cFormat ) CLASS Date

    Local cDate := ''
    Local cVar := ''
    Local aMesesTemporal := { '   ' }
    Local cCharforEmpty := '0'

    hb_Default ( @cFormat,  "dd de mmmm de aaaa" )

    aEval( TMonths():New():GetCapitalized(), < | cMes |
                                                aAdD( aMesesTemporal, cMes:Lower():Alltrim() )
                                                return ( nil )
                                             >)

    cDate := cFormat

    cVar:=if(day(Self)>0,allTrim(str(day(Self))), Replicate( cCharforEmpty, 2) )
    cDate:=strTran(cDate,"dd",cVar)
    cDate:=strTran(cDate,"DD",cVar)
    cVar:=if(day(Self)>0,strZero(day(Self),2), Replicate( cCharforEmpty, 2))
    cDate:=strTran(cDate,"0d",cVar)
    cDate:=strTran(cDate,"0D",cVar)
    cVar:=aMesesTemporal[month(Self)+1]
    cDate:=strTran(cDate,"mmmm",cVar)
    cDate:=strTran(cDate,"Mmmm",upper(left(cVar,1))+subStr(cVar,2))
    cDate:=strTran(cDate,"MMMM",upper(cVar))
    cVar:=left(cVar,3)
    cDate:=strTran(cDate,"mmm",cVar)
    cDate:=strTran(cDate,"Mmm",upper(left(cVar,1))+subStr(cVar,2))
    cDate:=strTran(cDate,"MMM",upper(cVar))
    cVar:=if(month(Self)>0,allTrim(str(month(Self))), Replicate( cCharforEmpty, 2))
    cDate:=strTran(cDate,"mm",cVar)
    cDate:=strTran(cDate,"MM",cVar)
    cVar:=if(day(Self)>0,strZero(month(Self),2), Replicate( cCharforEmpty, 2))
    cDate:=strTran(cDate,"0m",cVar)
    cDate:=strTran(cDate,"0M",cVar)
    cVar:=if(year(Self)>0,TRANSFORM(year(Self),"@E 9999"), Replicate( cCharforEmpty, 4))
    cDate:=strTran(cDate,"aaaa",cVar)
    cDate:=strTran(cDate,"AAAA",cVar)
    cVar:=right(cVar,2)
    cDate:=strTran(cDate,"aa",cVar)
    cDate:=strTran(cDate,"AA",cVar)

Return ( cDate )

/* METHOD: StrDay()
    Method That Converts Days into String

Devuelve:
    Character
*/
method StrDay() class Date
return(Day2Str(Self))

function Day2Str(uData)
    local cType:=ValType(uData)
    if (cType=="D")
        return(StrZero(Day(uData),2))
    elseif (cType=="N")
        return(StrZero(uData,2))
    elseif (cType=="C")
        return(StrZero(Val(uData),2))
    endif

/* METHOD: StrMonth()
    Method That Converts Months into String

Devuelve:
    Character
*/
method StrMonth() class Date
return(Month2Str(Self))

function Month2Str(uData)
    local cType:=ValType(uData)
    if (cType=="D")
        return(StrZero(Month(uData),2))
    elseif (cType=="N")
        return(StrZero(uData,2))
    elseif (cType=="C")
        return(StrZero(Val(uData),2))
    endif

/* METHOD: StrYear()
    Method That Converts Years into String

Devuelve:
    Character
*/
method StrYear() class Date
return(Year2Str(Self))

function Year2Str(uData)
    local cType:=ValType(uData)
    if (cType=="D")
        return(StrZero(Year(uData),4))
    elseif (cType=="N")
        return(StrZero(uData,4))
    elseif (cType=="C")
        return(StrZero(Val(uData),4))
    endif

/* METHOD: StrYearMonth()
    Method that returns Year and Mes, of a date, in character format (YYYYMM)

Devuelve:
    Character
*/
method StrYearMonth() class Date
return(StrYearMonth(Self))

function StrYearMonth(dDate)

    local cStrYearMonth:=""

    hb_default(@dDate,Ctod("//"))

    if (ValType(dDate)=="D")
        cStrYearMonth:=Left(DtoS(dDate),6)
    endif

return(cStrYearMonth)

/* METHOD: AddMonth()
    Method that adds months to a date

Devuelve:
    date
*/
method AddMonth(nMonth) class Date
    hb_default(@nMonth,1)
return(MonthSum(Self,nMonth))

function MonthSum(dDate,nMonth)

    local nMonthAux:=Month(dDate)
    local nDayAux:=Day(dDate)
    local nYearAux:=Year(dDate)

    local nYearPlus

    nMonthAux+=nMonth
    if (nMonthAux>12)
        if ((nMonthAux%12)==0)
            nYearPlus:=((nMonthAux/12)-1)
            nYearAux+=nYearPlus
            nMonthAux:=(nYearPlus*12)
            if (nMonthAux>12)
                nMonthAux:=12
            endif
        else
            nYearPlus:=(nMonthAux/12)
            nYearPlus:=Int(nYearPlus)
            nMonthAux:=(nMonthAux-(nYearPlus*12))
            nYearAux+=nYearPlus
            while (nMonthAux>12)
                nMonthAux-=12
                nYearAux++
            end while
        endif
    endif
    dDate:=hb_CToD(Day2Str(nDayAux)+"/"+Month2Str(nMonthAux)+"/"+Year2Str(nYearAux),"DDMMYYYY")
    if Empty(dDate)
        dDate:=hb_CToD(Day2Str(1)+"/"+Month2Str(nMonthAux)+"/"+Year2Str(nYearAux),"DDMMYYYY")
        nDayAux:=LastDayOfMonth(dDate)
        dDate:=hb_CToD(Day2Str(nDayAux)+"/"+Month2Str(nMonthAux)+"/"+Year2Str(nYearAux),"DDMMYYYY")
    endif

    return(dDate)

/* METHOD: SubMonth()
    Method that subtracts months from a date

Devuelve:
    date
*/
method SubMonth(nMonth) class Date
    hb_default(@nMonth,1)
return(MonthSub(Self,nMonth))

function MonthSub(dDate,nMonth)

    local nMonthAux:=Month(dDate)
    local nDayAux:=Day(dDate)
    local nYearAux:=Year(dDate)

    while (nMonth>=12)
        nMonth-=12
        nYearAux--
    end while
    nMonthAux-=nMonth
    if (nMonthAux <=0)
        nMonthAux:=(12+nMonthAux)
        nYearAux--
    endif

    dDate:=hb_CToD(Day2Str(nDayAux)+"/"+Month2Str(nMonthAux)+"/"+Year2Str(nYearAux),"DDMMYYYY")
    if Empty(dDate)
        dDate:=hb_CToD(Day2Str(1)+"/"+Month2Str(nMonthAux)+"/"+Year2Str(nYearAux),"DDMMYYYY")
        nDayAux:=LastDayOfMonth(dDate)
        dDate:=hb_CToD(Day2Str(nDayAux)+"/"+Month2Str(nMonthAux)+"/"+Year2Str(nYearAux),"DDMMYYYY")
    endif

    return(dDate)

/* METHOD: AddYear()
    Method that adds years to a date

Devuelve:
    date
*/
method AddYear(nYear) class Date
    hb_default(@nYear,1)
return(YearSum(Self,nYear))

function YearSum(dDate,nYear)

    local nMonthAux:=Month(dDate)
    local nDayAux:=Day(dDate)
    local nYearAux:=Year(dDate)

    nYearAux+=nYear
    dDate:=hb_CToD(Day2Str(nDayAux)+"/"+Month2Str(nMonthAux)+"/"+Year2Str(nYearAux),"DDMMYYYY")
    if Empty(dDate)
        dDate:=hb_CToD(Day2Str(1)+"/"+Month2Str(nMonthAux)+"/"+Year2Str(nYearAux),"DDMMYYYY")
        nDayAux:=LastDayOfMonth(dDate)
        dDate:=hb_CToD(Day2Str(nDayAux)+"/"+Month2Str(nMonthAux)+"/"+Year2Str(nYearAux),"DDMMYYYY")
    endif

    return(dDate)

/* METHOD: SubYear()
    Method that subtracts year from a date

Devuelve:
    date
*/
method SubYear(nYear) class Date
    hb_default(@nYear,1)
return(YearSub(Self,nYear))

function YearSub(dDate,nYear)

    local nMonthAux:=Month(dDate)
    local nDayAux:=Day(dDate)
    local nYearAux:=Year(dDate)

    nYearAux-=nYear
    dDate:=hb_CToD(Day2Str(nDayAux)+"/"+Month2Str(nMonthAux)+"/"+Year2Str(nYearAux),"DDMMYYYY")
    if Empty(dDate)
        dDate:=hb_CToD(Day2Str(1)+"/"+Month2Str(nMonthAux)+"/"+Year2Str(nYearAux),"DDMMYYYY")
        nDayAux:=LastDayOfMonth(dDate)
        dDate:=hb_CToD(Day2Str(nDayAux)+"/"+Month2Str(nMonthAux)+"/"+Year2Str(nYearAux),"DDMMYYYY")
    endif

    return(dDate)

/* METHOD: DateDiffDay()
    Method gets the difference in days between two dates

Devuelve:
    numeric
*/
method DateDiffDay(dDate) class Date
    hb_default(@dDate,Date())
return(DateDiffDay(Self,dDate))

function DateDiffDay(dDate1,dDate2)

    local uDayRet

    if (dDate2>dDate1)
        uDayRet:=dDate2
        dDate2:=dDate1
        dDate1:=uDayRet
    endif

    uDayRet:=(dDate1-dDate2)

    return(uDayRet)

/* METHOD: DateDiffMonth()
    Method gets the difference in months between two dates

Devuelve:
    numeric
*/
method DateDiffMonth(dDate) class Date
    hb_default(@dDate,Date())
return(DateDiffMonth(Self,dDate))

function DateDiffMonth(dDate1,dDate2)

    local nMonth1
    local nMonth2

    local uMonthRet

    if (ValType(dDate1)=="C")
        dDate1:=hb_CToD(dDate1,"DDMMYYYY")
    endif
    if (ValType(dDate2)=="C")
        dDate2:=hb_CToD(dDate2,"DDMMYYYY")
    endif

    if (dDate2>dDate1)
        uMonthRet:=dDate2
        dDate2:=dDate1
        dDate1:=uMonthRet
    endif

    nMonth1:=((Year(dDate1)*12)+Month(dDate1))
    nMonth2:=((Year(dDate2)*12)+Month(dDate2))
    uMonthRet:=(nMonth1-nMonth2)
    if (Day(dDate1)-Day(dDate2)>LastDayOfMonth(dDate1))
        uMonthRet++
    endif

    return(uMonthRet)

/* METHOD: DateDiffYear()
    Method gets the difference in years between two dates

Devuelve:
    numeric
*/
method DateDiffYear(dDate) class Date
    hb_default(@dDate,Date())
return(DateDiffYear(Self,dDate))

function DateDiffYear(dDate1,dDate2)

    local nMonth1
    local nMonth2

    local uYearRet

    if (ValType(dDate1)=="C")
        dDate1:=hb_CToD(dDate1,"DDMMYYYY")
    endif
    if (ValType(dDate2)=="C")
        dDate2:=hb_CToD(dDate2,"DDMMYYYY")
    endif

    if (dDate2>dDate1)
        uYearRet:=dDate2
        dDate2:=dDate1
        dDate1:=uYearRet
    endif

    nMonth1:=((Year(dDate1)*12)+Month(dDate1))
    nMonth2:=((Year(dDate2)*12)+Month(dDate2))
    uYearRet:=((nMonth1-nMonth2)-1)
    if (Day(dDate1)>=Day(dDate2))
        uYearRet++
    endif
    uYearRet/=12
    uYearRet:=Int(uYearRet)

    return(uYearRet)

/* METHOD: DateDiffYMD()
    Method gets the difference in years between two dates

Devuelve:
    hash {"years"=>nYears,"months"=>nMonths,"days"=>nDays}
*/
method DateDiffYMD(dDate) class Date
    hb_default(@dDate,Date())
return(DateDiffYMD(Self,dDate))

function DateDiffYMD(dDate1,dDate2)

    local nYears
    local nMonths
    local nDays

    nYears:=DateDiffYear(@dDate1,@dDate2)
    nMonths:=DateDiffMonth(dDate1,dDate2)
    nMonths-=(nYears*12)
    if (StrYearMonth(dDate1)<>StrYearMonth(dDate2))
        if (dDate1>dDate2)
            if (Day(dDate1)<Day(dDate2))
                nDays:=((Day(dDate1)+30)-Day(dDate2))
                nMonths-=1
                if (nMonths<0)
                    nMonths:=0
                endif
            else
                nDays:=(Day(dDate1)-Day(dDate2))
            endif
        else
            if (Day(dDate1)>Day(dDate2))
                nDays:=(Day(dDate2)+30)-Day(dDate1)
                nMonths-=1
                if (nMonths<0)
                    nMonths:=0
                endif
            else
                nDays:=(Day(dDate2)-Day(dDate1))
            endif
        endif
    else
        nDays:=DateDiffDay(dDate1,dDate2)
    endif

    return({"years"=>nYears,"months"=>nMonths,"days"=>nDays})

/* METHOD: LastDayOfMonth()
    Médoto returning the last day of the month

Devuelve:
    numeric
*/
method LastDayOfMonth() class Date
return(LastDayOfMonth(Self))

function LastDayOfMonth(dDate)

    local nMonth
    local nYear

    if (ValType(dDate)=="C")
        dDate:=hb_CToD(dDate,"DDMMYYYY")
    endif

    nMonth:=(Month(dDate)+1)
    nYear:=Year(dDate)
    if (nMonth>12)
        nMonth:=1
        nYear++
    endif

    dDate:=hb_CToD("01/"+Month2Str(nMonth)+"/"+Year2Str(nYear),"DDMMYYYY")
    dDate-=1

    return(Day(dDate))

/* METHOD: FirstDateOfMonth()
    Medoto returning the first date of the month

Devuelve:
    date
*/
method FirstDateOfMonth() class Date
return(FirstDateOfMonth(Self))

function FirstDateOfMonth(dDate)
    local cYearMonth:=StrYearMonth(dDate)
    local cDate:=("01/"+Right(cYearMonth ,2)+"/"+Left(cYearMonth,4))
return(hb_CToD(cDate,"DDMMYYYY"))

/* METHOD: LastDateOfMonth()
    Medoto returning the last date of the month

Devuelve:
    date
*/
method LastDateOfMonth() class Date
return(LastDateOfMonth(Self))

function LastDateOfMonth(dDate)
    local cDate:=(Day2Str(LastDayOfMonth(FirstDateOfMonth(dDate)))+"/"+Month2Str(dDate)+"/"+Year2Str(dDate))
return(hb_CToD(cDate,"DDMMYYYY"))

/* METHOD: FirstDateOfYear()
    Medoto returning the first date of the year

Devuelve:
    date
*/
method FirstDateOfYear() class Date
return(FirstDateOfYear(Self))

function FirstDateOfYear(dDate)
    local cDate:=("01/01/"+Year2Str(dDate))
return(hb_CToD(cDate,"DDMMYYYY"))

/* METHOD: LastDateOfYear()
    Medoto returning the last date of the year

Devuelve:
    date
*/
method LastDateOfYear() class Date
return(LastDateOfYear(Self))

function LastDateOfYear(dDate)
    local cDate:=(Day2Str(LastDayOfMonth(FirstDateOfMonth(dDate)))+"/12/"+Year2Str(dDate))
return(hb_CToD(cDate,"DDMMYYYY"))
