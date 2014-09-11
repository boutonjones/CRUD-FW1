<cfcomponent displayname="SQL Queries" hint="These functions are SQL queries for CRUD" output="true">

    <!--- *** START variable declarations (use var) *** --->
	
	
    
    <!--- *** END variable declarations *** --->

	<cffunction name="functQrySelTblTasks" hint="Return a recordset for all the tasks is no TaskID is passed --- or a single task if the TaskID is passed" returntype="Query">
		<!--- cfargument tags must be first --->
		<cfargument name="TaskID" type="numeric" required="no" default="0">
		<cfargument name="TaskName" type="string" required="no" default="">
		<cfargument name="DevCode" type="string" required="no" default="">
		<cfargument name="StatusCode" type="string" required="no" default="">
		<cfargument name="MemoTxt" type="string" required="no" default="">
		<cfargument name="OrderByGroup" default="">
    	<cfset OrderByGroup=request.OrderByGroup>
        <cfparam name="arguments.OrderByGroup" type="string">
        <cfparam name="arguments.OrderByGroup" type="regex" pattern="(DevName|StatusTerm|TaskName|)">
		<cfset var this.datasource="DBCrud">
		<cfset var qrySelTblTasks=''>
        <!---<cfdump var="#arguments#" label="arguments" abort="true">--->
		<cfquery datasource="#this.datasource#" name="qrySelTblTasks" debug>
			SELECT 
				tblTasks.TaskID
				, tblTasks.TaskName
				, tblTasks.TaskDescript
				, tblTasks.DevCode
				, tblDevelopers.FName & ' ' & tblDevelopers.LName AS DevName
				, tblTasks.DueDate
				, tblTasks.PercentComplete
				, tblTasks.StatusCode
				, tblRefStatus.StatusTerm
				, tblTasks.MemoTxt
			FROM ((tblTasks INNER JOIN tblDevelopers 
					ON tblTasks.DevCode = tblDevelopers.DevCode)
				INNER JOIN tblRefStatus 
					ON tblTasks.StatusCode = tblRefStatus.StatusCode)
			WHERE 0=0
				<!--- Optional Search Criteria --->
				<cfif arguments.TaskID>AND tblTasks.TaskID = <cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.TaskID#"></cfif>
				<cfif len(trim(arguments.TaskName))>AND tblTasks.TaskName LIKE <cfqueryparam cfsqltype="cf_sql_varchar" value="%#arguments.TaskName#%"></cfif>
				<cfif len(trim(arguments.DevCode))>AND tblTasks.DevCode = <cfqueryparam cfsqltype="cf_sql_char" value="#arguments.DevCode#"></cfif>
				<cfif len(trim(arguments.StatusCode))>AND tblTasks.StatusTerm = <cfqueryparam cfsqltype="cf_sql_char" value="#arguments.Term#"></cfif>
				<cfif len(trim(arguments.MemoTxt))>AND tblTasks.MemoTxt LIKE <cfqueryparam cfsqltype="cf_sql_varchar" value="%#arguments.MemoTxt#%"></cfif>
			<!--- For reports.  Display by (Order By) criteria --->
			<cfswitch expression="#request.OrderByGroup#">
				<cfcase value="DevName">ORDER BY FName, LName, TaskName</cfcase>
				<cfcase value="StatusTerm">ORDER BY StatusTerm</cfcase>
				<cfcase value="TaskName">ORDER BY TaskName, tblTasks.DevCode</cfcase> 
			</cfswitch>
			;
		</cfquery>
        <cfset request.qrySelTblTasks = qrySelTblTasks>
		<cfreturn request.qrySelTblTasks>
	</cffunction>

	<cffunction name="functQryGetTblDevelopers" returntype="Query" hint="Returns recordset for Developers Select List">
		<cfset var this.datasource="DBCrud">
		<cfset var qryGetTblDevelopers=''>
		<cfquery datasource="#this.datasource#" name="qryGetTblDevelopers">
			SELECT DevCode, FName & ' ' & LName AS DevName
			FROM tblDevelopers; 
		</cfquery>
        <cfset request.qryGetTblDevelopers = qryGetTblDevelopers>
		<cfreturn qryGetTblDevelopers>
	</cffunction>

	<cffunction name="functQryGetTblRefStatus" returntype="Query" hint="Returns Recordset for Status Select List">
		<cfset var this.datasource="DBCrud">
		<cfset var qryGetTblRefStatus=''>
		<cfquery datasource="#this.datasource#" name="qryGetTblRefStatus">
			SELECT StatusCode, StatusTerm
			FROM tblRefStatus;
		</cfquery>
        <cfset request.qryGetTblRefStatus = qryGetTblRefStatus>
		<cfreturn request.qryGetTblRefStatus>
	</cffunction>
	
	<cffunction name="functQryUpdateTblTasks" hint="Updates a record for an existing task">
		<cfargument name="TaskName" type="string" required="yes">
		<cfargument name="TaskDescript" type="string" required="no" default="">
		<cfargument name="PercentComplete" type="numeric" required="yes">
		<cfargument name="MemoTxt" type="string" required="yes">
		<cfargument name="StatusCode" type="string" required="yes">
		<cfargument name="DevCode" type="string" required="yes">
		<cfargument name="TaskID" type="numeric" required="yes">	
		<cfset var this.datasource="DBCrud">	
		<cfquery datasource="DBCrud" name="qryUpdateTblTasks" result="resultQuery">
			UPDATE tblTasks 
			SET 
				TaskName = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.TaskName#">
				, TaskDescript = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.TaskDescript#">
				, PercentComplete = <cfqueryparam cfsqltype="cf_sql_integer"  value="#arguments.PercentComplete#">
				, MemoTxt = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.MemoTxt#">
				, StatusCode = <cfqueryparam cfsqltype="cf_sql_char" value="#arguments.StatusCode#">
				, DevCode = <cfqueryparam cfsqltype="cf_sql_char" value="#arguments.DevCode#">
			WHERE TaskID = <cfqueryparam cfsqltype="cf_sql_char" value="#arguments.TaskID#">
			;
		</cfquery>
        <cfset request.resultQuery = resultQuery>
		<cfreturn resultQuery>
	</cffunction>
	
	<cffunction name="functQryInsTblTasks" hint="Inserts a record for a new task into the tblTasks table">
		<cfargument name="TaskName" type="string" required="yes">
		<cfargument name="TaskDescript" type="string" required="no" default="">
		<cfargument name="PercentComplete" type="numeric" required="yes">
		<cfargument name="MemoTxt" type="string" required="no" default="">
		<cfargument name="StatusCode" type="string" required="yes">
		<cfargument name="DevCode" type="string" required="yes">
		<cfset var this.datasource="DBCrud">
		<!--- NOTE:  You can't mix values and SELECT in an INSERT in Access.  Otherwise I would have nested the following query in qryInsTblTasks. --->
		<cfquery datasource="#this.datasource#" name="qryGetNextTaskID">
			SELECT MAX(TaskID) + 1 AS NextTaskID
			FROM tblTasks;
		</cfquery>
		<cfset var local.TaskID = qryGetNextTaskID.NextTaskID>
		<cfquery datasource="DBCrud" name="qryInsTblTasks"  result="resultQuery">
			INSERT INTO tblTasks (
				TaskID
				, TaskName
				, TaskDescript
				, PercentComplete
				, MemoTxt
				, StatusCode
				, DevCode 
				)
			VALUES (
				<cfqueryparam cfsqltype="cf_sql_integer"  value="#local.TaskID#">
				, <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.TaskName#">
				, <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.TaskDescript#">
				, <cfqueryparam cfsqltype="cf_sql_integer"  value="#arguments.PercentComplete#">
				, <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.MemoTxt#">
				, <cfqueryparam cfsqltype="cf_sql_char" value="#arguments.StatusCode#">
				, <cfqueryparam cfsqltype="cf_sql_char" value="#arguments.DevCode#">
				);
		</cfquery>
        <cfset request.resultQuery = resultQuery>
		<cfreturn resultQuery>
	</cffunction>
	
	<cffunction name="functQryDelTblTasks" hint="Deletes a record in the TtblTasks table.">
		<cfargument name="TaskID" type="numeric" required="yes">
		<cfset var local.datasource="DBCrud">
		<cfquery datasource="#local.datasource#">
			DELETE 
			FROM tblTasks
			WHERE tblTasks.TaskID = <cfqueryparam cfsqltype="cf_sql_integer"  value="#arguments.TaskID#">;
		</cfquery>
	</cffunction>

</cfcomponent>