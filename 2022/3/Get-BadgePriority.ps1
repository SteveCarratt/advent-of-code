param(
    $ElfInputFile
)

$typePriority = @('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z')

$ElfContent = Get-Content $ElfInputFile

$groups = @{}

for ($i = 0; $i -lt $ElfContent.count; $i++) {
    $gn = [int][math]::floor($i / 3)
    
    $backpack = $ElfContent[$i].ToCharArray()
    if ($i % 3 -eq 0) {
        $list = [System.Collections.Generic.List[char[]]]::new()
        [void] $list.Add($backpack)
        $groups.$gn = $list
    }
    else {
        [void]$groups.$gn.Add($backpack)
    }
}

function Get-DuplicateTypes {
    param(
        $Types1, 
        $Types2
    )
    $matches = Compare-Object -ReferenceObject $Types1 -DifferenceObject $Types2 -CaseSensitive -IncludeEqual | Where-Object { $_.SideIndicator -eq '==' }
    Write-Information "What $($matches.InputObject)"
    $matches | Select-Object -ExpandProperty InputObject | Get-Unique 
}
$total = 0
foreach ($key in $groups.keys) {
    $backpacks = $groups[$key]
    $ab = Get-DuplicateTypes -Types1 $backpacks[0] -Types2 $backpacks[1]
    $badgeType = Get-DuplicateTypes -Types1 $ab -Types2 $backpacks[2]
    if ($null -eq $badgeType) {
        
        Write-Error "$badgeType was wrong for $($backpacks[0])|$($backpacks[1])|$($backpacks[2])"
    }
    $priority = $typePriority.IndexOf("$badgeType") + 1
    $badgeType
    $priority
    $total += $priority 
}
$total
