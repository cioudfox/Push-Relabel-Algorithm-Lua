array = function(N) local arr = {} for i=1,N do arr[i] = 0 end return arr end 
matrix = function(N) local mt = {} for i=1,N do mt[i] = {} for j=1,N do mt[i][j] = 0 end end return mt end
list = function(N) local lt = {} for i=1,N do lt[i] = (i-1) end return lt end
  
function retofr(C, source, sink)
    local n = #C
    local F = matrix(n)
    local height = array(n)
    
    local excess = array(n)
    local seen = array(n)
    local nodelist = {}

    for i = 1, n do
        if i ~= source and i ~= sink then
            table.insert(nodelist, i)
        end
    end
	
    --local function push(u,v)
    --local function relabel(u)
    --local function discharge(u)
    
    local function push(u, v)
        local send = math.min(excess[u], C[u][v] - F[u][v])
        if send > 0 then
            F[u][v] = F[u][v] + send
            F[v][u] = F[v][u] - send
            excess[u] = excess[u] - send
            excess[v] = excess[v] + send
        end
        
    end

    local function relabel(u)
        local min_height = math.huge
        for v = 1, n do
            if C[u][v] - F[u][v] > 0 then
                min_height = math.min(min_height, height[v])
            end
        end
        if min_height < math.huge then
            height[u] = min_height + 1
        end
    end

    local function discharge(u)
        while excess[u] > 0 do
            if seen[u] < n then
                local v = seen[u] + 1
                seen[u] = v
                if C[u][v] - F[u][v] > 0 and height[u] > height[v] then
                    push(u, v)
                end
            else
                relabel(u)
                seen[u] = 0
            end
        end
    end

    --Initialize the height and source = 0
    height[source] = n
    excess[source] = math.huge
    for v = 1, n do
        push(source, v)
    end

    local p = 1
    while p <= #nodelist do
        local u = nodelist[p]
        local old_height = height[u]
        discharge(u)
        if height[u] > old_height then
            table.remove(nodelist, p)
            table.insert(nodelist, 1, u)
            p = 1
        else
            p = p + 1
        end
    end

    local flow = 0
    for v = 1, n do
        flow = flow + F[source][v]
    end
    return flow
end