-- =============================================
-- Create Database Role  
-- =============================================
-- =============================================
-- Author:		Okino Leiba
-- Create date: 12/28/2022
-- Description:	Template to create role for users read-only
-- =============================================
USE [WorldCup2022]
GO

-- Create the database role
CREATE ROLE READ_ONLY AUTHORIZATION [dbo]
GO

-- Grant access rights to a specific schema in the database
GRANT 

	SELECT,   
	VIEW DEFINITION 
ON SCHEMA::[dbo]
	TO READ_ONLY
GO

-- Add an existing user to the role
ALTER ROLE READ_ONLY ADD MEMBER <user_name, sysname, user_name>
GO


 --Query the members of the database roles.
 SELECT DP1.name AS DatabaseRoleName,   
   isnull (DP2.name, 'No members') AS DatabaseUserName,
   --consider obfuscating security id
   DP1.sid AS SecurityIdentity,
   DP1.authentication_type_desc as AuthenicationType
 FROM sys.database_role_members AS DRM  
 RIGHT OUTER JOIN sys.database_principals AS DP1  
   ON DRM.role_principal_id = DP1.principal_id  
 LEFT OUTER JOIN sys.database_principals AS DP2  
   ON DRM.member_principal_id = DP2.principal_id  
WHERE DP1.type = 'R'
ORDER BY DP1.name;
GO


--Query lists the permissions explicitly granted or denied to database principals.
SELECT DISTINCT pr.principal_id, pr.name, pr.type_desc,   
    pr.authentication_type_desc, pe.state_desc, pe.permission_name  
FROM sys.database_principals AS pr  
JOIN sys.database_permissions AS pe  
ON pe.grantee_principal_id = pr.principal_id;
GO


SELECT *
FROM sys.database_role_members
GO


SELECT *
FROM sys.database_principals
GO