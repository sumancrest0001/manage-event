module EventsHelper
  def display_attendees_list(arr)
    if arr.length > 0
      raw("<p>#{pluralize(arr.length, 'person')} joined the event.</p>
      <button class='attendees-lists-button' onClick={showAtteneesList(@event.attendees)}>See attendees list</button>")
    else
      raw('<p>No one has joined the event yet.</p>')
    end
  end
end
