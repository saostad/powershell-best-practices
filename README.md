## Best practices to create powershell module

- Start your scripts with a standard set of comments (name, date, author, purpose and keywords) to easily find them later.
- Add comments as much as possible.
- Use simple but meaningful variable names. PascalCase is our current best practice. (e.g. $ServiceName or $CounterName, and not $s, $c or $servicename).
- Place user-defined variables at the top of script. It makes it easier for you or anyone making changes to those script variables.
- Don’t use aliases in scripts. Ever! Use the full cmdlet name with its named parameters.
- each function is written in .ps1 file and whether you want to compile it to a single PSM1 sign your script file.
- never hard code any password / credential in plain text in script, instead always use credential manager
