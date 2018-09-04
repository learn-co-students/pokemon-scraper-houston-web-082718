class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  def initialize(props = {})
    @name = props[:name]
    @type= props[:type]
    @id = props[:id]
    @db = props[:db]
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id_n,db)
    id = db.execute("SELECT id FROM pokemon WHERE id = ?", id_n).flatten.first
    name = db.execute("SELECT name FROM pokemon WHERE id = ?", id_n).flatten.first
    type = db.execute("SELECT type FROM pokemon WHERE id = ?", id_n).flatten.first
    pokemon_hash = {:id => id, :name => name, :type => type, :db => db}
    Pokemon.new(pokemon_hash)
  end
end
