package.path = './PRL/?.lua;' .. package.path
require("pushrelabel")
require('edmondkarp')
require('fordfulkerson')
require('func')

function runtest(graphsize, samplesize, runcount, prob)
    --LUA INDEXING ADD 1 
	--Declare amount of samples and runs	
	source = 1

	--Store array to be stored for CSV pretty graphs :D
	prlrtimes = array(samplesize)
	ffdrtimes = array(samplesize)
	ektimes = array(samplesize)

	-- Do stuff. Yay!
    for i = 1, samplesize do
		local size = graphsize
		local sink = size
		--GENERATE Random Flow table w/ p probability to fill vertices 0-500
		local C = genmfgraph(size,prob) 

		--Store values for each sample's run temporary
		local prlarr = array(runcount)
		local ffarr = array(runcount)
		local ekarr = array(runcount)
		
		--Calc RUNTIME PRL n times
		for j = 1, runcount do
			local start = os.clock()
			maxflow1 = retofr(C, source, sink)
			prlarr[j] = (os.clock() - start)
		end
		
		--Calc RUNTIME Ford Fulkerson DFS 
		for k = 1, runcount do
			local start = os.clock()
			maxflow2 = ffdfs(C, source, sink)
			ffarr[k] = (os.clock() - start)
		end
		
		--Calc RUNTIME Edmonds-Karp Algorithm BFS
		for l = 1, runcount do
			local start = os.clock()
			maxflow3 = forFulk(C, source, sink)
			ekarr[l] = (os.clock() - start)
		end
		
		--Calculate runtime averages for this sample case
		prlrtimes[i] = calcavg(prlarr)
		ffdrtimes[i] = calcavg(ffarr)
		ektimes[i] = calcavg(ekarr)
		
		-- ERROR checker
		if(maxflow1 == maxflow2 and maxflow1 == maxflow3) then
			--print("Maxflow for PRL: "..maxflow1)
			--print("Maxflow for ForFulk: "..maxflow2)
			--print("Maxflow for EdmondKarp(ForFulk): "..maxflow2)
		else
			print("ERROR ERROR ERROR ERROR ERROR")
			--break
		end
		
		-- DEBUG sample display
		--[[
		if(i == 44) then
			print(dump(C))
			print("Maxflow for PRL: "..maxflow1)
			print("Maxflow for ForFulk: "..maxflow2)
			print("Maxflow for EdmondKarp(ForFulk): "..maxflow2)
			print(string.format("TEST CASE Push Relabel %.9f seconds", prlrtimes[i] ) )
			print(string.format("TEST CASE Ford Fulkerson %.9f seconds", ffdrtimes[i] ) )
			print(string.format("TEST CASE Edmonds-Karp %.9f seconds", ektimes[i] ) )
		end
		]]--
	end
	
	--Print out Summary of the average runtime of all samples
	print("TEST")
	print(string.format("\nGraph size: %i, Sample Size: %i, Run count: %i  P: 0.%i", graphsize, samplesize, runcount, prob))
	print(string.format("AVG RUNTIME Push Relabel %.9f seconds", calcavg(prlrtimes) ) )
	print(string.format("AVG RUNTIME Ford Fulkerson %.9f seconds", calcavg(ffdrtimes) ) )
	print(string.format("AVG RUNTIME Edmonds-Karp %.9f seconds", calcavg(ektimes) ) )

	--Store data onto dump file before garbage collection
	writeToFile("dump.csv", csvformat(prlrtimes,ffdrtimes,ektimes))
end

--Graph size, Sample size, Run count, edge prob
runtest(6, 1000, 100, 9)
