ready = ->
  $("#s3-uploader").S3Uploader()
 
$(document).ready(ready)
$(document).on('page:load', ready)