require 'json'

FORMATS = [ "[Color][verb]",
            "[Greekgod]",
            "Cloud[Verb]",
            "Elastic[Verb]",
            "Data [Verb]",
            "Data [Noun]",
            "Work[Noun]",
            "Code[Verb]",
            "Code[Noun]",
            "Elastic [Noun] [Verb]ing",
            "[Thing] [Noun] [Verb]er",
            "[Thing] [Noun]er",
            "Cloud[Thing]",
            "Elastic [Verb] for [Thing]",
            "[Noun]DB",
            "Deep[Verb]er",
            "[Thing] [Verb] Optimizer",
            "[Thing] [Greekgod]",
            "[Thing]Formation",
            "[Noun]Watch",
            "[Thing]Watch",
            "[Noun]53"]

BITS = {
  color: %w{red blue green pink},
  greekgod: %w{artemis demeter apollo aphrodite dionysus hades hera hermes hestia poseidon zeus},
  verb: %w{search seek find take grab scale grow analyze run query},
  noun: %w{data analytics analysis network ops SQL query machine engine function vision studio reader cloud node iceberg glacier gateway store console formation},
  thing: %w{video data code form vision AI language cost JavaScript IoT S3 EC2 storage developer DNS HTTP}
}
  
def create_aws_name
  format = FORMATS.sample

  result = format.gsub(/\[(\w+)\]/) do 
    piece = BITS[$1.downcase.to_sym].sample
    $1[0].between?('A', 'Z') ? piece[0].upcase + piece[1..-1] : piece
  end

  "AWS " + result
end

def lambda_handler(event:, context:)
  { statusCode: 200, body: JSON.generate(create_aws_name.to_s) }
end
