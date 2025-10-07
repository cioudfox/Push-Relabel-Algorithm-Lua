-- Ford–Fulkerson using DFS with input capacity matrix
-- Copied off wikipedia pseudocode
-- Refer to other group
function ffdfs(capacity, source, sink)
  local n = #capacity
  local flow = {}
  for i = 1, n do
    flow[i] = {}
    for j = 1, n do
      flow[i][j] = 0
    end
  end

  -- DFS to find an augmenting path
  local function dfs(u, t, visited, path)
    if u == t then return true end
    visited[u] = true
    for v = 1, n do
      local residual = capacity[u][v] - flow[u][v]
      if not visited[v] and residual > 0 then
        path[v] = u
        if dfs(v, t, visited, path) then return true end
      end
    end
    return false
  end

  local maxFlow = 0
  local path = {}

  while true do
    local visited = {}
    for i = 1, n do visited[i] = false end
    path = {}

    if not dfs(source, sink, visited, path) then break end

    -- Find bottleneck capacity
    local bottleneck = math.huge
    local v = sink
    while v ~= source do
      local u = path[v]
      bottleneck = math.min(bottleneck, capacity[u][v] - flow[u][v])
      v = u
    end

    -- Augment flow
    v = sink
    while v ~= source do
      local u = path[v]
      flow[u][v] = flow[u][v] + bottleneck
      flow[v][u] = flow[v][u] - bottleneck
      v = u
    end

    maxFlow = maxFlow + bottleneck
  end

  return maxFlow
end