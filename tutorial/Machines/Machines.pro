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
"BufferAB"    "System"      +Visual+      +Shown+       +Plant+       
<File>
"BufferAB.vio" 
</File>
</Variable>
<Variable>
"Sigma"       "EventSet"    +Visual+      
<File>
"SigmaAB.vio" 
</File>
</Variable>
<Variable>
"PlantAB"     "System"      +Visual+      
<Value>
<VioSystem>
<Generator>
"PlantAB"     

% 
%  Statistics for PlantAB
% 
%  States:        9
%  Init/Marked:   1/1
%  Events:        8
%  Transitions:   24
%  StateSymbols:  9
%  Attrib. E/S/T: 4/0/0
% 

<Alphabet>
"alpha_a"     +C+           "beta_a"      "mue_a"       "lambda_a"    +C+           
"alpha_b"     +C+           "beta_b"      "mue_b"       "lambda_b"    +C+           
</Alphabet>

<States>
"I|I"         "B|I"         "I|B"         "B|B"         "I|D"         "B|D"         
"D|D"         "D|I"         "D|B"         
</States>

<TransRel>
"I|I"         "alpha_a"     "B|I"         
"I|I"         "alpha_b"     "I|B"         
"B|I"         "beta_a"      "I|I"         
"B|I"         "mue_a"       "D|I"         
"B|I"         "alpha_b"     "B|B"         
"I|B"         "alpha_a"     "B|B"         
"I|B"         "beta_b"      "I|I"         
"I|B"         "mue_b"       "I|D"         
"B|B"         "beta_a"      "I|B"         
"B|B"         "mue_a"       "D|B"         
"B|B"         "beta_b"      "B|I"         
"B|B"         "mue_b"       "B|D"         
"I|D"         "alpha_a"     "B|D"         
"I|D"         "lambda_b"    "I|I"         
"B|D"         "beta_a"      "I|D"         
"B|D"         "mue_a"       "D|D"         
"B|D"         "lambda_b"    "B|I"         
"D|D"         "lambda_a"    "I|D"         
"D|D"         "lambda_b"    "D|I"         
"D|I"         "lambda_a"    "I|I"         
"D|I"         "alpha_b"     "D|B"         
"D|B"         "lambda_a"    "I|B"         
"D|B"         "beta_b"      "D|I"         
"D|B"         "mue_b"       "D|D"         
</TransRel>

<InitStates>
"I|I"         
</InitStates>

<MarkedStates>
"I|I"         
</MarkedStates>


</Generator>
<VioModels>
<TransitionList>
=AAAAGAEAAAABAAAADgBhAGwAcABoAGEAXwBhAAAAAgEAAAABAAAADgBhAGwAcABoAGEAXwBiAAAAAwEAAAACAAAADABiAGUAdABhAF8AYQAAAAEBAAAAAgAAAAoAbQB1AGUAXwBhAAAACAEAAAACAAAADgBhAGwAcABoAGEAXwBiAAAABAEAAAADAAAADgBhAGwAcABoAGEAXwBhAAAABAEAAAADAAAADABiAGUAdABhAF8AYgAAAAEBAAAAAwAAAAoAbQB1AGUAXwBiAAAABQEAAAAEAAAADABiAGUAdABhAF8AYQAAAAMBAAAABAAAAAoAbQB1AGUAXwBhAAAACQEAAAAEAAAADABiAGUAdABhAF8AYgAAAAIBAAAABAAAAAoAbQB1AGUAXwBiAAAABgEAAAAFAAAADgBhAGwAcABoAGEAXwBhAAAABgEAAAAFAAAAEABsAGEAbQBiAGQAYQBfAGIAAAABAQAAAAYAAAAMAGIAZQB0AGEAXwBhAAAABQEAAAAGAAAACgBtAHUAZQBfAGEAAAAHAQAAAAYAAAAQAGwAYQBtAGIAZABhAF8AYgAAAAIBAAAABwAAABAAbABhAG0AYgBkAGEAXwBhAAAABQEAAAAHAAAAEABsAGEAbQBiAGQAYQBfAGIAAAAIAQAAAAgAAAAQAGwAYQBtAGIAZABhAF8AYQAAAAEBAAAACAAAAA4AYQBsAHAAaABhAF8AYgAAAAkBAAAACQAAABAAbABhAG0AYgBkAGEAXwBhAAAAAwEAAAAJAAAADABiAGUAdABhAF8AYgAAAAgBAAAACQAAAAoAbQB1AGUAXwBiAAAABw=== </TransitionList>
<StateList>
=AAAACQIAAAABAgAAAAICAAAAAwIAAAAEAgAAAAUCAAAABgIAAAAHAgAAAAgCAAAACQ=== </StateList>
<EventList>
=AAAACAMAAAAOAGEAbABwAGgAYQBfAGEDAAAADABiAGUAdABhAF8AYQMAAAAKAG0AdQBlAF8AYQMAAAAQAGwAYQBtAGIAZABhAF8AYQMAAAAOAGEAbABwAGgAYQBfAGIDAAAADABiAGUAdABhAF8AYgMAAAAKAG0AdQBlAF8AYgMAAAAQAGwAYQBtAGIAZABhAF8AYg=== </EventList>
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
</VioSystem>
</Value>
</Variable>
<Variable>
"FullBufferAB" "System"      +Visual+      
<Value>
<VioSystem>
<Generator>
"FullBufferAB" 

