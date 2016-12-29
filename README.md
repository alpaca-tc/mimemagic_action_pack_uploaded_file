# MimemagicActionPackUploadedFile

Detected content_type by `ActionDispatch::HTTP::UploadedFile` is not trusted because it does not validate received content_type.
Therefore, content_type should be detected by magicbyte.  `MimemagicActionPackUploadedFile` extends `ActionDispatch::HTTP::UploadedFile` to 
detects actual content_type with [mimemagic](https://github.com/minad/mimemagic)

## Installation

```
gem 'mimemagic_action_pack_uploaded_file'
```

## CarrierWave configuration

Define `content_type_whitelist` to your uploader.
[Click here for details](Please https://github.com/carrierwaveuploader/carrierwave#securing-uploads)

```
class YourUploader < CarrierWave::Uploader::Base
  def content_type_whitelist
    %w(image/jpeg image/png)
  end
end
```

## Testing

`bundle exec rake spec`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/alpaca-tc/mimemagic_action_pack_uploaded_file.
