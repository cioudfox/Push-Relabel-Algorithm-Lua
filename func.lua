-- Simulate library functions I guess
array = function(N) local arr = {} for i=1,N do arr[i] = 0 end return arr end 
matrix = function(N) local mt = {} for i=1,N do mt[i] = {} for j=1,N do mt[i][j] = 0 end end return mt end

-- DEBUG dump for visual aid on matrix
function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .." ".. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
  end
  
  function dumpArray(o)
    if type(o) ~= 'table' then
        return tostring(o)
    end

    local s = '{ '
    for i = 1, #o do
        s = s .. dumpArray(o[i]) .. ', '
    end
    return s .. '}'
end
  
--Calculate Average of array
function calcavg(arr)
    local sum = 0
    local count = (#arr) * 1.0

    for i = 1, count do
        sum = sum + arr[i]
    end
	--print("Summation ".. sum .. " and count ".. count )
    return sum / count
end

--Generates a max flow graph
function genmfgraph(sizee , prob)
  mf = matrix(sizee)
  --Sink Index must be empty as final endpoint. 
  --Cannot flow into itself
  --Sink Index empty since redundant
  for i = 1, #mf-1 do
    for j = 2, #mf do
      if(j ~= i and math.random(10) < prob) then
        mf[i][j] = math.random(0,100000000)
      end
    end
  end
  return mf
end

--Generates string for CSV format for txt
function csvformat(o,p,q)
    if type(o) == 'table' then
       local s = '' 
       for k = 1, #o do
          s = s .. k ..",".. o[k] .. ",".. p[k] .. "," .. q[k] .. '\n'
       end
       return "Sample #,Push-Relabel Algo,Ford Fulkerson Algo,Edmonds Karp Algo\n".. s .. ''
    else
       return tostring(o)
	end
end

--Write to file function
function writeToFile(filename, content)
    mode = "w"  -- default mode is write ("w")
    local file, err = io.open(filename, mode)  -- attempt to open file
    if not file then
        return false, "Error opening file: ".. (err or "unknown error")
    end

    local success, writeErr = pcall(function()
        file:write(content)
    end)

    file:close()  -- always close the file

    if not success then
        return false, "Error writing to file: ".. (writeErr or "unknown error")
    end

    return true
end

--return {csvformat = csvformat, writeToFile = writeToFile}