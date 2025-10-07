# Push Relabel Algorithm Lua
Implementation of Push Relabel(Goldberg Tarjan) Algorithm in Lua. Runs comparison tests against Ford Fulkerson Algorithms
Project for CPSC 535: Advanced Algorithms

## Description
Push Relabel Algorithm from Goldberg Tarjan implemented in Lua code. Random test samples of max flow graphs are generated and is run in comparison with Ford Fulkerson Algorithms. On paper, push relabel will have a better time complexity than Ford Fulkerson Algorithms with large sample sizes. However, depending on samples, the greedy method of the ford fulkerson algorithms can sometimes win over push-relabel. 

https://github.com/user-attachments/assets/2f8ab3bb-b5a2-4836-a021-7bd8f42f678d

## Implementation of Random Matrix
Matrix values (u,v) = w correspond to a directed flow of w from u to v in a Max Flow Graph
p is a probability value of whether or not a edge will be generated from between vertexes u and v.

![CPSC 535 Push Re-label Algo pptx](https://github.com/user-attachments/assets/5b842d3f-40c3-4346-87be-532fac0409d7)

## Line Graph Results for various test scenarios
![CPSC 535 Push Re-label Algo pptx (1)](https://github.com/user-attachments/assets/69450f99-9d36-44af-9571-9bfaf6bbb90b)

![CPSC 535 Push Re-label Algo pptx (2)](https://github.com/user-attachments/assets/6f8e65ad-ba9e-4a0e-be5f-7171237ca4f4)

![CPSC 535 Push Re-label Algo pptx (3)](https://github.com/user-attachments/assets/54c518aa-3f4e-4f9d-a2f9-bc9d63e12951)

![CPSC 535 Push Re-label Algo pptx (4)](https://github.com/user-attachments/assets/a9b07ed9-e9cb-45a2-b1e2-918cd9b39316)

## Conclusion

![CPSC 535 Push Re-label Algo pptx (5)](https://github.com/user-attachments/assets/7390a22b-9d17-4096-a85b-135b2c3bed20)
