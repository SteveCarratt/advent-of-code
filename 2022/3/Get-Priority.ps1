param(
    $ElfInputFile
)

$typePriority = @('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z')

$ElfContent = Get-Content $ElfInputFile

$ElfContent | ForEach-Object {$total}} { 
    $count = $_.length / 2
    $c1 = $_.substring(0, $count).ToCharArray()
    $c2 = $_.substring($count, $count).ToCharArray()
    $type = Compare-Object -ReferenceObject $c1 -DifferenceObject $c2 -CaseSensitive -IncludeEqual | Where-Object { $_.SideIndicator -eq '=='  } | Get-Unique | Select-Object -ExpandProperty InputObject 
    $priority = $typePriority.IndexOf("$type") + 1
    $type
    $priority
    $total += $priority
} { $total }