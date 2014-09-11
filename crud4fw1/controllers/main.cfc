<cfcomponent output="false">
	
    <!--- *** START variable declarations (use var) *** --->
	
    
    <!--- *** END variable declarations *** --->
	
	<cffunction name="default" hint="The first screen in the application">
        <cfargument name="rc" />
		<cfargument name="OrderByGroup">
		<cfset rc.theTime=DateFormat(now(),"mmmm dd, yyyy")>
		<cfset request.OrderByGroup="">
		<cfinvoke component="controllers.crudsql" method="functQrySelTblTasks" returnVariable="qrySelTblTasks" description="Return a recordset for all the tasks">
        <cfset request.qrySelTblTasks = qrySelTblTasks>
	</cffunction>
	
	<cffunction name="insOrUpdate" hint="A table for either adding a new record into the Task table or for editing an existing record in the product table.">
		<cfargument name="rc" />
		<cfargument name="OrderByGroup">
		<cfset request.OrderByGroup="">
		<cfset rc.theDate=DateFormat(now(),"mmmm dd, yyyy") />
	</cffunction>
	
	<cffunction name="save" hint="Action template to Save a New Record or Update an Existing Record">
		<!--- Error Capture for Form Goes Here --->
		<cfif len(FORM.StatusCode) EQ 0>
			<h2>Error!</h2>
			<p>The statuscode form field is an empty string!</p>
			<cfdump var="#FORM#" label="FORM" abort="true">
		</cfif>
		<cfparam name="FORM.TaskID" type="integer" default="0">
		<cfparam name="FORM.TaskName" type="string">
		<cfparam name="FORM.TaskDescript" type="string">
		<cfparam name="FORM.PercentComplete" type="integer" default="0">
		<!---<cfparam name="FORM.DueDate" type="date">--->
		<cfparam name="FORM.MemoTxt" type="string">
		<cfparam name="FORM.StatusCode" type="regex" pattern="(s|d|h|n|t|u)" default="n">
		<cfparam name="FORM.DevCode" type="regex" pattern="(DelgadoRaul|ChaconManuel|JonesBouton|PaniaguaClaudia)">
	</cffunction>
	
	<cffunction name="delTblTasks" hint="Deletes a record in the TtblTasks table.">
		<cfinvoke component="controllers.CRUDSQL" method="functQryDelTblTasks" description="Deletes a task in the Tasks table" TaskID="#URL.TaskID#"></cfinvoke> 
	</cffunction>
	
</cfcomponent>