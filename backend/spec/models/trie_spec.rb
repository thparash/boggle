require 'rails_helper'

RSpec.describe Trie, type: :model do
  it "should initialize with root node and end symbol" do 
    trie = Trie.new
    expect(trie.root_node).to eq({})
    expect(trie.end_symbol).to eq("*")
  end

  it "should create a trie data structure of a word" do 
    word = "cat"
    trie = Trie.new
    trie.add("cat")

    expect(trie.root_node.key?("c")).to eq(true)

    expect(trie.root_node["c"].key?("a")).to eq(true)

    expect(trie.root_node["c"]["a"].key?("t")).to eq(true)

    expect(trie.root_node["c"]["a"]["t"]["*"]).to eq("cat")

  end

end
