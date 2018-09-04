require 'pry'

class Pokemon

    attr_accessor :name, :type, :id, :db, :hp

    @@all = []
    def initialize(props={})
        @name = props['name'] 
        @type = props['type']
        @db = db
        @id = props['id']
        @hp = props['hp']
    end


    def self.save(name, type, db)

        sql = <<-SQL 
        INSERT INTO pokemon (name, type) VALUES (?, ?); 
        SQL
        db.execute(sql, name, type)
    end

    def self.find(id, db)

        sql = <<-SQL
            SELECT * FROM pokemon WHERE id = ?;
        SQL

        test = db.execute(sql, id)
        # binding.pry

        # found = test.map do |result|
        Pokemon.new('name' => test.first[1], 'id' => test.first[0], 'type' => test.first[2])
        # end

        # found
    end

    

    
end
