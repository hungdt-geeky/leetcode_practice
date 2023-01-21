# @param {String} s
# @return {String[]}
def restore_ip_addresses(s)
    result = []
    restore_ip_addresses_helper(s, [], result)
    result
end

def restore_ip_addresses_helper(s, current, result)
    if current.size == 4 && s.empty?
        result << current.join(".")
        return
    end
    if current.size == 4 || s.empty?
        return
    end

    (1..3).each do |i|
        if s.size >= i && is_valid(s[0, i])
            restore_ip_addresses_helper(s[i..-1], current + [s[0, i]], result)
        end
    end
end

def is_valid(s)
    return false if s[0] == '0' && s.size > 1
    s.to_i <= 255
end
