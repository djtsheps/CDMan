require 'rails_helper'

RSpec.describe Track, type: :model do
  subject {Track.new}
  it { subject.attributes.each { |attr| expect(subject).to validate_presence_of attr[0] unless ["id", "created_at", "updated_at"].include?(attr[0]) } }
end
