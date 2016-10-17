class Api::Attachments::CreateInteraction < CustomInteractionBase
  object   :user
  file     :file

  def execute
    Attachment.create(name: file)
  end
end
