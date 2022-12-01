param (
    $CalorieFile
)

(Get-Content $CalorieFile) | ForEach-Object {$a = @{Max=[System.Collections.ArrayList]@(); Current=0}} {
    if ($_.Length -gt 0) {
        $a.Current += $_
    }
    else {
        $a.Max.add($a.Current) | Out-Null
        $a.Current = 0
    }
} {
    $a.Max.add($a.Current) | Out-Null
    ($a.Max | Sort-Object -Descending)[0,1,2] | ForEach-Object {$total = 0} {$total+=$_} {$total}
}