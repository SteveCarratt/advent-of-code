param (
    $StrategyFilePath
)
# A=Rock,B=Paper,C=Scissors
# X=Rock,Y=Paper,Z=Scissors
$ShapeMatrix = @{
    X = 1;
    Y = 2;
    Z = 3;
}
$WinMatrix = @{
    A = @{X=3; Y=6; Z=0}
    B = @{X=0; Y=3; Z=6}
    C = @{X=6; Y=0; Z=3}
}

(Get-Content $StrategyFilePath) | ForEach-Object { $total = 0} { $total += $ShapeMatrix[$_[2].toString()] + $WinMatrix[$_[0].toString()][$_[2].toString()] } {$total}