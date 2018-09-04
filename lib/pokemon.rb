class Pokemon

    attr_accessor :name, :type, :db, :id, :hp

    def initialize(name:, type:, db:, id:, hp: nil)
        @name = name
        @type = type
        @db = db
        @id = id
        @hp = hp
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db)
        data = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
        pokemon = data[0]
        self.new(name: pokemon[1], type: pokemon[2], id: pokemon[0], db: db, hp: pokemon[3])
    end

    def alter_hp(hp, db)
        db.execute("UPDATE pokemon SET hp = ? WHERE id = ?;", hp, self.id)
    end

end

