$allItemsTime = Measure-Command -Expression {
  foreach ($item in $operations) {
    $eachItemTime = Measure-Command -Expression { ProcessItem -src $item.src -dst $item.dst }
    Log -msg "Item Execution Time: $eachItemTime"
  }
}
Log -msg "All Items Execution Time: $allItemsTime"