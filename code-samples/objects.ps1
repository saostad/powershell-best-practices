#https://adamtheautomator.com/powershell-objects/

## Define the hashtable
$CarHashtable = @{
	Brand      = 'Ford'
	Style      = 'Truck'
	Model      = 'F-150'
	Color      = 'Red'
	Drivetrain = '4x4'
}

## Create an object
$CarObject = [PsCustomObject]$CarHashTable


# Array of Objects
$data = @(
       [pscustomobject]@{FirstName='Kevin';LastName='Marquette'}
       [pscustomobject]@{FirstName='John'; LastName='Doe'}
   )
