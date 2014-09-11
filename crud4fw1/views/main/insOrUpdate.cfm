
<!--- A table for either adding a new record into the Task table or for editing an exsiting record in the product table.  --->	

<cfoutput>

		<p>Today is #rc.theDate#!</p>
		
		<cfparam name="URL.TaskID" type="integer" default="0">
		
		<!--- If you are editing an existing record then you would look up the record first --->
		<cfif URL.TaskID>
			
			<!--- Run the qrySelTblTasks query to populate the form with an exisiting task --->
			<cfinvoke component="controllers.CRUDSQL" method="functQrySelTblTasks" returnVariable="qrySelTblTasks" description="Return a record for one existing task" TaskID="#URL.TaskID#"></cfinvoke> 
			
			<cfset local.TaskID = URL.TaskID>
			<cfset local.TaskName = qrySelTblTasks.TaskName>
			<cfset local.TaskDescript = qrySelTblTasks.TaskDescript>
			<cfset local.DevCode = qrySelTblTasks.DevCode>
			<cfset local.DueDate = DateFormat(qrySelTblTasks.DueDate,"mmmm dd, yyyy")>
			<cfset local.MemoTxt = qrySelTblTasks.MemoTxt>
			<cfset local.PercentComplete = qrySelTblTasks.PercentComplete>
			<cfset local.StatusCode = qrySelTblTasks.StatusCode>
			
			<h2>Edit an Existing Task</h2>
			
		<!--- Otherwise if you were adding a new record you would make sure the form fields were empty --->
		<cfelse>
			
			<cfparam name="local.TaskID" default="0">
			<cfparam name="local.TaskName" default="">
			<cfparam name="local.TaskDescript" default="">
			<cfparam name="local.DevCode" default="">
			<cfparam name="local.DueDate" default="">
			<cfparam name="local.MemoTxt" default="">
			<cfparam name="local.PercentComplete" default="">
			<cfparam name="local.StatusCode" default="">
			
			<h2>Add a New Task</h2>
		
		</cfif>
		
		<!--- Returns recordset for Developers Select List --->
		<cfinvoke component="controllers.CRUDSQL" method="functQryGetTblDevelopers" returnVariable="qryGetTblDevelopers" description="Returns Recordset for Developers Select List"></cfinvoke> 
		
		<!--- Returns Recordset for Status Select List --->
		<cfinvoke component="controllers.CRUDSQL" method="functQryGetTblRefStatus" returnVariable="qryGetTblRefStatus" description="Returns Recordset for Status Select List"></cfinvoke> 
		
		<!--- IF the main SELECT query was run BUT there were no records found THEN display an error message ... --->
		<cfif URL.TaskID AND qrySelTblTasks.recordcount EQ 0>
			
			<H2 class="error">Error!</H2>
			<h3 class="error">No records found for that Task.</h3>
			<p class="error">Task ID: #URL.TaskID#</p>
			
		<!--- .... OTHERWISE display the form for either Adding a New Records or Editing an Existing Record --->
		<cfelse>
			
			<div align="center">
		
                <table class="standard">
                    <cfif URL.TaskID>
                        <caption>Edit an Existing Task</caption>
                    <cfelse>
                        <caption>Add a New Task</caption>
                    </cfif>
                    <CFFORM action="index.cfm?action=main.save&reload=true" method="post">
                        <tr>
                            <th style="background-color: inherit">Task Name</th>
                            <td>
                                <cfinput type="text" id="TaskName" name="TaskName" required="true" value="#local.TaskName#" size="60" />
                            </td>
                        </tr>
                        <tr>
                            <th style="background-color: inherit">Task Description</th>
                            <td>
                                <cfinput type="text" id="TaskDescript" name="TaskDescript" required="true" value="#local.TaskDescript#" size="60" />
                            </td>
                        </tr>
                        <tr>
                            <th style="background-color: inherit">Developer</th>
                            <td>
                            
                                <select id="DevCode" name="DevCode">
                                    <option value=""></option>

                                        <cfloop query="qryGetTblDevelopers">
    
                                            <cfif local.DevCode EQ qryGetTblDevelopers.DevCode>
                                                <option value="#qryGetTblDevelopers.DevCode#" selected="selected">#qryGetTblDevelopers.devName#</option>
                                            <cfelse>
                                                <option value="#qryGetTblDevelopers.DevCode#">#qryGetTblDevelopers.devName#</option>
                                            </cfif>
    
                                        </cfloop>

                                </select>
                            
                            </td>
                        </tr>
                        <tr>
                            <th style="background-color: inherit">% Complete</th>
                            <td>
                                <cfinput type="PercentComplete" name="PercentComplete" required="true" value="#local.PercentComplete#" validate="integer" size="3" />
                            </td>
                        </tr>
                        <tr>
                            <th style="background-color: inherit">Status</th>
                            <td>
                            
                                <select id="StatusCode" name="StatusCode">
                                    <option value=""></option>

                                        <cfloop query="qryGetTblRefStatus">
                                            <cfif local.StatusCode EQ qryGetTblRefStatus.StatusCode>
                                                <option value="#qryGetTblRefStatus.StatusCode#" selected="selected">#qryGetTblRefStatus.StatusTerm#</option>
                                            <cfelse>
                                                <option value="#qryGetTblRefStatus.StatusCode#">#qryGetTblRefStatus.StatusTerm#</option>
                                            </cfif>
    
                                        </cfloop>

                                </select>
                                
                            </td>
                        </tr>
                        <tr>
                            <th style="background-color: inherit">Memo</th>
                            <td>
                                
                                <textarea rows="6" name="MemoTxt" id="MemoTxt" style="width: 98%">#local.MemoTxt#</textarea>

                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"">
                            
                                <!-- Hidden TaskID -->
                                <input type="hidden" name="TaskID" id="TaskID" value="#local.TaskID#" />
                                
                                <div align="center">
                                    
                                    <input type="submit" value="Submit!" style="text-align: center; font-weight: bold; font-style: normal;" />
                                    
                                </div>

                            </td>
                        </tr>
                    </CFFORM>
                </table>
			
			</div>

		</cfif>

</cfoutput>