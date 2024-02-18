<Project>

<VariablePool>
<Variable>
"MachineA"    "System"      +Visual+      +Shown+       +Plant+       
<File>
"MachineA.vio" 
</File>
</Variable>
<Variable>
"MachineB"    "System"      +Visual+      +Shown+       +Plant+       
<File>
"MachineB.vio" 
</File>
</Variable>
<Variable>
"MachineC"    "System"      +Visual+      +Shown+       +Plant+       
<File>
"MachineC.vio" 
</File>
</Variable>
<Variable>
"BufferAB"    "System"      +Visual+      +Shown+       +Plant+       
<File>
"BufferAB.vio" 
</File>
</Variable>
<Variable>
"BufferBC"    "Generator"   +Visual+      +Shown+       +Plant+       
<File>
"BufferBC.vio" 
</File>
</Variable>
<Variable>
"SigmaABC"    "EventSet"    +Visual+      
<File>
"SigmaABC.vio" 
</File>
</Variable>
<Variable>
"PlantABC"    "System"      +Visual+      
<Value>
<VioSystem>
<Generator>
"PlantABC"    

% 
%  Statistics for PlantABC
% 
%  States:        27
%  Init/Marked:   1/1
%  Events:        12
%  Transitions:   108
%  StateSymbols:  27
%  Attrib. E/S/T: 6/0/0
% 

<Alphabet>
"alpha_a"     +C+           "beta_a"      "mue_a"       "lambda_a"    +C+           
"alpha_b"     +C+           "beta_b"      "mue_b"       "lambda_b"    +C+           
"alpha_c"     +C+           "beta_c"      "mue_c"       "lambda_c"    +C+           
</Alphabet>

<States>
"I|I|I"       "B|I|I"       "I|I|B"       "I|B|I"       "B|B|I"       "I|B|B"       
"I|D|I"       "B|D|I"       "I|D|B"       "B|D|B"       "I|D|D"       "B|D|D"       
"I|I|D"       "B|I|D"       "I|B|D"       "B|B|D"       "D|B|D"       "D|B|I"       
"D|I|D"       "D|D|D"       "D|D|I"       "D|D|B"       "D|I|I"       "D|I|B"       
"D|B|B"       "B|I|B"       "B|B|B"       
</States>

<TransRel>
"I|I|I"       "alpha_a"     "I|I|B"       
"I|I|I"       "alpha_b"     "I|B|I"       
"I|I|I"       "alpha_c"     "B|I|I"       
"B|I|I"       "alpha_a"     "B|I|B"       
"B|I|I"       "alpha_b"     "B|B|I"       
"B|I|I"       "beta_c"      "I|I|I"       
"B|I|I"       "mue_c"       "D|I|I"       
"I|I|B"       "beta_a"      "I|I|I"       
"I|I|B"       "mue_a"       "I|I|D"       
"I|I|B"       "alpha_b"     "I|B|B"       
"I|I|B"       "alpha_c"     "B|I|B"       
"I|B|I"       "alpha_a"     "I|B|B"       
"I|B|I"       "beta_b"      "I|I|I"       
"I|B|I"       "mue_b"       "I|D|I"       
"I|B|I"       "alpha_c"     "B|B|I"       
"B|B|I"       "alpha_a"     "B|B|B"       
"B|B|I"       "beta_b"      "B|I|I"       
"B|B|I"       "mue_b"       "B|D|I"       
"B|B|I"       "beta_c"      "I|B|I"       
"B|B|I"       "mue_c"       "D|B|I"       
"I|B|B"       "beta_a"      "I|B|I"       
"I|B|B"       "mue_a"       "I|B|D"       
"I|B|B"       "beta_b"      "I|I|B"       
"I|B|B"       "mue_b"       "I|D|B"       
"I|B|B"       "alpha_c"     "B|B|B"       
"I|D|I"       "alpha_a"     "I|D|B"       
"I|D|I"       "lambda_b"    "I|I|I"       
"I|D|I"       "alpha_c"     "B|D|I"       
"B|D|I"       "alpha_a"     "B|D|B"       
"B|D|I"       "lambda_b"    "B|I|I"       
"B|D|I"       "beta_c"      "I|D|I"       
"B|D|I"       "mue_c"       "D|D|I"       
"I|D|B"       "beta_a"      "I|D|I"       
"I|D|B"       "mue_a"       "I|D|D"       
"I|D|B"       "lambda_b"    "I|I|B"       
"I|D|B"       "alpha_c"     "B|D|B"       
"B|D|B"       "beta_a"      "B|D|I"       
"B|D|B"       "mue_a"       "B|D|D"       
"B|D|B"       "lambda_b"    "B|I|B"       
"B|D|B"       "beta_c"      "I|D|B"       
"B|D|B"       "mue_c"       "D|D|B"       
"I|D|D"       "lambda_a"    "I|D|I"       
"I|D|D"       "lambda_b"    "I|I|D"       
"I|D|D"       "alpha_c"     "B|D|D"       
"B|D|D"       "lambda_a"    "B|D|I"       
"B|D|D"       "lambda_b"    "B|I|D"       
"B|D|D"       "beta_c"      "I|D|D"       
"B|D|D"       "mue_c"       "D|D|D"       
"I|I|D"       "lambda_a"    "I|I|I"       
"I|I|D"       "alpha_b"     "I|B|D"       
"I|I|D"       "alpha_c"     "B|I|D"       
"B|I|D"       "lambda_a"    "B|I|I"       
"B|I|D"       "alpha_b"     "B|B|D"       
"B|I|D"       "beta_c"      "I|I|D"       
"B|I|D"       "mue_c"       "D|I|D"       
"I|B|D"       "lambda_a"    "I|B|I"       
"I|B|D"       "beta_b"      "I|I|D"       
"I|B|D"       "mue_b"       "I|D|D"       
"I|B|D"       "alpha_c"     "B|B|D"       
"B|B|D"       "lambda_a"    "B|B|I"       
"B|B|D"       "beta_b"      "B|I|D"       
"B|B|D"       "mue_b"       "B|D|D"       
"B|B|D"       "beta_c"      "I|B|D"       
"B|B|D"       "mue_c"       "D|B|D"       
"D|B|D"       "lambda_a"    "D|B|I"       
"D|B|D"       "beta_b"      "D|I|D"       
"D|B|D"       "mue_b"       "D|D|D"       
"D|B|D"       "lambda_c"    "I|B|D"       
"D|B|I"       "alpha_a"     "D|B|B"       
"D|B|I"       "beta_b"      "D|I|I"       
"D|B|I"       "mue_b"       "D|D|I"       
"D|B|I"       "lambda_c"    "I|B|I"       
"D|I|D"       "lambda_a"    "D|I|I"       
"D|I|D"       "alpha_b"     "D|B|D"       
"D|I|D"       "lambda_c"    "I|I|D"       
"D|D|D"       "lambda_a"    "D|D|I"       
"D|D|D"       "lambda_b"    "D|I|D"       
"D|D|D"       "lambda_c"    "I|D|D"       
"D|D|I"       "alpha_a"     "D|D|B"       
"D|D|I"       "lambda_b"    "D|I|I"       
"D|D|I"       "lambda_c"    "I|D|I"       
"D|D|B"       "beta_a"      "D|D|I"       
"D|D|B"       "mue_a"       "D|D|D"       
"D|D|B"       "lambda_b"    "D|I|B"       
"D|D|B"       "lambda_c"    "I|D|B"       
"D|I|I"       "alpha_a"     "D|I|B"       
"D|I|I"       "alpha_b"     "D|B|I"       
"D|I|I"       "lambda_c"    "I|I|I"       
"D|I|B"       "beta_a"      "D|I|I"       
"D|I|B"       "mue_a"       "D|I|D"       
"D|I|B"       "alpha_b"     "D|B|B"       
"D|I|B"       "lambda_c"    "I|I|B"       
"D|B|B"       "beta_a"      "D|B|I"       
"D|B|B"       "mue_a"       "D|B|D"       
"D|B|B"       "beta_b"      "D|I|B"       
"D|B|B"       "mue_b"       "D|D|B"       
"D|B|B"       "lambda_c"    "I|B|B"       
"B|I|B"       "beta_a"      "B|I|I"       
"B|I|B"       "mue_a"       "B|I|D"       
"B|I|B"       "alpha_b"     "B|B|B"       
"B|I|B"       "beta_c"      "I|I|B"       
"B|I|B"       "mue_c"       "D|I|B"       
"B|B|B"       "beta_a"      "B|B|I"       
"B|B|B"       "mue_a"       "B|B|D"       
"B|B|B"       "beta_b"      "B|I|B"       
"B|B|B"       "mue_b"       "B|D|B"       
"B|B|B"       "beta_c"      "I|B|B"       
"B|B|B"       "mue_c"       "D|B|B"       
</TransRel>

<InitStates>
"I|I|I"       
</InitStates>

<MarkedStates>
"I|I|I"       
</MarkedStates>


</Generator>
<VioModels>
<TransitionList>
=AAAAbAEAAAABAAAADgBhAGwAcABoAGEAXwBhAAAAAwEAAAABAAAADgBhAGwAcABoAGEAXwBiAAAABAEAAAABAAAADgBhAGwAcABoAGEAXwBjAAAAAgEAAAACAAAADgBhAGwAcABoAGEAXwBhAAAAGgEAAAACAAAADgBhAGwAcABoAGEAXwBiAAAABQEAAAACAAAADABiAGUAdABhAF8AYwAAAAEBAAAAAgAAAAoAbQB1AGUAXwBjAAAAFwEAAAADAAAADABiAGUAdABhAF8AYQAAAAEBAAAAAwAAAAoAbQB1AGUAXwBhAAAADQEAAAADAAAADgBhAGwAcABoAGEAXwBiAAAABgEAAAADAAAADgBhAGwAcABoAGEAXwBjAAAAGgEAAAAEAAAADgBhAGwAcABoAGEAXwBhAAAABgEAAAAEAAAADABiAGUAdABhAF8AYgAAAAEBAAAABAAAAAoAbQB1AGUAXwBiAAAABwEAAAAEAAAADgBhAGwAcABoAGEAXwBjAAAABQEAAAAFAAAADgBhAGwAcABoAGEAXwBhAAAAGwEAAAAFAAAADABiAGUAdABhAF8AYgAAAAIBAAAABQAAAAoAbQB1AGUAXwBiAAAACAEAAAAFAAAADABiAGUAdABhAF8AYwAAAAQBAAAABQAAAAoAbQB1AGUAXwBjAAAAEgEAAAAGAAAADABiAGUAdABhAF8AYQAAAAQBAAAABgAAAAoAbQB1AGUAXwBhAAAADwEAAAAGAAAADABiAGUAdABhAF8AYgAAAAMBAAAABgAAAAoAbQB1AGUAXwBiAAAACQEAAAAGAAAADgBhAGwAcABoAGEAXwBjAAAAGwEAAAAHAAAADgBhAGwAcABoAGEAXwBhAAAACQEAAAAHAAAAEABsAGEAbQBiAGQAYQBfAGIAAAABAQAAAAcAAAAOAGEAbABwAGgAYQBfAGMAAAAIAQAAAAgAAAAOAGEAbABwAGgAYQBfAGEAAAAKAQAAAAgAAAAQAGwAYQBtAGIAZABhAF8AYgAAAAIBAAAACAAAAAwAYgBlAHQAYQBfAGMAAAAHAQAAAAgAAAAKAG0AdQBlAF8AYwAAABUBAAAACQAAAAwAYgBlAHQAYQBfAGEAAAAHAQAAAAkAAAAKAG0AdQBlAF8AYQAAAAsBAAAACQAAABAAbABhAG0AYgBkAGEAXwBiAAAA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= </TransitionList>
<StateList>
=AAAAGwIAAAABAgAAAAICAAAAAwIAAAAEAgAAAAUCAAAABgIAAAAHAgAAAAgCAAAACQIAAAAKAgAAAAsCAAAADAIAAAANAgAAAA4CAAAADwIAAAAQAgAAABECAAAAEgIAAAATAgAAABQCAAAAFQIAAAAWAgAAABcCAAAAGAIAAAAZAgAAABoCAAAAGw=== </StateList>
<EventList>
=AAAADAMAAAAOAGEAbABwAGgAYQBfAGEDAAAADABiAGUAdABhAF8AYQMAAAAKAG0AdQBlAF8AYQMAAAAQAGwAYQBtAGIAZABhAF8AYQMAAAAOAGEAbABwAGgAYQBfAGIDAAAADABiAGUAdABhAF8AYgMAAAAKAG0AdQBlAF8AYgMAAAAQAGwAYQBtAGIAZABhAF8AYgMAAAAOAGEAbABwAGgAYQBfAGMDAAAADABiAGUAdABhAF8AYwMAAAAKAG0AdQBlAF8AYwMAAAAQAGwAYQBtAGIAZABhAF8AYw=== </EventList>
<GraphData>
<States>
</States>
<TransRel>
</TransRel>
</GraphData>
</VioModels>
<VioLayout>
0             =AgAAAGVtAABwPDEIwIc6CAAAAgABAAAAGQAAAFggKwgAAA=== 1             150           100           1             
</VioLayout>
</VioSystem>
</Value>
</Variable>
<Variable>
"BufferABC"   "System"      +Visual+      
<Value>
<VioSystem>
<Generator>
"BufferABC"   

% 
%  Statistics for BufferABC
% 
%  States:        4
%  Init/Marked:   1/1
%  Events:        4
%  Transitions:   8
%  StateSymbols:  4
%  Attrib. E/S/T: 0/0/0
% 

<Alphabet>
"beta_a"      "alpha_b"     "beta_b"      "alpha_c"     
</Alphabet>

<States>
"E|E"         "F|E"         "E|F"         "F|F"         
</States>

<TransRel>
"E|E"         "beta_a"      "F|E"         
"E|E"         "beta_b"      "E|F"         
"F|E"         "alpha_b"     "E|E"         
"F|E"         "beta_b"      "F|F"         
"E|F"         "beta_a"      "F|F"         
"E|F"         "alpha_c"     "E|E"         
"F|F"         "alpha_b"     "E|F"         
"F|F"         "alpha_c"     "F|E"         
</TransRel>

<InitStates>
"E|E"         
</InitStates>

<MarkedStates>
"E|E"         
</MarkedStates>


