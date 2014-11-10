<cfparam name="form.name" default="">
<cfparam name="form.email" default="">
<cfparam name="form.message" default="">





<cfif form.name NEQ "" AND form.email NEQ "" AND form.message NEQ "">
	<cfmail to="bitar.k@gmail.com" from="#form.email#" subject="New Contact from Kivab.com" type="html">
		<cfoutput>
			Name: #form.name#<br />
			Email: #form.email#<br />
			Message: #form.message#<br />
		</cfoutput>
		<cfset message ="Message sent. Thank you.">
	</cfmail>
	<cfelse>
	<cfset message ="Please fill out all fields">
</cfif>
<cfoutput>
	#message#
</cfoutput>