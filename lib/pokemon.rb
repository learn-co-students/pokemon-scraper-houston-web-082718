class Pokemon
end
class Pokemon
   attr_accessor :id, :name, :type, :db

   def initialize(id:, name:, type:, db:)
       @id = id
       @name = name
       @type = type
       @db = db
   end

   def self.save(name, type, db)
       db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
   end

   def self.find(id, db)
      parts = db.execute("SELECT * FROM pokemon WHERE ID = ?", id).flatten
       Pokemon.new(id: parts[0], name: parts[1], type: parts[2], db: db)
   end
end