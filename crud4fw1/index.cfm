<!---
Application Name: CRUD with FW/1

This application is written using the Framework One (FW/1) framework.

GETTING STARTED INSTALLING A FW/1 FRAMEWORK:

I. ADD FW/1 CORE FILES TO YOUR WEB SERVER:

	A. Download FW/1 files from http://fw1.riaforge.org
	B. Place the org subdirectory in your root. (E.G. "C:/inetpub/wwwroot/org")
	C. Rename the org subdirectory to reflect the version of FW/1 that you are using.  (E.G. "FW1v2_5" for version 2.5.)  
	   This step will allow the use of mutliple versions of FW/1 in case you are a developer working in a large organizations where multiple developers and multiple teams share the same environment.
	   (NOTE: Do not install FW/1 into a subfolder that contains "." in the name as this will prevent CFC resolution from working! That is why we named the subfolder "v2_5" instead of "v2.5".) 

       OR

    A.  Just use the existing FW1v2_5

II. CONFIGURE YOUR APPLICATION:

	A. To incoporate FW1, add the FW1 Application.cfc to your new application's root directory.  
	B. For each FW1 application that uses your specific FW1 installation, replace 'component extends="org.corfield.framework"' with 'component extends="FW1v2_5.corfield.framework"' inside your Application.cfc file.  (This assumes the application is under the root directory.  E.G. "C:/inetpub/wwwroot/YourNewFW1Application".)
	C. Create an empty index.cfm file in your applications root directory. (E.G. "C:/inetpub/wwwroot/YourNewFW1Application/index.cfm".)  You notice that my copy (this template) contains a comment block that I hope you find useful.
	D. Create views/main/default.cfm containing "<p>Hello World!</p>" text string. (E.G. "C:/inetpub/wwwroot/YourNewFW1Application/views/main/default.cfm".)  This "main.default" is your first "action."
	E. For your /views/main/error.cfm file add debug code. You're welcome to copy mine.  It's more useful than the default error.cfm template but it needs more work.
	F. FW1 has a layouts folder in addition to a views folder.  Look at "crud4fw1\layouts\default.cfm" to see how layouts work in FW/1.  Basically in replaces header and footer includes with a single layout template which wraps around the views.  So you have one template which controls the appearance of your application.
	G. Use the view() method for includes.  For example "<cfoutput>#view('main/header')#</cfoutput>" and "<cfoutput>#view('main/footer')#</cfoutput>".  The view() method serves as a smart include of FW/1.
	H. Links to other actions are formatted as "<a href="index.cfm?action=main.insorupdate&reload=true&TaskID=0">Add a New Task</a>".  Each action gets a template in a view subdirectory 
	   ("C:\inetpub\wwwroot\crud4fw1\views\main\insorupdate.cfm") and optionally a function in a controller ("C:\inetpub\wwwroot\crud4fw1\controllers\main.cfc")

SOME QUICK NOTES ON FW/1

	* When you ask for action=section.item FW/1 looks for section.cfc in a controllers folder and, if present, invokes the item() method on it (and then displays the matching view).
	* For FW/1 it's useful to know Application.cfc, CFCs, CFScript, MVC, APIs, and Bean Factories.  The available FW/1 documentation assumes all new FW/1 developers code in CFScript.  (So much for simple.)
	* FW/1 uses convention over configuration.  Uses folder naming conventions.
	* index.cfm is usually empty but since this is the first file that I usually look at I've put my "Getting Started"/"Read me" notes here.
	* The first controller is main.cfc inside the "controllers" folder.  That's where your action code belongs.  Each action gets a function / method.
	* Queries must be scoped otherwise you will get errors that the query variables are invalid. Include "<cfset request.qrySelTblTasks = qrySelTblTasks>" in the controller and SQL CFCs and scope the queries in CFOUTPUTs, CFLOOPs, and CFDUMPs.
	* The view folder is for your markup (display.)  (But the layout can be separated from the view in a dedicated folder.)
	* All views execute as included files within the context of a FW/1 request.  Data stored in variables scope by one view is accessible to other views executed in the same request such as those views rendered by calls to view() in layouts.  You can avoid those concerns by using local scope for any new variables introduced inside the view. 
	* It is not advisable to write to the request scope inside a view or layout.  (see pg. 4 of the Developing Applications Manual)
	* Controller CFC filenames, layout filenames, and view filenames must be all lowercase!
	* Use the local struct for the variables in views or layout.   "local – A struct that can be safely used for new variables created by the view."
	* Use var to declare variables.  (explain further)
	* the RC (Request Context) scope is part of FW/1.  It's a structure within the local scope which passes URL and From variables merged together.
	* I converted the CFScript to CFML tags (and added a comment) in the Application.cfc in the root of my application.
 
QUICK NOTES ON THE CFCS USED IN FW/1

	* I use the hint attribute in cffunction to include useful comments
	* I suggest using var to declare 'local' variables.  The local variable this cannot be declared outside of a function.
	* Using the returntype attribute inside a CFC function caused an error.  Maybe that's a FW/1 thing.  Need to investigate further.
    * "Context validation error for the cffunction tag."   This happens when something comes between cffunction tag and cfargument tag.
 
ERRORS

	* Your error template will be /views/main/error.cfm .  It doesn't do much until you add CFML to it.  You can use this application's copy of that template (with the CFML I added) but it needs work.
	* The error "Element MISSINGVIEW is undefined in REQUEST" indicates a mistake in the view function.   Example: "<cfoutput>#view('wrongdir/footer')#</cfoutput>"
	* The error "Variable CFQUERY is undefined" normally indicates a problem with the SQL code inside a CFQUERY tag pair rather than a problem with the CFML.

FW/1 EXTERNAL LINKS
	* Project home: http://fw1.riaforge.org
	* Documentation (source code, forks, issues, documentation, etc.,) wiki: http://github.com/framework-one/fw1/wiki
	* New FW/1 Blog: http://framework-one.github.io/
	* All the release announcement posts and major roadmap posts have been back-filled: http://framework-one.github.io/blog/archives/
	* Old FW/1 Blog: http://corfield.org/blog/archives.cfm/category/fw1
	* Support: http://groups.google.com/group/framework-one/
	* Mailing List (Google Group for FW/1): https://groups.google.com/forum/#!forum/framework-one
	* Github Wiki for FW/1 Docs: https://github.com/framework-one/fw1/wiki
--->
