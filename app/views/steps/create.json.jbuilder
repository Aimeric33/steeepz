if @step.persisted?
  json.inserted_item render(partial: 'steps/step', formats: :html, locals: { step: @step })
end
