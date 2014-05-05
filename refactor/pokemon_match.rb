class Pokemon
  attr_accessor :name

  def initialize(name, level, hp, attack, defence,
                   magic_attack, magic_defence, agility, *skills)
    @name = name
    @level = level
    @hp = hp
    @attack = attack
    @defence = defence
    @magic_attack = magic_attack
    @magic_defence = magic_defence
    @agility = agility
    @skills = skills
  end
end


class Skill
  def initialize(name, power, hit_rate, type, is_normal_skill)
    @name = name
    @power = power
    @hit_rate = hit_rate
    @type = type
    # 通常の攻撃 or 特殊攻撃
    @is_normal_skill = is_normal_skill
  end
end


class PokemonBuilder
  def self.create_kamonegi
    tsubasa = Skill.new("つばさでうつ", 60, 100, "ひこう", true)
    easura = Skill.new("エアスラッシュ", 75, 95, "ひこう", false)
    leafblade = Skill.new("リーフブレード", 90, 100, "くさ", false)
    neppuu = Skill.new("ねっぷう", 95, 90, "ほのお", false)

    kamonegi = Pokemon.new("カモネギ", 100, 245, 166, 146, 152, 160, 156,
                             tsubasa, easura, leafblade, neppuu)
    return kamonegi
  end
end


class Trainer
  attr_accessor :pokemons

  def initialize(*pokemons)
    @pokemons = pokemons
  end

  def battle(opponent)

  end
end


def main
  trainer = Trainer.new(PokemonBuilder.create_kamonegi)

  trainer.pokemons.each do |pokemon|
    puts pokemon.name
  end
end

main

