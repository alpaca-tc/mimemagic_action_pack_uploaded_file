require 'mimemagic'

module MimemagicActionPackUploadedFile
  # Detect content_type from magic byte instead of request parameters.
  module UploadedFileWithMimemagic
    UNKNOWN_CONTENT_TYPE = 'unknown/unknown'.freeze

    def initialize(*)
      super
      @content_type = MimeMagic.by_magic(@tempfile).try(:type) || UNKNOWN_CONTENT_TYPE
    end
  end
end
