require 'rails_helper'

RSpec.describe AlbumTrack, type: :model do
  subject {AlbumTrack.new}
  it { subject.attributes.each { |attr| expect(subject).to validate_presence_of attr[0] unless ["id", "created_at", "updated_at"].include?(attr[0]) } }
end
