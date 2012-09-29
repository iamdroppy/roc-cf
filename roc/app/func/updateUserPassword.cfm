﻿<cfquery name="CurrentPass" datasource="#config.DSN#">
	SELECT password 
	FROM users
	WHERE id = #session.userid#
</cfquery>

<cfif CurrentPass.password is hash(oldpass)>
	<cfset password = hash(newpass) >
	<cfquery name="updateUserPassword" datasource="#config.DSN#">
		UPDATE users
		SET password = <CFQUERYPARAM VALUE="#password#" CFSQLType="CF_SQL_VARCHAR" MAXLENGTH="128">
		WHERE id = #session.userid#
	</cfquery>
</cfif>