</Generator>
<VioModels>
<TransitionList>
=AAAACAEAAAABAAAADABiAGUAdABhAF8AYQAAAAIBAAAAAQAAAAwAYgBlAHQAYQBfAGIAAAADAQAAAAIAAAAOAGEAbABwAGgAYQBfAGIAAAABAQAAAAIAAAAMAGIAZQB0AGEAXwBiAAAABAEAAAADAAAADABiAGUAdABhAF8AYQAAAAQBAAAAAwAAAA4AYQBsAHAAaABhAF8AYwAAAAEBAAAABAAAAA4AYQBsAHAAaABhAF8AYgAAAAMBAAAABAAAAA4AYQBsAHAAaABhAF8AYwAAAAI== </TransitionList>
<StateList>
=AAAABAIAAAABAgAAAAICAAAAAwIAAAAE= </StateList>
<EventList>
=AAAABAMAAAAMAGIAZQB0AGEAXwBhAwAAAA4AYQBsAHAAaABhAF8AYgMAAAAMAGIAZQB0AGEAXwBiAwAAAA4AYQBsAHAAaABhAF8AYw=== </EventList>
<GraphData>
<States>
<State>
1             
<Item>
<Position>
0             40            
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999628    0             
</BasePoints>
</Item>
</State>
<State>
2             
<Item>
<Position>
100           40            
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999628    0             
</BasePoints>
</Item>
</State>
<State>
3             
<Item>
<Position>
200           40            
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999628    0             
</BasePoints>
</Item>
</State>
<State>
4             
<Item>
<Position>
0             120           
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999628    0             
</BasePoints>
</Item>
</State>
</States>
<TransRel>
<Trans>
1             "beta_a"      2             +Line+        
<Item>
<Position>
0             40            
</Position>
<BasePoints>
50            10            0             0             30.028953     0             
43.209961     0             56.390625     0             69.971047     0             
100           0             
</BasePoints>
</Item>
</Trans>
<Trans>
1             "beta_b"      3             +Line+        
<Item>
<Position>
0             40            
</Position>
<BasePoints>
100           10            0             0             29.980126     0             
76.193359     0             122.406250    0             170.019874    0             
200           0             
</BasePoints>
</Item>
</Trans>
<Trans>
2             "alpha_b"     1             +Line+        
<Item>
<Position>
100           40            
</Position>
<BasePoints>
-50           -10           0             0             -30.028953    0             
-43.209961    0             -56.390625    0             -69.971047    0             
-100          0             
</BasePoints>
</Item>
</Trans>
<Trans>
2             "beta_b"      4             +Line+        
<Item>
<Position>
100           40            
</Position>
<BasePoints>
-56.246950    32.191312     0             0             -23.456992    18.765593     
-40.952148    32.761719     -58.515625    46.812500     -76.543008    61.234407     
-100          80            
</BasePoints>
</Item>
</Trans>
<Trans>
3             "beta_a"      4             +Line+        
<Item>
<Position>
200           40            
</Position>
<BasePoints>
-103.713907   30.715233     0             0             -27.913330    11.165332     
-75.462891    30.185156     -123.093750   49.237500     -172.086670   68.834668     
-200          80            
</BasePoints>
</Item>
</Trans>
<Trans>
3             "alpha_c"     1             +Line+        
<Item>
<Position>
200           40            
</Position>
<BasePoints>
-100          -10           0             0             -29.980126    0             
-76.193359    0             -122.406250   0             -170.019874   0             
-200          0             
</BasePoints>
</Item>
</Trans>
<Trans>
4             "alpha_b"     3             +Line+        
<Item>
<Position>
0             120           
</Position>
<BasePoints>
103.713907    -30.715233    0             0             27.913330     -11.165332    
75.462891     -30.185156    123.093750    -49.237500    172.086670    -68.834668    
200           -80           
</BasePoints>
</Item>
</Trans>
<Trans>
4             "alpha_c"     2             +Line+        
<Item>
<Position>
0             120           
</Position>
<BasePoints>
56.246950     -32.191312    0             0             23.456992     -18.765593    
40.952148     -32.761719    58.515625     -46.812500    76.543008     -61.234407    
100           -80           
</BasePoints>
</Item>
</Trans>
</TransRel>
</GraphData>
</VioModels>
<VioLayout>
0             == 0             150           150           1             
</VioLayout>
</VioSystem>
</Value>
</Variable>
<Variable>
"FullBufferABC" "Generator"   +Visual+      
<Value>
<VioGenerator>
<Generator>
"FullBufferABC" 

% 
%  Statistics for FullBufferABC
% 
%  States:        4
%  Init/Marked:   1/1
%  Events:        12
%  Transitions:   40
%  StateSymbols:  4
%  Attrib. E/S/T: 0/0/0
% 

<Alphabet>
"alpha_a"     "beta_a"      "mue_a"       "lambda_a"    "alpha_b"     "beta_b"      
"mue_b"       "lambda_b"    "alpha_c"     "beta_c"      "mue_c"       "lambda_c"    
</Alphabet>

<States>
"E|E"         "F|E"         "E|F"         "F|F"         
</States>

<TransRel>
"E|E"         "alpha_a"     "E|E"         
"E|E"         "beta_a"      "F|E"         
"E|E"         "mue_a"       "E|E"         
"E|E"         "lambda_a"    "E|E"         
"E|E"         "beta_b"      "E|F"         
"E|E"         "mue_b"       "E|E"         
"E|E"         "lambda_b"    "E|E"         
"E|E"         "beta_c"      "E|E"         
"E|E"         "mue_c"       "E|E"         
"E|E"         "lambda_c"    "E|E"         
"F|E"         "alpha_a"     "F|E"         
"F|E"         "mue_a"       "F|E"         
"F|E"         "lambda_a"    "F|E"         
"F|E"         "alpha_b"     "E|E"         
"F|E"         "beta_b"      "F|F"         
"F|E"         "mue_b"       "F|E"         
"F|E"         "lambda_b"    "F|E"         
"F|E"         "beta_c"      "F|E"         
"F|E"         "mue_c"       "F|E"         
"F|E"         "lambda_c"    "F|E"         
"E|F"         "alpha_a"     "E|F"         
"E|F"         "beta_a"      "F|F"         
"E|F"         "mue_a"       "E|F"         
"E|F"         "lambda_a"    "E|F"         
"E|F"         "mue_b"       "E|F"         
"E|F"         "lambda_b"    "E|F"         
"E|F"         "alpha_c"     "E|E"         
"E|F"         "beta_c"      "E|F"         
"E|F"         "mue_c"       "E|F"         
"E|F"         "lambda_c"    "E|F"         
"F|F"         "alpha_a"     "F|F"         
"F|F"         "mue_a"       "F|F"         
"F|F"         "lambda_a"    "F|F"         
"F|F"         "alpha_b"     "E|F"         
"F|F"         "mue_b"       "F|F"         
"F|F"         "lambda_b"    "F|F"         
"F|F"         "alpha_c"     "F|E"         
"F|F"         "beta_c"      "F|F"         
"F|F"         "mue_c"       "F|F"         
"F|F"         "lambda_c"    "F|F"         
</TransRel>

<InitStates>
"E|E"         
</InitStates>

<MarkedStates>
"E|E"         
</MarkedStates>


</Generator>
<VioModels>
<TransitionList>
=AAAAKAEAAAABAAAADgBhAGwAcABoAGEAXwBhAAAAAQEAAAABAAAADABiAGUAdABhAF8AYQAAAAIBAAAAAQAAAAoAbQB1AGUAXwBhAAAAAQEAAAABAAAAEABsAGEAbQBiAGQAYQBfAGEAAAABAQAAAAEAAAAMAGIAZQB0AGEAXwBiAAAAAwEAAAABAAAACgBtAHUAZQBfAGIAAAABAQAAAAEAAAAQAGwAYQBtAGIAZABhAF8AYgAAAAEBAAAAAQAAAAwAYgBlAHQAYQBfAGMAAAABAQAAAAEAAAAKAG0AdQBlAF8AYwAAAAEBAAAAAQAAABAAbABhAG0AYgBkAGEAXwBjAAAAAQEAAAACAAAADgBhAGwAcABoAGEAXwBhAAAAAgEAAAACAAAACgBtAHUAZQBfAGEAAAACAQAAAAIAAAAQAGwAYQBtAGIAZABhAF8AYQAAAAIBAAAAAgAAAA4AYQBsAHAAaABhAF8AYgAAAAEBAAAAAgAAAAwAYgBlAHQAYQBfAGIAAAAEAQAAAAIAAAAKAG0AdQBlAF8AYgAAAAIBAAAAAgAAABAAbABhAG0AYgBkAGEAXwBiAAAAAgEAAAACAAAADABiAGUAdABhAF8AYwAAAAIBAAAAAgAAAAoAbQB1AGUAXwBjAAAAAgEAAAACAAAAEABsAGEAbQBiAGQAYQBfAGMAAAACAQAAAAMAAAAOAGEAbABwAGgAYQBfAGEAAAADAQAAAAMAAAAMAGIAZQB0AGEAXwBhAAAABAEAAAADAAAACgBtAHUAZQBfAGEAAAADAQAAAAMAAAAQAGwAYQBtAGIAZABhAF8AYQAAAAMBAAAAAwAAAAoAbQB1AGUAXwBiAAAAAwEAAAADAAAAEABsAGEAbQBiAGQAYQBfAGIAAAADAQAAAAMAAAAOAGEAbABwAGgAYQBfAGMAAAABAQAAAAMAAAAMAGIAZQB0AGEAXwBjAAAAAwEAAAADAAAACgBtAHUAZQBfAGMAAAADAQAAAAMAAAAQAGwAYQBtAGIAZABhAF8AYwAAAAMBAAAABAAAAA4AYQBsAHAAaABhAF8AYQAAAAQBAAAABAAAAAoAbQB1AGUAXwBhAAAABAEAAAAEAAAAEABsAGEAbQBiAGQAYQBfAGEAAAAEAQAAAAQAAAAOAGEAbABwAGgAYQBfAGIAAAADAQAAAAQAAAAKAG0AdQBlAF8AYgAAAAQBAAAABAAAABAAbABhAG0AYgBkAGEAXwBiAAAABAEAAAAEAAAADgBhAGwAcABoAGEAXwBjAAAAAgEAAAAEAAAADABiAGUAdABhAF8AYwAAAAQBAAAABAAAAAoAbQB1AGUAXwBjAAAABAEAAAAEAAAAEABsAGEAbQBiAGQAYQBfAGMAAAAE= </TransitionList>
<StateList>
=AAAABAIAAAABAgAAAAICAAAAAwIAAAAE= </StateList>
<EventList>
=AAAADAMAAAAOAGEAbABwAGgAYQBfAGEDAAAADABiAGUAdABhAF8AYQMAAAAKAG0AdQBlAF8AYQMAAAAQAGwAYQBtAGIAZABhAF8AYQMAAAAOAGEAbABwAGgAYQBfAGIDAAAADABiAGUAdABhAF8AYgMAAAAKAG0AdQBlAF8AYgMAAAAQAGwAYQBtAGIAZABhAF8AYgMAAAAOAGEAbABwAGgAYQBfAGMDAAAADABiAGUAdABhAF8AYwMAAAAKAG0AdQBlAF8AYwMAAAAQAGwAYQBtAGIAZABhAF8AYw=== </EventList>
<GraphData>
<States>
</States>
<TransRel>
</TransRel>
</GraphData>
</VioModels>
<VioLayout>
0             == 0             150           150           1             
</VioLayout>
</VioGenerator>
</Value>
</Variable>
<Variable>
"SuperABC"    "Generator"   +Visual+      +Shown+       +Supervisor+  
<Value>
<VioGenerator>
<Generator>
"SuperABC [minstate]" 

% 
%  Statistics for SuperABC [minstate]
% 
%  States:        48
%  Init/Marked:   1/1
%  Events:        12
%  Transitions:   139
%  StateSymbols:  0
%  Attrib. E/S/T: 0/0/0
% 

<Alphabet>
"alpha_a"     "beta_a"      "mue_a"       "lambda_a"    "alpha_b"     "beta_b"      
"mue_b"       "lambda_b"    "alpha_c"     "beta_c"      "mue_c"       "lambda_c"    
</Alphabet>

<States>
<Consecutive>
1             48            
</Consecutive>
</States>

<TransRel>
2             "alpha_a"     3             
2             "beta_b"      15            
2             "mue_b"       7             
2             "beta_c"      33            
2             "mue_c"       19            
1             "alpha_a"     41            
3             "beta_a"      6             
3             "mue_a"       4             
3             "beta_b"      45            
3             "mue_b"       8             
3             "beta_c"      34            
3             "mue_c"       20            
4             "lambda_a"    2             
4             "beta_b"      17            
4             "mue_b"       9             
4             "beta_c"      35            
4             "mue_c"       21            
5             "alpha_b"     2             
5             "beta_c"      36            
5             "mue_c"       22            
6             "beta_b"      18            
6             "mue_b"       10            
6             "beta_c"      37            
6             "mue_c"       23            
7             "alpha_a"     8             
7             "lambda_b"    28            
7             "beta_c"      43            
7             "mue_c"       24            
8             "beta_a"      10            
8             "mue_a"       9             
8             "lambda_b"    16            
8             "beta_c"      38            
8             "mue_c"       25            
9             "lambda_a"    7             
9             "lambda_b"    47            
9             "beta_c"      39            
9             "mue_c"       26            
10            "lambda_b"    5             
10            "beta_c"      40            
10            "mue_c"       27            
11            "alpha_a"     12            
11            "alpha_c"     28            
12            "beta_a"      14            
12            "mue_a"       13            
12            "alpha_c"     16            
13            "lambda_a"    11            
13            "alpha_c"     47            
14            "alpha_c"     5             
15            "alpha_a"     45            
15            "beta_c"      11            
15            "mue_c"       32            
16            "beta_a"      5             
16            "mue_a"       47            
16            "beta_c"      41            
16            "mue_c"       46            
17            "lambda_a"    15            
17            "beta_c"      13            
17            "mue_c"       30            
18            "beta_c"      14            
18            "mue_c"       31            
19            "alpha_a"     20            
19            "beta_b"      32            
19            "mue_b"       24            
19            "lambda_c"    33            
20            "beta_a"      23            
20            "mue_a"       21            
20            "beta_b"      29            
20            "mue_b"       25            
20            "lambda_c"    34            
21            "lambda_a"    19            
21            "beta_b"      30            
21            "mue_b"       26            
21            "lambda_c"    35            
22            "alpha_b"     19            
22            "lambda_c"    36            
23            "beta_b"      31            
23            "mue_b"       27            
23            "lambda_c"    37            
24            "alpha_a"     25            
24            "lambda_b"    44            
24            "lambda_c"    43            
25            "beta_a"      27            
25            "mue_a"       26            
25            "lambda_b"    46            
25            "lambda_c"    38            
26            "lambda_a"    24            
26            "lambda_b"    48            
26            "lambda_c"    39            
27            "lambda_b"    22            
27            "lambda_c"    40            
28            "alpha_a"     16            
28            "beta_c"      1             
28            "mue_c"       44            
29            "beta_a"      31            
29            "mue_a"       30            
29            "lambda_c"    12            
30            "lambda_a"    32            
30            "lambda_c"    13            
31            "lambda_c"    14            
32            "alpha_a"     29            
32            "lambda_c"    11            
33            "alpha_a"     34            
33            "beta_b"      11            
33            "mue_b"       43            
34            "beta_a"      37            
34            "mue_a"       35            
34            "beta_b"      12            
34            "mue_b"       38            
35            "lambda_a"    33            
35            "beta_b"      13            
35            "mue_b"       39            
36            "alpha_b"     33            
37            "beta_b"      14            
37            "mue_b"       40            
38            "beta_a"      40            
38            "mue_a"       39            
38            "lambda_b"    41            
39            "lambda_a"    43            
39            "lambda_b"    42            
40            "lambda_b"    36            
41            "beta_a"      36            
41            "mue_a"       42            
42            "lambda_a"    1             
43            "alpha_a"     38            
43            "lambda_b"    1             
44            "alpha_a"     46            
44            "lambda_c"    1             
45            "beta_a"      18            
45            "mue_a"       17            
45            "beta_c"      12            
45            "mue_c"       29            
46            "beta_a"      22            
46            "mue_a"       48            
46            "lambda_c"    41            
47            "lambda_a"    28            
47            "beta_c"      42            
47            "mue_c"       48            
48            "lambda_a"    44            
48            "lambda_c"    42            
</TransRel>

