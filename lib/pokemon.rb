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
    begin
      db.execute("INSERT INTO pokemon (name, type, hp) VALUES (?, ?, ?);", name, type, 60)
    rescue SQLite3::SQLException
      db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
    end
  end

  def self.find(id, db)
    data = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    self.new(name: data.first[1], type: data.first[2], db: db, id: data.first[0], hp: data.first[3])
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?;", new_hp, id)
  end
end
