local function foo(t, order)
  -- create an array of keys to ensure order
  local keys = {}
  for k in pairs(t) do
    table.insert(keys, k)
  end

  table.sort(keys, order) -- order the keys (optional)

  for _, k in ipairs(keys) do
    local v = t[k]
    if type(v) == "table" then
      foo(v, order) -- recursive call, maintains order
    end
    -- process v here, in consistent order
    print(k, v)
  end
end

local t = {a = 1, b = {c = 2, d = {e = 3}}}
foo(t) -- use default order

-- Example using a custom sorting function
foo(t, function(a,b)
  return a < b 
end) 