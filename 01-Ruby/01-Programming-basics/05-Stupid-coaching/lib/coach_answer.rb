def coach_answer(your_message)
  # TODO: return coach answer to your_message
  if your_message.end_with?("?")
    "Silly question, get dressed and go to work!"
  elsif your_message == "I would love to eat some pizza!"
    "I don't care, get dressed and go to work!"
  else
    ""
  end
end

def coach_answer_enhanced(your_message)
  # TODO: return coach answer to your_message, with additional custom rules of yours!
  case your_message
  when "I WOULD LOVE SOME PIZZA!"
    "I can feel your motivation! I don't care, get dressed and go to work!"
  when "CAN I EAT SOME PIZZA?"
    "I can feel your motivation! Silly question, get dressed and go to work!"
  else
    coach_answer(your_message)
  end
end
