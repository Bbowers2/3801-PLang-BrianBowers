function change(amount)
  if math.type(amount) ~= "integer" then
    error("Amount must be an integer")
  end
  if amount < 0 then
    error("Amount cannot be negative")
  end
  local counts, remaining = {}, amount
  for _, denomination in ipairs({25, 10, 5, 1}) do
    counts[denomination] = remaining // denomination
    remaining = remaining % denomination
  end
  return counts
end

-- Write your first then lower case function here
function first_then_lower_case(array, predicate)
  for _, value in ipairs(array) do
    if predicate(value) then return string.lower(value) end
  end
  return nil
end

-- Write your powers generator here
function powers_generator(base, limit)
  return coroutine.create(function ()
    local result = 1
    while result <= limit do
      coroutine.yield(result)
      result = result * base
    end
  end)
end

-- Write your say function here
function say(string)
  if string == nil then return "" end
  local phrase = string
  function closure(string)
    if string == nil then return phrase end
    phrase = phrase .. " " .. string
    return closure
  end
  return closure
end

-- Write your line count function here
function meaningful_line_count(file)
  local f = io.open(file, "r")
  if f == nil then return error("No such file") end
  local count = 0
  for line in f:lines() do
    if line ~= nil then
      for i = 1, #line do
        local char = line:sub(i,i)
        if char == "#" then
          break
        elseif char ~= " " and char ~= "\t" then
          count = count + 1
          break
        end
      end
    end
  end
  f:close()
  return count
end

-- Write your Quaternion table here
Quaternion = {}

quaternionmeta = {
  __index = {
    coefficients = function(self)
      return {self.a, self.b, self.c, self.d}
    end,
    conjugate = function(self)
      return Quaternion.new(self.a, -self.b, -self.c, -self.d)
    end
  },
  __add = function(self, q)
    return Quaternion.new(self.a + q.a, self.b + q.b, self.c + q.c, self.d + q.d)
  end,
  __mul = function(self, q)
    return Quaternion.new(
      self.a*q.a - self.b*q.b - self.c*q.c - self.d*q.d,
      self.b*q.a + self.a*q.b + self.c*q.d - self.d*q.c,
      self.a*q.c - self.b*q.d + self.c*q.a + self.d*q.b,
      self.a*q.d + self.b*q.c - self.c*q.b + self.d*q.a
    )
  end,
  __eq = function(self, q)
    return self.a == q.a and self.b == q.b and self.c == q.c and self.d == q.d
  end,
  __tostring = function(self)
    local str = "0"
    local vars = {"", "i", "j", "k"}
    local values = {self.a, self.b, self.c, self.d}

    for i = 1,4 do
      if values[i] ~= 0 then
        if values[i] == 1 then
          if str == "0" then str = (i == 1 and values[1] or vars[i]) else str = str .. "+" .. vars[i] end
        elseif values[i] == -1 then
          if str == "0" then str = "-" .. (i == 1 and -values[1] or vars[i]) else str = str .. "-" .. vars[i] end
        else
          if str == "0" then
             str = values[i] .. vars[i]
          else str = values[i] < 0 and str .. values[i] .. vars[i] or str .. "+" .. values[i] .. vars[i]
          end
        end
      end
    end
    return str
  end
}
 
Quaternion.new = function(a, b, c, d)
  return setmetatable({a=a, b=b, c=c, d=d}, quaternionmeta)
end