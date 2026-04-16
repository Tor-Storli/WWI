# Define a mapping: "SQL Server Name" = "Clean Filename"
$tables = @{
    "Dimension.City"               = "City"
    "Dimension.Customer"           = "Customer"
    "Dimension.Date"               = "Date"
    "Dimension.Employee"           = "Employee"
    "[Dimension].[Payment Method]" = "PaymentMethod"
    "[Dimension].[Stock Item]"     = "StockItem"
    "Fact.Sale"                    = "Sale"
    "[Fact].[Stock Holding]"       = "Fact_StockHolding"
}

# Builds a NULL-safe SELECT for any table dynamically
function Get-NullSafeQuery {
    param($sqlName)
    $cols = Invoke-Sqlcmd -ServerInstance "TOR-1\TOR_SQL22" -Database "WideWorldImportersDW" -Query "
        SELECT 'ISNULL(CAST([' + COLUMN_NAME + '] AS NVARCHAR(MAX)), '''') AS [' + COLUMN_NAME + ']'
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_SCHEMA + '.' + TABLE_NAME = REPLACE(REPLACE('$sqlName', '[', ''), ']', '')
        ORDER BY ORDINAL_POSITION"
    $selectList = ($cols | ForEach-Object { $_[0] }) -join ", "
    return "SELECT $selectList FROM $sqlName"
}

foreach ($sqlName in $tables.Keys) {
    $cleanName = $tables[$sqlName]
    $outFile   = "C:\Users\storl\Desktop\WWI\csv\$cleanName.csv"

    Write-Host "Exporting $sqlName to $cleanName.csv..."

    $query = Get-NullSafeQuery -sqlName $sqlName

    Invoke-Sqlcmd -ServerInstance "TOR-1\TOR_SQL22" -Database "WideWorldImportersDW" -Query $query |
        Export-Csv -Path $outFile -NoTypeInformation -Encoding UTF8
}

Write-Host "Done! All files are cleaned, UTF-8 encoded, and ready for DuckDB."