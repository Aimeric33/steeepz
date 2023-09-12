if @section.persisted?
  json.inserted_item render(partial: 'sections/section', formats: :html, locals: { section: @section })
end
