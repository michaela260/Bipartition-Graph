# Time Complexity: O(V+E) where V is the number of vertices and E is the number of Edges
# Space Complexity: O(n) where n is the number of vertices

def possible_bipartition(dislikes)
  return true if dislikes.empty?
  
  queue = [0]
  first_group = Set[0]
  second_group = Set[]
  
  until queue.empty?
    current = remove_first_from_queue(queue)
    
    until !dislikes[current].empty? || current == (dislikes.length - 1)
      current += 1
    end
    
    dislikes[current].each do |neighbor|
      if first_group.include?(current)
        return false if first_group.include?(neighbor)
        # Avoid adding nodes that have previously been added
        unless second_group.include?(neighbor)
          second_group.add(neighbor)
          queue << neighbor
        end
      else
        return false if second_group.include?(neighbor)
        unless first_group.include?(neighbor)
          first_group.add(neighbor)
          queue << neighbor
        end
      end
      
    end
  end

  return true
end

def remove_first_from_queue(list)
  temp = list[-1]
  list[-1] = list[0]
  list[0] = temp
  
  return list.pop()
end
