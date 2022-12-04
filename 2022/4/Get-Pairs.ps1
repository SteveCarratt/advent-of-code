param(
    $ElfInputFile
)

class WorkRange {
    [int]$start
    [int]$end
    WorkRange([string]$representation) {
        $split = $representation -split '-'
        $this.start = [int]::Parse($split[0])
        $this.end = [int]::Parse($split[1])
    }
    [bool]Includes([WorkRange]$other){
        return $this.start -le $other.start -and $this.end -ge $other.end
    }
    [bool]Overlaps([WorkRange]$other) {
        return ($this.start -ge $other.start -and $this.start -le $other.end) -or ($this.end -ge $other.start -and $this.end -le $other.end)
    }
}

Get-Content $ElfInputFile | Foreach-Object {$r = @{includes =0; overlaps =0}} {
    $assignments = $_ -split ','
    $first = [WorkRange]::new($assignments[0])
    $second = [WorkRange]::new($assignments[1])
    if ($first.Includes($second) -or $second.Includes($first)) {
        $r.includes +=1 
    }
    if ($first.Overlaps($second) -or $second.Overlaps($first)) {
        $r.overlaps += 1
    } 
} { $r}