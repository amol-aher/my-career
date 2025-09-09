hash1 = {
  user: {
    name: "John",
    scores: [85, 90, 78],
    preferences: {
      theme: "dark",
      language: "en"
    }
  },
  settings: {
    notifications: true,
    timeout: 30
  }
}
 
hash2 = {
  user: {
    name: "Jane",  # conflict
    scores: [92, 88],  # conflict - arrays
    preferences: {
      theme: "light",  # conflict
      country: "USA"   # new
    }
  },
  settings: {
    notifications: false,  # conflict
    debug: true  # new
  }
}

# Merge strategies:
# 1. For strings: concatenate with separator
# 2. For arrays: concatenate and remove duplicates
# 3. For booleans: use OR operation
# 4. For numbers: use maximum value
 
# Expected output:
# {
#   user: {
#     name: "John|Jane",
#     scores: [85, 90, 78, 92, 88],
#     preferences: {
#       theme: "dark|light",
#       language: "en",
#       country: "USA"
#     }
#   },
#   settings: {
#     notifications: true,  # true OR false = true
#     timeout: 30,
#     debug: true
#   }
# }

def deep_merge_hash(val1, val2)
  case
  when val1.is_a?(Hash) && val2.is_a?(Hash)
    val1.merge(val2) { |_, v1, v2| deep_merge_hash(v1, v2) }
  when val1.is_a?(String) && val2.is_a?(String)
    val1 == val2 ? val1 : "#{val1} | #{val2}"
  when val1.is_a?(Array) && val2.is_a?(Array)
    (val1 + val2).uniq
  when [true, false].include?(val1) && [true, false].include?(val2)
    val1 || val2
  when val1.is_a?(Numeric) && val2.is_a?(Numeric)
    [val1, val2].max
  end
end
data = deep_merge_hash(hash1, hash2)
puts data