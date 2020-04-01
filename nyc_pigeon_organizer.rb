
pigeon_data = {
  :color => {
    :purple => ["Theo", "Peter Jr.", "Lucky"],
    :grey => ["Theo", "Peter Jr.", "Ms. K"],
    :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
    :brown => ["Queenie", "Alex"]
  },
  :gender => {
    :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
    :female => ["Queenie", "Ms. K"]
  },
  :lives => {
    "Subway" => ["Theo", "Queenie"],
    "Central Park" => ["Alex", "Ms. K", "Lucky"],
    "Library" => ["Peter Jr."],
    "City Hall" => ["Andrew"]
  }
}

pigeon_list = {
  "Theo" => {
    :color => ["purple", "grey"],
    :gender => ["male"],
    :lives => ["Subway"]
  },
  "Peter Jr." => {
    :color => ["purple", "grey"],
    :gender => ["male"],
    :lives => ["Library"]
  },
  "Lucky" => {
    :color => ["purple"],
    :gender => ["male"],
    :lives => ["Central Park"]
  },
  "Ms. K" => {
    :color => ["grey", "white"],
    :gender => ["female"],
    :lives => ["Central Park"]
  },
  "Queenie" => {
    :color => ["white", "brown"],
    :gender => ["female"],
    :lives => ["Subway"]
  },
  "Andrew" => {
    :color => ["white"],
    :gender => ["male"],
    :lives => ["City Hall"]
  },
  "Alex" => {
    :color => ["white", "brown"],
    :gender => ["male"],
    :lives => ["Central Park"]
  }
}


def name_array_generator1(data)
    names = []
    data.reduce([]) do |memo, (data_key, data_val) |
        #memo, which becomes pigeon_names, is an array
        #data_val is a hash, like {:gender => {...}}
        data_val.reduce([]) do |mem2, (info_key, info_val) |
            #info_val is array of Names
            names << info_val
        end
        memo
    end
    return names.flatten.uniq.sort
end

def name_array_generator2(data)
    names = []
    data.each_pair {|pair| pair[1].each_pair {|pair| names << pair[1]} }
    return names.flatten.uniq.sort
end

def info_array_generator(data)
    info_symbs = []
    data.each_pair{|info, trait_hash| info_symbs << info}
    return info_symbs
end

def info_array_generator2(data)
    return data.reduce([]) {|memo, (info, trait_hash)| memo << info}
end

def nyc_pigeon_organizer(data)
    output_hash = {}
    pigeon_names = name_array_generator2(data)

    info_keys = info_array_generator2(data)
    pigeon_names.each {|name| output_hash[name] = {}}

    output_hash.each_pair do |name, info_hash|
        info_keys.each do |info|
            info_hash[info] = []
        end
    end

    data.reduce({}) do | mem1, (info, trait_hash)|
        trait_hash.reduce({}) do |mem2, (trait, name_array)|
            pigeon_names.each do |name|
                if name_array.include?(name)
                    s_trait = trait.to_s
                    output_hash[name][info] << s_trait
                    output_hash[name][info].uniq!
                end
            end
            mem2
        end
        mem1
    end
    return output_hash
end
  
  
  
end
