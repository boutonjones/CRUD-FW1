
<!--- Inherit from the Framework One (FW/1) version 2.5 core files. --->
<cfcomponent extends="fw1v2_5.corfield.framework">
	
    <!--- direct to the landing page if the action attribute is missing in the URL --->
    <cfparam name="URL.action" type="string" default="main.default">
    
    <cfsetting showDebugOutput="Yes">
    
	<cfset framework.applicationkey ="fw1v2_5.corfield.framework">
	
	<!--- Will cfparam work here? --->
	
	<!--- Application name --->
	<cfif isDefined("this.name") AND this.name NEQ "CRUD with FW/1">
		<cfset this.name="CRUD with FW/1" >
	</cfif>

    <!---<cfscript>
    classLoader = createObject("java", "java.lang.Class");
    classLoader.forName("sun.jdbc.odbc.JdbcOdbcDriver");
    dm = createObject("java","java.sql.DriverManager");
    this.datasource = dm.getConnection("Driver={Microsoft Access Driver (*.mdb, *.accdb)};Dbq=D:\inetpub\access_databases\DBCrud.accdb;");
    //st = con.createStatement();
    //rs = st.ExecuteQuery("Select * FROM table");
    //q = createObject("java", "coldfusion.sql.QueryTable").init(rs);
    </cfscript>--->
	
	<!--- Datasource --->
	<cfif NOT isDefined("this.datasource") OR this.datasource NEQ "DBCrud">
		<cfset this.datasource="DBCrud" >
	</cfif>
	
    <!--- Add self like in Fusebox? --->
		
	<!--- overriding failure in framework.cfc --->
	<cffunction name="failure" output="true">
		<cfargument name="exception" default="">
		<cfargument name="event" default="">
		<cfif StructKeyExists(exception, "rootCause")>
			<cfset exception = exception.rootCause>
		</cfif>
		<cfoutput><h1>A serious error occurred and an administrator has been notified.</h1></cfoutput>
		<cfif StructKeyExists(request, "failedAction")>
			<cfoutput><p>The action #request.failedAction# failed</p></cfoutput>
		</cfif>
		<p>#CGI.REMOTE_ADDR# - #CGI.HTTP_USER_AGENT# - #CGI.PATH_INFO#?#CGI.QUERY_STRING#</p>
		<cfdump var="#exception#" label="EXCEPTION" expand="yes">
		<cfdump var="#request#" label="REQUEST" expand="yes">
		<cfdump var="#session#" label="SESSION" expand="yes">
		<!---
		<cfoutput><h2>#exception.message#</h2></cfoutput>
		<cfoutput><p>#exception.detail# (#exception.type#)</p>
		<cfdump var="#exception#">
		--->
	</cffunction>

</cfcomponent>