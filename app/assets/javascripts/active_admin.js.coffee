#= require active_admin/base
#= require bootstrap
#= require bootstrap-multiselect
#= require fancybox
#= require jquery
#= require jquery-ui
#= require admin/jquery.flot
jQuery ->
  $('a.fancybox').fancybox(
    {
      padding: 0,
      autoScale: true
    }
  )
  $("input.datetimepicker").datetimepicker
    stepMinute: 30
    dateFormat: "yy-mm-dd"
