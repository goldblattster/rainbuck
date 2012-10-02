class Rainbuck::Brainfuck
  def self.eval(statement)
    ptr = -1

    cells = [0]
    cell_ptr = 0
    
    cleaned = []
    cleaned_ptr = 0

    bracket_hash = {}
    bracket_count = 0

    stack = []

    # operators
    op = ['>', '<', '+', '-', '.', '[', ']', ',']

    until (ptr += 1) == statement.length
      if statement[ptr] == ?[
        stack << cleaned_ptr
        bracket_count += 1
      end

      if statement[ptr] == ?]
        bracket_hash[stack.pop] = cleaned_ptr
        bracket_count -= 1
      end

      bracket_count < 0 && raise("Ending Bracket without opening, mismatch at #{ptr}") && exit
      op.include? statement[ptr] && (cleaned.push statement[ptr]) && cleaned_ptr += 1
    end

    !stack.empty? && raise("Opening Bracket without closing, mismatch at #{stack.pop}") && exit

    ptr = -1

    until (ptr += 1) == statement.length
      case cleaned[ptr]
        when ?> then cell_ptr += 1 && cells[cell_ptr].nil? && cells[cell_ptr] = 0
        when ?< then cell_ptr <= 1 ? cell_ptr = 0 : cell_ptr -= 1
        when ?+ then cells[cell_ptr] <= 254 ? cells[cell_ptr] += 1 : cells[cell_ptr] = 0
        when ?- then cells[cell_ptr] >= 1 ? cells[cell_ptr] -= 1 : cells[cell_ptr] = 255
        when ?[ then cells[cell_ptr] == 0 && ptr = bracket_hash[ptr]
        when ?] then cells[cell_ptr] != 0 && ptr = bracket_hash.key(ptr)
        when ?. then print cells[cell_ptr].chr
        when ?, then cells[cell_ptr] = get_character.to_i
      end
    end
  end
end