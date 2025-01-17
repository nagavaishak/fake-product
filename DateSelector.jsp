<!--
	Date Selector Pop-Up.
	Javascript fully designed and developed by Fadi Chamieh - fadi.chamieh@google.com
	Vague Software. The Software @ vague-software.com
-->
<html>
	<head>
	<title>Easy Calendar - by Nitin</title>
	<style>
		BODY {
			font-family: Verdana, Arial,Georgia;
			color: Navy;
			font-size: 11px;
			background-color: White;
		}

		TD {
			font-family: Verdana, Arial,Georgia;
			font-size: 11px;
		}

		TEXTAREA {
			font-family: Verdana, Arial,Georgia;
			background-color: #FFF4D9;
			font-size: 11px;
		}

		INPUT.fancy {
			background-color: #FFFFFF;
			border-top: 1px #FBCB98 solid;
			border-right: 1px #FBCB98 solid;
			border-bottom: 2px #FBCB98 solid;
			border-left: 1px #FBCB98 solid;
			height: 20px;
			font-family: Verdana, Arial,Georgia;
			font-size: 10px;
		}

		INPUT.fancyButton {
			font-family: Verdana, Arial,Georgia;
			border-right: #000000 1px solid;
			border-top: #000000 1px solid;
			font-weight: bold;
			font-size: 11px;
			border-left: #000000 1px solid;
			cursor: hand;
			color: Navy;
			border-bottom: #000000 1px solid;
			height: 20px;
			background-color: #ffb72b;
		}

		SELECT {
			font-family: Verdana, Arial,Georgia;
			font-size: 11px;
			background-color: #FFE4C9;
			border-top: 1px #000000 solid;
			border-right: 1px #000000 solid;
			border-bottom: 1px #000000 solid;
			border-left: 1px #000000 solid;
		}
	</style>
	<script language="javascript">

		var DayInMilliseconds = 24 * 60 * 60 * 1000;
		var TodaysDate = new Date();
		var SelectedDate = TodaysDate;
		var OriginalDate = TodaysDate;
		var ColumnDayMapping = Array( 1, 2, 3, 4, 5, 6, 0 ); // 0-Monday ... 6-Sunday
		var previousYear = SelectedDate.getFullYear();
		/*
		 * Show the calendar for the given month
		 */
		 function ShowCalendar(pYear, pMonth, pMonthDay)
		 {
		 	// Valid entries only
		 	pYear  = parseInt( pYear );  pYear = (isNaN( pYear ) || pYear < 1599 || pYear > 2999) ? TodaysDate.getFullYear() : pYear;
		 	pMonth = parseInt( pMonth ); pMonth = isNaN( pMonth ) ? (TodaysDate.getMonth() + 1) : pMonth;
		 	pMonthDay = parseInt( pMonthDay ); pMonthDay = isNaN( pMonthDay ) ? TodaysDate.getDate() : pMonthDay;

			previousYear = pYear;

		 	SelectedDate = new Date();
			SelectedDate.setFullYear( pYear, pMonth - 1, pMonthDay );
			document.frmDateSelection.theDate.value = formatDate( SelectedDate );

		 	// Get first and last days of the month
		 	var FirstDayOfMonth = new Date(), FirstDayOfNextMonth = new Date(), LastDayOfMonth = new Date();
		 	FirstDayOfMonth.setFullYear( pYear, pMonth - 1, 1 );

		 	if(pMonth < 12) FirstDayOfNextMonth.setFullYear( pYear, pMonth, 1 );
		 	else FirstDayOfNextMonth.setFullYear( pYear + 1, 0, 1 );

		 	LastDayOfMonth.setTime( FirstDayOfNextMonth.getTime() - DayInMilliseconds );

		 	// Loop over TD's and set their values accordingly
		 	var dayNo = 0;
		 	for( var r = 0; r < 6; r++ )
		 	{
		 		for(var c = 0; c < 7; c++)
		 		{
		 			var td = document.getElementById("GridTD_" + r + "_" + c);
		 			// Clean up the td
		 			td.innerHTML = "&nbsp;";
					
					// Sundays and Saturdays are different
					// if( c == 5 || c == 6 )
					// 	td.style.backgroundColor ="#F0F0F0";
					// else
 					td.style.backgroundColor = "";
 					
 					td.style.color = "black";
 					td.style.fontWeight = "normal";

		 			// If not started counting, check for start
		 			if( dayNo == 0 )
		 				if ( FirstDayOfMonth.getDay() == ColumnDayMapping[c] )
		 					dayNo = 1;

		 			if( dayNo > 0 && dayNo <= LastDayOfMonth.getDate() )
		 			{
		 				td.innerHTML = "<a href='javascript:void(0);' onclick='javascript:ShowCalendar("+pYear+","+pMonth+","+dayNo+")'>"+ dayNo + "</a>";

		 				if( (TodaysDate.getFullYear() == pYear) && (TodaysDate.getMonth() == pMonth - 1) && (TodaysDate.getDate() == dayNo) )
		 				{
 							td.style.fontWeight = "bold";
		 				}

		 				if( pMonthDay == dayNo )
		 				{
 							td.style.backgroundColor = "Yellow";
 							td.style.color = "red";
 							td.style.fontWeight = "bold";
		 				}
		 						 				
		 				dayNo++;
		 			}
		 		}
		 	}
		 }

		/*
		 * Returned Date format
		 */
		 function formatDate( dateObject )
		 {
		 	var pMonth = dateObject.getMonth() + 1;
		 	var pMonthDay = dateObject.getDate();
		 	var pYear = dateObject.getFullYear();

		 	// Show day, month and year readings
		 	var disp_Month = (pMonth < 10) ? "0" + pMonth : pMonth;
		 	var disp_Day = (pMonthDay  < 10) ? "0" + pMonthDay  : pMonthDay;
		 	document.frmDateSelection.month.selectedIndex = pMonth - 1;
		 	document.frmDateSelection.year.value = pYear;
		 	return disp_Day + "-" + disp_Month + "-" + pYear;
		 }

		/*
		 * Month changed
		 */
		 function MonthOrYearChanged()
		 {
			ShowCalendar( document.frmDateSelection.year.value, document.frmDateSelection.month.selectedIndex + 1, 1 );
		 }

		// +1/-1 Year change
		function YearChanged( howMuch )
		{
			document.frmDateSelection.year.value = parseInt( document.frmDateSelection.year.value ) + parseInt( howMuch );
			MonthOrYearChanged();
		}

		// Parse a date string and return the object
		function getDateObject( dateString )
		{
			var arr = Array();
			var valid = false;
			var day = -1, month = -1, year = -1;

			// dd/mm/yyyy format
			if( dateString.indexOf("/") > 0 )
			{
				valid = true;
				arr   = dateString.split("/");
				day = parseInt(arr[0],10);
				if(arr.length > 0) month = parseInt(arr[1],10);
				if(arr.length > 1) year  = parseInt(arr[2],10);
			}
			// yyyy-mm-dd
			else if( dateString.indexOf("-") > 0 )
			{
				valid = true;
				arr   = dateString.split("-");
				day = parseInt(arr[2],10);
				if(arr.length > 0) month = parseInt(arr[1],10);
				if(arr.length > 1) year  = parseInt(arr[0],10);
			}

			if(! valid ) return TodaysDate;

			day = parseInt(arr[0],10);
			if(arr.length > 0) month = parseInt(arr[1],10);
			if(arr.length > 1) year  = parseInt(arr[2],10);

			var theDate = new Date();

			theDate.setFullYear( year, month - 1, day );
			
			return theDate;
		}

		/*
		 * Initialize
		 */
		function Initialize( fromDateObj )
		{
			previousYear = SelectedDate.getFullYear();
			
			if( ! fromDateObj )
			{
				var validSelected = false;
				try
				{
					if(window.opener != null)
						SelectedDate = opener.GetDateSelectorDate();
					if( typeof(SelectedDate) == "object" )
					{
						validSelected = true;
					}
					else
					{
						SelectedDate = getDateObject( SelectedDate );
						validSelected = true;
					}
				}
				catch( ex )
				{
					validSelected = false;
				}
				if( ! validSelected ) SelectedDate = TodaysDate;
				
				OriginalDate = SelectedDate;
			}
			else
			{
				SelectedDate = fromDateObj;
			}
			
			document.frmDateSelection.year.focus();
			
			ShowCalendar( SelectedDate.getFullYear(), SelectedDate.getMonth() + 1, SelectedDate.getDate() );
						
		}

		function returnDateString()
		{
			try
			{
				if(window.opener != null)
					opener.SetDateSelectorDate( document.frmDateSelection.theDate.value );
			}
			catch( ex )
			{
				alert("Wrong use of returnDateString() function\n" + ex.toString());
			}
			window.close();
		}
		
	</script>

	</head>
	<body topmargin="0" rightmargin="0" leftmargin="0" bottommargin="0" style="margin: 0px;" onload="Initialize()">

		<table border="1" cellpadding="5" cellspacing="2" bordercolor="#FFFFFF" align="center" height="100%">
        <form name="frmDateSelection" method="post" action="">
		    <tr>
              <td bordercolor="#FFCC00"><table border="0" cellspacing="2" cellpadding="2">
                  <tr>
                    <td><table border="0" cellpadding="2" cellspacing="0">
                        <tr>
                          <td align="right">
                          	<table border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td><table border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td><a href="javascript:YearChanged(1);"><img src="<%=request.getContextPath()%>/Images/up.gif" width="12" height="8" border="0"></a></td>
                                    </tr>
                                    <TR><td></td></tr>
                                    <TR><td></td></tr>
                                    <tr>
                                      <td><a href="javascript:YearChanged(-1);"><img src="<%=request.getContextPath()%>/Images/down.gif" width="12" height="8" border="0"></a></td>
                                    </tr>
                                </table></td>
                                <td align="right"><input name="year" type="text" class="fancy" style="width:40px" maxlength="4" value="2004" onchange="MonthOrYearChanged()" onkeyup="if(this.value.length == 4 && previousYear != this.value) MonthOrYearChanged()"></td>
                              </tr>
                          </table></td>
                          <td><select name="month" class="fancy" id="month" onchange="MonthOrYearChanged()" style="width:160px">
                          	  <option value="01">January</option>
                              <option value="02">February</option>
                              <option value="03">March</option>
                              <option value="04">April</option>
							  <option value="05">May</option>
                          	  <option value="06">June</option>
                              <option value="07">July</option>
                              <option value="08">August</option>
                              <option value="09">September</option>
							  <option value="10">October</option>
                          	  <option value="11">November</option>
                              <option value="02">December</option>
							</select></td>
                        </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td>
						<table border="1" cellspacing="1" bordercolor="Silver" cellpadding="3">
                        <tr align="center" bgcolor="#FFCC00">
                          <td width="25">Mon</td>
                          <td width="25">Tue</td>
                          <td width="25">Wed</td>
                          <td width="25">Thu</td>
                          <td width="25">Fri</td>
                          <td width="25">Sat</td>
                          <td width="25">Sun</td>
                        </tr>
                        <script language="javascript">
							var InlineHTML = "";
							for(var i = 0; i < 6; i++)
							{
								InlineHTML += "<tr align=center>";
								for(var j = 0; j < 7; j++)
									InlineHTML += "<td id='GridTD_"+ i +"_"+ j +"'>&nbsp;</td>";
								InlineHTML += "</tr>"
							}
							document.writeln( InlineHTML );
                        </script>
                    </table></td>
                  </tr>
                  <tr>
                    <td>
						<input type="text"   style="width:70px;color:red;" name="theDate" readonly="true" value="" class="fancy">
						<input type="button" style="width:25px;color=Black"  name="btnOk" value="OK" onclick="returnDateString()" class="fancyButton">
                        <input type="button" style="width:50px;color=Black"  name="btnCancel" value="Cancel" onclick="window.close()" class="fancyButton">
                        <input type="button" style="width:48px;color=Blue"  name="btnToday" value="Today" onclick="Initialize( TodaysDate )" class="fancyButton">
                        <input type="button" style="width:42px;color=Green"  name="btnRest" value="Reset" onclick="Initialize( OriginalDate )" class="fancyButton" ID="Button1">
                    </td>
                  </tr>
              </table></td>
            </tr>
			</form>
       </table>
</body>
</html>