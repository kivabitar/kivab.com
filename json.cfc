<cfcomponent displayname="JSON" hint="I return a json structure" output="false">

	<cffunction name="list" output="true" returnformat="JSON" access="remote">
		<cfargument name="returnType" type="string" default="json" hint="Format to return data">

               <cfset result = structNew()>
               <cfset result.status = false>
					<cfset result.firstname="Jim">
					<cfset result.lastname="Smith">
					<cfset result.phone="555-555-5555">
					<cfset result.address ="1111 N. MLK BLVD">
					<cfset result.city ="Portland">
					<cfset result.State ="OR">
					<cfset result.country ="USA">
 				<cfif arguments.returnType EQ "json">
                       <cfreturn serializeJson(result)>
               <cfelse>
                       <cfreturn result>
               </cfif>
	</cffunction>		

</cfcomponent>