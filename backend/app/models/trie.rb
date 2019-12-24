class Trie
    attr_accessor :root_node, :end_symbol

    def initialize
        @root_node = {}
        @end_symbol = "*"
    end

    def add(word)
        current_node = @root_node
        word.each_char do |char|
            if !current_node.key?(char)
                current_node[char] = {}
            end
            current_node = current_node[char]
        end
        current_node[@end_symbol] = word
    end
end


# {
#     "c":{
#         "a": {
#             "t": {
#                 "*": "cat"
#             }
#         },
#         "o":{
#             "w":{
#                 "*": "cow"
#             }
#         }
#     }
# }

