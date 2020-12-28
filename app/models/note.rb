

class Note < ActiveRecord::Base
    belongs_to :user
    has_many :viewers
    has_many :readers, through: :viewers, source: :user 

    def visible_to
        readers.map(&:name).join(',')
        # comma_string = ""
        # self.readers.each do |reader|
        #     comma_string += "#{reader.name},"
        # end
        # comma_string[0...-1]
    end

    def visible_to=(comma_string)
        viewer_names = comma_string.gsub(/\s+/,'').split(',').compact
        eligible = User.where(name: viewer_names).to_a
        eligible << user if user 
        self.readers = eligible.uniq 
        visible_to
        # names = comma_string.split(",")
        # proper_format = ""
        # names.each do |name|
        #     reader = User.find_by(name: name)
        #     self.readers << reader
        #     proper_format += "#{reader.name},"
        # end
        # proper_format
    end


end