param (
    $StrategyFilePath
)
# A=Rock,B=Paper,C=Scissors
# X=Lose,Y=Draw,Z=Win
$WinMatrix = @{
    X = 0;
    Y = 3;
    Z = 6;
}
$ShapeMatrix = @{
    A = @{X=3; Y=1; Z=2}
    B = @{X=1; Y=2; Z=3}
    C = @{X=2; Y=3; Z=1}
}

(Get-Content $StrategyFilePath) | ForEach-Object { $total = 0} { $total += $WinMatrix[$_[2].toString()] + $ShapeMatrix[$_[0].toString()][$_[2].toString()] } {$total}