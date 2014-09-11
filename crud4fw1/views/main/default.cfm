

<!--- Run qrySelTblTasks to display all all tasks --->

		<div style="margin: 20px; border: groove; padding: 20px 20px;">
		
			<p>This application is for experimenting with the Framework One (FW/1) framework.</p>
			
			<p>FW/1 is easier once you get past the poor documentation.   Unfortunately the FW/1 Czars assume that any developers using FW/1 are starting from the same level of ColdFusion experience.</p>
			
			<p><span class="highlight">Please view the ColdFusion comment block in the root index.cfm template.</span>  It's my "quick start" readme file.  </p>
			
			<p>The time is <cfoutput>#dateformat(rc.theTime, 'medium')#</cfoutput>!</p>
			
			<p>View the <a href="http://localhost/crud4fw1/controllers/main.cfc" title="http://localhost/crud4fw1/controllers/main.cfc">Component main documentation</a></p>
			
			<p><a href="http://localhost/crud4fw1/controllers/CRUDSQL.cfc" title="http://localhost/crud4fw1/controllers/CRUDSQL.cfc">Component CRUDSQL documentation</a></p>
		
		</div>
		
		<h2>Display Records for All Tasks.</h4>
		
		<div align="center">
		
			<table class="standard">
				<caption>CRUD Report</caption>
                <thead>
				<tr>
					<th>Tasks</th>
					<th>Description</th>
					<th>Developer</th>
					<!---<th>Due Date</th>--->
					<th>% Complete</th>
					<th>Status</th>
					<th>Memo</th>
					<th>Delete</th>
				</tr>
                </thead>
                <tbody>
				<cfoutput query="request.qrySelTblTasks">
                    <tr>
                        <td><a href="index.cfm?action=main.insOrUpdate&reload=true&TaskID=#TaskID#">#TaskName#</a></td>
                        <td>#TaskDescript#</td>
                        <td>#DevName#</td>
                        <!---<td>#DateFormat(DueDate,"mmmm, dd, yyyy")#</td>--->
                        <td>#PercentComplete#</td>
                        <td>#StatusTerm#</td>
                        <td>#MemoTxt#</td>
                        <td><a href="index.cfm?action=main.delTblTasks&reload=true&TaskID=#TaskID#">Delete</a></td>
                    </tr>
				</cfoutput>
                </tbody>
			</table>
		
		</div>


