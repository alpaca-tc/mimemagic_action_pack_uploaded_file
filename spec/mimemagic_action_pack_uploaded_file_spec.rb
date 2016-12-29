require 'spec_helper'
require 'mimemagic_action_pack_uploaded_file/railtie'

describe MimemagicActionPackUploadedFile do
  describe 'VERSION' do
    it 'has a version number' do
      expect(MimemagicActionPackUploadedFile::VERSION).not_to be nil
    end
  end

  describe described_class::UploadedFileWithMimemagic do
    def fixture_path(filename)
      File.expand_path(File.join('..', 'fixtures', filename), __FILE__)
    end

    let(:uploaded_file) do
      Class.new(ActionDispatch::Http::UploadedFile) do
        prepend(MimemagicActionPackUploadedFile::UploadedFileWithMimemagic)
      end
    end

    let(:instance) do
      uploaded_file.new(
        tempfile: tempfile,
        head: head,
        type: request_content_type,
        filename: filename
      )
    end

    let(:tempfile) { File.open(fixture_path('cmyk.jpg')) }
    let(:request_content_type) { 'image/jpeg' }
    let(:filename) { 'filename.jpeg' }

    let(:head) do
      <<~HEAD
        Content-Disposition: form-data; name="image[file]"; filename="#{filename}"
        Content-Type: #{request_content_type}
        Content-Length: #{tempfile.size}
      HEAD
    end

    after do
      tempfile.close
    end

    context '#initialize' do
      subject { instance.content_type }

      context 'given actual content_type' do
        it { is_expected.to eq('image/jpeg') }
      end

      context 'given difference content_type' do
        let(:request_content_type) { 'image/png' }
        it { is_expected.to eq('image/jpeg') }
      end

      context 'given png content_type' do
        let(:tempfile) { File.open(fixture_path('image.png')) }
        it { is_expected.to eq('image/png') }
      end

      context 'given pdf content_type' do
        let(:tempfile) { File.open(fixture_path('manuscript.pdf')) }
        it { is_expected.to eq('application/pdf') }
      end

      context 'given zip content_type' do
        let(:tempfile) { File.open(fixture_path('manuscript.zip')) }
        it { is_expected.to eq('application/zip') }
      end

      context 'given unsupported tempfile' do
        let(:tempfile) { File.open(__FILE__) }
        it { is_expected.to eq('unknown/unknown') }
      end
    end
  end
end