<InitStates>
1             
</InitStates>

<MarkedStates>
1             
</MarkedStates>


</Generator>
<VioModels>
<TransitionList>
=AAAAiwEAAAAEAAAAEABsAGEAbQBiAGQAYQBfAGEAAAABAQAAABMAAAAOAGEAbABwAGgAYQBfAGEAAAAUAQAAACEAAAAOAGEAbABwAGgAYQBfAGEAAAAiAQAAAAEAAAAOAGEAbABwAGgAYQBfAGEAAAADAQAAAAEAAAAMAGIAZQB0AGEAXwBiAAAADwEAAAABAAAACgBtAHUAZQBfAGIAAAAHAQAAAAEAAAAMAGIAZQB0AGEAXwBjAAAAIQEAAAABAAAACgBtAHUAZQBfAGMAAAATAQAAAAIAAAAOAGEAbABwAGgAYQBfAGEAAAApAQAAAAMAAAAMAGIAZQB0AGEAXwBhAAAABgEAAAADAAAACgBtAHUAZQBfAGEAAAAEAQAAAAMAAAAMAGIAZQB0AGEAXwBiAAAALQEAAAADAAAACgBtAHUAZQBfAGIAAAAIAQAAAAMAAAAMAGIAZQB0AGEAXwBjAAAAIgEAAAADAAAACgBtAHUAZQBfAGMAAAAUAQAAAAQAAAAMAGIAZQB0AGEAXwBiAAAAEQEAAAAEAAAACgBtAHUAZQBfAGIAAAAJAQAAAAQAAAAMAGIAZQB0AGEAXwBjAAAAIwEAAAAEAAAACgBtAHUAZQBfAGMAAAAVAQAAAAUAAAAOAGEAbABwAGgAYQBfAGIAAAABAQAAAAUAAAAMAGIAZQB0AGEAXwBjAAAAJAEAAAAFAAAACgBtAHUAZQBfAGMAAAAWAQAAAAYAAAAMAGIAZQB0AGEAXwBiAAAAEgEAAAAGAAAACgBtAHUAZQBfAGIAAAAKAQAAAAYAAAAMAGIAZQB0AGEAXwBjAAAAJQEAAAAGAAAACgBtAHUAZQBfAGMAAAAXAQAAAAcAAAAOAGEAbABwAGgAYQBfAGEAAAAIAQAAAAcAAAAQAGwAYQBtAGIAZABhAF8AYgAAABwBAAAABwAAAAwAYgBlAHQAYQBfAGMAAAArAQAAAAcAAAAKAG0AdQBlAF8AYwAAABgBAAAACAAAAAwAYgBlAHQAYQBfAGEAAAAKAQAAAAgAAAAKAG0AdQBlAF8AYQAAAAkBAAAACAAAABAAbABhAG0AYgBkAGEAXwBiAAAAEAEAAAAIAAAADABiAGUAdABhAF8AYwAAACYBAAAACAAAAAoAbQB1AGUAXwBjAAAAGQEAAAAJAAAAEABsAGEAbQBiAGQAYQBfAGEAAAAHAQAAAAkAAAAQAGwAYQBtAGIAZABhAF8AYgAAAC8BAAAACQAAAAwAYgBlAHQAYQBfAGMAAAAnAQAAAAkAAAAKAG0AdQBlAF8AYwAAABoBAAAACgAAABAAbABhAG0AYgBkAGEAXwBiAAAABQEAAAAKAAAADABiAGUAdABhAF8AYwAAACgBAAAACgAAAAoAbQB1AGUAXwBjAAAAGwEAAAALAAAADgBhAGwAcABoAGEAXwBhAAAADAEAAAALAAAADgBhAGwAcABoAGEAXwBjAAAAHAEAAAAMAAAADABiAGUAdABhAF8AYQAAAA4BAAAADAAAAAoAbQB1AGUAXwBhAAAADQEAAAAMAAAADgBhAGwAcABoAGEAXwBjAAAAEAEAAAANAAAAEABsAGEAbQBiAGQAYQBfAGEAAAALAQAAAA0AAAAOAGEAbABwAGgAYQBfAGMAAAAvAQAAAA4AAAAOAGEAbABwAGgAYQBfAGMAAAAFAQAAAA8AAAAOAGEAbABwAGgAYQBfAGEAAAAtAQAAAA8AAAAMAGIAZQB0AGEAXwBjAAAACwEAAAAPAAAACgBtAHUAZQBfAGMAAAAgAQAAABAAAAAMAGIAZQB0AGEAXwBhAAAABQEAAAAQAAAACgBtAHUAZQBfAGEAAAAvAQAAABAAAAAMAGIAZQB0AGEAXwBjAAAAKQEAAAAQAAAACgBtAHUAZQBfAGMAAAAuAQAAABEAAAAQAGwAYQBtAGIAZABhAF8AYQAAAA8BAAAAEQAAAAwAYgBlAHQAYQBfAGMAAAANAQAAABEAAAAKAG0AdQBlAF8AYwAAAB4BAAAAEgAAAAwAYgBlAHQAYQBfAGMAAAAOAQAAABIAAAAKAG0AdQBlAF8AYwAAAB8BAAAAEwAAAAwAYgBlAHQAYQBfAGIAAAAgAQAAABMAAAAKAG0AdQBlAF8AYgAAABgBAAAAEwAAABAAbABhAG0AYgBkAGEAXwBjAAAAIQEAAAAUAAAADABiAGUAdABhAF8AYQAAABcBAAAAFAAAAAoAbQB1AGUAXwBhAAAAFQEAAAAUAAAADABiAGUAdABhAF8AYgAAAB0BAAAAFAAAAAoAbQB1AGUAXwBiAAAAGQEAAAAUAAAAEABsAGEAbQBiAGQAYQBfAGMAAAAiAQAAABUAAAAQAGwAYQBtAGIAZABhAF8AYQAAABMBAAAAFQAAAAwAYgBlAHQAYQBfAGIAAAAeAQAAABUAAAAKAG0AdQBlAF8AYgAAABoBAAAAFQAAABAAbABhAG0AYgBkAGEAXwBjAAAAIwEAAAAWAAAADgBhAGwAcABoAGEAXwBiAAAAEwEAAAAWAAAAEABsAGEAbQBiAGQAYQBfAGMAAAAkAQAAABcAAAAMAGIAZQB0AGEAXwBiAAAAHwEAAAAXAAAACgBtAHUAZQBfAGIAAAAbAQAAABcAAAAQAGwAYQBtAGIAZABhAF8AYwAAACUBAAAAGAAAAA4AYQBsAHAAaABhAF8AYQAAABkBAAAAGAAAABAAbABhAG0AYgBkAGEAXwBiAAAALAEAAAAYAAAAEABsAGEAbQBiAGQAYQBfAGMAAAArAQAAABkAAAAMAGIAZQB0AGEAXwBhAAAAGwEAAAAZAAAACgBtAHUAZQBfAGEAAAAaAQAAABkAAAAQAGwAYQBtAGIAZABhAF8AYgAAAC4BAAAAGQAAABAAbABhAG0AYgBkAGEAXwBjAAAAJgEAAAAaAAAAEABsAGEAbQBiAGQAYQBfAGEAAAAYAQAAABoAAAAQAGwAYQBtAGIAZABhAF8AYgAAADABAAAAGgAAABAAbABhAG0AYgBkAGEAXwBjAAAAJwEAAAAbAAAAEABsAGEAbQBiAGQAYQBfAGIAAAAWAQAAABsAAAAQAGwAYQBtAGIAZABhAF8AYwAAACgBAAAAHAAAAA4AYQBsAHAAaABhAF8AYQAAABABAAAAHAAAAAwAYgBlAHQAYQBfAGMAAAACAQAAABwAAAAKAG0AdQBlAF8AYwAAACwBAAAAHQAAAAwAYgBlAHQAYQBfAGEAAAAfAQAAAB0AAAAKAG0AdQBlAF8AYQAAAB4BAAAAHQAAABAAbABhAG0AYgBkAGEAXwBjAAAADAEAAAAeAAAAEABsAGEAbQBiAGQAYQBfAGEAAAAgAQAAAB4AAAAQAGwAYQBtAGIAZABhAF8AYwAAAA0BAAAAHwAAABAAbABhAG0AYgBkAGEAXwBjAAAADgEAAAAgAAAADgBhAGwAcABoAGEAXwBhAAAAHQEAAAAgAAAAEABsAGEAbQBiAGQAYQBfAGMAAAALAQAAACEAAAAMAGIAZQB0AGEAXwBiAAAACwEAAAAhAAAACgBtAHUAZQBfAGIAAAArAQAAACIAAAAMAGIAZQB0AGEAXwBhAAAAJQEAAAAiAAAACgBtAHUAZQBfAGEAAAAjAQAAACIAAAAMAGIAZQB0AGEAXwBiAAAADAEAAAAiAAAACgBtAHUAZQBfAGIAAAAmAQAAACMAAAAQAGwAYQBtAGIAZABhAF8AYQAAACEBAAAAIwAAAAwAYgBlAHQAYQBfAGIAAAANAQAAACMAAAAKAG0AdQBlAF8AYgAAACcBAAAAJAAAAA4AYQBsAHAAaABhAF8AYgAAACEBAAAAJQAAAAwAYgBlAHQAYQBfAGIAAAAOAQAAACUAAAAKAG0AdQBlAF8AYgAAACgBAAAAJgAAAAwAYgBlAHQAYQBfAGEAAAAoAQAAACYAAAAKAG0AdQBlAF8AYQAAACcBAAAAJgAAABAAbABhAG0AYgBkAGEAXwBiAAAAKQEAAAAnAAAAEABsAGEAbQBiAGQAYQBfAGEAAAArAQAAACcAAAAQAGwAYQBtAGIAZABhAF8AYgAAACoBAAAAKAAAABAAbABhAG0AYgBkAGEAXwBiAAAAJAEAAAApAAAADABiAGUAdABhAF8AYQAAACQBAAAAKQAAAAoAbQB1AGUAXwBhAAAAKgEAAAAqAAAAEABsAGEAbQBiAGQAYQBfAGEAAAACAQAAACsAAAAOAGEAbABwAGgAYQBfAGEAAAAmAQAAACsAAAAQAGwAYQBtAGIAZABhAF8AYgAAAAIBAAAALAAAAA4AYQBsAHAAaABhAF8AYQAAAC4BAAAALAAAABAAbABhAG0AYgBkAGEAXwBjAAAAAgEAAAAtAAAADABiAGUAdABhAF8AYQAAABIBAAAALQAAAAoAbQB1AGUAXwBhAAAAEQEAAAAtAAAADABiAGUAdABhAF8AYwAAAAwBAAAALQAAAAoAbQB1AGUAXwBjAAAAHQEAAAAuAAAADABiAGUAdABhAF8AYQAAABYBAAAALgAAAAoAbQB1AGUAXwBhAAAAMAEAAAAuAAAAEABsAGEAbQBiAGQAYQBfAGMAAAApAQAAAC8AAAAQAGwAYQBtAGIAZABhAF8AYQAAABwBAAAALwAAAAwAYgBlAHQAYQBfAGMAAAAqAQAAAC8AAAAKAG0AdQBlAF8AYwAAADABAAAAMAAAABAAbABhAG0AYgBkAGEAXwBhAAAALAEAAAAwAAAAEABsAGEAbQBiAGQAYQBfAGMAAAAq= </TransitionList>
<StateList>
=AAAAMAIAAAABAgAAAAICAAAAAwIAAAAEAgAAAAYCAAAABwIAAAAIAgAAAAkCAAAACgIAAAALAgAAAAwCAAAADgIAAAAPAgAAABACAAAAEQIAAAASAgAAABMCAAAAFAIAAAAWAgAAABcCAAAAGAIAAAAZAgAAABoCAAAAGwIAAAAcAgAAAB4CAAAAHwIAAAAgAgAAACECAAAAIgIAAAAlAgAAACgCAAAAKgIAAAArAgAAACwCAAAALQIAAAAuAgAAAC8CAAAAMAIAAAAFAgAAAA0CAAAAFQIAAAAdAgAAACMCAAAAJAIAAAAmAgAAACcCAAAAKQ=== </StateList>
<EventList>
=AAAADAMAAAAOAGEAbABwAGgAYQBfAGEDAAAADABiAGUAdABhAF8AYQMAAAAKAG0AdQBlAF8AYQMAAAAQAGwAYQBtAGIAZABhAF8AYQMAAAAOAGEAbABwAGgAYQBfAGIDAAAADABiAGUAdABhAF8AYgMAAAAKAG0AdQBlAF8AYgMAAAAQAGwAYQBtAGIAZABhAF8AYgMAAAAOAGEAbABwAGgAYQBfAGMDAAAADABiAGUAdABhAF8AYwMAAAAKAG0AdQBlAF8AYwMAAAAQAGwAYQBtAGIAZABhAF8AYw=== </EventList>
<GraphData>
<States>
<State>
1             
<Item>
<Position>
27.800000     1112.500000   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
2             
<Item>
<Position>
2800          440.299988    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
3             
<Item>
<Position>
152.800000    1547.200012   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
4             
<Item>
<Position>
277.800012    1250          
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
5             
<Item>
<Position>
1195.800018   1209.700012   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
6             
<Item>
<Position>
859.700012    1816.699982   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
7             
<Item>
<Position>
712.500000    334.699988    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
8             
<Item>
<Position>
859.700012    840.299988    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
9             
<Item>
<Position>
565.299988    513.899994    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
10            
<Item>
<Position>
1006.900024   1504.199982   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
11            
<Item>
<Position>
712.500000    2045.800018   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
12            
<Item>
<Position>
859.700012    1995.800018   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
13            
<Item>
<Position>
565.299988    1995.800018   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
14            
<Item>
<Position>
2520.800018   2062.500000   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
15            
<Item>
<Position>
565.299988    2318.099976   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
16            
<Item>
<Position>
1006.900024   766.699982    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
17            
<Item>
<Position>
418.100023    2244.400024   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
18            
<Item>
<Position>
1101.399994   2451.399994   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
19            
<Item>
<Position>
1490.299988   1272.200012   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
20            
<Item>
<Position>
1637.500000   1536.100006   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
21            
<Item>
<Position>
1784.700012   1290.299988   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
22            
<Item>
<Position>
1343.099976   1251.399994   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
23            
<Item>
<Position>
1784.700012   1819.400024   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
24            
<Item>
<Position>
2079.199982   426.399994    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
25            
<Item>
<Position>
2226.399994   894.400024    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
26            
<Item>
<Position>
1931.900024   575           
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
27            
<Item>
<Position>
2373.600006   1437.500000   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
28            
<Item>
<Position>
1343.099976   429.199982    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
29            
<Item>
<Position>
2226.399994   2062.500000   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
30            
<Item>
<Position>
1931.900024   2072.200012   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
31            
<Item>
<Position>
2373.600006   2062.500000   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
32            
<Item>
<Position>
2079.199982   2152.799988   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
33            
<Item>
<Position>
1637.500000   997.200012    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
34            
<Item>
<Position>
1784.700012   1645.800018   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
35            
<Item>
<Position>
418.100023    1369.400024   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
36            
<Item>
<Position>
1490.299988   1125          
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
37            
<Item>
<Position>
1931.900024   1798.600006   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
38            
<Item>
<Position>
2373.600006   895.800018    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
39            
<Item>
<Position>
2520.800018   200           
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
40            
<Item>
<Position>
2520.800018   1311.100006   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
41            
<Item>
<Position>
2931.900024   858.300018    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
42            
<Item>
<Position>
3070.800018   440.299988    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
43            
<Item>
<Position>
2226.399994   345.799994    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
44            
<Item>
<Position>
2659.700012   518.100023    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
45            
<Item>
<Position>
712.500000    2402.799988   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
46            
<Item>
<Position>
2373.600006   761.100006    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
47            
<Item>
<Position>
1195.800018   470.800018    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
<State>
48            
<Item>
<Position>
2520.800018   662.500000    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999971    0             
</BasePoints>
</Item>
</State>
</States>
<TransRel>
<Trans>
1             "alpha_a"     3             
<Item>
<Position>
27.800000     1112.500000   
</Position>
<BasePoints>
62.500000     252.799988    0             0             8.592336      28.779134     
29.100001     101.399994    87.500000     305.599976    116.352773    405.922014    
125           434.700012    
</BasePoints>
</Item>
</Trans>
<Trans>
1             "mue_b"       7             
<Item>
<Position>
27.800000     1112.500000   
</Position>
<BasePoints>
316.600001    -1037.500000  0             0             0             -29.996836    
2.800000      -194.400024   19.400001     -1050         125           -1050         
125           -1050         125           -1050         537.499988    -1050         
641.599977    -1050         672.200000    -895.799994   682.686743    -807.711390   
684.700000    -777.800012   
</BasePoints>
</Item>
</Trans>
<Trans>
1             "beta_b"      15            
<Item>
<Position>
27.800000     1112.500000   
</Position>
<BasePoints>
250.000012    1300          0             0             1.509583      29.975998     
9.700000      216.699982    59.700000     1288.899994   125           1288.899994   
125           1288.899994   125           1288.899994   390.300024    1288.899994   
433.300006    1288.899994   473.599994    1262.500000   515.847132    1226.413113   
537.499988    1205.599976   
</BasePoints>
</Item>
</Trans>
<Trans>
1             "mue_c"       19            
<Item>
<Position>
27.800000     1112.500000   
</Position>
<BasePoints>
684.700000    159.700012    0             0             29.086386     7.602151      
145.799994    36.100006     631.900012    154.199982    1038.899982   191.699982    
1070.800006   194.400024    1077.799976   191.699982    1108.300006   191.699982    
1216.600025   190.299988    1243.000019   194.400024    1349.999988   186.100006    
1374.999988   183.300018    1380.500019   181.900024    1402.799976   177.799988    
1406.900012   176.399994    1411.099994   175           1433.912223   168.966799    
1462.499988   159.700012    
</BasePoints>
</Item>
</Trans>
<Trans>
1             "beta_c"      33            
<Item>
<Position>
27.800000     1112.500000   
</Position>
<BasePoints>
758.300006    -154.199982   0             0             7.229847      -29.128935    
20.800000     -75           56.900001     -166.699982   125           -166.699982   
125           -166.699982   125           -166.699982   1388.899982   -166.699982   
1449.999988   -166.699982   1519.400012   -147.200012   1581.505089   -125.519123   
1609.700000   -115.299988   
</BasePoints>
</Item>
</Trans>
<Trans>
2             "alpha_a"     41            
<Item>
<Position>
2800          440.299988    
</Position>
<BasePoints>
62.500000     234.700012    0             0             9.014663      28.673074     
30.599976     95.800018     88.899994     283.300018    122.693771    389.412265    
131.900024    418.000031    
</BasePoints>
</Item>
</Trans>
<Trans>
3             "mue_a"       4             
<Item>
<Position>
152.800000    1547.200012   
</Position>
<BasePoints>
62.500012     -112.500000   0             0             11.630629     -27.662016    
33.299994     -77.799988    81.899989     -197.200012   113.153184    -269.604721   
125.000012    -297.200012   
</BasePoints>
</Item>
</Trans>
<Trans>
3             "beta_a"      6             
<Item>
<Position>
152.800000    1547.200012   
</Position>
<BasePoints>
338.899982    261.100006    0             0             1.509590      29.975998     
5.499995      93.099976     27.800000     250           125.000012    250           
125.000012    250           125.000012    250           559.700000    250           
597.200000    250           636.099994    255.599976    677.470745    263.557552    
706.900012    269.499969    
</BasePoints>
</Item>
</Trans>
<Trans>
3             "mue_b"       8             
<Item>
<Position>
152.800000    1547.200012   
</Position>
<BasePoints>
338.899982    -531.900024   0             0             3.008207      -29.867192    
19.400001     -138.899994   91.600001     -547.200012   338.899982    -548.600006   
338.899982    -548.600006   338.899982    -548.600006   559.700000    -548.600006   
601.399982    -548.600006   616.599977    -545.800018   647.200000    -572.200012   
674.999988    -595.800018   690.299976    -634.700012   701.029273    -677.475636   
706.900012    -706.900024   
</BasePoints>
</Item>
</Trans>
<Trans>
3             "mue_c"       20            
<Item>
<Position>
152.800000    1547.200012   
</Position>
<BasePoints>
706.900012    13.899994     0             0             29.996849     0             
52.800000     0             91.600001     0             125.000012    0             
125.000012    0             125.000012    0             633.300006    0             
855.500019    0             909.700000    54.199982     1130.500019   38.899994     
1241.600025   29.199982     1369.400012   9.700012      1455.264297   -5.224972     
1484.700000   -11.100006    
</BasePoints>
</Item>
</Trans>
<Trans>
3             "beta_c"      34            
<Item>
<Position>
152.800000    1547.200012   
</Position>
<BasePoints>
780.500019    175           0             0             20.403103     21.980623     
50.000012     50            112.500012    105.599976    177.800000    129.199982    
304.099977    173.600006    647.200000    163.899994    780.500019    163.899994    
780.500019    163.899994    780.500019    163.899994    1411.099994   168.099976    
1483.300006   168.099976    1508.300006   198.600006    1572.200000   169.499969    
1573.599994   168.099976    1586.099994   152.799988    1612.454181   121.459508    
1631.900012   98.600006     
</BasePoints>
</Item>
</Trans>
<Trans>
3             "beta_b"      45            
<Item>
<Position>
152.800000    1547.200012   
</Position>
<BasePoints>
265.300024    929.199982    0             0             1.509590      29.975998     
5.499995      181.999969    33.299994     918.099976    125.000012    918.099976    
125.000012    918.099976    125.000012    918.099976    412.499988    918.099976    
451.399982    918.099976    490.300024    900           534.688267    872.274464    
559.700000    855.599976    
</BasePoints>
</Item>
</Trans>
<Trans>
4             "lambda_a"    1             
<Item>
<Position>
277.800012    1250          
</Position>
<BasePoints>
-125.000012   -45.800018    0             0             -26.271915    -14.607179    
-68.100023    -37.500000    -161.100006   -87.500000    -223.768330   -122.950147   
-250.000012   -137.500000   
</BasePoints>
</Item>
</Trans>
<Trans>
4             "mue_b"       9             
<Item>
<Position>
277.800012    1250          
</Position>
<BasePoints>
140.300012    -256.900024   0             0             10.352953     -28.177137    
52.799988     -136.100006   220.799994    -563.899994   276.857166    -708.066968   
287.499976    -736.100006   
</BasePoints>
</Item>
</Trans>
<Trans>
4             "beta_b"      17            
<Item>
<Position>
277.800012    1250          
</Position>
<BasePoints>
66.599989     566.699982    0             0             4.375984      29.671373     
23.599982     165.299988    108.299994    769.400024    136.019196    964.678999    
140.300012    994.400024    
</BasePoints>
</Item>
</Trans>
<Trans>
4             "mue_c"       21            
<Item>
<Position>
277.800012    1250          
</Position>
<BasePoints>
729.100013    -187.500000   0             0             21.222203     -21.222255    
70.799994     -70.800018    215.300012    -197.200012   361.099982    -198.600006   
361.099982    -198.600006   361.099982    -198.600006   918.000007    -198.600006   
987.499976    -197.200012   970.799994    -126.399994   1030.500007   -91.699982    
1049.999976   -81.900024    1343.000007   -4.199982     1477.850397   32.606769     
1506.900001   40.299988     
</BasePoints>
</Item>
</Trans>
<Trans>
4             "beta_c"      35            
<Item>
<Position>
277.800012    1250          
</Position>
<BasePoints>
66.599989     76.399994     0             0             22.672315     19.729252     
42.999983     36.100006     77.799988     65.299988     117.440495    99.954193     
140.300012    119.400024    
</BasePoints>
</Item>
</Trans>
<Trans>
5             "alpha_b"     1             
<Item>
<Position>
1195.800018   1209.700012   
</Position>
<BasePoints>
-630.500031   -91.600037    0             0             -29.434571    -5.844433     
-131.900024   -29.100037    -515.199995   -111.100006   -837.500024   -116.600037   
-959.700012   -119.400024   -993.000007   -138.899994   -1115.200019  -116.600037   
-1119.400018  -115.299988   -1123.600018  -115.299988   -1140.404723  -109.046823   
-1168.000019  -97.200012    
</BasePoints>
</Item>
</Trans>
<Trans>
5             "mue_c"       22            
<Item>
<Position>
1195.800018   1209.700012   
</Position>
<BasePoints>
73.600006     33.399963     0             0             28.589234     9.096537      
47.299957     13.899994     76.399994     22.200012     118.466532    33.226730     
147.299957    41.699982     
</BasePoints>
</Item>
</Trans>
<Trans>
5             "beta_c"      36            
<Item>
<Position>
1195.800018   1209.700012   
</Position>
<BasePoints>
147.299957    -22.200012    0             0             28.779134     -8.592354     
76.399994     -22.200012    184.799957    -54.100037    265.719502    -76.224414    
294.499969    -84.700012    
</BasePoints>
</Item>
</Trans>
<Trans>
6             "mue_b"       10            
<Item>
<Position>
859.700012    1816.699982   
</Position>
<BasePoints>
73.600006     -33.399963    0             0             25.188665     -16.329923    
44.499969     -29.199982    72.200012     -51.399994    87.500000     -76.399994    
122.200012    -134.799957   137.500000    -213.899994   144.676614    -282.588760   
147.200012    -312.500000   
</BasePoints>
</Item>
</Trans>
<Trans>
6             "beta_b"      18            
<Item>
<Position>
859.700012    1816.699982   
</Position>
<BasePoints>
73.600006     233.300018    0             0             10.352979     28.177137     
47.200012     123.600006    177.799988    463.899994    230.383113    606.876752    
241.699982    634.700012    
</BasePoints>
</Item>
</Trans>
<Trans>
6             "mue_c"       23            
<Item>
<Position>
859.700012    1816.699982   
</Position>
<BasePoints>
483.399963    22.200012     0             0             29.996836     0             
58.399963     0             105.599976    0             147.200012    0             
147.200012    0             147.200012    0             409.700012    0             
593.099976    0             633.399963    101.399994    812.500000    76.399994     
837.500000    72.200012     844.499969    72.200012     865.299988    61.100006     
875           55.500031     884.700012    47.200012     905.554169    25.559545     
925           2.700043      
</BasePoints>
</Item>
</Trans>
<Trans>
6             "beta_c"      37            
<Item>
<Position>
859.700012    1816.699982   
</Position>
<BasePoints>
556.999969    88.899994     0             0             24.040966     17.976608     
51.399994     34.700012     100           62.500000     147.200012    62.500000     
147.200012    62.500000     147.200012    62.500000     409.700012    62.500000     
612.500000    62.500000     670.899963    140.200043    865.299988    84.700012     
934.700012    63.899994     951.399994    56.900024     1012.500000   20.800018     
1018.099976   18.000031     1025          13.899994     1047.240014   -1.419999     
1072.200012   -18.099976    
</BasePoints>
</Item>
</Trans>
<Trans>
7             "alpha_a"     8             
<Item>
<Position>
712.500000    334.699988    
</Position>
<BasePoints>
73.600006     297.199988    0             0             9.014663      28.673100     
31.899977     111.100030    106.900024    366.700006    138.309777    476.937889    
147.200012    505.599999    
</BasePoints>
</Item>
</Trans>
<Trans>
7             "mue_c"       24            
<Item>
<Position>
712.500000    334.699988    
</Position>
<BasePoints>
704.199982    -11.099982    0             0             28.177137     -10.352953    
55.600023     -17.999983    104.199982    -31.899977    147.200012    -31.899977    
147.200012    -31.899977    147.200012    -31.899977    556.900024    -31.899977    
688.899994    -31.899977    720.800018    -20.799994    851.399994    -20.799994    
851.399994    -20.799994    851.399994    -20.799994    1219.400024   -20.799994    
1269.400024   -20.799994    1312.500000   19.500017     1349.644673   66.975939     
1366.699982   91.700006     
</BasePoints>
</Item>
</Trans>
<Trans>
7             "lambda_b"    28            
<Item>
<Position>
712.500000    334.699988    
</Position>
<BasePoints>
294.400024    44.500017     0             0             28.177137     10.352979     
55.600023     18.100023     104.199982    32.000017     147.200012    32.000017     
147.200012    32.000017     147.200012    32.000017     483.300018    32.000017     
522.200012    32.000017     561.100006    50            605.588242    77.825505     
630.599976    94.499993     
</BasePoints>
</Item>
</Trans>
<Trans>
7             "beta_c"      43            
<Item>
<Position>
712.500000    334.699988    
</Position>
<BasePoints>
777.799988    -123.599982   0             0             13.429499     -26.858997    
34.700012     -63.899994    81.899977     -136.099994   147.200012    -136.099994   
147.200012    -136.099994   147.200012    -136.099994   777.799988    -136.099994   
1044.400024   -136.099994   1352.799988   -42.999983    1485.312229   1.893782      
1513.899994   11.100006     
</BasePoints>
</Item>
</Trans>
<Trans>
8             "mue_a"       9             
<Item>
<Position>
859.700012    840.299988    
</Position>
<BasePoints>
-147.200012   -94.499969    0             0             -21.875511    -20.508241    
-63.899994    -58.400011    -161.100006   -151.399994   -234.700012   -238.899994   
-248.600006   -255.599976   -261.100006   -275          -278.217103   -301.105072   
-294.400024   -326.399994   
</BasePoints>
</Item>
</Trans>
<Trans>
8             "beta_a"      10            
<Item>
<Position>
859.700012    840.299988    
</Position>
<BasePoints>
73.600006     381.900024    0             0             5.928719      29.431969     
27.799988     129.100037    108.399963    486.100006    141.171815    634.504829    
147.200012    663.899994    
</BasePoints>
</Item>
</Trans>
<Trans>
8             "lambda_b"    16            
<Item>
<Position>
859.700012    840.299988    
</Position>
<BasePoints>
73.600006     -26.399994    0             0             23.261259     -18.965225    
33.399963     -26.399994    47.200012     -36.100006    59.700012     -43.099976    
73.600006     -48.600006    87.500000     -54.199982    118.419544    -65.124379    
147.200012    -73.600006    
</BasePoints>
</Item>
</Trans>
<Trans>
8             "mue_c"       25            
<Item>
<Position>
859.700012    840.299988    
</Position>
<BasePoints>
704.199982    30.500031     0             0             28.177137     10.352979     
36.100006     13.899994     48.600006     16.600037     59.700012     19.400024     
155.599976    40.299988     180.599976    36.100006     276.399994    33.300018     
604.199982    29.100037     686.100006    0             1012.500000   18.000031     
1122.200012   25            1250          38.899994     1336.876202   50.724899     
1366.699982   54.100037     
</BasePoints>
</Item>
</Trans>
<Trans>
8             "beta_c"      38            
<Item>
<Position>
859.700012    840.299988    
</Position>
<BasePoints>
777.799988    -18.099976    0             0             29.996836     0             
77.799988     0             186.100006    -1.399994     276.399994    -2.799988     
538.899994    -6.999969     1212.500000   -98.600006    1454.199982   0             
1465.299988   4.100037      1473.600006   9.700012      1494.454163   32.640529     
1513.899994   55.500031     
</BasePoints>
</Item>
</Trans>
<Trans>
9             "lambda_a"    7             
<Item>
<Position>
565.299988    513.899994    
</Position>
<BasePoints>
73.600006     -94.500017    0             0             10.352979     -28.177137    
20.800018     -50           37.500000     -84.700012    59.700012     -111.100006   
75            -129.200006   94.400024     -145.799994   121.905090    -163.017084   
147.200012    -179.200006   
</BasePoints>
</Item>
</Trans>
<Trans>
9             "mue_c"       26            
<Item>
<Position>
565.299988    513.899994    
</Position>
<BasePoints>
704.100037    56.900024     0             0             23.329474     18.915761     
50            37.500000     100           67.999983     147.200012    67.999983     
147.200012    67.999983     147.200012    67.999983     441.600037    67.999983     
559.700012    67.999983     587.500000    41.700029     704.100037    41.700029     
704.100037    41.700029     704.100037    41.700029     998.600006    41.700029     
1113.899994   41.700029     1143.000031   -19.500017    1254.100037   5.499983      
1279.100037   12.500000     1304.100037   23.600006     1341.241207   45.006921     
1366.600037   61.100006     
</BasePoints>
</Item>
</Trans>
<Trans>
9             "beta_c"      39            
<Item>
<Position>
565.299988    513.899994    
</Position>
<BasePoints>
998.600006    -484.699994   0             0             9.014663      -28.673074    
23.600006     -70.799971    59.700012     -159.699988   112.500000    -219.499993   
263.899994    -386.099994   311.100006    -497.199994   536.100006    -497.199994   
536.100006    -497.199994   536.100006    -497.199994   777.799988    -497.199994   
876.399994    -497.199994   901.399994    -498.599994   998.600006    -498.599994   
998.600006    -498.599994   998.600006    -498.599994   1513.899994   -498.599994   
1687.500000   -498.599994   1756.900024   -529.199994   1895.800018   -427.799994   
1918.000031   -411.099994   1933.300018   -384.699988   1947.244390   -342.765047   
1955.500031   -313.899994   
</BasePoints>
</Item>
</Trans>
<Trans>
9             "lambda_b"    47            
<Item>
<Position>
565.299988    513.899994    
</Position>
<BasePoints>
294.400024    -55.599976    0             0             23.261259     -18.965225    
50            -37.500000    100           -68.099976    147.200012    -68.099976    
147.200012    -68.099976    147.200012    -68.099976    441.600037    -68.099976    
490.299988    -68.099976    544.400024    -59.700012    601.064327    -48.975009    
630.500031    -43.099976    
</BasePoints>
</Item>
</Trans>
<Trans>
10            "lambda_b"    5             
<Item>
<Position>
1006.900024   1504.199982   
</Position>
<BasePoints>
94.499969     -148.600006   0             0             7.039572      -29.164034    
18.099976     -68.099976    34.799957     -119.499969   59.799957     -159.799957   
86.199951     -202.799988   127.799988    -241.699982   165.866150    -275.270533   
188.899994    -294.499969   
</BasePoints>
</Item>
</Trans>
<Trans>
10            "mue_c"       27            
<Item>
<Position>
1006.900024   1504.199982   
</Position>
<BasePoints>
704.199982    86.100006     0             0             28.530388     9.481672      
41.699982     13.899994     51.399994     16.600037     59.799957     19.400024     
325           76.399994     397.299957    108.300018    665.299988    79.100037     
816.699982    61.100006     847.299957    2.700043      998.699951    2.700043      
998.699951    2.700043      998.699951    2.700043      1219.499969   2.700043      
1259.799957   2.700043      1298.699951   -18.099976    1343.132301   -48.160892    
1366.699982   -66.699982    
</BasePoints>
</Item>
</Trans>
<Trans>
10            "beta_c"      40            
<Item>
<Position>
1006.900024   1504.199982   
</Position>
<BasePoints>
777.799988    -119.499969   0             0             29.978861     0             
73.699951     0             136.199951    0             188.899994    0             
188.899994    0             188.899994    0             409.799957    0             
544.499969    0             565.299988    -65.299988    690.299988    -109.799957   
779.199982    -141.699982   800           -151.399994   890.299988    -173.600006   
938.899994    -186.100006   950           -193.099976   998.699951    -193.099976   
998.699951    -193.099976   998.699951    -193.099976   1366.699982   -193.099976   
1400          -193.099976   1437.500000   -193.099976   1483.886555   -193.099976   
1513.899994   -193.099976   
</BasePoints>
</Item>
</Trans>
<Trans>
11            "alpha_a"     12            
<Item>
<Position>
712.500000    2045.800018   
</Position>
<BasePoints>
73.600006     -11.100006    0             0             28.372767     -9.872668     
51.399994     -18.000031    77.799988     -26.399994    118.612247    -40.733213    
147.200012    -50           
</BasePoints>
</Item>
</Trans>
<Trans>
11            "alpha_c"     28            
<Item>
<Position>
712.500000    2045.800018   
</Position>
<BasePoints>
294.400024    -1343.000031  0             0             21.844339     -20.621062    
29.199982     -29.100037    31.899977     -34.700012    34.700012     -40.200043    
61.100006     -102.700043   80.600023     -1186.100006  112.500000    -1245.800018  
223.600006    -1441.600037  411.100006    -1302.699995  570.800018    -1461.100006  
601.399994    -1488.900042  615.299988    -1534.700012  626.319189    -1586.879011  
630.599976    -1616.600037  
</BasePoints>
</Item>
</Trans>
<Trans>
12            "mue_a"       13            
<Item>
<Position>
859.700012    1995.800018   
</Position>
<BasePoints>
-147.200012   -8.300018     0             0             -29.422507    -6.096574     
-55.500031    -12.500000    -86.100006    -16.600037    -112.500000   -19.400024    
-143.000031   -22.200012    -150          -22.200012    -181.900024   -19.400024    
-202.800035   -16.600037    -226.399994   -13.899994    -264.980951   -6.045875     
-294.400024   0             
</BasePoints>
</Item>
</Trans>
<Trans>
12            "beta_a"      14            
<Item>
<Position>
859.700012    1995.800018   
</Position>
<BasePoints>
851.399994    195.899963    0             0             24.999889     16.695116     
95.899963     58.399963     259.700012    148.600006    409.700012    148.600006    
409.700012    148.600006    409.700012    148.600006    704.199982    148.600006    
1000          148.600006    998.600006    455.599976    1293.099976   455.599976    
1293.099976   455.599976    1293.099976   455.599976    1513.899994   455.599976    
1586.100006   455.599976    1636.100006   219.499969    1656.040425   96.325900     
1661.100006   66.699982     
</BasePoints>
</Item>
</Trans>
<Trans>
12            "alpha_c"     16            
<Item>
<Position>
859.700012    1995.800018   
</Position>
<BasePoints>
73.600006     -302.700043   0             0             8.399685      -28.836012    
18.099976     -61.100006    29.199982     -102.700043   34.700012     -138.899994   
66.699982     -323.600006   91.699982     -790.200043   112.500000    -975          
120.899963    -1045.800018  131.999969    -1129.100037  142.980346    -1199.379011  
147.200012    -1229.100037  
</BasePoints>
</Item>
</Trans>
<Trans>
13            "lambda_a"    11            
<Item>
<Position>
565.299988    1995.800018   
</Position>
<BasePoints>
73.600006     37.500000     0             0             28.510181     9.503394      
54.099989     18.099976     80.500031     26.399994     118.737004    40.553739     
147.200012    50            
</BasePoints>
</Item>
</Trans>
<Trans>
13            "alpha_c"     47            
<Item>
<Position>
565.299988    1995.800018   
</Position>
<BasePoints>
294.400024    -1312.500000  0             0             2.412126      -29.892762    
19.400024     -222.200012   102.800035    -1113.899994  259.700012    -1333.300018  
340.299988    -1443.000031  501.399994    -1495.800018  601.064327    -1519.064403  
630.500031    -1525         
</BasePoints>
</Item>
</Trans>
<Trans>
14            "alpha_c"     5             
<Item>
<Position>
2520.800018   2062.500000   
</Position>
<BasePoints>
-662.500000   -412.500000   0             0             -18.746123    -23.474851    
-44.400024    -54.199982    -79.100037    -97.200012    -112.500000   -133.300018   
-143.000031   -169.400024   -362.500000   -423.600006   -406.900024   -441.699982   
-516.600037   -488.899994   -579.100037   -495.800018   -676.399994   -423.600006   
-697.200012   -408.300018   -680.500031   -387.500000   -701.399994   -369.400024   
-716.600037   -355.599976   -784.700012   -325          -823.600006   -340.299988   
-1061.100006  -441.699982   -1244.400024  -716.699982   -1309.972431  -826.843228   
-1325         -852.799988   
</BasePoints>
</Item>
</Trans>
<Trans>
15            "beta_c"      11            
<Item>
<Position>
565.299988    2318.099976   
</Position>
<BasePoints>
73.600006     -102.799988   0             0             14.300270     -26.360734    
43.000031     -79.199982    94.400024     -175          133.100311    -245.815409   
147.200012    -272.299957   
</BasePoints>
</Item>
</Trans>
<Trans>
15            "mue_c"       32            
<Item>
<Position>
565.299988    2318.099976   
</Position>
<BasePoints>
777.799988    11.100006     0             0             29.960470     1.122480      
204.099989    4.100037      936.100006    16.600037     1159.700012   -25           
1297.200012   -51.399994    1327.799988   -75           1454.100037   -131.999969   
1459.700012   -134.799957   1465.299988   -137.500000   1487.542477   -150.867554   
1513.899994   -165.299988   
</BasePoints>
</Item>
</Trans>
<Trans>
15            "alpha_a"     45            
<Item>
<Position>
565.299988    2318.099976   
</Position>
<BasePoints>
73.600006     52.700043     0             0             27.542922     11.915153     
48.600006     20.800018     70.800018     30.500031     87.500000     41.600037     
94.400024     45.800018     101.399994    50            123.264592    66.525732     
147.200012    84.700012     
</BasePoints>
</Item>
</Trans>
<Trans>
16            "beta_a"      5             
<Item>
<Position>
1006.900024   766.699982    
</Position>
<BasePoints>
94.499969     329.100037    0             0             10.555243     28.119184     
36.199951     100           94.499969     255.500031    154.199982    380.500031    
158.399963    388.899994    163.899994    397.200012    174.350141    416.768348    
188.899994    443.000031    
</BasePoints>
</Item>
</Trans>
<Trans>
16            "beta_c"      41            
<Item>
<Position>
1006.900024   766.699982    
</Position>
<BasePoints>
998.699951    245.800018    0             0             28.857197     8.380703      
205.599976    54.100037     975           255.500031    1219.499969   254.100037    
1219.499969   254.100037    1219.499969   254.100037    1793.099976   254.100037    
1854.199982   255.500031    1890.299988   187.500000    1915.820666   120.164569    
1925          91.600037     
</BasePoints>
</Item>
</Trans>
<Trans>
16            "mue_c"       46            
<Item>
<Position>
1006.900024   766.699982    
</Position>
<BasePoints>
704.199982    -38.899994    0             0             28.772819     -8.442338     
41.699982     -11.099958    51.399994     -13.899994    59.799957     -15.299988    
231.999969    -44.499969    276.399994    -43.099976    448.699951    -51.399994    
780.599976    -66.699982    1181.999969   -26.399994    1336.876202   -8.975084     
1366.699982   -5.599976     
</BasePoints>
</Item>
</Trans>
<Trans>
16            "mue_a"       47            
<Item>
<Position>
1006.900024   766.699982    
</Position>
<BasePoints>
94.499969     -116.699982   0             0             13.419196     -26.838392    
22.299957     -44.499969    29.199982     -59.800005    34.799957     -75           
47.299957     -101.399994   45.899963     -111.099958   59.799957     -137.500000   
87.500000     -183.399963   126.399994    -229.199982   167.679422    -274.618241   
188.899994    -295.899963   
</BasePoints>
</Item>
</Trans>
<Trans>
17            "beta_c"      13            
<Item>
<Position>
418.100023    2244.400024   
</Position>
<BasePoints>
73.599958     -91.600037    0             0             15.269986     -25.874193    
42.999983     -73.600006    92.999983     -155.500031   132.151198    -222.655948   
147.199965    -248.600006   
</BasePoints>
</Item>
</Trans>
<Trans>
17            "lambda_a"    15            
<Item>
<Position>
418.100023    2244.400024   
</Position>
<BasePoints>
73.599958     51.399994     0             0             26.810203     13.449050     
51.299953     26.399994     79.099989     40.299988     120.334626    60.237112     
147.199965    73.699951     
</BasePoints>
</Item>
</Trans>
<Trans>
17            "mue_c"       30            
<Item>
<Position>
418.100023    2244.400024   
</Position>
<BasePoints>
777.699995    30.599976     0             0             29.757307     3.601737      
176.299953    18.099976     724.999952    62.500000     1159.699965   -27.700043    
1277.699995   -52.700043    1405.499983   -115.200043   1487.496593   -157.763730   
1513.800001   -172.200012   
</BasePoints>
</Item>
</Trans>
<Trans>
18            "beta_c"      14            
<Item>
<Position>
1101.399994   2451.399994   
</Position>
<BasePoints>
683.300018    75            0             0             25.337013     16.116006     
62.500000     37.500000     116.699982    63.899994     168.000031    63.899994     
168.000031    63.899994     168.000031    63.899994     1272.200012   63.899994     
1316.699982   63.899994     1334.700012   54.199982     1359.700012   19.400024     
1400          -37.500000    1413.899994   -244.499969   1418.535648   -358.893647   
1419.400024   -388.899994   
</BasePoints>
</Item>
</Trans>
<Trans>
18            "mue_c"       31            
<Item>
<Position>
1101.399994   2451.399994   
</Position>
<BasePoints>
609.700012    11.100006     0             0             30.048330     0             
69.400024     0             122.200012    0             168.000031    0             
168.000031    0             168.000031    0             756.900024    0             
900           0             950           -4.199982     1065.299988   -86.100006    
1159.700012   -154.199982   1225          -277.799988   1260.910408   -361.052335   
1272.200012   -388.899994   
</BasePoints>
</Item>
</Trans>
<Trans>
19            "alpha_a"     20            
<Item>
<Position>
1490.299988   1272.200012   
</Position>
<BasePoints>
73.600006     156.999969    0             0             14.300311     26.360734     
43.000031     77.799988     93.000031     168.099976    132.763730    237.596586    
147.200012    263.899994    
</BasePoints>
</Item>
</Trans>
<Trans>
19            "mue_b"       24            
<Item>
<Position>
1490.299988   1272.200012   
</Position>
<BasePoints>
294.400024    -588.899994   0             0             23.474851     -18.746123    
45.800018     -37.500000    69.400024     -58.300018    87.500000     -79.100037    
138.899994    -140.299988   148.600006    -158.300018   181.900024    -227.799988   
311.100006    -488.899994   168.000031    -677.800035   406.900024    -845.800018   
445.800018    -873.600006   502.799988    -868.000031   560.066568    -854.273270   
588.899994    -845.800018   
</BasePoints>
</Item>
</Trans>
<Trans>
19            "beta_b"      32            
<Item>
<Position>
1490.299988   1272.200012   
</Position>
<BasePoints>
294.400024    793.099976    0             0             3.526339      29.844613     
22.200012     168.099976    106.900024    651.399994    406.900024    847.200012    
445.800018    873.600006    501.399994    880.599976    558.893647    881.464352    
588.899994    880.599976    
</BasePoints>
</Item>
</Trans>
<Trans>
19            "lambda_c"    33            
<Item>
<Position>
1490.299988   1272.200012   
</Position>
<BasePoints>
73.600006     -104.100037   0             0             14.332701     -26.334148    
43.000031     -79.100037    94.400024     -176.399994   132.767578    -248.642483   
147.200012    -275          
</BasePoints>
</Item>
</Trans>
<Trans>
20            "mue_a"       21            
<Item>
<Position>
1637.500000   1536.100006   
</Position>
<BasePoints>
73.600006     -94.400024    0             0             14.428598     -26.351687    
38.899994     -68.000031    77.799988     -136.100006   112.500000    -191.699982   
115.299988    -195.800018   118.099976    -200          131.106927    -220.441189   
147.200012    -245.800018   
</BasePoints>
</Item>
</Trans>
<Trans>
20            "beta_a"      23            
<Item>
<Position>
1637.500000   1536.100006   
</Position>
<BasePoints>
73.600006     168.099976    0             0             14.395918     26.378156     
43.099976     80.599976     94.400024     181.999969    132.763730    256.996610    
147.200012    283.300018    
</BasePoints>
</Item>
</Trans>
<Trans>
20            "mue_b"       25            
<Item>
<Position>
1637.500000   1536.100006   
</Position>
<BasePoints>
294.400024    -84.700012    0             0             29.418812     -5.849869     
91.699982     -18.000031    205.599976    -43.000031    234.700012    -69.400024    
351.399994    -179.199982   269.400024    -273.600006   354.199982    -406.900024   
408.300018    -491.699982   498.600006    -570.800018   564.882575    -623.671490   
588.899994    -641.699982   
</BasePoints>
</Item>
</Trans>
<Trans>
20            "beta_b"      29            
<Item>
<Position>
1637.500000   1536.100006   
</Position>
<BasePoints>
294.400024    404.199982    0             0             5.849869      29.418812     
23.600006     109.700012    68.099976     288.899994    112.500000    330.599976    
254.199982    459.700012    372.200012    333.300018    529.199982    443.099976    
544.400024    452.799988    556.900024    468.099976    575.493365    499.586736    
588.899994    526.399994    
</BasePoints>
</Item>
</Trans>
<Trans>
20            "lambda_c"    34            
<Item>
<Position>
1637.500000   1536.100006   
</Position>
<BasePoints>
73.600006     22.200012     0             0             29.892762     -2.412085     
51.399994     -2.799988     72.200012     0             87.500000     11.100006     
106.900024    23.600006     120.800018    44.499969     136.980877    81.505101     
147.200012    109.700012    
</BasePoints>
</Item>
</Trans>
<Trans>
21            "lambda_a"    19            
<Item>
<Position>
1784.700012   1290.299988   
</Position>
<BasePoints>
-147.200012   1.399994      0             0             -29.892762    -2.412085     
-87.500000    -5.599976     -186.100006   -11.100006    -264.488784   -15.515065    
-294.400024   -18.099976    
</BasePoints>
</Item>
</Trans>
<Trans>
21            "mue_b"       26            
<Item>
<Position>
1784.700012   1290.299988   
</Position>
<BasePoints>
73.600006     -645.900011   0             0             1.208774      -29.960470    
6.999969      -163.899994   26.399994     -612.500000   59.700012     -665.299988   
69.499969     -680.599976   84.700012     -691.699982   119.005101    -705.019326   
147.200012    -715.299988   
</BasePoints>
</Item>
</Trans>
<Trans>
21            "beta_b"      30            
<Item>
<Position>
1784.700012   1290.299988   
</Position>
<BasePoints>
73.600006     422.200012    0             0             18.746123     23.474851     
27.799988     36.100006     31.999969     44.400024     34.700012     54.100037     
79.199982     180.500031    23.600006     225           59.700012     355.500031    
68.099976     381.900024    80.599976     383.300018    87.500000     411.100006    
120.899963    523.600006    88.899994     558.300018    112.500000    675           
116.699982    694.400024    123.600006    716.600037    137.240000    753.580044    
147.200012    781.900024    
</BasePoints>
</Item>
</Trans>
<Trans>
21            "lambda_c"    35            
<Item>
<Position>
1784.700012   1290.299988   
</Position>
<BasePoints>
-683.300018   119.400024    0             0             -26.810245    13.449050     
-93.000031    45.800018     -238.899994   108.300018    -368.000031   108.300018    
-1219.400024  108.300018    -1219.400024  108.300018    -1219.400024  108.300018    
-1254.099989  108.300018    -1291.599989  101.399994    -1338.012253  88.366824     
-1366.599989  79.100037     
</BasePoints>
</Item>
</Trans>
<Trans>
22            "alpha_b"     19            
<Item>
<Position>
1343.099976   1251.399994   
</Position>
<BasePoints>
73.600006     20.800018     0             0             29.621933     4.695144      
54.100037     8.300018      77.700043     11.100006     117.478987    16.580352     
147.200012    20.800018     
</BasePoints>
</Item>
</Trans>
<Trans>
22            "lambda_c"    36            
<Item>
<Position>
1343.099976   1251.399994   
</Position>
<BasePoints>
73.600006     -43.099976    0             0             22.362676     -20.066856    
50            -43.099976    84.700012     -72.200012    124.340510    -106.954163   
147.200012    -126.399994   
</BasePoints>
</Item>
</Trans>
<Trans>
23            "mue_b"       27            
<Item>
<Position>
1784.700012   1819.400024   
</Position>
<BasePoints>
294.499969    -197.200012   0             0             15.309916     -25.798538    
23.600006     -41.600037    29.199982     -54.100037    34.700012     -66.600037    
48.600006     -97.200012    37.500000     -112.500000   59.700012     -134.700012   
100           -173.600006   486.100006    -259.700012   529.199982    -293.000031   
544.499969    -305.500031   556.999969    -322.200012   576.176483    -354.740231   
588.899994    -381.900024   
</BasePoints>
</Item>
</Trans>
<Trans>
23            "beta_b"      31            
<Item>
<Position>
1784.700012   1819.400024   
</Position>
<BasePoints>
294.499969    77.799988     0             0             28.446966     9.539071      
41.699982     12.500000     51.399994     15.299988     59.700012     18.099976     
202.799988    54.199982     254.199982    23.699951     381.999969    97.299957     
444.499969    131.999969    511.100006    180.599976    565.332313    224.560886    
588.899994    243.099976    
</BasePoints>
</Item>
</Trans>
<Trans>
23            "lambda_c"    37            
<Item>
<Position>
1784.700012   1819.400024   
</Position>
<BasePoints>
73.600006     0             0             0             29.621933     -4.695144     
54.199982     -8.300018     77.799988     -11.100006    117.478987    -16.519231    
147.200012    -20.800018    
</BasePoints>
</Item>
</Trans>
<Trans>
24            "alpha_a"     25            
<Item>
<Position>
2079.199982   426.399994    
</Position>
<BasePoints>
73.600006     276.399994    0             0             9.503394      28.510181     
36.100006     115.299988    102.700043    326.399994    137.933225    439.412265    
147.200012    468.000031    
</BasePoints>
</Item>
</Trans>
<Trans>
24            "lambda_c"    43            
<Item>
<Position>
2079.199982   426.399994    
</Position>
<BasePoints>
73.600006     -25           0             0             23.970648     -17.999567    
37.500000     -27.799988    48.600006     -34.699988    59.700012     -41.700006    
73.600006     -48.599982    88.899994     -56.999993    119.376752    -69.283115    
147.200012    -80.599999    
</BasePoints>
</Item>
</Trans>
<Trans>
24            "lambda_b"    44            
<Item>
<Position>
2079.199982   426.399994    
</Position>
<BasePoints>
294.400024    13.899994     0             0             30.048330     0             
65.200043     1.399994      108.300018    1.399994      147.200012    1.399994      
147.200012    1.399994      147.200012    1.399994      441.600037    1.399994      
483.300018    1.399994      522.200012    29.200029     561.054199    68.840528     
580.500031    91.700029     
</BasePoints>
</Item>
</Trans>
<Trans>
25            "mue_a"       26            
<Item>
<Position>
2226.399994   894.400024    
</Position>
<BasePoints>
-147.200012   -112.500048   0             0             -20.066856    -22.362676    
-76.399994    -83.300018    -201.399994   -218.000031   -274.134158   -297.387847   
-294.499969   -319.400024   
</BasePoints>
</Item>
</Trans>
<Trans>
25            "beta_a"      27            
<Item>
<Position>
2226.399994   894.400024    
</Position>
<BasePoints>
73.600006     313.899994    0             0             8.380703      28.857197     
34.700012     126.399994    104.199982    387.500000    138.944372    514.234916    
147.200012    543.099976    
</BasePoints>
</Item>
</Trans>
<Trans>
25            "lambda_c"    38            
<Item>
<Position>
2226.399994   894.400024    
</Position>
<BasePoints>
73.600006     13.899994     0             0             30.048330     0             
54.199982     1.399994      77.799988     1.399994      117.186574    1.399994      
147.200012    1.399994      
</BasePoints>
</Item>
</Trans>
<Trans>
25            "lambda_b"    46            
<Item>
<Position>
2226.399994   894.400024    
</Position>
<BasePoints>
73.600006     -40.200043    0             0             22.395995     -20.020672    
50            -45.800018    84.700012     -76.300049    124.773204    -113.385030   
147.200012    -133.300018   
</BasePoints>
</Item>
</Trans>
<Trans>
26            "lambda_a"    24            
<Item>
<Position>
1931.900024   575           
</Position>
<BasePoints>
73.699951     -27.799988    0             0             24.983765     -16.598794    
47.299957     -31.899977    70.899963     -48.600006    87.500000     -68.100023    
100           -80.600023    111.199951    -94.399977    130.845229    -123.481616   
147.299957    -148.600006   
</BasePoints>
</Item>
</Trans>
<Trans>
26            "lambda_c"    39            
<Item>
<Position>
1931.900024   575           
</Position>
<BasePoints>
294.499969    -283.299994   0             0             12.009440     -27.561225    
25            -56.899977    41.699982     -93.100023    59.799957     -123.600006   
120.899963    -225          152.799988    -251.399994   259.799957    -300          
354.199982    -341.700006   473.699951    -361.100006   558.988754    -372.415075   
588.899994    -375          
</BasePoints>
</Item>
</Trans>
<Trans>
26            "lambda_b"    48            
<Item>
<Position>
1931.900024   575           
</Position>
<BasePoints>
294.499969    47.200012     0             0             29.930573     2.408199      
120.899963    8.300018      345.899963    27.799988     529.199982    68.100023     
533.399963    69.399977     537.500000    70.800018     560.312229    78.233213     
588.899994    87.500000     
</BasePoints>
</Item>
</Trans>
<Trans>
27            "lambda_b"    22            
<Item>
<Position>
2373.600006   1437.500000   
</Position>
<BasePoints>
-515.299988   11.100006     0             0             -30.048330    0             
-63.899994    0             -108.300018   0             -147.200012   0             
-515.299988   0             -515.299988   0             -515.299988   0             
-701.399994   0             -745.800018   -47.200012    -918.000031   -118.099976   
-943.000031   -129.199982   -969.400024   -145.800018   -1005.830955  -169.040323   
-1030.500031  -186.100006   
</BasePoints>
</Item>
</Trans>
<Trans>
27            "lambda_c"    40            
<Item>
<Position>
2373.600006   1437.500000   
</Position>
<BasePoints>
73.600006     -43.099976    0             0             22.395995     -20.020672    
50            -43.099976    84.700012     -72.200012    124.340510    -106.893238   
147.200012    -126.399994   
</BasePoints>
</Item>
</Trans>
<Trans>
28            "beta_c"      2             
<Item>
<Position>
1343.099976   429.199982    
</Position>
<BasePoints>
736.100006    -152.799988   0             0             24.511136     -17.255078    
56.900024     -38.899970    102.700043    -62.499976    147.200012    -62.499976    
147.200012    -62.499976    147.200012    -62.499976    368.000031    -62.499976    
525           -62.499976    548.600006    -144.499993   701.300049    -169.499993   
731.900024    -173.599982   740.200043    -170.899987   770.800018    -169.499993   
920.800018    -159.799981   955.500031    -129.199982   1104.100037   -129.199982   
1104.100037   -129.199982   1104.100037   -129.199982   1316.600037   -129.199982   
1375          -129.199982   1416.600037   -69.499993    1444.238883   -16.110988    
1456.900024   11.100006     
</BasePoints>
</Item>
</Trans>
<Trans>
28            "alpha_a"     16            
<Item>
<Position>
1343.099976   429.199982    
</Position>
<BasePoints>
-147.299957   266.600037    0             0             -5.938308     29.437178     
-16.699982    84.700012     -37.500000    175           -59.799957    198.600006    
-129.199982   275           -187.500000   229.100037    -276.399994   283.300018    
-284.799957   288.900042    -293.099976   295.800018    -314.980485   316.280505    
-336.199951   337.500000    
</BasePoints>
</Item>
</Trans>
<Trans>
28            "mue_c"       44            
<Item>
<Position>
1343.099976   429.199982    
</Position>
<BasePoints>
662.500000    61.100006     0             0             29.418812     5.849869      
63.800049     11.100006     108.300018    18.000031     147.200012    18.000031     
147.200012    18.000031     147.200012    18.000031     368.000031    18.000031     
452.700043    18.000031     472.200012    37.500000     554.100037    44.400024     
608.300018    50            623.600006    43.000031     676.300049    48.600006     
770.800018    59.700012     790.200043    88.900042     883.300018    88.900042     
883.300018    88.900042     883.300018    88.900042     1177.700043   88.900042     
1208.300018   88.900042     1241.600037   88.900042     1286.586598   88.900042     
1316.600037   88.900042     
</BasePoints>
</Item>
</Trans>
<Trans>
29            "lambda_c"    12            
<Item>
<Position>
2226.399994   2062.500000   
</Position>
<BasePoints>
-662.500000   -55.599976    0             0             -24.002893    -17.959023    
-56.999969    -38.899994    -102.799988   -63.899994    -147.200012   -63.899994    
-368.099976   -63.899994    -368.099976   -63.899994    -368.099976   -63.899994    
-731.999969   -63.899994    -1172.200012  -65.299988    -1336.686543  -66.699982    
-1366.699982  -66.699982    
</BasePoints>
</Item>
</Trans>
<Trans>
29            "mue_a"       30            
<Item>
<Position>
2226.399994   2062.500000   
</Position>
<BasePoints>
-147.200012   15.299988     0             0             -29.960470    1.208774      
-87.500000    2.799988      -186.100006   6.900024      -264.519833   8.838163      
-294.499969   9.700012      
</BasePoints>
</Item>
</Trans>
<Trans>
29            "beta_a"      31            
<Item>
<Position>
2226.399994   2062.500000   
</Position>
<BasePoints>
73.600006     11.100006     0             0             30.048330     0             
54.199982     0             77.799988     0             117.186574    0             
147.200012    0             
</BasePoints>
</Item>
</Trans>
<Trans>
30            "lambda_c"    13            
<Item>
<Position>
1931.900024   2072.200012   
</Position>
<BasePoints>
-662.500000   136.100006    0             0             -29.418812    -5.849869     
-70.800018    -12.500000    -131.900024   -18.000031    -181.900024   -1.399994     
-276.300049   27.799988     -268.000031   125           -368.000031   125           
-662.500000   125           -662.500000   125           -662.500000   125           
-811.100006   125           -848.600006   134.700012    -998.600006   134.700012    
-1219.400024  134.700012    -1219.400024  134.700012    -1219.400024  134.700012    
-1258.300018  134.700012    -1276.300001  141.699982    -1306.900024  115.299988    
-1327.700043  94.499969     -1345.800018  22.200012     -1360.725003  -46.964290    
-1366.600037  -76.399994    
</BasePoints>
</Item>
</Trans>
<Trans>
30            "lambda_a"    32            
<Item>
<Position>
1931.900024   2072.200012   
</Position>
<BasePoints>
73.699951     48.600006     0             0             28.138218     10.530782     
50            18.099976     70.899963     27.799988     87.500000     37.500000     
94.499969     41.699982     101.399994    45.899963     123.732276    62.060886     
147.299957    80.599976     
</BasePoints>
</Item>
</Trans>
<Trans>
31            "lambda_c"    14            
<Item>
<Position>
2373.600006   2062.500000   
</Position>
<BasePoints>
73.600006     11.100006     0             0             30.048330     0             
54.199982     0             77.799988     0             117.186574    0             
147.200012    0             
</BasePoints>
</Item>
</Trans>
<Trans>
32            "lambda_c"    11            
<Item>
<Position>
2079.199982   2152.799988   
</Position>
<BasePoints>
-662.500000   -50           0             0             -28.530388    9.481672      
-41.699982    13.899994     -51.399994    15.299988     -59.799957    16.600037     
-70.899963    18.000031     -75           16.600037     -87.500000    16.600037     
-279.199982   -1.399994     -320.899963   -61.100006    -515.299988   -61.100006    
-809.799957   -61.100006    -809.799957   -61.100006    -809.799957   -61.100006    
-998.600006   -61.100006    -1223.600006  -87.500000    -1336.906441  -103.465159   
-1366.699982  -106.999969   
</BasePoints>
</Item>
</Trans>
<Trans>
32            "alpha_a"     29            
<Item>
<Position>
2079.199982   2152.799988   
</Position>
<BasePoints>
73.600006     -27.799988    0             0             25.466057     -15.839671    
50            -30.599976    80.500031     -48.600006    121.601592    -74.620208    
147.200012    -90.299988    
</BasePoints>
</Item>
</Trans>
<Trans>
33            "beta_b"      11            
<Item>
<Position>
1637.500000   997.200012    
</Position>
<BasePoints>
-441.699982   159.700012    0             0             -29.076574    7.334595      
-129.199982   30.599976     -400          97.200012     -476.399994   148.600006    
-608.300018   236.100006    -752.799988   630.599976    -812.500000   779.199982    
-851.399994   877.799988    -836.100006   913.899994    -890.299988   1008.399963   
-891.699982   1009.700012   -891.699982   1012.500000   -904.680229   1026.496658   
-925          1048.600006   
</BasePoints>
</Item>
</Trans>
<Trans>
33            "alpha_a"     34            
<Item>
<Position>
1637.500000   997.200012    
</Position>
<BasePoints>
73.600006     373.600006    0             0             7.231131      29.098672     
25            97.200012     59.700012     240.299988    87.500000     362.500000    
106.900024    445.899963    126.399994    543.099976    141.324978    619.164303    
147.200012    648.600006    
</BasePoints>
</Item>
</Trans>
<Trans>
33            "mue_b"       43            
<Item>
<Position>
1637.500000   997.200012    
</Position>
<BasePoints>
294.400024    -476.399994   0             0             10.555243     -28.119184    
43.099976     -116.600037   134.700012    -340.300035   259.700012    -493.000031   
315.299988    -558.300018   330.599976    -580.500031   406.900024    -618.000007   
450           -637.500024   502.799988    -645.800018   558.893647    -649.671250   
588.899994    -651.400018   
</BasePoints>
</Item>
</Trans>
<Trans>
34            "beta_b"      12            
<Item>
<Position>
1784.700012   1645.800018   
</Position>
<BasePoints>
-441.600037   304.199982    0             0             -9.481672     28.530388     
-20.800018    56.999969     -36.100006    88.899994     -59.700012    109.799957    
-140.299988   181.999969    -405.500031   297.299957    -515.299988   297.299957    
-777.799988   297.299957    -777.799988   297.299957    -777.799988   297.299957    
-813.899994   297.299957    -852.799988   312.500000    -899.055942   334.951234    
-925          350           
</BasePoints>
</Item>
</Trans>
<Trans>
34            "mue_a"       35            
<Item>
<Position>
1784.700012   1645.800018   
</Position>
<BasePoints>
-683.300018   27.799988     0             0             -29.757348    3.601737      
-77.799988    9.799957      -154.100037   16.699982     -220.800018   16.699982     
-851.399994   16.699982     -851.399994   16.699982     -851.399994   16.699982     
-1055.500031  16.699982     -1255.500031  -162.500000   -1346.295148  -254.326874   
-1366.599989  -276.399994   
</BasePoints>
</Item>
</Trans>
<Trans>
34            "beta_a"      37            
<Item>
<Position>
1784.700012   1645.800018   
</Position>
<BasePoints>
73.600006     122.299957    0             0             14.395918     26.378156     
27.799988     48.600006     43.099976     72.299957     59.700012     90.299988     
72.200012     102.799988    88.899994     116.699982    121.651726    137.114543    
147.200012    152.799988    
</BasePoints>
</Item>
</Trans>
<Trans>
34            "mue_b"       38            
<Item>
<Position>
1784.700012   1645.800018   
</Position>
<BasePoints>
294.499969    -290.200043   0             0             21.195102     -21.195102    
34.700012     -36.100006    48.600006     -48.600006    59.700012     -59.700012    
113.899994    -112.500000   137.500000    -118.000031   181.999969    -176.399994   
309.700012    -344.400024   276.399994    -429.100037   406.999969    -591.600037   
450           -643.000031   509.700012    -693.000031   564.175927    -732.944691   
588.899994    -750          
</BasePoints>
</Item>
</Trans>
<Trans>
35            "beta_b"      13            
<Item>
<Position>
418.100023    1369.400024   
</Position>
<BasePoints>
73.599958     359.799957    0             0             6.955774      29.164034     
31.899977     138.899994    108.299971    456.999969    140.518309    597.145189    
147.199965    626.399994    
</BasePoints>
</Item>
</Trans>
<Trans>
35            "lambda_a"    33            
<Item>
<Position>
418.100023    1369.400024   
</Position>
<BasePoints>
588.800001    -130.500031   0             0             29.844572     -3.526339     
122.199965    -15.200043    352.699995    -50           529.099989    -129.100037   
588.800001    -155.500031   594.399977    -177.700043   648.599958    -211.100006   
690.199995    -237.500000   699.999952    -245.800018   742.999983    -263.800049   
806.899977    -291.600037   824.999952    -293.000031   890.199995    -311.100006   
955.499983    -329.100037   972.199965    -336.100006   1037.499952   -350          
1083.299971   -358.300018   1133.299971   -365.200043   1189.488737   -369.615102   
1219.399977   -372.200012   
</BasePoints>
</Item>
</Trans>
<Trans>
35            "mue_b"       39            
<Item>
<Position>
418.100023    1369.400024   
</Position>
<BasePoints>
1072.199965   -1277.700025  0             0             9.503353      -28.510181    
30.499983     -93.000031    70.799971     -223.600006   87.500000     -337.500000   
106.899977    -459.700012   75            -776.300001   112.500000    -895.800018   
136.099958    -969.400024   165.199995    -976.300025   206.899977    -1043.000031  
279.099989    -1152.700019  237.500000    -1290.200025  367.999983    -1290.200025  
367.999983    -1290.200025  367.999983    -1290.200025  998.599958    -1290.200025  
1244.399977   -1290.200025  1305.499983   -1305.500025  1548.599958   -1280.500025  
1738.800001   -1259.700024  1959.699965   -1206.900024  2073.650392   -1177.093244  
2102.699995   -1169.400024  
</BasePoints>
</Item>
</Trans>
<Trans>
36            "alpha_b"     33            
<Item>
<Position>
1490.299988   1125          
</Position>
<BasePoints>
73.600006     -65.299988    0             0             15.234801     -25.899098    
29.100037     -45.800018    43.000031     -66.699982    59.700012     -80.599976    
72.200012     -91.699982    88.899994     -100          120.040218    -115.015339   
147.200012    -127.799988   
</BasePoints>
</Item>
</Trans>
<Trans>
37            "beta_b"      14            
<Item>
<Position>
1931.900024   1798.600006   
</Position>
<BasePoints>
294.499969    109.700012    0             0             29.453863     5.924609      
95.899963     19.499969     227.799988    51.399994     329.199982    98.600006     
412.500000    136.100006    500           195.800018    565.332313    245.360904    
588.899994    263.899994    
</BasePoints>
</Item>
</Trans>
<Trans>
37            "mue_b"       40            
<Item>
<Position>
1931.900024   1798.600006   
</Position>
<BasePoints>
294.499969    -136.100006   0             0             27.067265     -12.941538    
112.500000    -55.500031    331.999969    -170.800018   476.399994    -313.899994   
515.299988    -352.799988   547.299957    -405.500031   575.497494    -460.634661   
588.899994    -487.500000   
</BasePoints>
</Item>
</Trans>
<Trans>
38            "mue_a"       39            
<Item>
<Position>
2373.600006   895.800018    
</Position>
<BasePoints>
73.600006     -200          0             0             12.971392     -27.044971    
22.200012     -47.200012    29.199982     -68.000031    34.700012     -87.500000    
50            -138.900042   102.799988    -509.700012   112.500000    -562.500024   
119.499969    -591.600013   127.799988    -623.600030   139.506793    -666.750430   
147.200012    -695.800018   
</BasePoints>
</Item>
</Trans>
<Trans>
38            "beta_a"      40            
<Item>
<Position>
2373.600006   895.800018    
</Position>
<BasePoints>
73.600006     238.899994    0             0             11.947203     27.504338     
30.599976     76.399994     63.899994     158.399963    87.500000     227.799988    
104.199982    275           122.200012    330.599976    138.724414    386.519520    
147.200012    415.299988    
</BasePoints>
</Item>
</Trans>
<Trans>
38            "lambda_b"    41            
<Item>
<Position>
2373.600006   895.800018    
</Position>
<BasePoints>
286.100006    12.500000     0             0             30.048330     0             
65.299988     0             108.300018    0             147.200012    0             
147.200012    0             147.200012    0             426.399994    0             
455.599976    0             487.500000    -8.300018     530.649819    -25.727558    
558.300018    -37.500000    
</BasePoints>
</Item>
</Trans>
<Trans>
39            "lambda_b"    42            
<Item>
<Position>
2520.800018   200           
</Position>
<BasePoints>
279.199982    36.100006     0             0             28.857197     8.380682      
62.500000     15.300012     102.799988    23.600006     138.899994    23.600006     
138.899994    23.600006     138.899994    23.600006     411.100006    23.600006     
491.699982    23.600006     526.399994    127.800012    544.940419    210.674084    
550           240.299988    
</BasePoints>
</Item>
</Trans>
<Trans>
39            "lambda_a"    43            
<Item>
<Position>
2520.800018   200           
</Position>
<BasePoints>
-147.200012   104.200006    0             0             -27.044971    12.971412     
-83.300018    41.700006     -190.200043   94.400001     -267.586767   132.393380    
-294.400024   145.799994    
</BasePoints>
</Item>
</Trans>
<Trans>
40            "lambda_b"    36            
<Item>
<Position>
2520.800018   1311.100006   
</Position>
<BasePoints>
-515.200043   -62.500000    0             0             -28.119184    -10.555243    
-41.600037    -15.299988    -51.399994    -18.000031    -59.700012    -19.400024    
-456.900024   -113.899994   -581.900024   -22.200012    -970.800018   -152.799988   
-976.399994   -155.500031   -983.300018   -158.300018   -1004.734157  -170.615721   
-1030.500031  -186.100006   
</BasePoints>
</Item>
</Trans>
<Trans>
41            "beta_a"      36            
<Item>
<Position>
2931.900024   858.300018    
</Position>
<BasePoints>
-705.500031   236.100006    0             0             -2.320717     29.910959     
-8.300018     75            -22.200012    140.299988    -59.700012    181.999969    
-81.900024    208.399963    -95.800018    218.099976    -131.900024   218.099976    
-411.100006   218.099976    -411.100006   218.099976    -411.100006   218.099976    
-830.500031   218.099976    -934.700012   251.399994    -1354.100037  265.299988    
-1366.600037  265.299988    -1379.100037  265.299988    -1411.593689  265.835605    
-1441.600037  266.699982    
</BasePoints>
</Item>
</Trans>
<Trans>
41            "mue_a"       42            
<Item>
<Position>
2931.900024   858.300018    
</Position>
<BasePoints>
69.499969     -54.100037    0             0             20.662012     -21.795416    
41.699982     -45.800018    65.299988     -76.400042    79.199982     -106.900024   
118.099976    -193.000031   131.999969    -305.500031   137.232948    -387.993683   
138.899994    -418.000031   
</BasePoints>
</Item>
</Trans>
<Trans>
42            "lambda_a"    2             
<Item>
<Position>
3070.800018   440.299988    
</Position>
<BasePoints>
-138.899994   12.500000     0             0             -30.048330    0             
-84.700012    0             -175          0             -240.816743   0             
-270.800018   0             
</BasePoints>
</Item>
</Trans>
<Trans>
43            "lambda_b"    2             
<Item>
<Position>
2226.399994   345.799994    
</Position>
<BasePoints>
294.400024    30.599999     0             0             29.437178     5.938348      
63.899994     11.100006     108.300018    18.099999     147.200012    18.099999     
147.200012    18.099999     147.200012    18.099999     433.300018    18.099999     
475           18.099999     515.299988    44.500017     551.472303    74.245196     
573.600006    94.499993     
</BasePoints>
</Item>
</Trans>
<Trans>
43            "alpha_a"     38            
<Item>
<Position>
2226.399994   345.799994    
</Position>
<BasePoints>
73.600006     376.400018    0             0             5.836405      29.435683     
22.200012     111.099982    62.500000     305.599999    112.500000    462.500024    
118.000031    476.400018    122.200012    491.700006    135.181472    522.493693    
147.200012    550.000024    
</BasePoints>
</Item>
</Trans>
<Trans>
44            "lambda_c"    2             
<Item>
<Position>
2659.700012   518.100023    
</Position>
<BasePoints>
73.600006     -19.500017    0             0             26.378156     -14.395959    
52.799988     -27.800035    80.599976     -44.500017    114.068305    -63.250183    
140.299988    -77.800035    
</BasePoints>
</Item>
</Trans>
<Trans>
44            "alpha_a"     46            
<Item>
<Position>
2659.700012   518.100023    
</Position>
<BasePoints>
-138.899994   241.599989    0             0             -8.399685     28.835970     
-22.200012    76.299953     -52.799988    151.299953    -104.100037   191.599989    
-143.000031   222.199965    -197.200012   234.699965    -256.093659   241.271230    
-286.100006   242.999983    
</BasePoints>
</Item>
</Trans>
<Trans>
45            "beta_c"      12            
<Item>
<Position>
712.500000    2402.799988   
</Position>
<BasePoints>
73.600006     -156.999969   0             0             10.530782     -28.138218    
38.899994     -105.599976   100           -276.399994   136.509233    -378.907049   
147.200012    -406.999969   
</BasePoints>
</Item>
</Trans>
<Trans>
45            "mue_a"       17            
<Item>
<Position>
712.500000    2402.799988   
</Position>
<BasePoints>
-147.200012   -4.199982     0             0             -29.960470    -1.208774     
-73.600006    -4.199982     -134.700012   -13.899994    -181.899977   -37.500000    
-216.699982   -56.999969    -247.200012   -90.299988    -277.401655   -133.669555   
-294.399977   -158.399963   
</BasePoints>
</Item>
</Trans>
<Trans>
45            "beta_a"      18            
<Item>
<Position>
712.500000    2402.799988   
</Position>
<BasePoints>
147.200012    47.200012     0             0             28.510181     9.503394      
41.699982     13.899994     51.399994     16.600037     59.700012     19.400024     
158.300018    38.899994     275           45.800018     358.886555    48.600006     
388.899994    48.600006     
</BasePoints>
</Item>
</Trans>
<Trans>
45            "mue_c"       29            
<Item>
<Position>
712.500000    2402.799988   
</Position>
<BasePoints>
777.799988    -2.799988     0             0             29.757348     -3.601737     
77.799988     -6.999969     155.599976    -13.899994    220.800018    -13.899994    
220.800018    -13.899994    220.800018    -13.899994    998.600006    -13.899994    
1197.200012   -13.899994    1243.099976   -87.500000    1401.399994   -202.799988   
1436.100006   -229.199982   1468.099976   -268.099976   1497.853964   -314.954560   
1513.899994   -340.299988   
</BasePoints>
</Item>
</Trans>
<Trans>
46            "beta_a"      22            
<Item>
<Position>
2373.600006   761.100006    
</Position>
<BasePoints>
-515.299988   87.500000     0             0             -29.892762    2.412085      
-166.699982   16.699982     -641.699982   69.499969     -770.800018   143.099976    
-915.299988   227.799988    -901.399994   305.599976    -995.800018   444.499969    
-997.200012   445.800018    -998.600006   448.600006    -1012.385111  466.364568    
-1030.500031  490.299988    
</BasePoints>
</Item>
</Trans>
<Trans>
46            "lambda_c"    41            
<Item>
<Position>
2373.600006   761.100006    
</Position>
<BasePoints>
286.100006    73.600006     0             0             24.999889     16.695156     
58.300018     37.500000     104.199982    61.100006     147.200012    61.100006     
147.200012    61.100006     147.200012    61.100006     426.399994    61.100006     
455.599976    61.100006     487.500000    69.499969     530.373205    86.224394     
558.300018    97.200012     
</BasePoints>
</Item>
</Trans>
<Trans>
46            "mue_a"       48            
<Item>
<Position>
2373.600006   761.100006    
</Position>
<BasePoints>
73.600006     -34.700012    0             0             22.395995     -20.020672    
36.100006     -33.300018    48.600006     -42.999983    59.700012     -51.399994    
73.600006     -61.100006    88.899994     -69.400024    120.386755    -85.193377    
147.200012    -98.600006    
</BasePoints>
</Item>
</Trans>
<Trans>
47            "lambda_a"    28            
<Item>
<Position>
1195.800018   470.800018    
</Position>
<BasePoints>
73.600006     -2.699995     0             0             28.857197     -8.380703     
54.199982     -15.199995    79.199982     -22.200012    118.466532    -33.126756    
147.299957    -41.600037    
</BasePoints>
</Item>
</Trans>
<Trans>
47            "beta_c"      42            
<Item>
<Position>
1195.800018   470.800018    
</Position>
<BasePoints>
956.999969    -419.400018   0             0             21.195102     -21.195102    
61.100006     -61.100006    134.799957    -126.400018   206.999969    -168.000007   
300           -218.000007   1000          -470.800018   1104.199982   -470.800018   
1104.199982   -470.800018   1104.199982   -470.800018   1736.100006   -470.800018   
1816.699982   -470.800018   1858.399963   -194.400024   1872.476602   -60.411256    
1875          -30.500031    
</BasePoints>
</Item>
</Trans>
<Trans>
47            "mue_c"       48            
<Item>
<Position>
1195.800018   470.800018    
</Position>
<BasePoints>
662.500000    225           0             0             28.530388     9.481631      
62.500000     20.899963     106.999969    31.999969     147.299957    31.999969     
147.299957    31.999969     147.299957    31.999969     368.099976    31.999969     
476.399994    31.999969     452.799988    152.799988    554.199982    188.899994    
687.500000    238.899994    1127.799988   208.399963    1295.088760   194.284892    
1325          191.699982    
</BasePoints>
</Item>
</Trans>
<Trans>
48            "lambda_c"    42            
<Item>
<Position>
2520.800018   662.500000    
</Position>
<BasePoints>
279.199982    81.899977     0             0             22.948656     19.297748     
54.199982     43.100023     97.299957     69.399977     138.899994    69.399977     
138.899994    69.399977     138.899994    69.399977     411.100006    69.399977     
465.299988    69.399977     515.299988    -91.699982    542.524397    -193.134866   
550           -222.200012   
</BasePoints>
</Item>
</Trans>
<Trans>
48            "lambda_a"    44            
<Item>
<Position>
2520.800018   662.500000    
</Position>
<BasePoints>
69.499969     -48.600006    0             0             20.621062     -21.844339    
45.899963     -48.600006    79.199982     -83.300018    118.086857    -122.747149   
138.899994    -144.399977   
</BasePoints>
</Item>
</Trans>
</TransRel>
</GraphData>
</VioModels>
<VioLayout>
0             =AAAA/wAAAAAAAAADAAAAAAAAAa4AAAAAAQAAAAYBAAAAAQ=== 1             150           430           0.280140      
</VioLayout>
</VioGenerator>
</Value>
</Variable>
</VariablePool>

