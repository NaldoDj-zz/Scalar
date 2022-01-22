function main()

    CLEAR SCREEN
    
    AltD(1) // Enables the debugger. Press F5 to go.
    AltD()  // Invokes the debugger

    __SetCentury("ON")
    SET DATE TO BRITISH

    ? "Test_DToS()"
    Test_DToS()
    
    ? "-----------------------------------------------------"

    ? "Test_StrDay()"
    Test_StrDay()
    
    ? "-----------------------------------------------------"
    
    ? "Test_StrMonth()"
    Test_StrMonth()
    
    ? "-----------------------------------------------------"
    
    ? "Test_StrYear()"
    Test_StrYear()
    
    ? "-----------------------------------------------------"
    
    ? "Test_StrYearMonth()"
    Test_StrYearMonth()
    
    ? "-----------------------------------------------------"
    
    ? "Test_AddMonth()"
    Test_AddMonth()
    
    ? "-----------------------------------------------------"
  
    ? "Test_SubMonth()"
    Test_SubMonth()
    
    ? "-----------------------------------------------------"
    
    ? "Test_AddYear()"
    Test_AddYear()
    
    ? "-----------------------------------------------------"
    
    ? "Test_SubYear()"
    Test_SubYear()
    
    ? "-----------------------------------------------------"
    
    ? "Test_DateDiffDay()"
    Test_DateDiffDay()
    
    ? "-----------------------------------------------------"
    
    ? "Test_DateDiffMonth()"
    Test_DateDiffMonth()
    
    ? "-----------------------------------------------------"
    
    ? "Test_DateDiffYear()"
    Test_DateDiffYear()
    
    ? "-----------------------------------------------------"
    
    ? "Test_DateDiffYMD()"
    Test_DateDiffYMD()
    
    ? "-----------------------------------------------------"
    
    ? "Test_LastDayOfMonth()"
    Test_LastDayOfMonth()
    
    ? "-----------------------------------------------------"
    
    ? "Test_FirstDateOfMonth()"
    Test_FirstDateOfMonth()
    
    ? "-----------------------------------------------------"
    
    ? "Test_LastDateOfMonth()"
    Test_LastDateOfMonth()
    
    ? "-----------------------------------------------------"
    
    ? "Test_FirstDateOfYear()"
    Test_FirstDateOfYear()
    
    ? "-----------------------------------------------------"
    
    ? "Test_LastDateOfYear()"
    Test_LastDateOfYear()
    
    ? "-----------------------------------------------------"

return

static function Test_DToS()
    ? "0d19701215:DToS(): "+hb_ValToStr(0d19701215:DToS())
return(nil)

static function Test_StrDay()
    ? "0d19701215:StrDay(): "+hb_ValToStr(0d19701215:StrDay())
    
return(nil)

static function Test_StrMonth()
    ? "0d19701215:StrMonth(): "+hb_ValToStr(0d19701215:StrMonth())
    
return(nil)

static function Test_StrYear()
    ? "0d19701215:StrYear(): "+hb_ValToStr(0d19701215:StrYear())    
return(nil)

static function Test_StrYearMonth()
    ? "0d19701215:StrYearMonth(): "+hb_ValToStr(0d19701215:StrYearMonth())    
return(nil)

static function Test_AddMonth()
    
    local nMonth 
    local nMonths
    
    nMonths:=36
    for nMonth:=0 to nMonths step 12
        ? "0d19701215:AddMonth("+hb_NTos(nMonth)+"): "+hb_ValToStr(0d19701215:AddMonth(nMonth))
        ? "-----------------------------------------------------"
    next nMonth

return(nil)

static function Test_SubMonth()
    
    local nMonth 
    local nMonths
    
    nMonths:=36
    for nMonth:=0 to nMonths step 12
       ? "0d19701215:SubMonth("+hb_ntos(nMonth)+"): "+hb_ValToStr(0d19701215:SubMonth(nMonth))
       ? "-----------------------------------------------------"
    next nMonth

return(nil)

static function Test_AddYear()

    local nYear 
    local nYears
    
    nYears:=36 
    for nYear :=0 to nYears step 12
       ? "0d19701215:AddYear("+hb_ntos(nYear)+"): "+hb_ValToStr(0d19701215:AddYear(nYear))
       ? "-----------------------------------------------------"
    next nYear
    
return(nil)

static function Test_SubYear()

    local nYear 
    local nYears
    
    nYears:=36
    for nYear :=0 to nYears step 12
       ? "0d19701215:SubYear("+hb_ntos(nYear)+"): "+hb_ValToStr(0d19701215:SubYear(nYear))
       ? "-----------------------------------------------------"
    next nYear

return(nil)

static function Test_DateDiffDay()

    local nDay
    local nDays

    ? "0d19701215:DateDiffDay()"
    ? 0d19701215:DateDiffDay()

    nDays:=36
    for nDay :=0 to nDays step 12
       ? "0d19701215:DateDiffDay(0d19701215:AddDay("+hb_ntos(nDay)+"))"+hb_ValToStr(0d19701215:DateDiffDay(0d19701215:AddDay(nDay)))
       ? "-----------------------------------------------------"
    next nDays
    
return(nil)

static function Test_DateDiffMonth()

    local nMonth
    local nMonths

    ? "0d19701215:DateDiffMonth()"
    ? 0d19701215:DateDiffMonth()
    ? "-----------------------------------------------------"

    nMonths:=36
    for nMonth :=0 to nMonths step 12
       ? "0d19701215:DateDiffMonth(0d19701215:AddMonth("+hb_ntos(nMonth)+")): "+hb_ValToStr(0d19701215:DateDiffMonth(0d19701215:AddMonth(nMonth)))
       ? "-----------------------------------------------------"
    next nYear

