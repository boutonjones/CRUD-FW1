
<!-- 
main.save
Save a New Record or Update an Existing Record 
--->

<cfoutput>

		<h2>Thank You</h2>	
		
		<cfif Form.TaskID>
			
			<h2>Update</h2>
			
			<!--- Update Existing Task in DB Table --->
			<cfinvoke component="controllers.CRUDSQL" method="functQryUpdateTblTasks" returnVariable="resultQuery" description="Updates a record for an existing task" hint="Updates a record for an existing task">
				<cfinvokeargument name="TaskName" value="#FORM.TaskName#">
				<cfinvokeargument name="TaskDescript" value="#FORM.TaskDescript#">
				<cfinvokeargument name="PercentComplete" value="#FORM.PercentComplete#">
				<cfinvokeargument name="MemoTxt" value="#FORM.MemoTxt#">
				<cfinvokeargument name="StatusCode" value="#FORM.StatusCode#">
				<cfinvokeargument name="DevCode" value="#FORM.DevCode#">
				<cfinvokeargument name="TaskID" value="#FORM.TaskID#">
			</cfinvoke>
				
		<cfelse>
			
			<h2>Add</h2>
			
			<!--- Add New Task in DB Table --->
			<cfinvoke component="controllers.CRUDSQL" method="functQryInsTblTasks" returnVariable="resultQuery" description="Updates a record for an existing task" hint="Updates a record for an existing task">
				<cfinvokeargument name="TaskName" value="#FORM.TaskName#">
				<cfinvokeargument name="TaskDescript" value="#FORM.TaskDescript#">
				<cfinvokeargument name="PercentComplete" value="#FORM.PercentComplete#">
				<cfinvokeargument name="MemoTxt" value="#FORM.MemoTxt#">
				<cfinvokeargument name="StatusCode" value="#FORM.StatusCode#">
				<cfinvokeargument name="DevCode" value="#FORM.DevCode#">
			</cfinvoke>

		</cfif>

		<cfif structKeyExists(resultQuery,"recordcount") AND resultQuery.recordcount EQ 1>
			
			<p class="successmsg">Your request was completed successfully.</p>
			
		<cfelse>
			
			<p class="error">Your request was not completed successfully.</p>
			
			<p>Please send the following information to the HRIS department.</p>
			
			<cfif structKeyExists(resultQuery,"sql")>
				<div style="border-style:solid; border-color: ##000; width:95%">
					<tt>
						<pre>#resultQuery.Sql#</pre>
					</tt>
				</div>
			</cfif>
			
			<cfif isDefined("resultQuery.sqlparameters") and structKeyExists(resultQuery,"sqlparameters")>
				<cfdump var="#sqlparameters#" label="sqlparameters" expand="yes"><br />
			</cfif>
			
		</cfif>

		<p class="GoToTopIntLink"><a href="index.cfm?action=main.default">Return to #this.name# Homepage</a></p>

</cfoutput>