<Script>

<Operations>

<Parallel>
"AnonymousOperation_1182112391" 1             
<Parameters>
<Vector>
"MachineA"    "MachineB"    "MachineC"    
</Vector>
"PlantABC"    
</Parameters>
<Options>
"Clear Operands" 0             "Minimal Realisation" 0             "Clear State Names" 0             
</Options>
</Parallel>

<Parallel>
"AnonymousOperation_16807" 0             
<Parameters>
"BufferAB"    "BufferBC"    "BufferABC"   
</Parameters>
<Options>
"Clear Operands" 0             "Minimal Realisation" 0             "Clear State Names" 0             
</Options>
</Parallel>

<InvProject>
"AnonymousOperation_282475249" 1             
<Parameters>
"BufferABC"   "SigmaABC"    "FullBufferABC" 
</Parameters>
<Options>
"Clear Operands" 0             "Minimal Realisation" 0             "Clear State Names" 0             
</Options>
</InvProject>

<SupConNB>
"AnonymousOperation_1622650073" 0             
<Parameters>
"PlantABC"    "FullBufferABC" "SuperABC"    
</Parameters>
<Options>
"Clear Operands" 0             "Minimal Realisation" 1             "Clear State Names" 1             
</Options>
</SupConNB>

</Operations>
</Script>

