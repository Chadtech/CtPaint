selectPosture = [
  () ->
    if not areaSelected
      console.log 'Mouse Move, No area selected'
    else
      console.log 'Mouse Move, area selected'
  () ->
    if not areaSelected
      console.log 'Mouse Down, No area selected'
    else
      console.log 'Mouse Down, area selected'
  () ->
    if not areaSelected
      console.log 'Mouse Up, No area selected'
    else
      console.log 'Mouse Up, area selected'
]