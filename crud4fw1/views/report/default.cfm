
<!--- Run qrySelTblTasks to populate the report --->

		<h2 style="text-align: center">SCRUM Sprint Report</h4>

		<div align="center">
		
			<table class="standard">
				<caption>SCRUM Sprint Report</caption>
                <thead>
                    <tr>
                        <th>Tasks</th>
                        <th>Description</th>
                        <th>Developer</th>
                        <th>% Complete</th>
                        <th>Status</th>
                        <th>Memo</th>
                    </tr>
                </thead>
                <tbody>
					<cfoutput query="request.qrySelTblTasks">
                    <tr>
                        <td>#TaskName#</td>
                        <td>#TaskDescript#</td>
                        <td>#DevName#</td>
                        <td>#PercentComplete#</td>
                        <td>#StatusTerm#</td>
                        <td>#MemoTxt#</td>
                    </tr>
                    </cfoutput>
                    <tr>
                        <td colspan="6">
                            
                            <!-- Report Links -->
                            <p class="GoToTopIntLink">
                                [ 
                                <cfif URL.action EQ "report.default">
                                    <span style="color:silver">Standard Report</span>
                                <cfelse>
                                    <a href="index.cfm?action=report.default&reload=true">Standard Report</a>
                                </cfif>
                                | 
                                <cfif URL.action EQ "report.DevName">
                                    <span style="color:silver">Report by Developer</span>
                                <cfelse>
                                    <a href="index.cfm?action=report.DevName&reload=true&TaskID=0">Report by Developer</a> 
                                </cfif>
                                | 
                                <cfif URL.action EQ "report.StatusTerm">
                                    <span style="color:silver">Report by Status</span>
                                <cfelse>
                                    <a href="index.cfm?action=report.StatusTerm&reload=true">Report by Status</a> 
                                </cfif>
                                ]
                            </p>
                                   
                        </td>
                    </tr>
                </tbody>
			</table>
		
		</div>
