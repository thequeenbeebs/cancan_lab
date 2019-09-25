require 'rails_helper'

RSpec.describe Note, type: :model do
  before(:context) do
    @alice = User.find_or_create_by(YAML.load(file_fixture("users.yml").read)["alice"])
    @beth =  User.find_or_create_by(YAML.load(file_fixture("users.yml").read)["beth"])
  end

  describe 'visible_to=' do
    it "takes a comma separated list of names, trims spaces, and makes those users readers" do
      note = Note.new      
      note.visible_to = [@alice.name, @beth.name].join(', ')
      expect(note.readers).to eq([@alice, @beth])
    end
  end

  describe "visible_to" do
    it "returns reader names as a comma-separated string" do
      note = Note.new readers: [@alice, @beth]
      expect(note.visible_to).to eq([@alice.name, @beth.name].join(','))
    end
  end
end
