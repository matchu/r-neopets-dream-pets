# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

updatePage = () ->
  getMeta = (name) ->
    document.querySelector("meta[name=#{name}]")?.content

  userOwnsRow = (userId, row) ->
    row.querySelector('.creator').getAttribute('data-id') == userId

  if getMeta('current-user-admin') == 'true'
    table.className += ' admin' for table in document.querySelectorAll('.pet-requests')

  currentUserId = getMeta('current-user-id')
  rows = document.querySelectorAll('.pet-requests tbody tr')
  currentUserRows = (row for row in rows when userOwnsRow(currentUserId, row))
  row.className += ' current-user' for row in currentUserRows

document.addEventListener('page:change', updatePage);
