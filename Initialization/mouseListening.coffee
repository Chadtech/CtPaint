justPassTheCoordinates = (mouseEvent) ->
  return [mouseEvent.offsetX, mouseEvent.offsetY]

mouseListeningUnderAbnormalCircumstance = [
  (event) ->
    justPassTheCoordinates(event)
  (event) ->
    justPassTheCoordinates(event)
]

