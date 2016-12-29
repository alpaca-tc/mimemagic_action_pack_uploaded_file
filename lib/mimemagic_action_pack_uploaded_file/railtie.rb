require 'rails'

module MimemagicActionPackUploadedFile
  class Railtie < Rails::Railtie
    initializer 'mimemagic_action_pack_uploaded_file.initializer', after: 'action_dispatch.configure' do
      ActionDispatch::Http::UploadedFile.prepend(MimemagicActionPackUploadedFile::UploadedFileWithMimemagic)
    end
  end
end
