<cfcomponent displayname="Scrum Reports" hint="Displays reports for the SCRUM process">

	<cffunction name="default" hint="The landing page for the SCRUM Reports.">
		<cfargument name="OrderByGroup">
		<cfset request.OrderByGroup="">
        <cfinvoke component="controllers.crudsql" method="functQrySelTblTasks" returnVariable="qrySelTblTasks" description="Return a recordset for all the tasks">
	</cffunction>

	<cffunction name="DevName" hint="Report by Developer">
		<cfargument name="OrderByGroup">
		<cfset request.OrderByGroup="DevName">
		<cfinvoke component="controllers.crudsql" method="functQrySelTblTasks" returnVariable="qrySelTblTasks" description="Return a recordset for all the tasks ORDERED BY developer">
	</cffunction>
	
	<cffunction name="StatusTerm" hint="Report by Status">
		<cfargument name="OrderByGroup">
		<cfset request.OrderByGroup="StatusTerm">
        <cfinvoke component="controllers.crudsql" method="functQrySelTblTasks" returnVariable="qrySelTblTasks" description="Return a recordset for all the tasks ORDERED BY status">
	</cffunction>

</cfcomponent>