% 
%  Statistics for FullBufferAB
% 
%  States:        2
%  Init/Marked:   1/1
%  Events:        8
%  Transitions:   14
%  StateSymbols:  2
%  Attrib. E/S/T: 0/0/0
% 

<Alphabet>
"alpha_a"     "beta_a"      "mue_a"       "lambda_a"    "alpha_b"     "beta_b"      
"mue_b"       "lambda_b"    
</Alphabet>

<States>
"E"           "F"           
</States>

<TransRel>
"E"           "alpha_a"     "E"           
"E"           "beta_a"      "F"           
"E"           "mue_a"       "E"           
"E"           "lambda_a"    "E"           
"E"           "beta_b"      "E"           
"E"           "mue_b"       "E"           
"E"           "lambda_b"    "E"           
"F"           "alpha_a"     "F"           
"F"           "mue_a"       "F"           
"F"           "lambda_a"    "F"           
"F"           "alpha_b"     "E"           
"F"           "beta_b"      "F"           
"F"           "mue_b"       "F"           
"F"           "lambda_b"    "F"           
</TransRel>

<InitStates>
"E"           
</InitStates>

<MarkedStates>
"E"           
</MarkedStates>


</Generator>
<VioModels>
<TransitionList>
=AAAADgEAAAABAAAADgBhAGwAcABoAGEAXwBhAAAAAQEAAAABAAAADABiAGUAdABhAF8AYQAAAAIBAAAAAQAAAAoAbQB1AGUAXwBhAAAAAQEAAAABAAAAEABsAGEAbQBiAGQAYQBfAGEAAAABAQAAAAEAAAAMAGIAZQB0AGEAXwBiAAAAAQEAAAABAAAACgBtAHUAZQBfAGIAAAABAQAAAAEAAAAQAGwAYQBtAGIAZABhAF8AYgAAAAEBAAAAAgAAAA4AYQBsAHAAaABhAF8AYQAAAAIBAAAAAgAAAAoAbQB1AGUAXwBhAAAAAgEAAAACAAAAEABsAGEAbQBiAGQAYQBfAGEAAAACAQAAAAIAAAAOAGEAbABwAGgAYQBfAGIAAAABAQAAAAIAAAAMAGIAZQB0AGEAXwBiAAAAAgEAAAACAAAACgBtAHUAZQBfAGIAAAACAQAAAAIAAAAQAGwAYQBtAGIAZABhAF8AYgAAAAI== </TransitionList>
<StateList>
=AAAAAgIAAAABAgAAAAI== </StateList>
<EventList>
=AAAACAMAAAAOAGEAbABwAGgAYQBfAGEDAAAADABiAGUAdABhAF8AYQMAAAAKAG0AdQBlAF8AYQMAAAAQAGwAYQBtAGIAZABhAF8AYQMAAAAOAGEAbABwAGgAYQBfAGIDAAAADABiAGUAdABhAF8AYgMAAAAKAG0AdQBlAF8AYgMAAAAQAGwAYQBtAGIAZABhAF8AYg=== </EventList>
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
-30.058393    0             
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
-30.058393    0             
</BasePoints>
</Item>
</State>
</States>
<TransRel>
<Trans>
1             "alpha_a"     1             +Spline+      
<Item>
<Position>
0             40            
</Position>
<BasePoints>
0             -80.595703    0             0             13.406318     -26.812636    
40.297852     -80.595703    -40.297852    -80.595703    -13.445633    -26.891265    
0             0             
</BasePoints>
</Item>
</Trans>
<Trans>
1             "beta_a"      2             +Line+        
<Item>
<Position>
0             40            
</Position>
<BasePoints>
50            10            0             0             30.058393     0             
43.209961     0             56.390625     0             69.941607     0             
100           0             
</BasePoints>
</Item>
</Trans>
<Trans>
1             "mue_a"       1             +Spline+      
<Item>
<Position>
0             40            
</Position>
<BasePoints>
0             -80.595703    0             0             13.406318     -26.812636    
40.297852     -80.595703    -40.297852    -80.595703    -13.445633    -26.891265    
0             0             
</BasePoints>
</Item>
</Trans>
<Trans>
1             "lambda_a"    1             +Spline+      
<Item>
<Position>
0             40            
</Position>
<BasePoints>
0             -80.595703    0             0             13.406318     -26.812636    
40.297852     -80.595703    -40.297852    -80.595703    -13.445633    -26.891265    
0             0             
</BasePoints>
</Item>
</Trans>
<Trans>
1             "beta_b"      1             +Spline+      
<Item>
<Position>
0             40            
</Position>
<BasePoints>
0             -80.595703    0             0             13.406318     -26.812636    
40.297852     -80.595703    -40.297852    -80.595703    -13.445633    -26.891265    
0             0             
</BasePoints>
</Item>
</Trans>
<Trans>
1             "mue_b"       1             +Spline+      
<Item>
<Position>
0             40            
</Position>
<BasePoints>
0             -80.595703    0             0             13.406318     -26.812636    
40.297852     -80.595703    -40.297852    -80.595703    -13.445633    -26.891265    
0             0             
</BasePoints>
</Item>
</Trans>
<Trans>
1             "lambda_b"    1             +Spline+      
<Item>
<Position>
0             40            
</Position>
<BasePoints>
0             -80.595703    0             0             13.406318     -26.812636    
40.297852     -80.595703    -40.297852    -80.595703    -13.445633    -26.891265    
0             0             
</BasePoints>
</Item>
</Trans>
<Trans>
2             "alpha_a"     2             +Spline+      
<Item>
<Position>
100           40            
</Position>
<BasePoints>
0             -80.595703    0             0             13.406318     -26.812636    
40.297852     -80.595703    -40.297852    -80.595703    -13.445633    -26.891265    
0             0             
</BasePoints>
</Item>
</Trans>
<Trans>
2             "mue_a"       2             +Spline+      
<Item>
<Position>
100           40            
</Position>
<BasePoints>
0             -80.595703    0             0             13.406318     -26.812636    
40.297852     -80.595703    -40.297852    -80.595703    -13.445633    -26.891265    
0             0             
</BasePoints>
</Item>
</Trans>
<Trans>
2             "lambda_a"    2             +Spline+      
<Item>
<Position>
100           40            
</Position>
<BasePoints>
0             -80.595703    0             0             13.406318     -26.812636    
40.297852     -80.595703    -40.297852    -80.595703    -13.445633    -26.891265    
0             0             
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
-50           -10           0             0             -30.058393    0             
-43.209961    0             -56.390625    0             -69.941607    0             
-100          0             
</BasePoints>
</Item>
</Trans>
<Trans>
2             "beta_b"      2             +Spline+      
<Item>
<Position>
100           40            
</Position>
<BasePoints>
0             -80.595703    0             0             13.406318     -26.812636    
40.297852     -80.595703    -40.297852    -80.595703    -13.445633    -26.891265    
0             0             
</BasePoints>
</Item>
</Trans>
<Trans>
2             "mue_b"       2             +Spline+      
<Item>
<Position>
100           40            
</Position>
<BasePoints>
0             -80.595703    0             0             13.406318     -26.812636    
40.297852     -80.595703    -40.297852    -80.595703    -13.445633    -26.891265    
0             0             
</BasePoints>
</Item>
</Trans>
<Trans>
2             "lambda_b"    2             +Spline+      
<Item>
<Position>
100           40            
</Position>
<BasePoints>
0             -80.595703    0             0             13.406318     -26.812636    
40.297852     -80.595703    -40.297852    -80.595703    -13.445633    -26.891265    
0             0             
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
"SuperAB"     "System"      +Visual+      +Shown+       +Supervisor+  
<Value>
<VioSystem>
<Generator>
"SuperAB"     

