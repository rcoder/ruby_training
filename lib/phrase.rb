class Phrase
  attr_reader :template, :labels

  def initialize(config_hash)
    # Hint: save parts of the config_hash as @template and @labels
  end

  def format(words)
    # Hint: use String#split
  end

  def self.load(file_path)
    # Hint: use the JSON module
  end
end
