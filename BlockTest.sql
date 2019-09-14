{\rtf1\ansi\ansicpg1252\cocoartf1561\cocoasubrtf600
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 \
SELECT * \
FROM sys.dm_exec_requests\
WHERE blocking_session_id <> 0;\
\
SELECT\
db.name DBName,\
tl.request_session_id,\
wt.blocking_session_id,\
OBJECT_NAME(p.OBJECT_ID) BlockedObjectName,\
tl.resource_type,\
h1.TEXT AS RequestingText,\
h2.TEXT AS BlockingTest,\
tl.request_mode\
FROM sys.dm_tran_locks AS tl\
INNER JOIN sys.databases db ON db.database_id = tl.resource_database_id\
INNER JOIN sys.dm_os_waiting_tasks AS wt ON tl.lock_owner_address = wt.resource_address\
INNER JOIN sys.partitions AS p ON p.hobt_id = tl.resource_associated_entity_id\
INNER JOIN sys.dm_exec_connections ec1 ON ec1.session_id = tl.request_session_id\
INNER JOIN sys.dm_exec_connections ec2 ON ec2.session_id = wt.blocking_session_id\
CROSS APPLY sys.dm_exec_sql_text(ec1.most_recent_sql_handle) AS h1\
CROSS APPLY sys.dm_exec_sql_text(ec2.most_recent_sql_handle) AS h2\
GO\
}