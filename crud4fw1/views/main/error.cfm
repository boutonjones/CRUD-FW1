
<cfoutput>

		<H2 class="error">Error!</H2>
        
        <p>Please send an email to <a href="mailto:hrd.appsupport@austintexas.gov">HRD Application Support</a>.  Please include:</p>
        
        <ul type="disc">
          <li>What you were trying to do with the application;</li>
          <li>Where you were in the application when you encountered this error;</li>
          <li>The error message following;</li>
          <li>and any thing else that might help us fix the error.</li>
        </ul>
		
		<cfif StructKeyExists(request, "exception")>
			
				<h3>#request.exception.message#</h3>
				<h4>#request.exception.detail#</h4>
				<p><span class="highlight"><strong>Cause Message:</strong> #request.exception.cause.message#</span></p>
				<cfif len(request.exception.cause.detail)>
					<p><span class="highlight"><strong>Cause Detail:</strong> #request.exception.cause.detail#</span></p>
				</cfif>
				<cfif isDefined("request.exception.cause.sql")>
					<p><strong>SQL:</strong></p>
					<pre>
						#request.exception.cause.sql#
					</pre>
				</cfif>
			
			<cfif StructKeyExists(request, "failedAction")>
				<P><strong>Failed Action:</strong> #request.failedAction#</p>
			</cfif>
		
			<cfdump var="#request.exception#" label="request.exception" expand="false"><br />
			<br />
			
		<cfelse>
			
			<p>No request.exception</p>
			
		</cfif>
        

</cfoutput>