return(nil)

static function Test_DateDiffYear()

    local nYear
    local nYears

    ? "0d19701215:DateDiffYear(): "+hb_ValToStr(0d19701215:DateDiffYear())
    ? "-----------------------------------------------------"

    nYears:=36 
    for nYear :=0 to nYears step 12
       ? "0d19701215:DateDiffYear(0d19701215:AddYear("+hb_ntos(nYear)+")): "+hb_ValToStr(0d19701215:DateDiffYear(0d19701215:AddYear(nYear)))
       ? "-----------------------------------------------------"
    next nYear

return(nil)

static function Test_DateDiffYMD()

    local nYear
    local nYears

    local hRet

    ? "0d19701215:DateDiffYMD()['years']"+hb_ValToStr(0d19701215:DateDiffYMD()["years"])
    ? "0d19701215:DateDiffYMD()['months']"+hb_ValToStr(0d19701215:DateDiffYMD()["months"])
    ? "0d19701215:DateDiffYMD()['days']"+hb_ValToStr(0d19701215:DateDiffYMD()["days"])
    
    ? "-----------------------------------------------------"
    
    ? "0d19701215:DateDiffYMD(0d20201215)['years']"+hb_ValToStr(0d19701215:DateDiffYMD(0d20201215)["years"])
    ? "0d19701215:DateDiffYMD(0d20201215)['months']"+hb_ValToStr(0d19701215:DateDiffYMD(0d20201215)["months"])
    ? "0d19701215:DateDiffYMD(0d20201215)['days']"+hb_ValToStr(0d19701215:DateDiffYMD(0d20201215)["days"])
    
    ? "-----------------------------------------------------"
    
    ? "hRet:=0d19701215:DateDiffYMD(0d20201215)"
    
    hRet:=0d19701215:DateDiffYMD(0d20201215)
    ? 'hRet["years"]:  '+hb_ValToStr(hRet["years"])
    ? 'hRet["months"]: '+hb_ValToStr(hRet["months"])
    ? 'hRet["days"]:   '+hb_ValToStr(hRet["days"])

    ? "-----------------------------------------------------"
    
    ? "hRet:=0d19701215:DateDiffYMD(0d20201115)"
    
    hRet:=0d19701215:DateDiffYMD(0d20201115)
    ? 'hRet["years"] : '+hb_ValToStr(hRet["years"])
    ? 'hRet["months"]: '+hb_ValToStr(hRet["months"])
    ? 'hRet["days"]:   '+hb_ValToStr(hRet["days"])

    ? "-----------------------------------------------------"

    ? "hRet:=0d19701215:DateDiffYMD(0d20201130)"

    hRet:=0d19701215:DateDiffYMD(0d20201130)
    ? 'hRet["years"] : '+hb_ValToStr(hRet["years"])
    ? 'hRet["months"]: '+hb_ValToStr(hRet["months"])
    ? 'hRet["days"]:   '+hb_ValToStr(hRet["days"])
    
    ? "-----------------------------------------------------"

    nYears:=36 
    for nYear :=0 to nYears step 12
       ? "0d19701215:DateDiffYMD(0d19701215:AddYear("+hb_ntos(nYear)+")): "+hb_ValToStr(0d19701215:DateDiffYMD(0d19701215:AddYear(nYear))["years"])
       ? "0d19701215:DateDiffYMD(0d19701215:AddYear("+hb_ntos(nYear)+")): "+hb_ValToStr(0d19701215:DateDiffYMD(0d19701215:AddYear(nYear))["months"])
       ? "0d19701215:DateDiffYMD(0d19701215:AddYear("+hb_ntos(nYear)+")): "+hb_ValToStr(0d19701215:DateDiffYMD(0d19701215:AddYear(nYear))["days"])
       ? "-----------------------------------------------------"
    next nYear

return(nil)

static function Test_LastDayOfMonth()
    ? "0d19701115:LastDayOfMonth(): "+hb_ValToStr(0d19701115:LastDayOfMonth())
    ? "-----------------------------------------------------"
    ? "0d19701215:LastDayOfMonth(): "+hb_ValToStr(0d19701215:LastDayOfMonth())
return(nil)

static function Test_FirstDateOfMonth()
    ? "0d19701215:FirstDateOfMonth()"+hb_ValToStr(0d19701215:FirstDateOfMonth())
    ? "-----------------------------------------------------"
return(nil)

static function Test_LastDateOfMonth()
    ? "0d19701115:LastDateOfMonth(): "+hb_ValToStr(0d19701115:LastDateOfMonth())
    ? "-----------------------------------------------------"
    ? "0d19701215:LastDateOfMonth(): "+hb_ValToStr(0d19701215:LastDateOfMonth())
return(nil)

static function Test_FirstDateOfYear()
    ? "0d19701115:FirstDateOfYear(): "+hb_ValToStr(0d19701115:FirstDateOfYear())
    ? "-----------------------------------------------------"
    ? "0d19701215:FirstDateOfYear(): "+hb_ValToStr(0d19701215:FirstDateOfYear())
return(nil)

static function Test_LastDateOfYear()
    ? "0d19701115:LastDateOfYear(): "+hb_ValToStr(0d19701115:LastDateOfYear())
    ? "-----------------------------------------------------"
    ? "0d19701215:LastDateOfYear(): "+hb_ValToStr(0d19701215:LastDateOfYear())    
return(nil)

#include "hbclass.ch"
//class not found in project
class TMonths
end class

#include "Array.prg"
#include "Character.prg"
#include "Date.prg"
#include "Hash.prg"
#include "Logical.prg"
#include "Nil.prg"
#include "Numeric.prg"
#include "TimeStamp.prg"