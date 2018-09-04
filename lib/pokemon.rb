class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  def initialize(id:, name:, type:, db:, hp: nil)
    @name = name
    @type= type
    @id = id
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def alter_hp(hp,db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end

  def self.find(id_n,db)
    # db.execute("UPDATE pokemon SET hp = 60 WHERE id = ?", id_n)
    # id = db.execute("SELECT id FROM pokemon WHERE id = ?", id_n).flatten.first
    # name = db.execute("SELECT name FROM pokemon WHERE id = ?", id_n).flatten.first
    # type = db.execute("SELECT type FROM pokemon WHERE id = ?", id_n).flatten.first
    # hp = db.execute("SELECT hp FROM pokemon WHERE id = ?", id_n).flatten.first
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id = ?", id_n).flatten
    #pokemon_hash = {:id => id, :name => name, :type => type, :db => db, :hp => hp}
    Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], hp: pokemon_info[3], db: db)
  end
end
binding.pry