<Simulator>

+Supervisor+  +Plant+       
<Files>
</Files>
<SimEvents>
"alpha_a"     
<Priority>
0             
</Priority>
"beta_a"      
<Stochastic>
+Trigger+     +Gauss+       
<Parameter>
0             inf           10            5             
</Parameter>
</Stochastic>
"mue_a"       
<Stochastic>
+Delay+       +Exponential+ 
<Parameter>
0             inf           30            
</Parameter>
</Stochastic>
"lambda_a"    
<Stochastic>
+Extern+      +Gauss+       
<Parameter>
0             20            10            5             
</Parameter>
</Stochastic>
"alpha_b"     
<Priority>
0             
</Priority>
"beta_b"      
<Stochastic>
+Trigger+     +Gauss+       
<Parameter>
0             inf           20            5             
</Parameter>
</Stochastic>
"mue_b"       
<Stochastic>
+Delay+       +Exponential+ 
<Parameter>
0             inf           50            
</Parameter>
</Stochastic>
"lambda_b"    
<Stochastic>
+Trigger+     +Gauss+       
<Parameter>
0             inf           10            5             
</Parameter>
</Stochastic>
"alpha_c"     
<Priority>
0             
</Priority>
"beta_c"      
<Priority>
0             
</Priority>
"mue_c"       
<Priority>
0             
</Priority>
"lambda_c"    
<Priority>
0             
</Priority>
</SimEvents>
<Conditions>
"downA"       
<EventCondition>
+Enabled+     
<StartEvents>
"mue_a"       
</StartEvents>
<StopEvents>
"lambda_a"    
</StopEvents>
</EventCondition>
"downB"       
<EventCondition>
+Enabled+     
<StartEvents>
"mue_b"       
</StartEvents>
<StopEvents>
"lambda_b"    
</StopEvents>
</EventCondition>
"perfB"       
<EventCondition>
+Enabled+     
<StartEvents>
"alpha_b"     
</StartEvents>
<StopEvents>
"beta_b"      
</StopEvents>
</EventCondition>
</Conditions>
</Simulator>
<GuiState>
</GuiState>
</Project>
