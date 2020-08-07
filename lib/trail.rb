
class Trail

    attr_accessor :trail_id, :name, :summary, :length, :url, :difficulty, :description, :route, :high_elev, :low_elev, :elev_gain, :dogs, :id

    def initialize(trail_hash)
        trail_hash.each {|attr_name, attr_value| self.send("#{attr_name}=", attr_value)}
        self.save
    end 

    def self.create_from_collection(trail_array)
        trail_array.each {|trail| self.new(trail)}
    end 

    def add_trail_attributes(attributes_hash)
        attributes_hash.each {|attr_name, attr_value| self.send("#{attr_name}=", attr_value)}
        self.save 
        self
    end 

    def self.new_from_db(row)
        self.new({id: row[0], trail_id: row[1], name: row[2], summary: row[3], length: row[4], url: row[5], difficulty: row[6], description: row[7], route: row[8], high_elev: row[9], low_elev: row[10], elev_gain: row[11], dogs: row[12]})
    end 


    def self.new_from_rows(rows)
        rows.collect do |row|
            self.new_from_db(row)
        end
    end

    def save
        if self.id
            self.update
        else 
            self.insert
        end 
    end

    def update
        sql = <<-SQL
            UPDATE trails
            SET trail_id = ?, name = ?, summary = ?, length = ?, url = ?, difficulty = ?, description = ?, route = ?, high_elev = ?, low_elev = ?, elev_gain = ?, dogs = ? WHERE id = ?
        SQL

        DB[:conn].execute(sql, self.trail_id, self.name, self.summary, self.length, self.url, self.difficulty, self.description, self.route, self.high_elev, self.low_elev, self.elev_gain, self.dogs, self.id)
    end 

    def insert 
        sql = <<-SQL
            INSERT INTO trails (trail_id, name, summary, length, url, difficulty, description, route, high_elev, low_elev, elev_gain, dogs)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        SQL

        DB[:conn].execute(sql, self.trail_id, self.name, self.summary, self.length, self.url, self.difficulty, self.description, self.route, self.high_elev, self.low_elev, self.elev_gain, self.dogs)

        @id = DB[:conn].execute("SELECT last_insert_rowid() FROM trails")[0][0]
    end 

    def self.all
        sql = "SELECT * FROM trails"

        rows = DB[:conn].execute(sql)
        self.new_from_rows(rows)
        # @@all
    end 

    def self.sort_all
        sql = "SELECT * FROM trails ORDER BY length"

        rows = DB[:conn].execute(sql)
        self.new_from_rows(rows)
        # self.all.sort_by {|a| a.length}
    end 

    def self.find_by_trail_id(trail_id)
        sql = "SELECT * FROM trails WHERE trail_id = ?"

        row = DB[:conn].execute(sql, trail_id)[0]
        self.new_from_db(row)
    end 

    def self.create_table
        sql = <<-SQL
            CREATE TABLE IF NOT EXISTS trails (
                id INTEGER PRIMARY KEY,
                trail_id TEXT,
                name TEXT,
                summary TEXT,
                length INTEGER,
                url TEXT,
                difficulty TEXT,
                description TEXT,
                route TEXT,
                high_elev TEXT,
                low_elev TEXT,
                elev_gain TEXT,
                dogs TEXT
            );
        SQL

        DB[:conn].execute(sql)
    end 

    def self.clear_all
        sql = "DROP TABLE IF EXISTS trails"

        DB[:conn].execute(sql)
    end 

end 
 