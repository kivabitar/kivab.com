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

	<cffunction name="gallery" output="true" returnformat="JSON" access="remote">
		<cfargument name="returnType" type="string" default="json" hint="Format to return data">
			<cfset rssUrl = "https://www.flickr.com/services/feeds/photos_public.gne?id=103364915@N06&lang=en-us&format=rss_200">

			<cffeed action="read" source="#rssUrl#" query="images" properties="info">
			<cfset result = QueryToStruct(images)>

				<cfreturn serializeJson(result)>

	</cffunction>

	<cffunction name="QueryToStruct" access="public" returntype="any" output="false"
    hint="Converts an entire query or the given record to a struct. This might return a structure (single record) or an array of structures.">

    <!--- Define arguments. --->
    <cfargument name="Query" type="query" required="true" />
    <cfargument name="Row" type="numeric" required="false" default="0" />

    <cfscript>

        // Define the local scope.
        var LOCAL = StructNew();

        // Determine the indexes that we will need to loop over.
        // To do so, check to see if we are working with a given row,
        // or the whole record set.
        if (ARGUMENTS.Row){

            // We are only looping over one row.
            LOCAL.FromIndex = ARGUMENTS.Row;
            LOCAL.ToIndex = ARGUMENTS.Row;

        } else {

            // We are looping over the entire query.
            LOCAL.FromIndex = 1;
            LOCAL.ToIndex = ARGUMENTS.Query.RecordCount;

        }

        // Get the list of columns as an array and the column count.
        LOCAL.Columns = ListToArray( ARGUMENTS.Query.ColumnList );
        LOCAL.ColumnCount = ArrayLen( LOCAL.Columns );

        // Create an array to keep all the objects.
        LOCAL.DataArray = ArrayNew( 1 );

        // Loop over the rows to create a structure for each row.
        for (LOCAL.RowIndex = LOCAL.FromIndex ; LOCAL.RowIndex LTE LOCAL.ToIndex ; LOCAL.RowIndex = (LOCAL.RowIndex + 1)){

            // Create a new structure for this row.
            ArrayAppend( LOCAL.DataArray, StructNew() );

            // Get the index of the current data array object.
            LOCAL.DataArrayIndex = ArrayLen( LOCAL.DataArray );

            // Loop over the columns to set the structure values.
            for (LOCAL.ColumnIndex = 1 ; LOCAL.ColumnIndex LTE LOCAL.ColumnCount ; LOCAL.ColumnIndex = (LOCAL.ColumnIndex + 1)){

                // Get the column value.
                LOCAL.ColumnName = LOCAL.Columns[ LOCAL.ColumnIndex ];

                // Set column value into the structure.
                LOCAL.DataArray[ LOCAL.DataArrayIndex ][ LOCAL.ColumnName ] = ARGUMENTS.Query[ LOCAL.ColumnName ][ LOCAL.RowIndex ];

            }

        }


        // At this point, we have an array of structure objects that
        // represent the rows in the query over the indexes that we
        // wanted to convert. If we did not want to convert a specific
        // record, return the array. If we wanted to convert a single
        // row, then return the just that STRUCTURE, not the array.
        if (ARGUMENTS.Row){

            // Return the first array item.
            return( LOCAL.DataArray[ 1 ] );

        } else {

            // Return the entire array.
            return( LOCAL.DataArray );

        }

    </cfscript>
	</cffunction>
	<cffunction name="images" output="true" returnformat="JSON" access="remote">
		<cfargument name="imageId" type="string" default="" required="no">
		<cfargument name="returnType" type="string" default="json" hint="Format to return data">

               <cfset result = [

             	{
					imageUrl="/images/photos/image_01.jpg",
					name="Image 01",
					id = 1
				},
				{
					imageUrl="/images/photos/image_02.jpg",
					name="Image 02",
					id = 2
				},
				{
					imageUrl="/images/photos/image_03.jpg",
					name="Image 03",
					id = 3
				},
				{
					imageUrl="/images/photos/image_04.jpg",
					name="Image 041",
					id = 4
				},
				{
					imageUrl="/images/photos/image_05.jpg",
					name="Image 05",
					id = 5
				},
				{
					imageUrl="/images/photos/image_06.jpg",
					name="Image 06",
					id = 6
				},
				{
					imageUrl="/images/photos/image_07.jpg",
					name="Image 07",
					id = 7
				},
				{
					imageUrl="/images/photos/image_08.jpg",
					name="Image 08",
					id = 8
				},
				{
					imageUrl="/images/photos/image_09.jpg",
					name="Image 09",
					id = 9
				},
				{
					imageUrl="/images/photos/image_10.jpg",
					name="Image 10",
					id = 10
				}
				]
				/>

 			 	 <cfif arguments.imageId NEQ "" && arguments.imageId NEQ "undefined">
						<cfset result2 = structNew()>
							<cfset number = arguments.imageId>
							<cfset result2= #result[number]#>
						<cfreturn serializeJson(result2)>
	               <cfelse>
	                       <cfreturn result>
	             </cfif>
	</cffunction>
</cfcomponent>