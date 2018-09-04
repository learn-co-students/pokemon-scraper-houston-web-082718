require 'pry'

class Pokemon

    attr_accessor :name, :type, :id, :db

    def initialize(name:, type:, id:, db:)
        @name = name
        @type = type
        @db = db
        @id = id
        # @hp = hp
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
        Pokemon.new(name: test.first[1], type: test.first[2], db: db, id: test.first[0])
    end

    # def alter_hp(hp, db)
    #     sql = <<-SQL
    #     UPDATE pokemon SET hp = ? WHERE name = 'Pikachu';
    #     SQL

    #     poki_hp = db.execute(sql, hp)

    #     # Pokemon.new('' => test.first[1], 'id' => test.first[0], 'type' => test.first[2], )
    #     # binding.pry
# 
        # end
    

    
end
