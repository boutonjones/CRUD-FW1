
<!---  Run qrySelTblTasks to populate the report.  Order by Developers.  --->
	
		<h2>SCRUM Sprint Report</h4>
		
		<div align="center">
		
			<!--- Outer CFOUTPUT (ORDER BY DevName) --->
			<cfoutput query="request.qrySelTblTasks" group="DevName">
			
				<table class="standard" id="crud_table">
					<caption>#DevName#</caption>
                    <thead>
                        <tr>
                            <th>Tasks</th>
                            <th>Description</th>
                            <th>% Complete</th>
                            <th>Status</th>
                            <th>Memo</th>
                        </tr>
                    </thead>
                    <tbody>
					<!--- Inner CFOUTPUT --->
					<cfoutput>
						<tr>
							<td>#TaskName#</td>
							<td>#TaskDescript#</td>
							<td>#PercentComplete#</td>
							<td>#StatusTerm#</td>
							<td>#MemoTxt#</td>
						</tr>
					</cfoutput>
                    </tbody>
				</table>
			
			</cfoutput>
			
			<table class="standard">
				<tr>
					<td colspan="6">
						
						<!-- Report Links -->
						<p class="GoToTopIntLink">
							[ 
							<cfif URL.action EQ "report.default">
								<span class="unavailable">Standard Report</span>
							<cfelse>
								<a href="index.cfm?action=report.default&reload=true">Standard Report</a>
							</cfif>
							| 
							<cfif URL.action EQ "report.DevName">
								<span class="unavailable">Report by Developer</span>
							<cfelse>
								<a href="index.cfm?action=report.DevName&reload=true&TaskID=0">Report by Developer</a> 
							</cfif>
							| 
							<cfif URL.action EQ "report.StatusTerm">
								<span class="unavailable">Report by Status</span>
							<cfelse>
								<a href="index.cfm?action=report.StatusTerm&reload=true">Report by Status</a> 
							</cfif>
							]
						</p>
						
					</td>
				</tr>
			</table>
		
		</div>