% 
%  Statistics for SuperAB
% 
%  States:        12
%  Init/Marked:   1/1
%  Events:        8
%  Transitions:   25
%  StateSymbols:  12
%  Attrib. E/S/T: 4/0/0
% 

<Alphabet>
"alpha_a"     +C+           "beta_a"      "mue_a"       "lambda_a"    +C+           
"alpha_b"     +C+           "beta_b"      "mue_b"       "lambda_b"    +C+           
</Alphabet>

<States>
"I|I|E"       "B|I|E"       "I|I|F"       "D|I|E"       "I|B|E"       "B|B|E"       
"I|D|E"       "B|D|E"       "I|D|F"       "D|D|E"       "I|B|F"       "D|B|E"       
</States>

<TransRel>
"I|I|E"       "alpha_a"     "B|I|E"       
"B|I|E"       "beta_a"      "I|I|F"       
"B|I|E"       "mue_a"       "D|I|E"       
"I|I|F"       "alpha_b"     "I|B|E"       
"D|I|E"       "lambda_a"    "I|I|E"       
"I|B|E"       "alpha_a"     "B|B|E"       
"I|B|E"       "beta_b"      "I|I|E"       
"I|B|E"       "mue_b"       "I|D|E"       
"B|B|E"       "beta_a"      "I|B|F"       
"B|B|E"       "mue_a"       "D|B|E"       
"B|B|E"       "beta_b"      "B|I|E"       
"B|B|E"       "mue_b"       "B|D|E"       
"I|D|E"       "alpha_a"     "B|D|E"       
"I|D|E"       "lambda_b"    "I|I|E"       
"B|D|E"       "beta_a"      "I|D|F"       
"B|D|E"       "mue_a"       "D|D|E"       
"B|D|E"       "lambda_b"    "B|I|E"       
"I|D|F"       "lambda_b"    "I|I|F"       
"D|D|E"       "lambda_a"    "I|D|E"       
"D|D|E"       "lambda_b"    "D|I|E"       
"I|B|F"       "beta_b"      "I|I|F"       
"I|B|F"       "mue_b"       "I|D|F"       
"D|B|E"       "lambda_a"    "I|B|E"       
"D|B|E"       "beta_b"      "D|I|E"       
"D|B|E"       "mue_b"       "D|D|E"       
</TransRel>

