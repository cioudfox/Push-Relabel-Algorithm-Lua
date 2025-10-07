--Generic BFS node chart 
--Copied off wikipedia pseudocode
--Edmonds-Karp algo
function bfs(capacity, flow, source, sink, parent)
    local visited = {}
    for i = 1, #capacity do visited[i] = false end
    local queue = {}
    table.insert(queue, source)
    visited[source] = true
    parent[source] = -1

    while #queue > 0 do
        local u = table.remove(queue, 1)
        for v = 1, #capacity do
            if not visited[v] and capacity[u][v] - flow[u][v] > 0 then
                table.insert(queue, v)
                visited[v] = true
                parent[v] = u
            end
        end
    end
    return visited[sink]
end

-- Ford-Fulkerson main function
function forFulk(capacity, source, sink)
    local n = #capacity
    local flow = {}
    for i = 1, n do
        flow[i] = {}
        for j = 1, n do
            flow[i][j] = 0
        end
    end

    local parent = {}
    local maxFlow = 0

    while bfs(capacity, flow, source, sink, parent) do
        -- Find minimum residual capacity along the path found
        local pathFlow = math.huge
        local v = sink
        while v ~= source do
            local u = parent[v]
            pathFlow = math.min(pathFlow, capacity[u][v] - flow[u][v])
            v = u
        end

        -- Update flow along the path
        v = sink
        while v ~= source do
            local u = parent[v]
            flow[u][v] = flow[u][v] + pathFlow
            flow[v][u] = flow[v][u] - pathFlow
            v = u
        end

        maxFlow = maxFlow + pathFlow
    end

    return maxFlow
end