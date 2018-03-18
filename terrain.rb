#!/usr/bin/env ruby

class Terrain

  attr_reader :name, :glyph, :symbol, :color, :bold

  def initialize data
    data.each do |k, v|
      instance_variable_set("@#{k}", v)
    end
  end
end

class Terrains

  def [] char
    @list.find{ |t| t.symbol == char }
  end

  def initialize
    @list = DataLoader.load_file('terrains').map do |data|
      Terrain.new(data)
    end
  end

  private

  attr_reader :list

end
