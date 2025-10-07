# Push Relabel Algorithm Lua
Implementation of Push Relabel (Goldberg Tarjan) Algorithm in Lua. Runs comparison tests against Ford Fulkerson Algorithms  
Project for CPSC 535: Advanced Algorithms

## Description
Push Relabel Algorithm from Goldberg Tarjan implemented in Lua code. Random test samples of max flow graphs are generated and run in comparison with Ford Fulkerson Algorithms. On paper, push relabel will have a better time complexity than Ford Fulkerson Algorithms with large sample sizes. However, depending on samples, the greedy method of the Ford Fulkerson algorithms can sometimes win over push-relabel.


https://github.com/user-attachments/assets/2f8ab3bb-b5a2-4836-a021-7bd8f42f678d


## On Paper Time Complexity Analysis
<picture>
  <img alt="Time Complexity Analysis Slide" src="https://github.com/user-attachments/assets/31234aea-afab-4f0f-ba6d-9884c9043d79">
</picture>

## Implementation of Random Matrix
Matrix values (u,v) = w correspond to a directed flow of w from u to v in a Max Flow Graph  
p is a probability value of whether or not an edge will be generated between vertices u and v.

<picture>
  <img alt="Random Matrix Implementation Slide" src="https://github.com/user-attachments/assets/5b842d3f-40c3-4346-87be-532fac0409d7">
</picture>

## Line Graph Results for 6 Vertices, 20 Vertices, 20 Vertices w/ more edges
<picture>
  <img alt="Test Scenario Graph 1" src="https://github.com/user-attachments/assets/69450f99-9d36-44af-9571-9bfaf6bbb90b">
</picture>
<br><br>
<picture>
  <img alt="Test Scenario Graph 2" src="https://github.com/user-attachments/assets/6f8e65ad-ba9e-4a0e-be5f-7171237ca4f4">
</picture>
<br><br>
<picture>
  <img alt="Test Scenario Graph 3" src="https://github.com/user-attachments/assets/54c518aa-3f4e-4f9d-a2f9-bc9d63e12951">
</picture>
<br><br>
<picture>
  <img alt="Test Scenario Graph 4" src="https://github.com/user-attachments/assets/a9b07ed9-e9cb-45a2-b1e2-918cd9b39316">
</picture>

## Conclusion
<picture>
  <img alt="Conclusion Slide" src="https://github.com/user-attachments/assets/7390a22b-9d17-4096-a85b-135b2c3bed20">
</picture>
