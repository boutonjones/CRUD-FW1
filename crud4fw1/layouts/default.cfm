<cfoutput>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head xmlns="http://www.w3.org/1999/xhtml">
    <title>#this.name#</title>
    <link type="text/css" rel="stylesheet" href="..\css\default.css" />
    <![if !(lt IE 9)]><link type="text/css" title="CSS3 Stylesheet" rel="stylesheet" href="..\css\css3.css" /><![endif]>
    <!--[if lt IE 9]><link title="MS IE" rel="stylesheet" type="text/css" href="..\css\ie06.css" /><![endif]-->
    <link type="text/css" rel="alternate stylesheet" href="..\css\font01.css" title="font01" />
    <link type="text/css" rel="alternate stylesheet" href="..\css\font02.css" title="font02" />
    <link type="text/css" rel="alternate stylesheet" href="..\css\font03.css" title="font03" /> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <style>
    <!--
    h2 {
       text-align: center;
    }
    -->
    </style>
    <script src="../js/jquery-1.11.1.js" type="text/javascript"></script>    
    <script language="javascript">
        $(document).ready(function() {           
            $('.standard > tbody > tr:even').addClass('EvenRow');
            $('.standard > tbody > tr:odd').addClass('OddRow');
        }); 
    </script>
</head>
<body bgcolor="##ffffff" text="##000000" link="##0000FF" alink="##FF0000" name="top">

<!-- Wrapper -->
<div id="wrapper">

	<!-- Left Hand "Nav Bar" -->
	<div id="navbarleft">
	
	    <div id="nav_bar">
			<a href="http://www.austintexas.gov/">COA Internet Site</a><br />
            <a href="http://cityspace/">COA intranet site</a><br />
			<a href="../crud4fw1/index.cfm?action=main.default">CRUD: FW/1</a><br />
			<a href="../crud4fw1/index.cfm?action=main.default&reload=true">CRUD: FW/1 (reload)</a><br />
			<a href="../crud4fusebox/index.cfm">CRUD: Fusebox 2</a><br />
            <a href="../crud4fusebox5_5/index.cfm">CRUD: Fusebox 5.5</a><br />
			<a href="http://hrdcfdev01/hrportal/">HR Portal</a><br />
            <a href="http://localhost/">Localhost</a><br />
			<cfif FindNoCase("localhost",cgi.server_name)>
				<a href="../work/work.html" title="Work">Bouton's Work Notes and Code Library</a><br />
			</cfif>	
            <div style="margin-left: auto; margin-right: auto">
                <img src="images/logo_fw1.jpg" width="136" height="80" />
            </div>
            <br />
	    </div>
	
	</div>
	<!-- Right Hand "Content" Space -->
	<div id="contentright">
		
		<h1>#this.name#</h1>
		
		<!-- End Header -->

        <!-- Start Unique Content -->

#body#

        <!-- End Unique Content -->

		<!-- Begin Footer -->
		
		<p class="GoToTopIntLink">
			[
			<a href="##top">Top</a> 
			| 
            
				<cfif URL.action EQ "main.default">
                    <span class="unavailable">Return to #this.name# Homepage</span>
                <cfelse>
                    <a href="index.cfm?action=main.default&reload=true">Return to &quot;#this.name#&quot; Homepage</a>
                </cfif>
            
			| 
			<cfif URL.action EQ "main.insOrUpdate">
				<span class="unavailable">Add a New Task</span>
			<cfelse>
				<a href="index.cfm?action=main.insOrUpdate&reload=true&TaskID=0">Add a New Task</a> 
			</cfif>
			| 
			<cfif URL.action EQ "report.default">
				<span class="unavailable">SCRUM Sprint Report</span>
			<cfelse>
				<a href="index.cfm?action=report.default&reload=true">SCRUM Sprint Report</a> 
			</cfif>
			]
		</p>
        
        <hr />
        
        <h2>Debug</h2>
        
        	<cfif isDebugMode()><p class="error">The Debug Mode is off!</p></cfif>
        
			<!---<cfdump label="server" var="#SERVER#" expand="no" /><br /><br />--->
            
            <p><strong>ColdFusion Version:</strong> #LEFT(SERVER.ColdFusion.PRODUCTVERSION, 2	)# #SERVER.ColdFusion.productlevel#<br />
            <strong>OS:</strong> #SERVER.OS.Name# #SERVER.OS.Version#<br />
            <strong>Server:</strong> #cgi.server_name#</p></p>
            
            <cfif isDefined("url.action")>
                <p><strong>URL Action:</strong> #URL.action#</p>
            <cfelse>
                <p><strong>URL Action:</strong> None</p>
            </cfif>
            
            <cfdump var="#arguments#" label="arguments" expand="no"><br />
            <br />
            
            <cfdump var="#request#" label="request" expand="no"><br />
            <br />
            
            <cfdump var="#rc#" label="rc" expand="no"><br />
            <br />
            
            <cfif NOT isDefined("FORM")>
            	<p>No FORM</p>
            <cfelseif NOT StructIsEmpty(FORM)>
                <cfdump var="#FORM#" label="FORM" expand="false"><br /> 
                <br />
            <cfelse>
            	<p>The FORM is empty.</p>
            </cfif>
            
            <cfdump var="#rc#" label="rc" expand="false"><br />
            <br />
            
            <cfdump var="#local#" label="local" expand="false"><br />
            <br />
            
            <cfdump var="#framework#" label="framework" expand="false"><br />
            <br />
            
            <cfdump var="#request#" label="request" expand="false"><br />
            <br />

	</div>

</div>

</body>
</html>

</cfoutput>