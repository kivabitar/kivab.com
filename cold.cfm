<cfobject component="json" name="galleryObj">
<cfinvoke component="#galleryObj#" method="gallery" returnvariable="images">

<cfoutput>
<cfdump var="#images#">
</cfoutput>