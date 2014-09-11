
					<!-- Report Links -->
					<p class="GoToTopIntLink">
						[ 
						<cfif URL.action EQ report.default">
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
							<span class="unavailable">Status Report</span>
						<cfelse>
							<a href="index.cfm?action=report.StatusTerm&reload=true">Report by Developer</a> 
						</cfif>
						]
					</p>