<InitStates>
"I|I|E"       
</InitStates>

<MarkedStates>
"I|I|E"       
</MarkedStates>


</Generator>
<VioModels>
<TransitionList>
=AAAAGQEAAAABAAAADgBhAGwAcABoAGEAXwBhAAAAAgEAAAACAAAADABiAGUAdABhAF8AYQAAAAMBAAAAAgAAAAoAbQB1AGUAXwBhAAAABAEAAAAEAAAAEABsAGEAbQBiAGQAYQBfAGEAAAABAQAAAAYAAAAKAG0AdQBlAF8AYgAAAAgBAAAAAwAAAA4AYQBsAHAAaABhAF8AYgAAAAYBAAAABgAAAA4AYQBsAHAAaABhAF8AYQAAAAcBAAAABgAAAAwAYgBlAHQAYQBfAGIAAAABAQAAAAcAAAAMAGIAZQB0AGEAXwBhAAAADQEAAAAHAAAACgBtAHUAZQBfAGEAAAAOAQAAAAcAAAAMAGIAZQB0AGEAXwBiAAAAAgEAAAAHAAAACgBtAHUAZQBfAGIAAAAJAQAAAAgAAAAOAGEAbABwAGgAYQBfAGEAAAAJAQAAAAgAAAAQAGwAYQBtAGIAZABhAF8AYgAAAAEBAAAACQAAAAwAYgBlAHQAYQBfAGEAAAAKAQAAAAkAAAAKAG0AdQBlAF8AYQAAAAsBAAAACQAAABAAbABhAG0AYgBkAGEAXwBiAAAAAgEAAAAKAAAAEABsAGEAbQBiAGQAYQBfAGIAAAADAQAAAAsAAAAQAGwAYQBtAGIAZABhAF8AYQAAAAgBAAAACwAAABAAbABhAG0AYgBkAGEAXwBiAAAABAEAAAANAAAADABiAGUAdABhAF8AYgAAAAMBAAAADQAAAAoAbQB1AGUAXwBiAAAACgEAAAAOAAAAEABsAGEAbQBiAGQAYQBfAGEAAAAGAQAAAA4AAAAMAGIAZQB0AGEAXwBiAAAABAEAAAAOAAAACgBtAHUAZQBfAGIAAAAL= </TransitionList>
<StateList>
=AAAADAIAAAABAgAAAAICAAAAAwIAAAAEAgAAAAYCAAAABwIAAAAIAgAAAAkCAAAACgIAAAALAgAAAA0CAAAADg=== </StateList>
<EventList>
=AAAACAMAAAAOAGEAbABwAGgAYQBfAGEDAAAADABiAGUAdABhAF8AYQMAAAAKAG0AdQBlAF8AYQMAAAAQAGwAYQBtAGIAZABhAF8AYQMAAAAOAGEAbABwAGgAYQBfAGIDAAAADABiAGUAdABhAF8AYgMAAAAKAG0AdQBlAF8AYgMAAAAQAGwAYQBtAGIAZABhAF8AYg=== </EventList>
<GraphData>
<States>
<State>
1             
<Item>
<Position>
27.800000     376.399994    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999800    0             
</BasePoints>
</Item>
</State>
<State>
2             
<Item>
<Position>
152.800000    254.200006    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029039    0             
</BasePoints>
</Item>
</State>
<State>
3             
<Item>
<Position>
277.800012    187.500000    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.028868    0             
</BasePoints>
</Item>
</State>
<State>
4             
<Item>
<Position>
930.599976    140.300000    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029211    0             
</BasePoints>
</Item>
</State>
<State>
6             
<Item>
<Position>
402.799988    422.200012    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999628    0             
</BasePoints>
</Item>
</State>
<State>
7             
<Item>
<Position>
527.799988    355.599999    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999628    0             
</BasePoints>
</Item>
</State>
<State>
8             
<Item>
<Position>
527.799988    529.199982    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029211    0             
</BasePoints>
</Item>
</State>
<State>
9             
<Item>
<Position>
659.700012    316.700006    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
10            
<Item>
<Position>
798.600006    205.599999    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029211    0             
</BasePoints>
</Item>
</State>
<State>
11            
<Item>
<Position>
798.600006    325           
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029211    0             
</BasePoints>
</Item>
</State>
<State>
13            
<Item>
<Position>
659.700012    211.100006    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.058307    0             
</BasePoints>
</Item>
</State>
<State>
14            
<Item>
<Position>
659.700012    411.100006    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029211    0             
</BasePoints>
</Item>
</State>
</States>
<TransRel>
<Trans>
1             "alpha_a"     2             
<Item>
<Position>
27.800000     376.399994    
</Position>
<BasePoints>
62.500000     -38.899994    0             0             21.160055     -21.269119    
40.300000     -40.299988    72.200000     -69.499993    103.714485    -100.987381   
125           -122.199988   
</BasePoints>
</Item>
</Trans>
<Trans>
2             "beta_a"      3             
<Item>
<Position>
152.800000    254.200006    
</Position>
<BasePoints>
62.500012     -26.399994    0             0             21.896681     -20.528162    
29.100001     -27.800012    41.600001     -36.100006    52.800000     -43.099999    
62.500012     -47.300005    73.599994     -51.399994    95.965003     -58.971267    
125.000012    -66.700006    
</BasePoints>
</Item>
</Trans>
<Trans>
2             "mue_a"       4             
<Item>
<Position>
152.800000    254.200006    
</Position>
<BasePoints>
374.999988    -177.800006   0             0             5.832952      -29.482963    
16.600001     -80.600011    48.599994     -190.300006   125.000012    -190.300006   
125.000012    -190.300006   125.000012    -190.300006   645.800006    -190.300006   
686.099994    -190.300006   723.599994    -165.300006   756.550930    -135.149069   
777.799976    -113.900006   
</BasePoints>
</Item>
</Trans>
<Trans>
3             "alpha_b"     6             
<Item>
<Position>
277.800012    187.500000    
</Position>
<BasePoints>
62.500000     126.399994    0             0             17.280601     24.567624     
31.899977     45.799994     55.499983     81.900001     72.199988     113.899994    
86.099982     140.300012    100           170.799994    114.346914    206.639956    
124.999976    234.700012    
</BasePoints>
</Item>
</Trans>
<Trans>
4             "lambda_a"    1             
<Item>
<Position>
930.599976    140.300000    
</Position>
<BasePoints>
-465.299988   -127.800000   0             0             -11.737360    -27.666749    
-29.199982    -66.700000    -69.499969    -140.300000   -131.999969   -140.300000   
-777.799976   -140.300000   -777.799976   -140.300000   -777.799976   -140.300000   
-847.299975   -140.300000   -884.799975   95.800006     -899.865120   206.250369    
-902.799976   236.099994    
</BasePoints>
</Item>
</Trans>
<Trans>
6             "beta_b"      1             
<Item>
<Position>
402.799988    422.200012    
</Position>
<BasePoints>
-187.499976   -12.500000    0             0             -29.866850    -3.008211     
-93.099999    -12.500000    -255.599988   -31.900001    -345.170113   -42.788344    
-374.999988   -45.800018    
</BasePoints>
</Item>
</Trans>
<Trans>
6             "alpha_a"     7             
<Item>
<Position>
402.799988    422.200012    
</Position>
<BasePoints>
62.500000     -18.000031    0             0             26.858690     -13.429345    
43.000031     -20.800018    68.000031     -34.700012    98.768618     -52.050343    
125           -66.600013    
</BasePoints>
</Item>
</Trans>
<Trans>
6             "mue_b"       8             
<Item>
<Position>
402.799988    422.200012    
</Position>
<BasePoints>
62.500000     69.499969     0             0             22.672081     19.729027     
40.300035     34.699965     69.400024     59.699965     102.366156    87.336807     
125           106.999969    
</BasePoints>
</Item>
</Trans>
<Trans>
7             "beta_b"      2             
<Item>
<Position>
527.799988    355.599999    
</Position>
<BasePoints>
-187.499976   -19.499993    0             0             -29.866850    -3.008160     
-66.699982    -6.999993     -137.499976   -15.299988    -197.199988   -30.599999    
-245.899987   -44.499993    -301.399994   -68.099999    -347.963738   -88.422606    
-374.999988   -101.399994   
</BasePoints>
</Item>
</Trans>
<Trans>
7             "mue_b"       9             
<Item>
<Position>
527.799988    355.599999    
</Position>
<BasePoints>
62.500000     -6.999993     0             0             28.588907     -9.096485     
45.800018     -13.899994    70.800018     -20.900011    103.238208    -30.009860    
131.900024    -38.899994    
</BasePoints>
</Item>
</Trans>
<Trans>
7             "beta_a"      13            
<Item>
<Position>
527.799988    355.599999    
</Position>
<BasePoints>
62.500000     -45.900011    0             0             20.402895     -21.980422    
40.300035     -44.499993    73.600006     -80.599999    111.535842    -122.423531   
131.900024    -144.499993   
</BasePoints>
</Item>
</Trans>
<Trans>
7             "mue_a"       14            
<Item>
<Position>
527.799988    355.599999    
</Position>
<BasePoints>
62.500000     38.800001     0             0             27.661700     11.630496     
43.000031     19.400001     66.599989     29.099989     104.052684    44.210546     
131.900024    55.500007     
</BasePoints>
</Item>
</Trans>
<Trans>
8             "lambda_b"    1             
<Item>
<Position>
527.799988    529.199982    
</Position>
<BasePoints>
-249.999976   18.000031     0             0             -29.896302    2.903594      
-52.799988    4.100037      -90.299988    6.900024      -125          6.900024      
-374.999988   6.900024      -374.999988   6.900024      -374.999988   6.900024      
-434.699988   6.900024      -470.899987   -65.299988    -492.032726   -123.873810   
-499.999988   -152.799988   
</BasePoints>
</Item>
</Trans>
<Trans>
8             "alpha_a"     9             
<Item>
<Position>
527.799988    529.199982    
</Position>
<BasePoints>
62.500000     -72.300005    0             0             16.345890     -25.213165    
30.500031     -47.300005    54.099989     -83.399963    72.200012     -116.699982   
84.700012     -138.899970   84.700012     -145.899987   97.200012     -165.299988   
100           -169.499993   102.800035    -174.999976   113.854146    -188.462870   
131.900024    -212.499976   
</BasePoints>
</Item>
</Trans>
<Trans>
9             "lambda_b"    2             
<Item>
<Position>
659.700012    316.700006    
</Position>
<BasePoints>
-256.900024   -50           0             0             -21.896769    -20.528221    
-31.900024    -27.800012    -45.800018    -37.500000    -59.700012    -43.099999    
-115.300035   -65.300012    -133.300018   -62.500000    -194.400024   -62.500000    
-381.900001   -62.500000    -381.900001   -62.500000    -381.900001   -62.500000    
-409.700012   -62.500000    -440.300012   -62.500000    -476.878309   -62.500000    
-506.900012   -62.500000    
</BasePoints>
</Item>
</Trans>
<Trans>
9             "beta_a"      10            
<Item>
<Position>
659.700012    316.700006    
</Position>
<BasePoints>
69.499969     -34.800005    0             0             23.283814     -18.983680    
43.099976     -34.800005    75            -59.800005    115.689290    -92.066033    
138.899994    -111.100006   
</BasePoints>
</Item>
</Trans>
<Trans>
9             "mue_a"       11            
<Item>
<Position>
659.700012    316.700006    
</Position>
<BasePoints>
69.499969     12.500000     0             0             30.025987     0             
43.099976     0             62.500000     1.399994      79.199982     1.399994      
83.400011     1.399994      87.500000     2.699995      109.077500    4.761734      
138.899994    8.299994      
</BasePoints>
</Item>
</Trans>
<Trans>
10            "lambda_b"    3             
<Item>
<Position>
798.600006    205.599999    
</Position>
<BasePoints>
-270.800018   -55.599999    0             0             -22.919460    -19.360008    
-52.799988    -41.699994    -95.800018    -68.099999    -138.899994   -68.099999    
-395.800018   -68.099999    -395.800018   -68.099999    -395.800018   -68.099999    
-427.800012   -68.099999    -461.100006   -54.199994    -495.240998   -33.817728    
-520.799994   -18.099999    
</BasePoints>
</Item>
</Trans>
<Trans>
11            "lambda_b"    4             
<Item>
<Position>
798.600006    325           
</Position>
<BasePoints>
69.499969     -68.099999    0             0             17.233810     -24.569276    
41.699982     -59.699988    81.999969     -115.300012   114.446309    -160.335519   
131.999969    -184.700000   
</BasePoints>
</Item>
</Trans>
<Trans>
11            "lambda_a"    8             
<Item>
<Position>
798.600006    325           
</Position>
<BasePoints>
-138.899994   181.899977    0             0             -14.889730    26.034696     
-34.700012    59.699988     -65.299988    104.199982    -104.200029   133.300018    
-141.700029   162.500000    -194.400024   181.899977    -241.873806   196.232749    
-270.800018   204.199982    
</BasePoints>
</Item>
</Trans>
<Trans>
13            "beta_b"      3             
<Item>
<Position>
659.700012    211.100006    
</Position>
<BasePoints>
-194.400024   2.799988      0             0             -29.950890    -2.416796     
-105.500031   -6.900001     -263.900018   -16.700006    -351.930459   -21.582825    
-381.900001   -23.600006    
</BasePoints>
</Item>
</Trans>
<Trans>
13            "mue_b"       10            
<Item>
<Position>
659.700012    211.100006    
</Position>
<BasePoints>
69.499969     12.500000     0             0             29.950849     -2.416796     
43.099976     -2.800012     51.399994     -4.200006     59.699965     -4.200006     
69.499969     -4.200006     80.599976     -4.200006     108.916123    -5.500007     
138.899994    -5.500007     
</BasePoints>
</Item>
</Trans>
<Trans>
14            "beta_b"      4             
<Item>
<Position>
659.700012    411.100006    
</Position>
<BasePoints>
138.899994    2.799988      0             0             29.989630     1.209952      
73.600006     0             134.699965    -6.900024     173.600006    -40.300012    
230.599976    -88.900018    255.599976    -176.400018   265.916601    -241.184465   
270.899963    -270.800006   
</BasePoints>
</Item>
</Trans>
<Trans>
14            "lambda_a"    6             
<Item>
<Position>
659.700012    411.100006    
</Position>
<BasePoints>
-131.900024   18.099976     0             0             -29.921898    2.414436      
-72.200012    5.599976      -131.900024   9.700012      -184.700012   11.100006     
-194.400024   11.100006     -205.500031   11.100006     -226.878243   11.100006     
-256.900024   11.100006     
</BasePoints>
</Item>
</Trans>
<Trans>
14            "mue_b"       11            
<Item>
<Position>
659.700012    411.100006    
</Position>
<BasePoints>
69.499969     -26.400018    0             0             25.008116     -16.614992    
38.899994     -25           50            -31.900001    59.699965     -37.500000    
72.199965     -45.799994    86.100006     -54.200006    113.128699    -70.649600    
138.899994    -86.100006    
</BasePoints>
</Item>
</Trans>
</TransRel>
</GraphData>
</VioModels>
<VioLayout>
0             =evavtQAAQQBuAG8AbgB5AG0AbwB1AHMATwBwAGUAcgBhAA=== 0             150           775           0.679379      
</VioLayout>
</VioSystem>
</Value>
</Variable>
</VariablePool>

<Script>

<Operations>

<Parallel>
"AnonymousOperation_16807" 0             
<Parameters>
"MachineA"    "MachineB"    "PlantAB"     
</Parameters>
<Options>
"Clear Operands" 0             "Minimal Realisation" 0             "Clear State Names" 0             
</Options>
</Parallel>

<InvProject>
"AnonymousOperation_282475249" 1             
<Parameters>
"BufferAB"    "Sigma"       "FullBufferAB" 
</Parameters>
<Options>
"Clear Operands" 0             "Minimal Realisation" 0             "Clear State Names" 0             
</Options>
</InvProject>

<SupConNB>
"AnonymousOperation_1622650073" 0             
<Parameters>
"PlantAB"     "FullBufferAB" "SuperAB"     
</Parameters>
<Options>
"Clear Operands" 0             "Minimal Realisation" 0             "Clear State Names" 0             
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
