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
"BufferSize"  "Integer"     
<Value>
<Integer>
10            
</Integer>
</Value>
</Variable>
<Variable>
"BufferAB"    "Generator"   +Visual+      +Plant+       
<Value>
<VioGenerator>
<Generator>
"BufferAB"    

% 
%  Statistics for BufferAB
% 
%  States:        10
%  Init/Marked:   1/1
%  Events:        2
%  Transitions:   18
%  StateSymbols:  10
%  Attrib. E/S/T: 0/0/0
% 

<Alphabet>
"beta_a"      "alpha_b"     
</Alphabet>

<States>
"s1"          "s2"          "s3"          "s4"          "s5"          "s6"          
"s7"          "s8"          "s9"          "s10"         
</States>

<TransRel>
"s1"          "beta_a"      "s2"          
"s2"          "beta_a"      "s3"          
"s2"          "alpha_b"     "s1"          
"s3"          "beta_a"      "s4"          
"s3"          "alpha_b"     "s2"          
"s4"          "beta_a"      "s5"          
"s4"          "alpha_b"     "s3"          
"s5"          "beta_a"      "s6"          
"s5"          "alpha_b"     "s4"          
"s6"          "beta_a"      "s7"          
"s6"          "alpha_b"     "s5"          
"s7"          "beta_a"      "s8"          
"s7"          "alpha_b"     "s6"          
"s8"          "beta_a"      "s9"          
"s8"          "alpha_b"     "s7"          
"s9"          "beta_a"      "s10"         
"s9"          "alpha_b"     "s8"          
"s10"         "alpha_b"     "s9"          
</TransRel>

<InitStates>
"s1"          
</InitStates>

<MarkedStates>
"s1"          
</MarkedStates>


</Generator>
<VioModels>
<TransitionList>
=AAAAEgEAAAABAAAADABiAGUAdABhAF8AYQAAAAIBAAAAAgAAAAwAYgBlAHQAYQBfAGEAAAADAQAAAAIAAAAOAGEAbABwAGgAYQBfAGIAAAABAQAAAAMAAAAMAGIAZQB0AGEAXwBhAAAABAEAAAADAAAADgBhAGwAcABoAGEAXwBiAAAAAgEAAAAEAAAADABiAGUAdABhAF8AYQAAAAUBAAAABAAAAA4AYQBsAHAAaABhAF8AYgAAAAMBAAAABQAAAAwAYgBlAHQAYQBfAGEAAAAGAQAAAAUAAAAOAGEAbABwAGgAYQBfAGIAAAAEAQAAAAYAAAAMAGIAZQB0AGEAXwBhAAAABwEAAAAGAAAADgBhAGwAcABoAGEAXwBiAAAABQEAAAAHAAAADABiAGUAdABhAF8AYQAAAAgBAAAABwAAAA4AYQBsAHAAaABhAF8AYgAAAAYBAAAACAAAAAwAYgBlAHQAYQBfAGEAAAAJAQAAAAgAAAAOAGEAbABwAGgAYQBfAGIAAAAHAQAAAAkAAAAMAGIAZQB0AGEAXwBhAAAACgEAAAAJAAAADgBhAGwAcABoAGEAXwBiAAAACAEAAAAKAAAADgBhAGwAcABoAGEAXwBiAAAACQ=== </TransitionList>
<StateList>
=AAAACgIAAAABAgAAAAICAAAAAwIAAAAEAgAAAAUCAAAABgIAAAAHAgAAAAgCAAAACQIAAAAK= </StateList>
<EventList>
=AAAAAgMAAAAMAGIAZQB0AGEAXwBhAwAAAA4AYQBsAHAAaABhAF8AYg=== </EventList>
<GraphData>
<States>
<State>
1             
<Item>
<Position>
27.800000     61.100000     
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.058479    0             
</BasePoints>
</Item>
</State>
<State>
2             
<Item>
<Position>
152.800000    61.100000     
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.058479    0             
</BasePoints>
</Item>
</State>
<State>
3             
<Item>
<Position>
277.800012    61.100000     
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.058479    0             
</BasePoints>
</Item>
</State>
<State>
4             
<Item>
<Position>
402.799988    61.100000     
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.058479    0             
</BasePoints>
</Item>
</State>
<State>
5             
<Item>
<Position>
527.799988    61.100000     
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.058479    0             
</BasePoints>
</Item>
</State>
<State>
6             
<Item>
<Position>
652.799988    61.100000     
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.058479    0             
</BasePoints>
</Item>
</State>
<State>
7             
<Item>
<Position>
777.799988    61.100000     
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.058479    0             
</BasePoints>
</Item>
</State>
<State>
8             
<Item>
<Position>
902.799988    61.100000     
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.058479    0             
</BasePoints>
</Item>
</State>
<State>
9             
<Item>
<Position>
1027.799988   61.100000     
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.058479    0             
</BasePoints>
</Item>
</State>
<State>
10            
<Item>
<Position>
1159.700012   61.100000     
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.058479    0             
</BasePoints>
</Item>
</State>
</States>
<TransRel>
<Trans>
1             "beta_a"      2             
<Item>
<Position>
27.800000     61.100000     
</Position>
<BasePoints>
62.500000     11.100000     0             0             29.996763     0             
44.400001     0             65.300000     0             95.016794     0             
125           0             
</BasePoints>
</Item>
</Trans>
<Trans>
2             "alpha_b"     1             
<Item>
<Position>
152.800000    61.100000     
</Position>
<BasePoints>
-62.500000    -16.700000    0             0             -23.954251    -18.019638    
-36.099994    -25           -54.200000    -31.900001    -72.200000    -27.800000    
-77.800000    -26.400000    -83.399999    -25           -99.465951    -15.702379    
-125          0             
</BasePoints>
</Item>
</Trans>
<Trans>
2             "beta_a"      3             
<Item>
<Position>
152.800000    61.100000     
</Position>
<BasePoints>
62.500012     11.100000     0             0             29.996763     0             
44.400001     0             65.300000     0             95.016805     0             
125.000012    0             
</BasePoints>
</Item>
</Trans>
<Trans>
3             "alpha_b"     2             
<Item>
<Position>
277.800012    61.100000     
</Position>
<BasePoints>
-62.500000    -16.700000    0             0             -23.954264    -18.019638    
-36.100006    -25           -54.200006    -31.900001    -72.200012    -27.800000    
-77.800012    -26.400000    -83.400011    -25           -99.465959    -15.702379    
-125.000012   0             
</BasePoints>
</Item>
</Trans>
<Trans>
3             "beta_a"      4             
<Item>
<Position>
277.800012    61.100000     
</Position>
<BasePoints>
62.500000     11.100000     0             0             29.996750     0             
44.399977     0             65.299988     0             95.016787     0             
124.999976    0             
</BasePoints>
</Item>
</Trans>
<Trans>
4             "alpha_b"     3             
<Item>
<Position>
402.799988    61.100000     
</Position>
<BasePoints>
-62.499976    -16.700000    0             0             -25.188568    -16.329888    
-31.999993    -20.800000    -43.099999    -25           -52.799988    -27.800000    
-65.299988    -30.500001    -77.799988    -27.800000    -99.888572    -16.416328    
-124.999976   0             
</BasePoints>
</Item>
</Trans>
<Trans>
4             "beta_a"      5             
<Item>
<Position>
402.799988    61.100000     
</Position>
<BasePoints>
62.500000     11.100000     0             0             29.996802     0             
44.400024     0             65.300035     0             95.016811     0             
125           0             
</BasePoints>
</Item>
</Trans>
<Trans>
5             "alpha_b"     4             
<Item>
<Position>
527.799988    61.100000     
</Position>
<BasePoints>
-62.500000    -16.700000    0             0             -23.954212    -18.019638    
-36.100006    -25           -54.199982    -31.900001    -72.199965    -27.800000    
-77.799988    -26.400000    -83.400011    -25           -99.465947    -15.702379    
-125          0             
</BasePoints>
</Item>
</Trans>
<Trans>
5             "beta_a"      6             
<Item>
<Position>
527.799988    61.100000     
</Position>
<BasePoints>
62.500000     11.100000     0             0             29.996802     0             
44.400024     0             65.300035     0             95.016811     0             
125           0             
</BasePoints>
</Item>
</Trans>
<Trans>
6             "alpha_b"     5             
<Item>
<Position>
652.799988    61.100000     
</Position>
<BasePoints>
-62.500000    -16.700000    0             0             -23.954212    -18.019638    
-36.100006    -25           -54.199982    -31.900001    -72.199965    -27.800000    
-77.799988    -26.400000    -83.400011    -25           -99.465947    -15.702379    
-125          0             
</BasePoints>
</Item>
</Trans>
<Trans>
6             "beta_a"      7             
<Item>
<Position>
652.799988    61.100000     
</Position>
<BasePoints>
62.500000     11.100000     0             0             29.996802     0             
44.400024     0             65.300035     0             95.016811     0             
125           0             
</BasePoints>
</Item>
</Trans>
<Trans>
7             "alpha_b"     6             
<Item>
<Position>
777.799988    61.100000     
</Position>
<BasePoints>
-62.500000    -16.700000    0             0             -23.954212    -18.019638    
-36.100006    -25           -54.199982    -31.900001    -72.199965    -27.800000    
-77.799988    -26.400000    -83.400011    -25           -99.465947    -15.702379    
-125          0             
</BasePoints>
</Item>
</Trans>
<Trans>
7             "beta_a"      8             
<Item>
<Position>
777.799988    61.100000     
</Position>
<BasePoints>
62.500000     11.100000     0             0             29.996750     0             
44.400024     0             65.299988     0             95.016811     0             
125           0             
</BasePoints>
</Item>
</Trans>
<Trans>
8             "alpha_b"     7             
<Item>
<Position>
902.799988    61.100000     
</Position>
<BasePoints>
-62.500000    -16.700000    0             0             -25.188593    -16.329888    
-31.999969    -20.800000    -43.099976    -25           -52.799988    -27.800000    
-65.299988    -30.500001    -77.799988    -27.800000    -99.888580    -16.416328    
-125          0             
</BasePoints>
</Item>
</Trans>
<Trans>
8             "beta_a"      9             
<Item>
<Position>
902.799988    61.100000     
</Position>
<BasePoints>
62.500000     11.100000     0             0             29.996750     0             
44.400024     0             65.299988     0             95.016811     0             
125           0             
</BasePoints>
</Item>
</Trans>
<Trans>
9             "alpha_b"     8             
<Item>
<Position>
1027.799988   61.100000     
</Position>
<BasePoints>
-62.500000    -16.700000    0             0             -25.188593    -16.329888    
-31.999969    -20.800000    -43.099976    -25           -52.799988    -27.800000    
-65.299988    -30.500001    -77.799988    -27.800000    -99.888580    -16.416328    
-125          0             
</BasePoints>
</Item>
</Trans>
<Trans>
9             "beta_a"      10            
<Item>
<Position>
1027.799988   61.100000     
</Position>
<BasePoints>
62.500000     11.100000     0             0             29.996750     0             
44.400024     0             63.899994     0             101.886672    0             
131.900024    0             
</BasePoints>
</Item>
</Trans>
<Trans>
10            "alpha_b"     9             
<Item>
<Position>
1159.700012   61.100000     
</Position>
<BasePoints>
-69.400024    -16.700000    0             0             -24.954961    -16.636620    
-44.400024    -26.400000    -62.500000    -31.900001    -79.100037    -27.800000    
-84.700012    -26.400000    -90.299988    -25           -106.365971   -15.702379    
-131.900024   0             
</BasePoints>
</Item>
</Trans>
</TransRel>
</GraphData>
</VioModels>
<VioLayout>
0             =AAAAAEBPYQAZAAAAAgAAAAgAAAAAAAAAAAAAADpBbGwRAA=== 0             150           845           0.938037      
</VioLayout>
</VioGenerator>
</Value>
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
<State>
1             
<Item>
<Position>
27.800000     422.200012    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.057189    0             
</BasePoints>
</Item>
</State>
<State>
2             
<Item>
<Position>
152.800000    290.300012    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.057189    0             
</BasePoints>
</Item>
</State>
<State>
3             
<Item>
<Position>
527.799988    459.700012    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.057189    0             
</BasePoints>
</Item>
</State>
<State>
4             
<Item>
<Position>
652.799988    302.800012    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.057189    0             
</BasePoints>
</Item>
</State>
<State>
5             
<Item>
<Position>
652.799988    491.699982    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.057189    0             
</BasePoints>
</Item>
</State>
<State>
6             
<Item>
<Position>
777.799988    286.100006    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.057189    0             
</BasePoints>
</Item>
</State>
<State>
7             
<Item>
<Position>
902.799988    197.200000    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.057189    0             
</BasePoints>
</Item>
</State>
<State>
8             
<Item>
<Position>
277.800012    161.099994    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.057189    0             
</BasePoints>
</Item>
</State>
<State>
9             
<Item>
<Position>
402.799988    198.599994    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.057189    0             
</BasePoints>
</Item>
</State>
</States>
<TransRel>
<Trans>
1             "alpha_a"     2             
<Item>
<Position>
27.800000     422.200012    
</Position>
<BasePoints>
62.500000     -44.400001    0             0             20.478106     -21.955928    
40.300000     -43.000007    72.200000     -76.400018    104.229358    -110.204655   
125           -131.900001   
</BasePoints>
</Item>
</Trans>
<Trans>
1             "alpha_b"     3             
<Item>
<Position>
27.800000     422.200012    
</Position>
<BasePoints>
250.000012    43.099976     0             0             27.661074     11.630233     
51.400000     19.499969     90.300000     31.999969     125           31.999969     
125           31.999969     125           31.999969     374.999988    31.999969     
404.099977    31.999969     434.700000    33.400011     470.011419    35.486352     
499.999988    37.500000     
</BasePoints>
</Item>
</Trans>
<Trans>
2             "beta_a"      1             
<Item>
<Position>
152.800000    290.300012    
</Position>
<BasePoints>
-62.500000    38.899994     0             0             -29.453401    5.827092      
-41.700006    9.699988      -59.700000    16.599989     -72.200000    27.799988     
-98.600000    50            -105.599999   63.899994     -118.176093   102.634574    
-125          131.900001    
</BasePoints>
</Item>
</Trans>
<Trans>
2             "alpha_b"     4             
<Item>
<Position>
152.800000    290.300012    
</Position>
<BasePoints>
249.999988    37.500000     0             0             28.672104     9.014325      
34.700000     11.099982     44.400001     13.899994     52.800000     15.299988     
200.000012    36.099982     377.800024    23.599982     470.093021    15.440489     
499.999988    12.500000     
</BasePoints>
</Item>
</Trans>
<Trans>
2             "mue_a"       8             
<Item>
<Position>
152.800000    290.300012    
</Position>
<BasePoints>
62.500012     -43.100023    0             0             20.402405     -21.979918    
40.300000     -41.700006    72.200000     -75           104.290104    -107.497165   
125.000012    -129.200017   
</BasePoints>
</Item>
</Trans>
<Trans>
3             "beta_b"      1             
<Item>
<Position>
527.799988    459.700012    
</Position>
<BasePoints>
-249.999976   77.799988     0             0             -21.962578    20.491359     
-44.499969    38.899994     -83.400011    66.699982     -125          66.699982     
-374.999988   66.699982     -374.999988   66.699982     -374.999988   66.699982     
-431.999987   66.699982     -452.799988   41.699982     -485.450648   -11.269218    
-499.999988   -37.500000    
</BasePoints>
</Item>
</Trans>
<Trans>
3             "alpha_a"     4             
<Item>
<Position>
527.799988    459.700012    
</Position>
<BasePoints>
62.500000     -54.099989    0             0             18.915162     -23.328673    
38.899994     -48.600006    73.600006     -93.000007    106.379002    -133.412151   
125           -156.900001   
</BasePoints>
</Item>
</Trans>
<Trans>
3             "mue_b"       5             
<Item>
<Position>
527.799988    459.700012    
</Position>
<BasePoints>
62.500000     44.499969     0             0             23.260458     18.964573     
30.500031     23.600006     41.599989     30.599976     52.800035     33.400011     
62.500000     36.100006     73.600006     37.500000     95.261843     35.922295     
125           31.999969     
</BasePoints>
</Item>
</Trans>
<Trans>
4             "beta_b"      2             
<Item>
<Position>
652.799988    302.800012    
</Position>
<BasePoints>
-250          -4.200006     0             0             -29.866168    -3.008116     
-69.499969    -7.000017     -151.399994   -13.900018    -222.199965   -15.300012    
-304.199982   -19.500017    -404.199982   -15.300012    -470.008460   -13.509344    
-499.999988   -12.500000    
</BasePoints>
</Item>
</Trans>
<Trans>
4             "beta_a"      3             
<Item>
<Position>
652.799988    302.800012    
</Position>
<BasePoints>
-62.500000    145.799994    0             0             -3.008090     29.866168     
-2.799988     30.499983     -4.199982     31.899977     -4.199982     33.299994     
-16.699982    75            -20.900011    88.899994     -52.799988    119.400001    
-62.500000    129.099965    -73.600006    136.099982    -97.025044    145.896967    
-125          156.900001    
</BasePoints>
</Item>
</Trans>
<Trans>
4             "mue_b"       6             
<Item>
<Position>
652.799988    302.800012    
</Position>
<BasePoints>
62.500000     2.799988      0             0             29.670406     -4.482579     
44.400024     -7.000017     65.300035     -8.400011     95.261842     -12.706389    
125           -16.700006    
</BasePoints>
</Item>
</Trans>
<Trans>
4             "mue_a"       9             
<Item>
<Position>
652.799988    302.800012    
</Position>
<BasePoints>
-125          -59.700012    0             0             -21.254536    -21.254588    
-29.199982    -29.200006    -41.699982    -38.900018    -52.799988    -45.900011    
-100          -76.400018    -166.699982   -93.100023    -220.246152   -100.194681   
-250          -104.200017   
</BasePoints>
</Item>
</Trans>
<Trans>
5             "lambda_b"    1             
<Item>
<Position>
652.799988    491.699982    
</Position>
<BasePoints>
-312.499976   118.000031    0             0             -15.214869    25.832461     
-33.400011    55.500031     -73.600006    106.900024    -125          106.900024    
-499.999988   106.900024    -499.999988   106.900024    -499.999988   106.900024    
-577.799988   106.900024    -590.299988   51.400042     -620.106208   -39.924538    
-624.999988   -69.499969    
</BasePoints>
</Item>
</Trans>
<Trans>
5             "alpha_a"     6             
<Item>
<Position>
652.799988    491.699982    
</Position>
<BasePoints>
62.500000     -98.599982    0             0             10.352622     -28.176171    
19.400024     -50           34.700012     -86.099958    52.800035     -113.899970   
70.800018     -143.099976   83.300018     -155.599976   106.379002    -182.112126   
125           -205.599976   
</BasePoints>
</Item>
</Trans>
<Trans>
6             "lambda_b"    2             
<Item>
<Position>
777.799988    286.100006    
</Position>
<BasePoints>
-312.500000   -250.000006   0             0             -10.352572    -28.176196    
-37.500000    -91.700006    -120.900011   -261.100006   -250          -261.100006   
-499.999976   -261.100006   -499.999976   -261.100006   -499.999976   -261.100006   
-609.699988   -261.100006   -531.999993   -122.200000   -597.199988   -33.299994    
-598.599982   -31.900001    -598.599982   -30.500007    -607.025009   -19.814569    
-624.999988   4.200006      
</BasePoints>
</Item>
</Trans>
<Trans>
6             "beta_a"      5             
<Item>
<Position>
777.799988    286.100006    
</Position>
<BasePoints>
-62.500000    161.100006    0             0             -3.008090     29.866168     
-2.799988     30.599999     -4.199982     31.999993     -4.199982     33.299994     
-22.199965    88.899994     -66.699982    143.099976    -103.788000   184.315088    
-125          205.599976    
</BasePoints>
</Item>
</Trans>
<Trans>
6             "mue_a"       7             
<Item>
<Position>
777.799988    286.100006    
</Position>
<BasePoints>
62.500000     -27.800012    0             0             24.522750     -17.352963    
41.600037     -29.200006    68.000031     -48.600006    100.660070    -71.364045    
125           -88.900006    
</BasePoints>
</Item>
</Trans>
<Trans>
7             "lambda_a"    5             
<Item>
<Position>
902.799988    197.200000    
</Position>
<BasePoints>
-125          256.999981    0             0             -5.928515     29.430973     
-54.199982    145.899999    -73.600006    184.700000    -177.799988   266.699994    
-186.100006   273.600018    -198.600006   279.199994    -220.978804   286.756371    
-250          294.499981    
</BasePoints>
</Item>
</Trans>
<Trans>
7             "lambda_b"    8             
<Item>
<Position>
902.799988    197.200000    
</Position>
<BasePoints>
-312.500000   -72.200000    0             0             -9.096227     -28.588266    
-34.700012    -56.900001    -55.599976    -52.800000    -97.200012    -65.300000    
-200          -94.400001    -240.299988   -92.999995    -322.199965   -87.500000    
-443.099976   -77.800000    -506.999993   -123.600000   -604.304225   -57.791432    
-624.999976   -36.100006    
</BasePoints>
</Item>
</Trans>
<Trans>
8             "lambda_a"    1             
<Item>
<Position>
277.800012    161.099994    
</Position>
<BasePoints>
-125.000012   77.800000     0             0             -29.104578    7.328493      
-59.700012    16.700006     -115.300012   34.700000     -152.800012   66.700017     
-200.000012   107.000005    -234.700012   182.000005    -247.200012   219.500005    
-247.200012   219.500005    -247.200012   219.500005    -247.986818   231.189652    
-250.000012   261.100018    
</BasePoints>
</Item>
</Trans>
<Trans>
8             "alpha_b"     9             
<Item>
<Position>
277.800012    161.099994    
</Position>
<BasePoints>
62.500000     37.500000     0             0             27.661067     11.630233     
34.699988     13.900006     44.399977     16.700006     52.799988     19.500005     
62.500000     23.600006     73.599982     26.400006     95.587270     31.645673     
124.999976    37.500000     
</BasePoints>
</Item>
</Trans>
<Trans>
9             "lambda_a"    3             
<Item>
<Position>
402.799988    198.599994    
</Position>
<BasePoints>
62.500000     143.100011    0             0             16.329411     25.187788     
19.400024     32.000005     23.600006     38.900006     27.800035     47.200000     
59.700012     105.600011    90.300035     179.200017    113.153597    233.505673    
125           261.100018    
</BasePoints>
</Item>
</Trans>
<Trans>
9             "mue_b"       7             
<Item>
<Position>
402.799988    198.599994    
</Position>
<BasePoints>
250           -36.099994    0             0             25.187801     -16.329374    
48.600006     -29.199994    88.899994     -47.199988    125           -47.199988    
125           -47.199988    125           -47.199988    375           -47.199988    
406.900024    -47.199988    438.899994    -34.699988    473.968012    -16.399026    
500           -1.399994     
</BasePoints>
</Item>
</Trans>
<Trans>
9             "beta_b"      8             
<Item>
<Position>
402.799988    198.599994    
</Position>
<BasePoints>
-62.499976    -34.699988    0             0             -17.352938    -24.522738    
-24.999976    -33.299994    -33.399987    -38.899994    -52.799988    -45.799994    
-62.499976    -48.599994    -73.599982    -48.599994    -95.781628    -44.532699    
-124.999976   -37.500000    
</BasePoints>
</Item>
</Trans>
</TransRel>
</GraphData>
</VioModels>
<VioLayout>
0             =AQAAAB8AAAAvAAAAGyyFvwIAAAADAAAA4LkVChQAAAAKAA=== 0             150           726           0.612336      
</VioLayout>
</VioSystem>
</Value>
</Variable>
<Variable>
"FullBufferAB" "Generator"   +Visual+      
<Value>
<VioGenerator>
<Generator>
"FullBufferAB" 

% 
%  Statistics for FullBufferAB
% 
%  States:        10
%  Init/Marked:   1/1
%  Events:        8
%  Transitions:   78
%  StateSymbols:  10
%  Attrib. E/S/T: 0/0/0
% 

<Alphabet>
"alpha_a"     "beta_a"      "mue_a"       "lambda_a"    "alpha_b"     "beta_b"      
"mue_b"       "lambda_b"    
</Alphabet>

<States>
"s1"          "s2"          "s3"          "s4"          "s5"          "s6"          
"s7"          "s8"          "s9"          "s10"         
</States>

<TransRel>
"s1"          "alpha_a"     "s1"          
"s1"          "beta_a"      "s2"          
"s1"          "mue_a"       "s1"          
"s1"          "lambda_a"    "s1"          
"s1"          "beta_b"      "s1"          
"s1"          "mue_b"       "s1"          
"s1"          "lambda_b"    "s1"          
"s2"          "alpha_a"     "s2"          
"s2"          "beta_a"      "s3"          
"s2"          "mue_a"       "s2"          
"s2"          "lambda_a"    "s2"          
"s2"          "alpha_b"     "s1"          
"s2"          "beta_b"      "s2"          
"s2"          "mue_b"       "s2"          
"s2"          "lambda_b"    "s2"          
"s3"          "alpha_a"     "s3"          
"s3"          "beta_a"      "s4"          
"s3"          "mue_a"       "s3"          
"s3"          "lambda_a"    "s3"          
"s3"          "alpha_b"     "s2"          
"s3"          "beta_b"      "s3"          
"s3"          "mue_b"       "s3"          
"s3"          "lambda_b"    "s3"          
"s4"          "alpha_a"     "s4"          
"s4"          "beta_a"      "s5"          
"s4"          "mue_a"       "s4"          
"s4"          "lambda_a"    "s4"          
"s4"          "alpha_b"     "s3"          
"s4"          "beta_b"      "s4"          
"s4"          "mue_b"       "s4"          
"s4"          "lambda_b"    "s4"          
"s5"          "alpha_a"     "s5"          
"s5"          "beta_a"      "s6"          
"s5"          "mue_a"       "s5"          
"s5"          "lambda_a"    "s5"          
"s5"          "alpha_b"     "s4"          
"s5"          "beta_b"      "s5"          
"s5"          "mue_b"       "s5"          
"s5"          "lambda_b"    "s5"          
"s6"          "alpha_a"     "s6"          
"s6"          "beta_a"      "s7"          
"s6"          "mue_a"       "s6"          
"s6"          "lambda_a"    "s6"          
"s6"          "alpha_b"     "s5"          
"s6"          "beta_b"      "s6"          
"s6"          "mue_b"       "s6"          
"s6"          "lambda_b"    "s6"          
"s7"          "alpha_a"     "s7"          
"s7"          "beta_a"      "s8"          
"s7"          "mue_a"       "s7"          
"s7"          "lambda_a"    "s7"          
"s7"          "alpha_b"     "s6"          
"s7"          "beta_b"      "s7"          
"s7"          "mue_b"       "s7"          
"s7"          "lambda_b"    "s7"          
"s8"          "alpha_a"     "s8"          
"s8"          "beta_a"      "s9"          
"s8"          "mue_a"       "s8"          
"s8"          "lambda_a"    "s8"          
"s8"          "alpha_b"     "s7"          
"s8"          "beta_b"      "s8"          
"s8"          "mue_b"       "s8"          
"s8"          "lambda_b"    "s8"          
"s9"          "alpha_a"     "s9"          
"s9"          "beta_a"      "s10"         
"s9"          "mue_a"       "s9"          
"s9"          "lambda_a"    "s9"          
"s9"          "alpha_b"     "s8"          
"s9"          "beta_b"      "s9"          
"s9"          "mue_b"       "s9"          
"s9"          "lambda_b"    "s9"          
"s10"         "alpha_a"     "s10"         
"s10"         "mue_a"       "s10"         
"s10"         "lambda_a"    "s10"         
"s10"         "alpha_b"     "s9"          
"s10"         "beta_b"      "s10"         
"s10"         "mue_b"       "s10"         
"s10"         "lambda_b"    "s10"         
</TransRel>

<InitStates>
"s1"          
</InitStates>

<MarkedStates>
"s1"          
</MarkedStates>


</Generator>
<VioModels>
<TransitionList>
=AAAATgEAAAABAAAADgBhAGwAcABoAGEAXwBhAAAAAQEAAAABAAAACgBtAHUAZQBfAGEAAAABAQAAAAEAAAAQAGwAYQBtAGIAZABhAF8AYQAAAAEBAAAAAQAAAAwAYgBlAHQAYQBfAGIAAAABAQAAAAEAAAAKAG0AdQBlAF8AYgAAAAEBAAAAAQAAABAAbABhAG0AYgBkAGEAXwBiAAAAAQEAAAACAAAADgBhAGwAcABoAGEAXwBhAAAAAgEAAAACAAAADABiAGUAdABhAF8AYQAAAAMBAAAAAgAAAAoAbQB1AGUAXwBhAAAAAgEAAAACAAAAEABsAGEAbQBiAGQAYQBfAGEAAAACAQAAAAIAAAAMAGIAZQB0AGEAXwBiAAAAAgEAAAACAAAACgBtAHUAZQBfAGIAAAACAQAAAAIAAAAQAGwAYQBtAGIAZABhAF8AYgAAAAIBAAAAAwAAAA4AYQBsAHAAaABhAF8AYQAAAAMBAAAAAwAAAAwAYgBlAHQAYQBfAGEAAAAEAQAAAAMAAAAKAG0AdQBlAF8AYQAAAAMBAAAAAwAAABAAbABhAG0AYgBkAGEAXwBhAAAAAwEAAAADAAAADgBhAGwAcABoAGEAXwBiAAAAAgEAAAADAAAADABiAGUAdABhAF8AYgAAAAMBAAAAAwAAAAoAbQB1AGUAXwBiAAAAAwEAAAADAAAAEABsAGEAbQBiAGQAYQBfAGIAAAADAQAAAAQAAAAOAGEAbABwAGgAYQBfAGEAAAAEAQAAAAQAAAAMAGIAZQB0AGEAXwBhAAAABQEAAAAEAAAACgBtAHUAZQBfAGEAAAAEAQAAAAQAAAAQAGwAYQBtAGIAZABhAF8AYQAAAAQBAAAABAAAAA4AYQBsAHAAaABhAF8AYgAAAAMBAAAABAAAAAwAYgBlAHQAYQBfAGIAAAAEAQAAAAQAAAAKAG0AdQBlAF8AYgAAAAQBAAAABAAAABAAbABhAG0AYgBkAGEAXwBiAAAABAEAAAAFAAAADgBhAGwAcABoAGEAXwBhAAAABQEAAAAFAAAACgBtAHUAZQBfAGEAAAAFAQAAAAUAAAAQAGwAYQBtAGIAZABhAF8AYQAAAAUBAAAABQAAAA4AYQBsAHAAaABhAF8AYgAAAAQBAAAABQAAAAwAYgBlAHQAYQBfAGIAAAAFAQAAAAUAAAAKAG0AdQBlAF8AYgAAAAUBAAAABQAAABAAbABhAG0AYgBkAGEAXwBiAAAABQEAAAABAAAADABiAGUAdABhAF8AYQAAAAIBAAAAAgAAAA4AYQBsAHAAaABhAF8AYgAAAAEBAAAABQAAAAwAYgBlAHQAYQBfAGEAAAAGAQAAAAYAAAAOAGEAbABwAGgAYQBfAGEAAAAGAQAAAAYAAAAMAGIAZQB0AGEAXwBhAAAABwEAAAAGAAAACgBtAHUAZQBfAGEAAAAGAQAAAAYAAAAQAGwAYQBtAGIAZABhAF8AYQAAAAYBAAAABgAAAA4AYQBsAHAAaABhAF8AYgAAAAUBAAAABgAAAAwAYgBlAHQAYQBfAGIAAAAGAQAAAAYAAAAKAG0AdQBlAF8AYgAAAAYBAAAABgAAABAAbABhAG0AYgBkAGEAXwBiAAAABgEAAAAHAAAADgBhAGwAcABoAGEAXwBhAAAABwEAAAAHAAAADABiAGUAdABhAF8AYQAAAAgBAAAABwAAAAoAbQB1AGUAXwBhAAAABwEAAAAHAAAAEABsAGEAbQBiAGQAYQBfAGEAAAAHAQAAAAcAAAAOAGEAbABwAGgAYQBfAGIAAAAGAQAAAAcAAAAMAGIAZQB0AGEAXwBiAAAABwEAAAAHAAAACgBtAHUAZQBfAGIAAAAHAQAAAAcAAAAQAGwAYQBtAGIAZABhAF8AYgAAAAcBAAAACAAAAA4AYQBsAHAAaABhAF8AYQAAAAgBAAAACAAAAAwAYgBlAHQAYQBfAGEAAAAJAQAAAAgAAAAKAG0AdQBlAF8AYQAAAAgBAAAACAAAABAAbABhAG0AYgBkAGEAXwBhAAAACAEAAAAIAAAADgBhAGwAcABoAGEAXwBiAAAABwEAAAAIAAAADABiAGUAdABhAF8AYgAAAAgBAAAACAAAAAoAbQB1AGUAXwBiAAAACAEAAAAIAAAAEABsAGEAbQBiAGQAYQBfAGIAAAAIAQAAAAkAAAAOAGEAbABwAGgAYQBfAGEAAAAJAQAAAAkAAAAMAGIAZQB0AGEAXwBhAAAACgEAAAAJAAAACgBtAHUAZQBfAGEAAAAJAQAAAAkAAAAQAGwAYQBtAGIAZABhAF8AYQAAAAkBAAAACQAAAA4AYQBsAHAAaABhAF8AYgAAAAgBAAAACQAAAAwAYgBlAHQAYQBfAGIAAAAJAQAAAAkAAAAKAG0AdQBlAF8AYgAAAAkBAAAACQAAABAAbABhAG0AYgBkAGEAXwBiAAAACQEAAAAKAAAADgBhAGwAcABoAGEAXwBhAAAACgEAAAAKAAAACgBtAHUAZQBfAGEAAAAKAQAAAAoAAAAQAGwAYQBtAGIAZABhAF8AYQAAAAoBAAAACgAAAA4AYQBsAHAAaABhAF8AYgAAAAkBAAAACgAAAAwAYgBlAHQAYQBfAGIAAAAKAQAAAAoAAAAKAG0AdQBlAF8AYgAAAAoBAAAACgAAABAAbABhAG0AYgBkAGEAXwBiAAAACg=== </TransitionList>
<StateList>
=AAAACgIAAAABAgAAAAICAAAAAwIAAAAEAgAAAAUCAAAABgIAAAAHAgAAAAgCAAAACQIAAAAK= </StateList>
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
</VioGenerator>
</Value>
</Variable>
<Variable>
"SuperAB"     "System"      +Visual+      +Supervisor+  
<Value>
<VioSystem>
<Generator>
"SuperAB"     

% 
%  Statistics for SuperAB
% 
%  States:        84
%  Init/Marked:   1/1
%  Events:        8
%  Transitions:   217
%  StateSymbols:  84
%  Attrib. E/S/T: 4/0/0
% 

<Alphabet>
"alpha_a"     +C+           "beta_a"      "mue_a"       "lambda_a"    +C+           
"alpha_b"     +C+           "beta_b"      "mue_b"       "lambda_b"    +C+           
</Alphabet>

<States>
"I|I|s1"      "B|I|s1"      "I|I|s2"      "D|I|s1"      "B|I|s2"      "I|B|s1"      
"B|B|s1"      "I|D|s1"      "B|D|s1"      "I|D|s2"      "D|D|s1"      "B|D|s2"      
"I|D|s3"      "D|D|s2"      "D|I|s2"      "D|B|s1"      "B|D|s3"      "I|I|s3"      
"B|I|s3"      "I|B|s2"      "B|B|s2"      "I|B|s3"      "D|B|s2"      "B|B|s3"      
"I|B|s4"      "D|B|s3"      "D|I|s3"      "D|D|s3"      "B|B|s4"      "I|I|s4"      
"I|D|s4"      "B|D|s4"      "I|D|s5"      "D|D|s4"      "B|I|s4"      "I|I|s5"      
"D|I|s4"      "B|I|s5"      "I|I|s6"      "D|I|s5"      "D|B|s4"      "B|I|s6"      
"I|B|s5"      "B|B|s5"      "I|B|s6"      "D|B|s5"      "B|D|s5"      "I|D|s6"      
"D|D|s5"      "B|D|s6"      "I|D|s7"      "D|D|s6"      "D|I|s6"      "B|D|s7"      
"I|I|s7"      "B|I|s7"      "I|I|s8"      "D|I|s7"      "B|B|s6"      "I|B|s7"      
"D|B|s6"      "B|B|s7"      "I|B|s8"      "D|B|s7"      "D|D|s7"      "B|B|s8"      
"I|D|s8"      "B|D|s8"      "I|D|s9"      "D|D|s8"      "B|I|s8"      "I|I|s9"      
"D|I|s8"      "B|I|s9"      "I|I|s10"     "D|I|s9"      "D|B|s8"      "I|B|s9"      
"B|B|s9"      "I|B|s10"     "D|B|s9"      "B|D|s9"      "I|D|s10"     "D|D|s9"      
</States>

<TransRel>
"I|I|s1"      "alpha_a"     "B|I|s1"      
"B|I|s1"      "beta_a"      "I|I|s2"      
"B|I|s1"      "mue_a"       "D|I|s1"      
"I|I|s2"      "alpha_a"     "B|I|s2"      
"I|I|s2"      "alpha_b"     "I|B|s1"      
"D|I|s1"      "lambda_a"    "I|I|s1"      
"B|I|s2"      "beta_a"      "I|I|s3"      
"B|I|s2"      "mue_a"       "D|I|s2"      
"B|I|s2"      "alpha_b"     "B|B|s1"      
"I|B|s1"      "alpha_a"     "B|B|s1"      
"I|B|s1"      "beta_b"      "I|I|s1"      
"I|B|s1"      "mue_b"       "I|D|s1"      
"B|B|s1"      "beta_a"      "I|B|s2"      
"B|B|s1"      "mue_a"       "D|B|s1"      
"B|B|s1"      "beta_b"      "B|I|s1"      
"B|B|s1"      "mue_b"       "B|D|s1"      
"I|D|s1"      "alpha_a"     "B|D|s1"      
"I|D|s1"      "lambda_b"    "I|I|s1"      
"B|D|s1"      "beta_a"      "I|D|s2"      
"B|D|s1"      "mue_a"       "D|D|s1"      
"B|D|s1"      "lambda_b"    "B|I|s1"      
"I|D|s2"      "alpha_a"     "B|D|s2"      
"I|D|s2"      "lambda_b"    "I|I|s2"      
"D|D|s1"      "lambda_a"    "I|D|s1"      
"D|D|s1"      "lambda_b"    "D|I|s1"      
"B|D|s2"      "beta_a"      "I|D|s3"      
"B|D|s2"      "mue_a"       "D|D|s2"      
"B|D|s2"      "lambda_b"    "B|I|s2"      
"I|D|s3"      "alpha_a"     "B|D|s3"      
"I|D|s3"      "lambda_b"    "I|I|s3"      
"D|D|s2"      "lambda_a"    "I|D|s2"      
"D|D|s2"      "lambda_b"    "D|I|s2"      
"D|I|s2"      "lambda_a"    "I|I|s2"      
"D|I|s2"      "alpha_b"     "D|B|s1"      
"D|B|s1"      "lambda_a"    "I|B|s1"      
"D|B|s1"      "beta_b"      "D|I|s1"      
"D|B|s1"      "mue_b"       "D|D|s1"      
"B|D|s3"      "beta_a"      "I|D|s4"      
"B|D|s3"      "mue_a"       "D|D|s3"      
"B|D|s3"      "lambda_b"    "B|I|s3"      
"I|I|s3"      "alpha_a"     "B|I|s3"      
"I|I|s3"      "alpha_b"     "I|B|s2"      
"B|I|s3"      "beta_a"      "I|I|s4"      
"B|I|s3"      "mue_a"       "D|I|s3"      
"B|I|s3"      "alpha_b"     "B|B|s2"      
"I|B|s2"      "alpha_a"     "B|B|s2"      
"I|B|s2"      "beta_b"      "I|I|s2"      
"I|B|s2"      "mue_b"       "I|D|s2"      
"B|B|s2"      "beta_a"      "I|B|s3"      
"B|B|s2"      "mue_a"       "D|B|s2"      
"B|B|s2"      "beta_b"      "B|I|s2"      
"B|B|s2"      "mue_b"       "B|D|s2"      
"I|B|s3"      "alpha_a"     "B|B|s3"      
"I|B|s3"      "beta_b"      "I|I|s3"      
"I|B|s3"      "mue_b"       "I|D|s3"      
"D|B|s2"      "lambda_a"    "I|B|s2"      
"D|B|s2"      "beta_b"      "D|I|s2"      
"D|B|s2"      "mue_b"       "D|D|s2"      
"B|B|s3"      "beta_a"      "I|B|s4"      
"B|B|s3"      "mue_a"       "D|B|s3"      
"B|B|s3"      "beta_b"      "B|I|s3"      
"B|B|s3"      "mue_b"       "B|D|s3"      
"I|B|s4"      "alpha_a"     "B|B|s4"      
"I|B|s4"      "beta_b"      "I|I|s4"      
"I|B|s4"      "mue_b"       "I|D|s4"      
"D|B|s3"      "lambda_a"    "I|B|s3"      
"D|B|s3"      "beta_b"      "D|I|s3"      
"D|B|s3"      "mue_b"       "D|D|s3"      
"D|I|s3"      "lambda_a"    "I|I|s3"      
"D|I|s3"      "alpha_b"     "D|B|s2"      
"D|D|s3"      "lambda_a"    "I|D|s3"      
"D|D|s3"      "lambda_b"    "D|I|s3"      
"B|B|s4"      "beta_a"      "I|B|s5"      
"B|B|s4"      "mue_a"       "D|B|s4"      
"B|B|s4"      "beta_b"      "B|I|s4"      
"B|B|s4"      "mue_b"       "B|D|s4"      
"I|I|s4"      "alpha_a"     "B|I|s4"      
"I|I|s4"      "alpha_b"     "I|B|s3"      
"I|D|s4"      "alpha_a"     "B|D|s4"      
"I|D|s4"      "lambda_b"    "I|I|s4"      
"B|D|s4"      "beta_a"      "I|D|s5"      
"B|D|s4"      "mue_a"       "D|D|s4"      
"B|D|s4"      "lambda_b"    "B|I|s4"      
"I|D|s5"      "alpha_a"     "B|D|s5"      
"I|D|s5"      "lambda_b"    "I|I|s5"      
"D|D|s4"      "lambda_a"    "I|D|s4"      
"D|D|s4"      "lambda_b"    "D|I|s4"      
"B|I|s4"      "beta_a"      "I|I|s5"      
"B|I|s4"      "mue_a"       "D|I|s4"      
"B|I|s4"      "alpha_b"     "B|B|s3"      
"I|I|s5"      "alpha_a"     "B|I|s5"      
"I|I|s5"      "alpha_b"     "I|B|s4"      
"D|I|s4"      "lambda_a"    "I|I|s4"      
"D|I|s4"      "alpha_b"     "D|B|s3"      
"B|I|s5"      "beta_a"      "I|I|s6"      
"B|I|s5"      "mue_a"       "D|I|s5"      
"B|I|s5"      "alpha_b"     "B|B|s4"      
"I|I|s6"      "alpha_a"     "B|I|s6"      
"I|I|s6"      "alpha_b"     "I|B|s5"      
"D|I|s5"      "lambda_a"    "I|I|s5"      
"D|I|s5"      "alpha_b"     "D|B|s4"      
"D|B|s4"      "lambda_a"    "I|B|s4"      
"D|B|s4"      "beta_b"      "D|I|s4"      
"D|B|s4"      "mue_b"       "D|D|s4"      
"B|I|s6"      "beta_a"      "I|I|s7"      
"B|I|s6"      "mue_a"       "D|I|s6"      
"B|I|s6"      "alpha_b"     "B|B|s5"      
"I|B|s5"      "alpha_a"     "B|B|s5"      
"I|B|s5"      "beta_b"      "I|I|s5"      
"I|B|s5"      "mue_b"       "I|D|s5"      
"B|B|s5"      "beta_a"      "I|B|s6"      
"B|B|s5"      "mue_a"       "D|B|s5"      
"B|B|s5"      "beta_b"      "B|I|s5"      
"B|B|s5"      "mue_b"       "B|D|s5"      
"I|B|s6"      "alpha_a"     "B|B|s6"      
"I|B|s6"      "beta_b"      "I|I|s6"      
"I|B|s6"      "mue_b"       "I|D|s6"      
"D|B|s5"      "lambda_a"    "I|B|s5"      
"D|B|s5"      "beta_b"      "D|I|s5"      
"D|B|s5"      "mue_b"       "D|D|s5"      
"B|D|s5"      "beta_a"      "I|D|s6"      
"B|D|s5"      "mue_a"       "D|D|s5"      
"B|D|s5"      "lambda_b"    "B|I|s5"      
"I|D|s6"      "alpha_a"     "B|D|s6"      
"I|D|s6"      "lambda_b"    "I|I|s6"      
"D|D|s5"      "lambda_a"    "I|D|s5"      
"D|D|s5"      "lambda_b"    "D|I|s5"      
"B|D|s6"      "beta_a"      "I|D|s7"      
"B|D|s6"      "mue_a"       "D|D|s6"      
"B|D|s6"      "lambda_b"    "B|I|s6"      
"I|D|s7"      "alpha_a"     "B|D|s7"      
"I|D|s7"      "lambda_b"    "I|I|s7"      
"D|D|s6"      "lambda_a"    "I|D|s6"      
"D|D|s6"      "lambda_b"    "D|I|s6"      
"D|I|s6"      "lambda_a"    "I|I|s6"      
"D|I|s6"      "alpha_b"     "D|B|s5"      
"B|D|s7"      "beta_a"      "I|D|s8"      
"B|D|s7"      "mue_a"       "D|D|s7"      
"B|D|s7"      "lambda_b"    "B|I|s7"      
"I|I|s7"      "alpha_a"     "B|I|s7"      
"I|I|s7"      "alpha_b"     "I|B|s6"      
"B|I|s7"      "beta_a"      "I|I|s8"      
"B|I|s7"      "mue_a"       "D|I|s7"      
"B|I|s7"      "alpha_b"     "B|B|s6"      
"I|I|s8"      "alpha_a"     "B|I|s8"      
"I|I|s8"      "alpha_b"     "I|B|s7"      
"D|I|s7"      "lambda_a"    "I|I|s7"      
"D|I|s7"      "alpha_b"     "D|B|s6"      
"B|B|s6"      "beta_a"      "I|B|s7"      
"B|B|s6"      "mue_a"       "D|B|s6"      
"B|B|s6"      "beta_b"      "B|I|s6"      
"B|B|s6"      "mue_b"       "B|D|s6"      
"I|B|s7"      "alpha_a"     "B|B|s7"      
"I|B|s7"      "beta_b"      "I|I|s7"      
"I|B|s7"      "mue_b"       "I|D|s7"      
"D|B|s6"      "lambda_a"    "I|B|s6"      
"D|B|s6"      "beta_b"      "D|I|s6"      
"D|B|s6"      "mue_b"       "D|D|s6"      
"B|B|s7"      "beta_a"      "I|B|s8"      
"B|B|s7"      "mue_a"       "D|B|s7"      
"B|B|s7"      "beta_b"      "B|I|s7"      
"B|B|s7"      "mue_b"       "B|D|s7"      
"I|B|s8"      "alpha_a"     "B|B|s8"      
"I|B|s8"      "beta_b"      "I|I|s8"      
"I|B|s8"      "mue_b"       "I|D|s8"      
"D|B|s7"      "lambda_a"    "I|B|s7"      
"D|B|s7"      "beta_b"      "D|I|s7"      
"D|B|s7"      "mue_b"       "D|D|s7"      
"D|D|s7"      "lambda_a"    "I|D|s7"      
"D|D|s7"      "lambda_b"    "D|I|s7"      
"B|B|s8"      "beta_a"      "I|B|s9"      
"B|B|s8"      "mue_a"       "D|B|s8"      
"B|B|s8"      "beta_b"      "B|I|s8"      
"B|B|s8"      "mue_b"       "B|D|s8"      
"I|D|s8"      "alpha_a"     "B|D|s8"      
"I|D|s8"      "lambda_b"    "I|I|s8"      
"B|D|s8"      "beta_a"      "I|D|s9"      
"B|D|s8"      "mue_a"       "D|D|s8"      
"B|D|s8"      "lambda_b"    "B|I|s8"      
"I|D|s9"      "alpha_a"     "B|D|s9"      
"I|D|s9"      "lambda_b"    "I|I|s9"      
"D|D|s8"      "lambda_a"    "I|D|s8"      
"D|D|s8"      "lambda_b"    "D|I|s8"      
"B|I|s8"      "beta_a"      "I|I|s9"      
"B|I|s8"      "mue_a"       "D|I|s8"      
"B|I|s8"      "alpha_b"     "B|B|s7"      
"I|I|s9"      "alpha_a"     "B|I|s9"      
"I|I|s9"      "alpha_b"     "I|B|s8"      
"D|I|s8"      "lambda_a"    "I|I|s8"      
"D|I|s8"      "alpha_b"     "D|B|s7"      
"B|I|s9"      "beta_a"      "I|I|s10"     
"B|I|s9"      "mue_a"       "D|I|s9"      
"B|I|s9"      "alpha_b"     "B|B|s8"      
"I|I|s10"     "alpha_b"     "I|B|s9"      
"D|I|s9"      "lambda_a"    "I|I|s9"      
"D|I|s9"      "alpha_b"     "D|B|s8"      
"D|B|s8"      "lambda_a"    "I|B|s8"      
"D|B|s8"      "beta_b"      "D|I|s8"      
"D|B|s8"      "mue_b"       "D|D|s8"      
"I|B|s9"      "alpha_a"     "B|B|s9"      
"I|B|s9"      "beta_b"      "I|I|s9"      
"I|B|s9"      "mue_b"       "I|D|s9"      
"B|B|s9"      "beta_a"      "I|B|s10"     
"B|B|s9"      "mue_a"       "D|B|s9"      
"B|B|s9"      "beta_b"      "B|I|s9"      
"B|B|s9"      "mue_b"       "B|D|s9"      
"I|B|s10"     "beta_b"      "I|I|s10"     
"I|B|s10"     "mue_b"       "I|D|s10"     
"D|B|s9"      "lambda_a"    "I|B|s9"      
"D|B|s9"      "beta_b"      "D|I|s9"      
"D|B|s9"      "mue_b"       "D|D|s9"      
"B|D|s9"      "beta_a"      "I|D|s10"     
"B|D|s9"      "mue_a"       "D|D|s9"      
"B|D|s9"      "lambda_b"    "B|I|s9"      
"I|D|s10"     "lambda_b"    "I|I|s10"     
"D|D|s9"      "lambda_a"    "I|D|s9"      
"D|D|s9"      "lambda_b"    "D|I|s9"      
</TransRel>

<InitStates>
"I|I|s1"      
</InitStates>

<MarkedStates>
"I|I|s1"      
</MarkedStates>


</Generator>
<VioModels>
<TransitionList>
=AAAA2QEAAAASAAAADgBhAGwAcABoAGEAXwBiAAAAFAEAAAABAAAADgBhAGwAcABoAGEAXwBhAAAAAgEAAAACAAAADABiAGUAdABhAF8AYQAAAAMBAAAAAgAAAAoAbQB1AGUAXwBhAAAABAEAAAADAAAADgBhAGwAcABoAGEAXwBhAAAABQEAAAADAAAADgBhAGwAcABoAGEAXwBiAAAABgEAAAAEAAAAEABsAGEAbQBiAGQAYQBfAGEAAAABAQAAAAUAAAAMAGIAZQB0AGEAXwBhAAAAEgEAAAAFAAAACgBtAHUAZQBfAGEAAAAPAQAAAAUAAAAOAGEAbABwAGgAYQBfAGIAAAAHAQAAAAYAAAAOAGEAbABwAGgAYQBfAGEAAAAHAQAAAAYAAAAMAGIAZQB0AGEAXwBiAAAAAQEAAAAGAAAACgBtAHUAZQBfAGIAAAAIAQAAAAcAAAAMAGIAZQB0AGEAXwBhAAAAFAEAAAAHAAAACgBtAHUAZQBfAGEAAAAQAQAAAAcAAAAMAGIAZQB0AGEAXwBiAAAAAgEAAAAHAAAACgBtAHUAZQBfAGIAAAAJAQAAAAgAAAAOAGEAbABwAGgAYQBfAGEAAAAJAQAAAAgAAAAQAGwAYQBtAGIAZABhAF8AYgAAAAEBAAAACQAAAAwAYgBlAHQAYQBfAGEAAAAKAQAAAAkAAAAKAG0AdQBlAF8AYQAAAAsBAAAACQAAABAAbABhAG0AYgBkAGEAXwBiAAAAAgEAAAAKAAAADgBhAGwAcABoAGEAXwBhAAAADAEAAAAKAAAAEABsAGEAbQBiAGQAYQBfAGIAAAADAQAAAAsAAAAQAGwAYQBtAGIAZABhAF8AYQAAAAgBAAAACwAAABAAbABhAG0AYgBkAGEAXwBiAAAABAEAAAAMAAAADABiAGUAdABhAF8AYQAAAA0BAAAADAAAAAoAbQB1AGUAXwBhAAAADgEAAAAMAAAAEABsAGEAbQBiAGQAYQBfAGIAAAAFAQAAAA0AAAAOAGEAbABwAGgAYQBfAGEAAAARAQAAAA0AAAAQAGwAYQBtAGIAZABhAF8AYgAAABIBAAAADgAAABAAbABhAG0AYgBkAGEAXwBhAAAACgEAAAAOAAAAEABsAGEAbQBiAGQAYQBfAGIAAAAPAQAAAA8AAAAQAGwAYQBtAGIAZABhAF8AYQAAAAMBAAAADwAAAA4AYQBsAHAAaABhAF8AYgAAABABAAAAEAAAABAAbABhAG0AYgBkAGEAXwBhAAAABgEAAAAQAAAADABiAGUAdABhAF8AYgAAAAQBAAAAEAAAAAoAbQB1AGUAXwBiAAAACwEAAAARAAAADABiAGUAdABhAF8AYQAAAB8BAAAAEQAAAAoAbQB1AGUAXwBhAAAAHAEAAAARAAAAEABsAGEAbQBiAGQAYQBfAGIAAAATAQAAABIAAAAOAGEAbABwAGgAYQBfAGEAAAATAQAAABMAAAAMAGIAZQB0AGEAXwBhAAAAHgEAAAATAAAACgBtAHUAZQBfAGEAAAAbAQAAABMAAAAOAGEAbABwAGgAYQBfAGIAAAAVAQAAABQAAAAOAGEAbABwAGgAYQBfAGEAAAAVAQAAABQAAAAMAGIAZQB0AGEAXwBiAAAAAwEAAAAUAAAACgBtAHUAZQBfAGIAAAAKAQAAABUAAAAMAGIAZQB0AGEAXwBhAAAAFgEAAAAVAAAACgBtAHUAZQBfAGEAAAAXAQAAABUAAAAMAGIAZQB0AGEAXwBiAAAABQEAAAAVAAAACgBtAHUAZQBfAGIAAAAMAQAAABYAAAAOAGEAbABwAGgAYQBfAGEAAAAYAQAAABYAAAAMAGIAZQB0AGEAXwBiAAAAEgEAAAAWAAAACgBtAHUAZQBfAGIAAAANAQAAABcAAAAQAGwAYQBtAGIAZABhAF8AYQAAABQBAAAAFwAAAAwAYgBlAHQAYQBfAGIAAAAPAQAAABcAAAAKAG0AdQBlAF8AYgAAAA4BAAAAGAAAAAwAYgBlAHQAYQBfAGEAAAAZAQAAABgAAAAKAG0AdQBlAF8AYQAAABoBAAAAGAAAAAwAYgBlAHQAYQBfAGIAAAATAQAAABgAAAAKAG0AdQBlAF8AYgAAABEBAAAAGQAAAA4AYQBsAHAAaABhAF8AYQAAAB0BAAAAGQAAAAwAYgBlAHQAYQBfAGIAAAAeAQAAABkAAAAKAG0AdQBlAF8AYgAAAB8BAAAAGgAAABAAbABhAG0AYgBkAGEAXwBhAAAAFgEAAAAaAAAADABiAGUAdABhAF8AYgAAABsBAAAAGgAAAAoAbQB1AGUAXwBiAAAAHAEAAAAbAAAAEABsAGEAbQBiAGQAYQBfAGEAAAASAQAAABsAAAAOAGEAbABwAGgAYQBfAGIAAAAXAQAAABwAAAAQAGwAYQBtAGIAZABhAF8AYQAAAA0BAAAAHAAAABAAbABhAG0AYgBkAGEAXwBiAAAAGwEAAAAdAAAADABiAGUAdABhAF8AYgAAACMBAAAAHQAAAAoAbQB1AGUAXwBiAAAAIAEAAAAeAAAADgBhAGwAcABoAGEAXwBhAAAAIwEAAAAeAAAADgBhAGwAcABoAGEAXwBiAAAAFgEAAAAfAAAADgBhAGwAcABoAGEAXwBhAAAAIAEAAAAfAAAAEABsAGEAbQBiAGQAYQBfAGIAAAAeAQAAACAAAAAMAGIAZQB0AGEAXwBhAAAAIQEAAAAgAAAACgBtAHUAZQBfAGEAAAAiAQAAACAAAAAQAGwAYQBtAGIAZABhAF8AYgAAACMBAAAAIQAAABAAbABhAG0AYgBkAGEAXwBiAAAAJAEAAAAiAAAAEABsAGEAbQBiAGQAYQBfAGEAAAAfAQAAACIAAAAQAGwAYQBtAGIAZABhAF8AYgAAACUBAAAAIwAAAAwAYgBlAHQAYQBfAGEAAAAkAQAAACMAAAAKAG0AdQBlAF8AYQAAACUBAAAAIwAAAA4AYQBsAHAAaABhAF8AYgAAABgBAAAAJAAAAA4AYQBsAHAAaABhAF8AYgAAABkBAAAAJQAAABAAbABhAG0AYgBkAGEAXwBhAAAAHgEAAAAlAAAADgBhAGwAcABoAGEAXwBiAAAAGgEAAAAdAAAACgBtAHUAZQBfAGEAAAApAQAAACkAAAAQAGwAYQBtAGIAZABhAF8AYQAAABkBAAAAKQAAAAwAYgBlAHQAYQBfAGIAAAAlAQAAACkAAAAKAG0AdQBlAF8AYgAAACIBAAAAHQAAAAwAYgBlAHQAYQBfAGEAAAArAQAAACEAAAAOAGEAbABwAGgAYQBfAGEAAAAvAQAAACQAAAAOAGEAbABwAGgAYQBfAGEAAAAmAQAAACYAAAAMAGIAZQB0AGEAXwBhAAAAJwEAAAAmAAAACgBtAHUAZQBfAGEAAAAoAQAAACYAAAAOAGEAbABwAGgAYQBfAGIAAAAdAQAAACcAAAAOAGEAbABwAGgAYQBfAGEAAAAqAQAAACcAAAAOAGEAbABwAGgAYQBfAGIAAAArAQAAACgAAAAQAGwAYQBtAGIAZABhAF8AYQAAACQBAAAAKAAAAA4AYQBsAHAAaABhAF8AYgAAACkBAAAAKgAAAAwAYgBlAHQAYQBfAGEAAAA3AQAAACoAAAAKAG0AdQBlAF8AYQAAADUBAAAAKgAAAA4AYQBsAHAAaABhAF8AYgAAACwBAAAAKwAAAA4AYQBsAHAAaABhAF8AYQAAACwBAAAAKwAAAAwAYgBlAHQAYQBfAGIAAAAkAQAAACsAAAAKAG0AdQBlAF8AYgAAACEBAAAALAAAAAwAYgBlAHQAYQBfAGEAAAAtAQAAACwAAAAKAG0AdQBlAF8AYQAAAC4BAAAALAAAAAwAYgBlAHQAYQBfAGIAAAAmAQAAACwAAAAKAG0AdQBlAF8AYgAAAC8BAAAALQAAAA4AYQBsAHAAaABhAF8AYQAAADsBAAAALQAAAAwAYgBlAHQAYQBfAGIAAAAnAQAAAC0AAAAKAG0AdQBlAF8AYgAAADABAAAALgAAABAAbABhAG0AYgBkAGEAXwBhAAAAKwEAAAAuAAAADABiAGUAdABhAF8AYgAAACgBAAAALgAAAAoAbQB1AGUAXwBiAAAAMQEAAAAvAAAADABiAGUAdABhAF8AYQAAADABAAAALwAAAAoAbQB1AGUAXwBhAAAAMQEAAAAvAAAAEABsAGEAbQBiAGQAYQBfAGIAAAAmAQAAADAAAAAOAGEAbABwAGgAYQBfAGEAAAAyAQAAADAAAAAQAGwAYQBtAGIAZABhAF8AYgAAACcBAAAAMQAAABAAbABhAG0AYgBkAGEAXwBhAAAAIQEAAAAxAAAAEABsAGEAbQBiAGQAYQBfAGIAAAAoAQAAADIAAAAMAGIAZQB0AGEAXwBhAAAAMwEAAAAyAAAACgBtAHUAZQBfAGEAAAA0AQAAADIAAAAQAGwAYQBtAGIAZABhAF8AYgAAACoBAAAAMwAAAA4AYQBsAHAAaABhAF8AYQAAADYBAAAAMwAAABAAbABhAG0AYgBkAGEAXwBiAAAANwEAAAA0AAAAEABsAGEAbQBiAGQAYQBfAGEAAAAwAQAAADQAAAAQAGwAYQBtAGIAZABhAF8AYgAAADUBAAAANQAAABAAbABhAG0AYgBkAGEAXwBhAAAAJwEAAAA1AAAADgBhAGwAcABoAGEAXwBiAAAALgEAAAA2AAAADABiAGUAdABhAF8AYQAAAEMBAAAANgAAAAoAbQB1AGUAXwBhAAAAQQEAAAA2AAAAEABsAGEAbQBiAGQAYQBfAGIAAAA4AQAAADcAAAAOAGEAbABwAGgAYQBfAGEAAAA4AQAAADcAAAAOAGEAbABwAGgAYQBfAGIAAAAtAQAAADgAAAAMAGIAZQB0AGEAXwBhAAAAOQEAAAA4AAAACgBtAHUAZQBfAGEAAAA6AQAAADgAAAAOAGEAbABwAGgAYQBfAGIAAAA7AQAAADkAAAAOAGEAbABwAGgAYQBfAGEAAABHAQAAADkAAAAOAGEAbABwAGgAYQBfAGIAAAA8AQAAADoAAAAQAGwAYQBtAGIAZABhAF8AYQAAADcBAAAAOgAAAA4AYQBsAHAAaABhAF8AYgAAAD0BAAAAOwAAAAwAYgBlAHQAYQBfAGEAAAA8AQAAADsAAAAKAG0AdQBlAF8AYQAAAD0BAAAAOwAAAAwAYgBlAHQAYQBfAGIAAAAqAQAAADsAAAAKAG0AdQBlAF8AYgAAADIBAAAAPAAAAA4AYQBsAHAAaABhAF8AYQAAAD4BAAAAPAAAAAwAYgBlAHQAYQBfAGIAAAA3AQAAADwAAAAKAG0AdQBlAF8AYgAAADMBAAAAPQAAABAAbABhAG0AYgBkAGEAXwBhAAAALQEAAAA9AAAADABiAGUAdABhAF8AYgAAADUBAAAAPQAAAAoAbQB1AGUAXwBiAAAANAEAAAA+AAAADABiAGUAdABhAF8AYQAAAD8BAAAAPgAAAAoAbQB1AGUAXwBhAAAAQAEAAAA+AAAADABiAGUAdABhAF8AYgAAADgBAAAAPgAAAAoAbQB1AGUAXwBiAAAANgEAAAA/AAAADgBhAGwAcABoAGEAXwBhAAAAQgEAAAA/AAAADABiAGUAdABhAF8AYgAAADkBAAAAPwAAAAoAbQB1AGUAXwBiAAAAQwEAAABAAAAAEABsAGEAbQBiAGQAYQBfAGEAAAA8AQAAAEAAAAAMAGIAZQB0AGEAXwBiAAAAOgEAAABAAAAACgBtAHUAZQBfAGIAAABBAQAAAEEAAAAQAGwAYQBtAGIAZABhAF8AYQAAADMBAAAAQQAAABAAbABhAG0AYgBkAGEAXwBiAAAAOgEAAABCAAAACgBtAHUAZQBfAGEAAABNAQAAAEIAAAAMAGIAZQB0AGEAXwBiAAAARwEAAABCAAAACgBtAHUAZQBfAGIAAABEAQAAAEMAAAAOAGEAbABwAGgAYQBfAGEAAABEAQAAAEMAAAAQAGwAYQBtAGIAZABhAF8AYgAAADkBAAAARAAAAAwAYgBlAHQAYQBfAGEAAABFAQAAAEQAAAAKAG0AdQBlAF8AYQAAAEYBAAAARAAAABAAbABhAG0AYgBkAGEAXwBiAAAARwEAAABFAAAAEABsAGEAbQBiAGQAYQBfAGIAAABIAQAAAEYAAAAQAGwAYQBtAGIAZABhAF8AYQAAAEMBAAAARgAAABAAbABhAG0AYgBkAGEAXwBiAAAASQEAAABHAAAADABiAGUAdABhAF8AYQAAAEgBAAAARwAAAAoAbQB1AGUAXwBhAAAASQEAAABHAAAADgBhAGwAcABoAGEAXwBiAAAAPgEAAABIAAAADgBhAGwAcABoAGEAXwBhAAAASgEAAABIAAAADgBhAGwAcABoAGEAXwBiAAAAPwEAAABJAAAAEABsAGEAbQBiAGQAYQBfAGEAAAA5AQAAAEkAAAAOAGEAbABwAGgAYQBfAGIAAABAAQAAAEoAAAAMAGIAZQB0AGEAXwBhAAAASwEAAABKAAAACgBtAHUAZQBfAGEAAABMAQAAAEoAAAAOAGEAbABwAGgAYQBfAGIAAABCAQAAAEwAAAAQAGwAYQBtAGIAZABhAF8AYQAAAEgBAAAATAAAAA4AYQBsAHAAaABhAF8AYgAAAE0BAAAATQAAABAAbABhAG0AYgBkAGEAXwBhAAAAPwEAAABNAAAADABiAGUAdABhAF8AYgAAAEkBAAAATQAAAAoAbQB1AGUAXwBiAAAARgEAAABQAAAACgBtAHUAZQBfAGIAAABTAQAAAFEAAAAKAG0AdQBlAF8AYgAAAFQBAAAAQgAAAAwAYgBlAHQAYQBfAGEAAABPAQAAAEUAAAAOAGEAbABwAGgAYQBfAGEAAABTAQAAAEsAAAAOAGEAbABwAGgAYQBfAGIAAABPAQAAAE8AAAAOAGEAbABwAGgAYQBfAGEAAABQAQAAAE8AAAAMAGIAZQB0AGEAXwBiAAAASAEAAABPAAAACgBtAHUAZQBfAGIAAABFAQAAAFAAAAAMAGIAZQB0AGEAXwBhAAAAUQEAAABQAAAACgBtAHUAZQBfAGEAAABSAQAAAFAAAAAMAGIAZQB0AGEAXwBiAAAASgEAAABRAAAADABiAGUAdABhAF8AYgAAAEsBAAAAUgAAABAAbABhAG0AYgBkAGEAXwBhAAAATwEAAABSAAAADABiAGUAdABhAF8AYgAAAEwBAAAAUgAAAAoAbQB1AGUAXwBiAAAAVQEAAABTAAAADABiAGUAdABhAF8AYQAAAFQBAAAAUwAAAAoAbQB1AGUAXwBhAAAAVQEAAABTAAAAEABsAGEAbQBiAGQAYQBfAGIAAABKAQAAAFQAAAAQAGwAYQBtAGIAZABhAF8AYgAAAEsBAAAAVQAAABAAbABhAG0AYgBkAGEAXwBhAAAARQEAAABVAAAAEABsAGEAbQBiAGQAYQBfAGIAAABM= </TransitionList>
<StateList>
=AAAAVAIAAAABAgAAAAMCAAAABAIAAAAGAgAAAAcCAAAACAIAAAAJAgAAAAoCAAAACwIAAAANAgAAAA4CAAAABQIAAAAMAgAAAA8CAAAAEAIAAAARAgAAABICAAAAEwIAAAAUAgAAABUCAAAAFgIAAAAXAgAAABgCAAAAGQIAAAAaAgAAABsCAAAAHAIAAAAdAgAAAB4CAAAAHwIAAAAgAgAAACECAAAAIgIAAAAjAgAAACQCAAAAJQIAAAACAgAAACgCAAAAKQIAAAAmAgAAACcCAAAAKgIAAAArAgAAACwCAAAALQIAAAAuAgAAAC8CAAAAMAIAAAAxAgAAADICAAAAMwIAAAA0AgAAADUCAAAANgIAAAA3AgAAADgCAAAAOQIAAAA6AgAAADsCAAAAPAIAAAA9AgAAAD4CAAAAPwIAAABAAgAAAEECAAAAQgIAAABDAgAAAEQCAAAARQIAAABGAgAAAEcCAAAASAIAAABJAgAAAEoCAAAASwIAAABMAgAAAE0CAAAATwIAAABQAgAAAFECAAAAUgIAAABTAgAAAFQCAAAAVQ=== </StateList>
<EventList>
=AAAACAMAAAAOAGEAbABwAGgAYQBfAGEDAAAADABiAGUAdABhAF8AYQMAAAAKAG0AdQBlAF8AYQMAAAAQAGwAYQBtAGIAZABhAF8AYQMAAAAOAGEAbABwAGgAYQBfAGIDAAAADABiAGUAdABhAF8AYgMAAAAKAG0AdQBlAF8AYgMAAAAQAGwAYQBtAGIAZABhAF8AYg=== </EventList>
<GraphData>
<States>
<State>
1             
<Item>
<Position>
27.800000     1272.200012   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
2             
<Item>
<Position>
152.800000    1350          
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
3             
<Item>
<Position>
277.800012    955.599976    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
4             
<Item>
<Position>
2006.900024   1434.700012   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
5             
<Item>
<Position>
402.799988    530.600023    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
6             
<Item>
<Position>
1486.100006   1172.200012   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
7             
<Item>
<Position>
527.799988    1134.700012   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
8             
<Item>
<Position>
1611.100006   1316.699982   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
9             
<Item>
<Position>
1736.100006   1309.700012   
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
1868.099976   613.899994    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
11            
<Item>
<Position>
1868.099976   1375          
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
12            
<Item>
<Position>
2006.900024   497.200012    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
13            
<Item>
<Position>
2145.800018   755.600023    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
14            
<Item>
<Position>
1076.399994   581.899977    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
15            
<Item>
<Position>
1215.299988   970.800018    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
16            
<Item>
<Position>
1354.199982   1172.200012   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
17            
<Item>
<Position>
2284.700012   650           
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
18            
<Item>
<Position>
10062.500000  176.400006    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
19            
<Item>
<Position>
2423.600006   256.900001    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
20            
<Item>
<Position>
659.700012    590.299988    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
21            
<Item>
<Position>
798.600006    433.300018    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
22            
<Item>
<Position>
2701.399994   416.699982    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
23            
<Item>
<Position>
937.500000    622.200012    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
24            
<Item>
<Position>
2840.299988   572.200012    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
25            
<Item>
<Position>
2979.199982   1337.500000   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
26            
<Item>
<Position>
9645.800018   436.100006    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
27            
<Item>
<Position>
9923.600006   319.400001    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
28            
<Item>
<Position>
9784.700012   419.399977    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
29            
<Item>
<Position>
3118.099976   1434.700012   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
30            
<Item>
<Position>
2562.500000   1198.600006   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
31            
<Item>
<Position>
9506.900024   650           
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
32            
<Item>
<Position>
3256.900024   1377.799988   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
33            
<Item>
<Position>
3395.800018   1673.600006   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
34            
<Item>
<Position>
9368.099976   3430.599976   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
35            
<Item>
<Position>
3395.800018   3444.400024   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
36            
<Item>
<Position>
3534.700012   1626.399994   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
37            
<Item>
<Position>
9506.900024   3538.899994   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
38            
<Item>
<Position>
3673.600006   1455.599976   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
39            
<Item>
<Position>
3812.500000   1295.800018   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
40            
<Item>
<Position>
9090.299988   3444.400024   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
41            
<Item>
<Position>
9229.199982   3538.899994   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
42            
<Item>
<Position>
3951.399994   1400          
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
43            
<Item>
<Position>
8951.399994   887.500000    
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
44            
<Item>
<Position>
4090.299988   1048.600006   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
45            
<Item>
<Position>
8118.099976   1258.300018   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
46            
<Item>
<Position>
8812.500000   3193.099976   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
47            
<Item>
<Position>
4229.199982   3251.399994   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
48            
<Item>
<Position>
4368.099976   1269.400024   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
49            
<Item>
<Position>
8951.399994   3354.199982   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
50            
<Item>
<Position>
4506.900024   1562.500000   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
51            
<Item>
<Position>
4645.800018   1562.500000   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
52            
<Item>
<Position>
8534.700012   3072.200012   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
53            
<Item>
<Position>
8673.600006   3193.099976   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
54            
<Item>
<Position>
4784.700012   1711.100006   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
55            
<Item>
<Position>
7979.199982   1443.099976   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
56            
<Item>
<Position>
4923.600006   2698.600006   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
57            
<Item>
<Position>
5062.500000   2566.699982   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
58            
<Item>
<Position>
7840.299988   2780.599976   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
59            
<Item>
<Position>
8256.900024   2302.799988   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
60            
<Item>
<Position>
5201.399994   2927.799988   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
61            
<Item>
<Position>
8395.800018   3058.300018   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
62            
<Item>
<Position>
5340.299988   2776.399994   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
63            
<Item>
<Position>
5479.199982   2565.299988   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
64            
<Item>
<Position>
7562.500000   2780.599976   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
65            
<Item>
<Position>
7701.399994   1944.400024   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
66            
<Item>
<Position>
6312.500000   2456.900024   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
67            
<Item>
<Position>
5618.099976   2191.699982   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
68            
<Item>
<Position>
5756.900024   2398.600006   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
69            
<Item>
<Position>
5895.800018   2152.799988   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
70            
<Item>
<Position>
7284.700012   2479.199982   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
71            
<Item>
<Position>
6451.399994   2648.600006   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
72            
<Item>
<Position>
6034.700012   2294.400024   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
73            
<Item>
<Position>
7423.600006   2708.300018   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
74            
<Item>
<Position>
6173.600006   2054.199982   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
75            
<Item>
<Position>
7006.900024   1854.199982   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
76            
<Item>
<Position>
7006.900024   2340.299988   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
77            
<Item>
<Position>
7145.800018   2519.400024   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
79            
<Item>
<Position>
6590.299988   2090.299988   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
80            
<Item>
<Position>
6729.199982   1806.900024   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
81            
<Item>
<Position>
6729.199982   2177.799988   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
82            
<Item>
<Position>
6729.199982   1901.399994   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
83            
<Item>
<Position>
6868.099976   1806.900024   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
<State>
84            
<Item>
<Position>
6868.099976   2184.700012   
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.029125    0             
</BasePoints>
</Item>
</State>
</States>
<TransRel>
<Trans>
1             "alpha_a"     2             
<Item>
<Position>
27.800000     1272.200012   
</Position>
<BasePoints>
62.500000     54.199982     0             0             25.188587     16.329876     
41.600001     26.399994     68.000001     41.699982     99.465955     62.097600     
125           77.799988     
</BasePoints>
</Item>
</Trans>
<Trans>
2             "beta_a"      3             
<Item>
<Position>
152.800000    1350          
</Position>
<BasePoints>
62.500012     -151.399994   0             0             9.014611      -28.672992    
29.100001     -94.400024    86.099994     -273.600006   116.083731    -365.725234   
125.000012    -394.400024   
</BasePoints>
</Item>
</Trans>
<Trans>
2             "mue_a"       4             
<Item>
<Position>
152.800000    1350          
</Position>
<BasePoints>
923.599994    137.500000    0             0             5.827290      29.454314     
38.900006     86.100006     55.499995     126.399994    125.000012    126.399994    
125.000012    126.399994    125.000012    126.399994    1715.299976   126.399994    
1751.399982   126.399994    1788.899982   113.899994    1827.057641   97.752452     
1854.100025   84.700012     
</BasePoints>
</Item>
</Trans>
<Trans>
3             "alpha_a"     5             
<Item>
<Position>
277.800012    955.599976    
</Position>
<BasePoints>
62.500000     -181.999969   0             0             7.229802      -29.128852    
15.299988     -66.699982    34.699988     -141.699982   52.799988     -205.599976   
72.199988     -268.099976   95.799994     -341.699982   115.195432    -396.644357   
124.999976    -424.999952   
</BasePoints>
</Item>
</Trans>
<Trans>
3             "alpha_b"     6             
<Item>
<Position>
277.800012    955.599976    
</Position>
<BasePoints>
590.299964    93.000031     0             0             29.975912     1.401805      
83.299994     5.500031      213.899970    15.200043     322.199988    30.500031     
562.499976    65.200043     619.400001    90.200043     858.299994    130.500031    
970.799994    150           1002.799964   136.100006    1111.099982   169.400024    
1131.900001   176.300049    1154.100013   186.100006    1182.267190   201.600515    
1208.299994   216.600037    
</BasePoints>
</Item>
</Trans>
<Trans>
4             "lambda_a"    1             
<Item>
<Position>
2006.900024   1434.700012   
</Position>
<BasePoints>
-1000         116.699982    0             0             -10.352950    28.177056     
-47.200012    79.199982     -69.400024    105.599976    -138.800049   105.599976    
-1854.100025  105.599976    -1854.100025  105.599976    -1854.100025  105.599976    
-1968.000025  105.599976    -1943.000025  -11.100006    -1971.378786  -133.493197   
-1979.100025  -162.500000   
</BasePoints>
</Item>
</Trans>
<Trans>
5             "alpha_b"     7             
<Item>
<Position>
402.799988    530.600023    
</Position>
<BasePoints>
62.500000     380.499983    0             0             4.391972      29.672662     
13.899994     79.099989     34.700012     192.999983    52.800035     288.800001    
73.600006     387.499952    101.399994    502.699995    118.175903    574.833623    
125           604.099989    
</BasePoints>
</Item>
</Trans>
<Trans>
5             "mue_a"       15            
<Item>
<Position>
402.799988    530.600023    
</Position>
<BasePoints>
395.800018    401.300001    0             0             10.390802     28.172915     
30.500031     81.899977     87.500000     208.299971    177.800035    272.199965    
363.899994    408.299971    650           434.699965    782.486647    440.199995    
812.500000    440.199995    
</BasePoints>
</Item>
</Trans>
<Trans>
5             "beta_a"      18            
<Item>
<Position>
402.799988    530.600023    
</Position>
<BasePoints>
4798.600006   -494.500023   0             0             1.509572      -29.975963    
5.500031      -133.400035   26.399994     -505.600023   125           -505.600023   
125           -505.600023   125           -505.600023   9520.800018   -505.600023   
9595.800018   -505.600023   9615.299988   -463.900024   9651.224438   -382.980396   
9659.700012   -354.200017   
</BasePoints>
</Item>
</Trans>
<Trans>
6             "beta_b"      1             
<Item>
<Position>
1486.100006   1172.200012   
</Position>
<BasePoints>
-756.900024   -445.800018   0             0             -7.602129     -29.086295    
-73.600006    -147.200012   -120.800018   -162.500000   -236.100006   -248.600006   
-480.500031   -430.500031   -622.200012   -343.000031   -861.100006   -534.700012   
-992.999983   -640.300035   -913.899994   -844.400001   -1083.300018  -844.400001   
-1333.300006  -844.400001   -1333.300006  -844.400001   -1333.300006  -844.400001   
-1425.000006  -844.400001   -1451.400006  -126.399994   -1457.290645  70.007503     
-1458.300006  100           
</BasePoints>
</Item>
</Trans>
<Trans>
6             "alpha_a"     7             
<Item>
<Position>
1486.100006   1172.200012   
</Position>
<BasePoints>
-479.199982   113.899994    0             0             -25.188593    16.329876     
-69.400024    44.499969     -173.600006   102.799988    -270.800018   102.799988    
-687.500000   102.799988    -687.500000   102.799988    -687.500000   102.799988    
-783.300018   102.799988    -879.200029   31.999969     -936.172378   -17.245261    
-958.300018   -37.500000    
</BasePoints>
</Item>
</Trans>
<Trans>
6             "mue_b"       8             
<Item>
<Position>
1486.100006   1172.200012   
</Position>
<BasePoints>
62.500000     90.299988     0             0             19.658355     22.699417     
38.899994     45.899963     73.600006     84.700012     105.336669    121.865931    
125           144.499969    
</BasePoints>
</Item>
</Trans>
<Trans>
7             "beta_b"      2             
<Item>
<Position>
527.799988    1134.700012   
</Position>
<BasePoints>
-187.499976   123.600006    0             0             -25.833275    15.215350     
-87.500000    50            -261.099982   150           -348.768381   200.750177    
-374.999988   215.299988    
</BasePoints>
</Item>
</Trans>
<Trans>
7             "mue_b"       9             
<Item>
<Position>
527.799988    1134.700012   
</Position>
<BasePoints>
618.000031    -65.299988    0             0             27.446000     -12.186031    
51.399994     -22.200012    94.400024     -36.100006    131.900024    -37.500000    
131.900024    -37.500000    131.900024    -37.500000    409.700012    -37.500000    
522.200012    -36.100006    806.900024    -163.899994   905.500031    -113.899994   
1008.300018   -61.100006    969.400024    20.899963     1055.500031   97.200012     
1088.899994   126.399994    1136.100006   148.600006    1180.019683   164.894690    
1208.300018   175           
</BasePoints>
</Item>
</Trans>
<Trans>
7             "mue_a"       16            
<Item>
<Position>
527.799988    1134.700012   
</Position>
<BasePoints>
409.700012    29.199982     0             0             29.975963     1.509572      
147.200012    6.999969      623.600006    27.799988     796.393733    35.771252     
826.399994    37.500000     
</BasePoints>
</Item>
</Trans>
<Trans>
7             "beta_a"      20            
<Item>
<Position>
527.799988    1134.700012   
</Position>
<BasePoints>
62.500000     -209.700012   0             0             7.602129      -29.086295    
27.800035     -113.899994   94.400024     -386.100006   125.025017    -515.165770   
131.900024    -544.400024   
</BasePoints>
</Item>
</Trans>
<Trans>
8             "lambda_b"    1             
<Item>
<Position>
1611.100006   1316.699982   
</Position>
<BasePoints>
-812.500000   33.300018     0             0             -28.672992    9.014637      
-51.399994    13.899994     -90.299988    22.200012     -125          22.200012     
-1083.300018  22.200012     -1083.300018  22.200012     -1083.300018  22.200012     
-1231.900001  22.200012     -1255.500007  -91.699982    -1405.500007  -77.799988    
-1452.800012  -73.600006    -1506.900001  -62.500000    -1554.080729  -51.532905    
-1583.300006  -44.499969    
</BasePoints>
</Item>
</Trans>
<Trans>
8             "alpha_a"     9             
<Item>
<Position>
1611.100006   1316.699982   
</Position>
<BasePoints>
62.500000     6.900024      0             0             29.975912     -1.509572     
44.499969     -2.799988     65.299988     -4.199982     95.010488     -4.986293     
125           -6.999969     
</BasePoints>
</Item>
</Trans>
<Trans>
9             "lambda_b"    2             
<Item>
<Position>
1736.100006   1309.700012   
</Position>
<BasePoints>
-798.600006   104.199982    0             0             -25.188593    16.329876     
-43.000031    26.399994     -70.800018    40.299988     -97.200012    47.200012     
-431.900024   118.099976    -523.600006   93.099976     -868.000031   93.099976     
-1458.299994  93.099976     -1458.299994  93.099976     -1458.299994  93.099976     
-1490.300012  93.099976     -1523.600006  77.799988     -1558.485369  57.176806     
-1583.300006  40.299988     
</BasePoints>
</Item>
</Trans>
<Trans>
9             "beta_a"      10            
<Item>
<Position>
1736.100006   1309.700012   
</Position>
<BasePoints>
62.500000     -256.900024   0             0             5.928702      -29.431885    
23.600006     -133.300018   97.200012     -512.500000   126.064419    -666.364399   
131.999969    -695.800018   
</BasePoints>
</Item>
</Trans>
<Trans>
9             "mue_a"       11            
<Item>
<Position>
1736.100006   1309.700012   
</Position>
<BasePoints>
62.500000     43.099976     0             0             26.858920     13.429460     
43.099976     22.200012     68.099976     33.399963     104.962722    52.251832     
131.999969    65.299988     
</BasePoints>
</Item>
</Trans>
<Trans>
10            "lambda_b"    3             
<Item>
<Position>
1868.099976   613.899994    
</Position>
<BasePoints>
-791.699982   268.000031    0             0             -9.560898     28.426736     
-33.399963    97.200012     -86.199951    230.500031    -131.999969   230.500031    
-583.399963   230.500031    -583.399963   230.500031    -583.399963   230.500031    
-830.599976   230.500031    -890.299988   294.400024    -1138.899994  294.400024    
-1465.299988  294.400024    -1465.299988  294.400024    -1465.299988  294.400024    
-1495.899987  294.400024    -1529.199982  306.900024    -1564.765928  325.926901    
-1590.299964  341.699982    
</BasePoints>
</Item>
</Trans>
<Trans>
10            "alpha_a"     12            
<Item>
<Position>
1868.099976   613.899994    
</Position>
<BasePoints>
69.400024     -38.899994    0             0             22.913028     -19.341010    
47.200012     -40.299988    77.700043     -65.299988    115.940613    -97.193281    
138.800049    -116.699982   
</BasePoints>
</Item>
</Trans>
<Trans>
11            "lambda_b"    4             
<Item>
<Position>
1868.099976   1375          
</Position>
<BasePoints>
69.400024     43.099976     0             0             27.561188     12.009406     
51.300049     22.200012     77.700043     33.300018     111.204802    47.893788     
138.800049    59.700012     
</BasePoints>
</Item>
</Trans>
<Trans>
11            "lambda_a"    8             
<Item>
<Position>
1868.099976   1375          
</Position>
<BasePoints>
-131.999969   -1.399994     0             0             -29.978775    -1.206038     
-48.699951    -2.799988     -63.899994    -4.199982     -79.199982    -5.599976     
-134.799957   -15.299988    -150          -16.699982    -204.199982   -34.700012    
-209.799957   -36.100006    -213.899994   -37.500000    -229.963488   -45.322485    
-256.999969   -58.300018    
</BasePoints>
</Item>
</Trans>
<Trans>
12            "lambda_b"    5             
<Item>
<Position>
2006.900024   497.200012    
</Position>
<BasePoints>
-791.600037   -329.100013   0             0             -19.297693    -22.948590    
-115.200043   -102.800012   -198.600006   -48.600006    -298.600006   -138.900018   
-384.700012   -215.300012   -341.600037   -344.400012   -458.300018   -344.400012   
-722.200012   -344.400012   -722.200012   -344.400012   -722.200012   -344.400012   
-813.800049   -344.400012   -837.500000   -340.300012   -930.500031   -340.300012   
-1208.300018  -340.300012   -1208.300018  -340.300012   -1208.300018  -340.300012   
-1247.200012  -340.300012   -1255.500031  -325.000012   -1287.500048  -302.800012   
-1441.600037  -190.300012   -1497.200012  -155.500007   -1591.122503  6.363529      
-1604.100037  33.400011     
</BasePoints>
</Item>
</Trans>
<Trans>
12            "beta_a"      13            
<Item>
<Position>
2006.900024   497.200012    
</Position>
<BasePoints>
69.499969     156.999969    0             0             14.395877     26.378080     
41.699982     76.399994     87.500000     162.500000    124.467602    232.042540    
138.899994    258.400011    
</BasePoints>
</Item>
</Trans>
<Trans>
12            "mue_a"       14            
<Item>
<Position>
2006.900024   497.200012    
</Position>
<BasePoints>
-458.300018   13.899994     0             0             -30.048245    0             
-62.500000    0             -102.700043   0             -138.800049   0             
-458.300018   0             -458.300018   0             -458.300018   0             
-615.200043   0             -800          45.900011     -901.719645   76.285391     
-930.500031   84.699965     
</BasePoints>
</Item>
</Trans>
<Trans>
13            "alpha_a"     17            
<Item>
<Position>
2145.800018   755.600023    
</Position>
<BasePoints>
69.499969     -33.400011    0             0             24.018811     -18.057325    
47.299957     -37.500000    76.399994     -58.400011    114.882643    -87.571583    
138.899994    -105.600023   
</BasePoints>
</Item>
</Trans>
<Trans>
13            "lambda_b"    18            
<Item>
<Position>
2145.800018   755.600023    
</Position>
<BasePoints>
3958.399963   3172.199965   0             0             0             30.048203     
0             101.300001    1.399994      254.099989    2.799988      380.499983    
4.199982      469.399977    5.599976      491.599989    6.999969      580.499983    
25            1372.199965   20.899963     1570.799971   59.799957     2362.499952   
69.499969     2538.800001   -37.500000    3158.299971   138.899994    3158.299971   
138.899994    3158.299971   138.899994    3158.299971   3263.899994   3158.299971   
3419.499969   3158.299971   3456.999969   3161.099958   3611.100006   3161.099958   
3611.100006   3161.099958   3611.100006   3161.099958   3888.899994   3161.099958   
4075          3161.099958   4120.899963   3167.999983   4305.599976   3167.999983   
4305.599976   3167.999983   4305.599976   3167.999983   5277.799988   3167.999983   
5370.899963   3167.999983   5394.499969   3169.399977   5486.100006   3169.399977   
5486.100006   3169.399977   5486.100006   3169.399977   7152.799988   3169.399977   
7247.299957   3169.399977   7268.099976   3202.699995   7361.100006   3202.699995   
7361.100006   3202.699995   7361.100006   3202.699995   7777.799988   3202.699995   
7876.399994   3202.699995   7911.100006   -87.500000    7916.699982   -549.186672   
7916.699982   -579.200017   
</BasePoints>
</Item>
</Trans>
<Trans>
14            "lambda_a"    10            
<Item>
<Position>
1076.399994   581.899977    
</Position>
<BasePoints>
409.700012    43.100023     0             0             29.757263     3.601767      
113.899994    12.500000     308.300018    32.000017     472.200012    32.000017     
472.200012    32.000017     472.200012    32.000017     659.700012    32.000017     
687.500000    32.000017     718.000031    32.000017     761.719931    32.000017     
791.699982    32.000017     
</BasePoints>
</Item>
</Trans>
<Trans>
14            "lambda_b"    15            
<Item>
<Position>
1076.399994   581.899977    
</Position>
<BasePoints>
69.400024     168.100023    0             0             15.234757     25.899064     
36.100006     61.200047     62.500000     111.200047    79.199982     157.000017    
101.399994    218.100023    119.400024    293.100023    133.024977    359.464422    
138.899994    388.900042    
</BasePoints>
</Item>
</Trans>
<Trans>
15            "lambda_a"    3             
<Item>
<Position>
1215.299988   970.800018    
</Position>
<BasePoints>
-486.100006   173.600006    0             0             -28.530307    9.481645      
-148.600006   51.399994     -530.599976   184.799957    -659.699965   204.199982    
-683.400011   206.999969    -691.699982   212.500000    -715.299988   204.199982    
-805.599976   168.099976    -879.199982   72.299957     -921.317118   10.094807     
-937.499976   -15.200043    
</BasePoints>
</Item>
</Trans>
<Trans>
15            "alpha_b"     16            
<Item>
<Position>
1215.299988   970.800018    
</Position>
<BasePoints>
69.400024     123.600006    0             0             16.598786     24.983694     
30.500031     45.899963     45.800018     68.099976     59.700012     87.500000     
77.799988     112.500000    95.800018     138.899994    121.844734    176.675998    
138.899994    201.399994    
</BasePoints>
</Item>
</Trans>
<Trans>
16            "beta_b"      4             
<Item>
<Position>
1354.199982   1172.200012   
</Position>
<BasePoints>
319.400024    -158.300018   0             0             8.399661      -28.835929    
26.399994     -83.300018    63.899994     -169.400024   131.900024    -169.400024   
131.900024    -169.400024   131.900024    -169.400024   513.899994    -169.400024   
595.800018    -169.400024   636.100006    112.500000    649.760027    232.669843    
652.700043    262.500000    
</BasePoints>
</Item>
</Trans>
<Trans>
16            "lambda_a"    6             
<Item>
<Position>
1354.199982   1172.200012   
</Position>
<BasePoints>
69.400024     11.100006     0             0             30.048245     0             
51.399994     0             72.200012     0             101.916835    0             
131.900024    0             
</BasePoints>
</Item>
</Trans>
<Trans>
16            "mue_b"       11            
<Item>
<Position>
1354.199982   1172.200012   
</Position>
<BasePoints>
256.900024    76.399994     0             0             27.044894     12.971355     
68.000031     31.999969     129.100037    58.399963     184.700012    66.699982     
305.500031    84.700012     355.500031    -43.000031    454.100037    26.399994     
476.399994    41.699982     494.400024    109.700012    508.646964    173.282825    
513.899994    202.799988    
</BasePoints>
</Item>
</Trans>
<Trans>
17            "lambda_b"    19            
<Item>
<Position>
2284.700012   650           
</Position>
<BasePoints>
69.499969     -216.699982   0             0             5.938291      -29.437094    
15.299988     -80.600023    33.399963     -165.299988   59.700012     -236.100006   
73.600006     -276.399994   97.200012     -319.400001   123.851271    -367.156001   
138.899994    -393.099999   
</BasePoints>
</Item>
</Trans>
<Trans>
17            "mue_a"       28            
<Item>
<Position>
2284.700012   650           
</Position>
<BasePoints>
3750          -361.100006   0             0             10.555213     -28.119104    
48.600006     -123.600006   163.899994    -372.199988   347.200012    -372.199988   
347.200012    -372.199988   347.200012    -372.199988   3680.599976   -372.199988   
3927.799988   -372.199988   3990.299988   -380.599999   4236.100006   -380.599999   
4236.100006   -380.599999   4236.100006   -380.599999   6805.599976   -380.599999   
7055.599976   -380.599999   7344.499969   -287.500000   7471.887312   -241.110610   
7500          -230.600023   
</BasePoints>
</Item>
</Trans>
<Trans>
17            "beta_a"      31            
<Item>
<Position>
2284.700012   650           
</Position>
<BasePoints>
3611.100006   3152.799988   0             0             1.208770      29.960384     
9.700012      379.199982    88.899994     3130.599976   416.699982    3130.599976   
416.699982    3130.599976   416.699982    3130.599976   833.399963    3130.599976   
926.399994    3130.599976   950           3131.900024   1041.699982   3131.900024   
1041.699982   3131.900024   1041.699982   3131.900024   1319.499969   3131.900024   
1412.500000   3131.900024   1436.100006   3134.700012   1527.799988   3134.700012   
1527.799988   3134.700012   1527.799988   3134.700012   2152.799988   3134.700012   
2308.399963   3134.700012   2345.899963   3141.699982   2500          3141.699982   
2500          3141.699982   2500          3141.699982   3611.100006   3141.699982   
3704.199982   3141.699982   3727.799988   3150          3819.499969   3150          
3819.499969   3150          3819.499969   3150          6597.200012   3150          
6738.899994   3150          7111.100006   2997.200012   7162.500000   2868.099976   
7216.699982   2730.599976   7222.200012   416.699982    7222.200012   30.013353     
7222.200012   0             
</BasePoints>
</Item>
</Trans>
<Trans>
18            "alpha_a"     19            
<Item>
<Position>
10062.500000  176.400006    
</Position>
<BasePoints>
-3819.400024  -15.300012    0             0             -28.835929    -8.399651     
-61.100006    -18.100011    -101.399994   -26.400006    -138.899994   -26.400006    
-7500         -26.400006    -7500         -26.400006    -7500         -26.400006    
-7559.700012  -26.400006    -7586.100006  -4.200006     -7625.146868  53.861068     
-7638.899994  80.499995     
</BasePoints>
</Item>
</Trans>
<Trans>
18            "alpha_b"     20            
<Item>
<Position>
10062.500000  176.400006    
</Position>
<BasePoints>
-4722.200012  -76.400006    0             0             -17.390778    -24.413960    
-55.599976    -68.100011    -77.799988    -90.300006    -138.899994   -90.300006    
-3819.400024  -90.300006    -3819.400024  -90.300006    -3819.400024  -90.300006    
-4004.199982  -90.300006    -4050         -87.500006    -4236.100006  -87.500006    
-5555.599976  -87.500006    -5555.599976  -87.500006    -5555.599976  -87.500006    
-5647.200012  -87.500006    -5670.800018  -83.300006    -5763.899994  -83.300006    
-6736.100006  -83.300006    -6736.100006  -83.300006    -6736.100006  -83.300006    
-6827.799988  -83.300006    -6851.399994  -82.000005    -6944.400024  -82.000005    
-7222.200012  -82.000005    -7222.200012  -82.000005    -7222.200012  -82.000005    
-7945.800018  -82.000005    -8122.200012  37.499988     -8847.200012  37.499988     
-9263.899994  37.499988     -9263.899994  37.499988     -9263.899994  37.499988     
-9422.200012  37.499988     -9365.299988  209.700000    -9398.519214  384.179042    
-9402.799988  413.899982    
</BasePoints>
</Item>
</Trans>
<Trans>
19            "alpha_b"     21            
<Item>
<Position>
2423.600006   256.900001    
</Position>
<BasePoints>
-812.500000   23.699999     0             0             -29.757263    3.601746      
-62.500000    6.999993      -102.799988   9.800005      -138.899994   9.800005      
-625          9.800005      -625          9.800005      -625          9.800005      
-736.100006   9.800005      -762.500000   12.500000     -875          12.500000     
-1486.100006  12.500000     -1486.100006  12.500000     -1486.100006  12.500000     
-1525         12.500000     -1537.500000  26.399994     -1565.299988  54.200006     
-1584.700012  75            -1600         105.599999    -1615.491654  147.937090    
-1625         176.400018    
</BasePoints>
</Item>
</Trans>
<Trans>
19            "mue_a"       27            
<Item>
<Position>
2423.600006   256.900001    
</Position>
<BasePoints>
3750          -31.900001    0             0             27.146564     -12.894626    
59.700012     -27.699995    101.399994    -43.000007    138.899994    -43.000007    
138.899994    -43.000007    138.899994    -43.000007    3888.899994   -43.000007    
3981.999969   -43.000007    4005.599976   -40.199995    4097.200012   -40.199995    
4097.200012   -40.199995    4097.200012   -40.199995    6736.100006   -40.199995    
6891.699982   -40.199995    6929.199982   -1.300001     7083.300018   -1.300001     
7083.300018   -1.300001     7083.300018   -1.300001     7361.100006   -1.300001     
7397.200012   -1.300001     7434.700012   16.700006     7475.976974   44.529051     
7500          62.500000     
</BasePoints>
</Item>
</Trans>
<Trans>
19            "beta_a"      30            
<Item>
<Position>
2423.600006   256.900001    
</Position>
<BasePoints>
69.499969     540.300012    0             0             4.772550      29.658123     
27.799988     177.800012    106.999969    726.400018    134.680340    911.979065    
138.899994    941.700006    
</BasePoints>
</Item>
</Trans>
<Trans>
20            "beta_b"      3             
<Item>
<Position>
659.700012    590.299988    
</Position>
<BasePoints>
-194.400024   191.599989    0             0             -23.474824    18.746069     
-84.700012    70.800018     -223.600006   188.899994    -329.100013   298.600006    
-337.500024   308.300018    -347.200012   319.400024    -363.740439   341.362407    
-381.900001   365.299988    
</BasePoints>
</Item>
</Trans>
<Trans>
20            "mue_b"       10            
<Item>
<Position>
659.700012    590.299988    
</Position>
<BasePoints>
625           -79.199982    0             0             29.437053     -5.938291     
148.600006    -30.599976    515.299988    -101.399994   634.700012    -90.299988    
833.399963    -70.900011    1063.899994   -13.899994    1179.374051   15.929304     
1208.399963   23.600006     
</BasePoints>
</Item>
</Trans>
<Trans>
20            "alpha_a"     21            
<Item>
<Position>
659.700012    590.299988    
</Position>
<BasePoints>
69.499969     -58.400011    0             0             18.746028     -23.474784    
33.400011     -41.699982    47.199965     -58.400011    59.699965     -73.600006    
73.600006     -88.899994    90.299988     -106.999969   117.679482    -135.718308   
138.899994    -156.999969   
</BasePoints>
</Item>
</Trans>
<Trans>
21            "beta_b"      5             
<Item>
<Position>
798.600006    433.300018    
</Position>
<BasePoints>
-208.300018   66.699982     0             0             -29.076491    7.334574      
-106.900024   26.399994     -276.399994   66.699982     -366.777911   89.486327     
-395.800018   97.300005     
</BasePoints>
</Item>
</Trans>
<Trans>
21            "mue_b"       12            
<Item>
<Position>
798.600006    433.300018    
</Position>
<BasePoints>
625           11.099958     0             0             30.048245     0             
63.899994     0             104.199982    0             138.899994    0             
138.899994    0             138.899994    0             687.500000    0             
862.500000    0             1068.099976   36.099958     1178.864399   58.024977     
1208.300018   63.899994     
</BasePoints>
</Item>
</Trans>
<Trans>
21            "beta_a"      22            
<Item>
<Position>
798.600006    433.300018    
</Position>
<BasePoints>
937.500000    -91.600013    0             0             17.431364     -24.387157    
44.499969     -59.700012    88.899994     -102.700019   138.899994    -102.700019   
138.899994    -102.700019   138.899994    -102.700019   1763.899994   -102.700019   
1805.599976   -102.700019   1843.099976   -76.400018    1882.435631   -38.676688    
1902.799988   -16.600037    
</BasePoints>
</Item>
</Trans>
<Trans>
21            "mue_a"       23            
<Item>
<Position>
798.600006    433.300018    
</Position>
<BasePoints>
69.499969     118.099976    0             0             17.958972     24.002825     
44.499969     59.800005     83.300018     112.500000    121.271552    164.570292    
138.899994    188.899994    
</BasePoints>
</Item>
</Trans>
<Trans>
22            "mue_b"       13            
<Item>
<Position>
2701.399994   416.699982    
</Position>
<BasePoints>
-277.799988   254.100037    0             0             -25.899024    15.234757     
-44.499969    27.699995     -62.500000    38.900042     -79.199982    50            
-173.600006   118.000031    -270.800018   223.600006    -381.999969   280.500031    
-422.200012   302.699995    -431.999969   308.300018    -476.399994   322.200012    
-486.100006   325           -497.200012   327.699995    -526.060767   333.794494    
-555.599976   338.900042    
</BasePoints>
</Item>
</Trans>
<Trans>
22            "beta_b"      18            
<Item>
<Position>
2701.399994   416.699982    
</Position>
<BasePoints>
3680.500031   -76.399970    0             0             15.234757     -25.899024    
52.799988     -66.699982    80.500031     -77.799988    138.899994    -77.799988    
138.899994    -77.799988    138.899994    -77.799988    3263.899994   -77.799988    
3543.000031   -77.799988    3611.100006   -93.099976    3888.899994   -93.099976    
3888.899994   -93.099976    3888.899994   -93.099976    4513.899994   -93.099976    
4606.900024   -93.099976    4630.500031   -94.499993    4722.200012   -94.499993    
4722.200012   -94.499993    4722.200012   -94.499993    6388.899994   -94.499993    
6581.900024   -94.499993    6613.899994   -213.899970   6805.500031   -213.899970   
6805.500031   -213.899970   6805.500031   -213.899970   7222.200012   -213.899970   
7254.199982   -213.899970   7287.500000   -219.499981   7332.319620   -231.824402   
7361.100006   -240.299976   
</BasePoints>
</Item>
</Trans>
<Trans>
22            "alpha_a"     24            
<Item>
<Position>
2701.399994   416.699982    
</Position>
<BasePoints>
69.400024     69.400024     0             0             25.571241     15.763131     
45.800018     27.699995     65.299988     43.000031     79.199982     58.300018     
93.000031     73.600006     106.900024    94.400024     125.493403    128.686849    
138.899994    155.500031    
</BasePoints>
</Item>
</Trans>
<Trans>
23            "mue_b"       14            
<Item>
<Position>
937.500000    622.200012    
</Position>
<BasePoints>
69.400024     -4.099989     0             0             28.835929     -8.399661     
51.399994     -15.300035    72.200012     -22.200012    110.119608    -31.824432    
138.899994    -40.300035    
</BasePoints>
</Item>
</Trans>
<Trans>
23            "beta_b"      15            
<Item>
<Position>
937.500000    622.200012    
</Position>
<BasePoints>
138.899994    213.899994    0             0             20.020615     22.395931     
56.900024     63.899994     122.200012    137.500000    173.600006    202.799988    
200           237.500000    229.199982    279.199982    260.740353    323.931000    
277.799988    348.600006    
</BasePoints>
</Item>
</Trans>
<Trans>
23            "lambda_a"    20            
<Item>
<Position>
937.500000    622.200012    
</Position>
<BasePoints>
-138.899994   1.399994      0             0             -29.844527    -3.526288     
-83.300018    -9.700012     -173.600006   -20.800018    -247.976293   -28.524896    
-277.799988   -31.900024    
</BasePoints>
</Item>
</Trans>
<Trans>
24            "mue_b"       17            
<Item>
<Position>
2840.299988   572.200012    
</Position>
<BasePoints>
-277.799988   88.899994     0             0             -21.195041    21.195041     
-51.399994    47.199965     -94.499969    77.799988     -138.899994   77.799988     
-416.699982   77.799988     -416.699982   77.799988     -416.699982   77.799988     
-445.899963   77.799988     -479.199982   77.799988     -525.586623   77.799988     
-555.599976   77.799988     
</BasePoints>
</Item>
</Trans>
<Trans>
24            "beta_b"      19            
<Item>
<Position>
2840.299988   572.200012    
</Position>
<BasePoints>
-208.399963   -113.899994   0             0             -26.360659    -14.300229    
-65.299988    -37.500000    -125          -72.200012    -173.600006   -108.300018   
-251.399994   -165.300035   -333.399963   -238.900018   -394.687867   -294.934229   
-416.699982   -315.300012   
</BasePoints>
</Item>
</Trans>
<Trans>
24            "beta_a"      25            
<Item>
<Position>
2840.299988   572.200012    
</Position>
<BasePoints>
69.400024     440.299988    0             0             4.695130      29.621808     
27.799988     156.999969    104.100037    573.600006    133.794475    735.760779    
138.899994    765.299988    
</BasePoints>
</Item>
</Trans>
<Trans>
24            "mue_a"       26            
<Item>
<Position>
2840.299988   572.200012    
</Position>
<BasePoints>
3402.799988   -108.300018   0             0             15.269982     -25.874119    
40.299988     -65.300035    84.700012     -119.400024   138.899994    -119.400024   
138.899994    -119.400024   138.899994    -119.400024   6666.600037   -119.400024   
6697.200012   -119.400024   6730.500031   -123.600006   6775.874197   -131.040468   
6805.500031   -136.100006   
</BasePoints>
</Item>
</Trans>
<Trans>
25            "alpha_a"     29            
<Item>
<Position>
2979.199982   1337.500000   
</Position>
<BasePoints>
69.400024     62.500000     0             0             24.387157     17.431364     
48.600006     34.700012     76.399994     54.199982     114.175998    80.144752     
138.899994    97.200012     
</BasePoints>
</Item>
</Trans>
<Trans>
25            "beta_b"      30            
<Item>
<Position>
2979.199982   1337.500000   
</Position>
<BasePoints>
-208.399963   -56.900024    0             0             -28.530307    -9.481645     
-106.999969   -36.100006    -284.799957   -94.400024    -388.112298   -129.633233   
-416.699982   -138.899994   
</BasePoints>
</Item>
</Trans>
<Trans>
25            "mue_b"       31            
<Item>
<Position>
2979.199982   1337.500000   
</Position>
<BasePoints>
3263.899994   -748.600006   0             0             2.325979      -29.892676    
15.200043     -184.700012   65.200043     -759.700012   138.899994    -759.700012   
138.899994    -759.700012   138.899994    -759.700012   3194.400024   -759.700012   
3318.000031   -759.700012   3350          -770.800018   3472.200012   -770.800018   
3472.200012   -770.800018   3472.200012   -770.800018   6388.899994   -770.800018   
6429.100037   -770.800018   6466.600037   -744.399977   6506.940403   -709.132413   
6527.700043   -687.500000   
</BasePoints>
</Item>
</Trans>
<Trans>
26            "lambda_a"    22            
<Item>
<Position>
9645.800018   436.100006    
</Position>
<BasePoints>
-3472.200012  -33.300018    0             0             -26.351612    -14.428599    
-58.300018    -29.200029    -100          -44.400001    -138.899994   -44.400001    
-3194.400024  -44.400001    -3194.400024  -44.400001    -3194.400024  -44.400001    
-3348.600006  -44.400001    -3386.100006  -44.400001    -3541.600037  -44.400001    
-6805.500031  -44.400001    -6805.500031  -44.400001    -6805.500031  -44.400001    
-6836.100006  -44.400001    -6870.800018  -38.900018    -6915.350504  -27.093222    
-6944.400024  -19.400024    
</BasePoints>
</Item>
</Trans>
<Trans>
26            "beta_b"      27            
<Item>
<Position>
9645.800018   436.100006    
</Position>
<BasePoints>
138.899994    -70.799994    0             0             20.020615     -22.395931    
48.600006     -52.800012    62.500000     -66.700006    104.199982    -86.100006    
144.499969    -102.800012   193.099976    -111.100006   247.793727    -114.971258   
277.799988    -116.700006   
</BasePoints>
</Item>
</Trans>
<Trans>
26            "mue_b"       28            
<Item>
<Position>
9645.800018   436.100006    
</Position>
<BasePoints>
69.499969     5.599976      0             0             29.775070     -3.593573     
51.399994     -6.900024     72.299957     -8.300018     109.076299    -13.263541    
138.899994    -16.700029    
</BasePoints>
</Item>
</Trans>
<Trans>
27            "lambda_a"    18            
<Item>
<Position>
9923.600006   319.400001    
</Position>
<BasePoints>
69.499969     -50           0             0             20.621003     -21.844276    
45.800018     -47.200012    79.199982     -81.900001    118.086917    -121.347207   
138.899994    -142.999995   
</BasePoints>
</Item>
</Trans>
<Trans>
27            "alpha_b"     23            
<Item>
<Position>
9923.600006   319.400001    
</Position>
<BasePoints>
-4513.899994  3668.099999   0             0             0             29.978817     
-4.199982     404.200006    -44.400024    3586.199975   -138.899994   3586.199975   
-416.699982   3586.199975   -416.699982   3586.199975   -416.699982   3586.199975   
-513.899994   3586.199975   -526.399994   3658.399987   -625          3658.399987   
-4444.400024  3658.399987   -4444.400024  3658.399987   -4444.400024  3658.399987   
-4536.100006  3658.399987   -4559.700012  3656.999993   -4652.799988  3656.999993   
-7500         3656.999993   -7500         3656.999993   -7500         3656.999993   
-7579.199982  3656.999993   -7622.200012  3668.099999   -7673.600006  3606.999993   
-7801.399994  3451.400018   -7700         3355.599999   -7718.000031  3155.599999   
-7784.700012  2397.299981   -7652.799988  1455.599999   -7976.399994  733.399987    
-8070.800018  520.899987    -8250         634.799981    -8465.299988  544.499993    
-8608.300018  484.799981    -8625         430.599999    -8768.000031  368.099999    
-8825         344.499993    -8893.000031  324.999976    -8956.865752  309.675019    
-8986.100006  302.800012    
</BasePoints>
</Item>
</Trans>
<Trans>
28            "lambda_a"    13            
<Item>
<Position>
9784.700012   419.399977    
</Position>
<BasePoints>
-3819.400024  3444.500017   0             0             0             29.978817     
-5.500031     397.300005    -48.600006    3433.400011   -138.899994   3433.400011   
-3611.100006  3433.400011   -3611.100006  3433.400011   -3611.100006  3433.400011   
-3733.300018  3433.400011   -3765.299988  3436.199999   -3888.899994  3436.199999   
-7500         3436.199999   -7500         3436.199999   -7500         3436.199999   
-7579.100037  3436.199999   -7630.500031  780.600023    -7638.899994  366.213370    
-7638.899994  336.200047    
</BasePoints>
</Item>
</Trans>
<Trans>
28            "lambda_b"    27            
<Item>
<Position>
9784.700012   419.399977    
</Position>
<BasePoints>
69.499969     -31.899977    0             0             24.413940     -17.390738    
48.600006     -34.699988    76.399994     -55.499983    114.882644    -81.971522    
138.899994    -99.999976    
</BasePoints>
</Item>
</Trans>
<Trans>
29            "mue_b"       32            
<Item>
<Position>
3118.099976   1434.700012   
</Position>
<BasePoints>
69.400024     -13.899994    0             0             27.561188     -12.009406    
41.600037     -18.000031    51.300049     -22.200012    59.700012     -25           
70.800018     -30.500031    81.900024     -34.700012    110.952469    -45.610452    
138.800049    -56.900024    
</BasePoints>
</Item>
</Trans>
<Trans>
29            "beta_b"      35            
<Item>
<Position>
3118.099976   1434.700012   
</Position>
<BasePoints>
138.800049    1254.199982   0             0             3.526329      29.844527     
38.800049     273.600006    231.900024    1679.199982   274.324914    1979.876317   
277.700043    2009.700012   
</BasePoints>
</Item>
</Trans>
<Trans>
29            "mue_a"       41            
<Item>
<Position>
3118.099976   1434.700012   
</Position>
<BasePoints>
3055.500031   2145.899963   0             0             7.231110      29.098589     
36.100006     137.500000    118.000031    462.500000    173.600006    734.700012    
190.200043    811.100006    338.800049    2123.600006   416.600037    2123.600006   
416.600037    2123.600006   416.600037    2123.600006   625           2123.600006   
718.000031    2123.600006   741.600037    2129.199982   833.300018    2129.199982   
833.300018    2129.199982   833.300018    2129.199982   1388.800049   2129.199982   
1544.400024   2129.199982   1581.900024   2134.700012   1736.100006   2134.700012   
1736.100006   2134.700012   1736.100006   2134.700012   2916.600037   2134.700012   
3133.300018   2134.700012   3187.500000   2134.700012   3402.700043   2134.700012   
3402.700043   2134.700012   3402.700043   2134.700012   5972.200012   2134.700012   
6004.100037   2134.700012   6037.500000   2127.799988   6082.535555   2113.439647   
6111.100006   2104.199982   
</BasePoints>
</Item>
</Trans>
<Trans>
29            "beta_a"      43            
<Item>
<Position>
3118.099976   1434.700012   
</Position>
<BasePoints>
2916.600037   -781.900024   0             0             2.325979      -29.892676    
13.800049     -188.899994   61.100006     -793.000031   138.800049    -793.000031   
138.800049    -793.000031   138.800049    -793.000031   2847.200012   -793.000031   
3063.800049   -793.000031   3118.000031   -815.300035   3333.300018   -815.300035   
3333.300018   -815.300035   3333.300018   -815.300035   5277.700043   -815.300035   
5388.800049   -815.300035   5376.300049   -679.099989   5486.100006   -679.099989   
5486.100006   -679.099989   5486.100006   -679.099989   5694.400024   -679.099989   
5762.500000   -679.099989   5787.500000   -648.600006   5824.824444   -575.980398   
5833.300018   -547.200012   
</BasePoints>
</Item>
</Trans>
<Trans>
30            "alpha_b"     22            
<Item>
<Position>
2562.500000   1198.600006   
</Position>
<BasePoints>
69.400024     -509.700012   0             0             1.208770      -29.960384    
5.599976      -120.800018   19.400024     -350          59.700012     -537.500000   
76.399994     -608.300018   102.799988    -687.500000   128.149884    -753.866545   
138.899994    -781.900024   
</BasePoints>
</Item>
</Trans>
<Trans>
30            "alpha_a"     35            
<Item>
<Position>
2562.500000   1198.600006   
</Position>
<BasePoints>
416.699982    2320.800018   0             0             0             30.048245     
2.799988      323.600006    20.800018     2309.700012   138.899994    2309.700012   
138.899994    2309.700012   138.899994    2309.700012   694.400024    2309.700012   
730.599976    2309.700012   768.099976    2291.699982   809.282667    2263.828459   
833.300018    2245.800018   
</BasePoints>
</Item>
</Trans>
<Trans>
31            "lambda_b"    30            
<Item>
<Position>
9506.900024   650           
</Position>
<BasePoints>
-3472.200012  -122.200012   0             0             -3.526329     -29.844527    
-40.200043    -98.600006    -63.800049    -136.100006   -138.800049   -136.100006   
-3194.400024  -136.100006   -3194.400024  -136.100006   -3194.400024  -136.100006   
-3316.600037  -136.100006   -3348.600006  -133.300018   -3472.200012  -133.300018   
-6041.600037  -133.300018   -6041.600037  -133.300018   -6041.600037  -133.300018   
-6295.800018  -133.300018   -6393.000031  -94.399977    -6423.600006  -77.799988    
-6679.100037  65.299988     -6862.500000  387.500000    -6930.993434  521.786825    
-6944.400024  548.600006    
</BasePoints>
</Item>
</Trans>
<Trans>
31            "alpha_a"     32            
<Item>
<Position>
9506.900024   650           
</Position>
<BasePoints>
-3125         50            0             0             -30.048245    0             
-62.500000    0             -102.700043   0             -138.800049   0             
-902.700043   0             -902.700043   0             -902.700043   0             
-995.800018   0             -1016.600037  22.200012     -1111.100006  22.200012     
-2222.200012  22.200012     -2222.200012  22.200012     -2222.200012  22.200012     
-2313.800049  22.200012     -2337.500000  23.600006     -2430.500031  23.600006     
-2777.700043  23.600006     -2777.700043  23.600006     -2777.700043  23.600006     
-3116.600037  23.600006     -3201.300049  52.799988     -3541.600037  52.799988     
-6111.100006  52.799988     -6111.100006  52.799988     -6111.100006  52.799988     
-6198.600006  52.799988     -6169.400024  150           -6190.200043  236.100006    
-6226.300049  395.800018    -6241.600037  590.299988    -6248.271252  697.793727    
-6250         727.799988    
</BasePoints>
</Item>
</Trans>
<Trans>
32            "beta_a"      33            
<Item>
<Position>
3256.900024   1377.799988   
</Position>
<BasePoints>
69.499969     175           0             0             12.971355     27.044894     
40.299988     84.700012     88.899994     190.299988    126.176519    268.640302    
138.899994    295.800018    
</BasePoints>
</Item>
</Trans>
<Trans>
32            "mue_a"       34            
<Item>
<Position>
3256.900024   1377.799988   
</Position>
<BasePoints>
3055.599976   -622.199965   0             0             3.601726      -29.757263    
19.499969     -165.299988   77.799988     -622.199965   138.899994    -622.199965   
138.899994    -622.199965   138.899994    -622.199965   2708.399963   -622.199965   
2831.999969   -622.199965   2863.899994   -633.400011   2986.199951   -633.400011   
2986.199951   -633.400011   2986.199951   -633.400011   3402.799988   -633.400011   
3836.199951   -633.400011   3943.099976   -652.799988   4375          -652.799988   
4375          -652.799988   4375          -652.799988   5138.899994   -652.799988   
5233.399963   -652.799988   5254.199982   -675          5347.299957   -675          
5347.299957   -675          5347.299957   -675          5972.299957   -675          
6041.699982   -675          6101.399994   1636.100006   6110.338104   2022.819937   
6111.199951   2052.799988   
</BasePoints>
</Item>
</Trans>
<Trans>
32            "lambda_b"    35            
<Item>
<Position>
3256.900024   1377.799988   
</Position>
<BasePoints>
69.499969     594.400024    0             0             2.412078      29.892676     
12.500000     84.700012     26.399994     95.800018     34.799957     148.600006    
95.899963     525           130.599976    1756.900024   138.035620    2036.593775   
138.899994    2066.600037   
</BasePoints>
</Item>
</Trans>
<Trans>
33            "lambda_b"    36            
<Item>
<Position>
3395.800018   1673.600006   
</Position>
<BasePoints>
69.499969     -11.100006    0             0             28.530307     -9.481645     
51.399994     -16.699982    72.299957     -23.600006    110.589412    -37.183358    
138.899994    -47.200012    
</BasePoints>
</Item>
</Trans>
<Trans>
33            "alpha_a"     47            
<Item>
<Position>
3395.800018   1673.600006   
</Position>
<BasePoints>
416.699982    1755.599976   0             0             1.208770      29.960384     
11.100006     265.299988    70.899963     1566.699982   198.600006    1681.999969   
372.299957    1834.700012   681.999969    1670.800018   808.054608    1593.845972   
833.399963    1577.799988   
</BasePoints>
</Item>
</Trans>
<Trans>
34            "lambda_a"    31            
<Item>
<Position>
9368.099976   3430.599976   
</Position>
<BasePoints>
69.400024     -1143.099976  0             0             1.119940      -29.978775    
16.600037     -330.599976   119.400024    -2386.199951  137.133007    -2750.593714  
138.800049    -2780.599976  
</BasePoints>
</Item>
</Trans>
<Trans>
34            "lambda_b"    37            
<Item>
<Position>
9368.099976   3430.599976   
</Position>
<BasePoints>
69.400024     70.800018     0             0             23.970579     17.999556     
47.200012     37.500000     76.300049     59.700012     115.224051    89.706615     
138.800049    108.300018    
</BasePoints>
</Item>
</Trans>
<Trans>
35            "alpha_b"     24            
<Item>
<Position>
3395.800018   3444.400024   
</Position>
<BasePoints>
-277.700043   11.199951     0             0             -30.048245    0             
-62.500000    0             -102.700043   0             -138.899994   0             
-416.600037   0             -416.600037   0             -416.600037   0             
-488.899994   0             -545.800018   -2445.800018  -554.635657   -2842.193751  
-555.500031   -2872.200012  
</BasePoints>
</Item>
</Trans>
<Trans>
35            "beta_a"      36            
<Item>
<Position>
3395.800018   3444.400024   
</Position>
<BasePoints>
69.499969     -744.400024   0             0             2.412078      -29.892676    
20.899963     -259.700012   115.299988    -1505.500031  136.376603    -1788.088877  
138.899994    -1818.000031  
</BasePoints>
</Item>
</Trans>
<Trans>
35            "mue_a"       37            
<Item>
<Position>
3395.800018   3444.400024   
</Position>
<BasePoints>
3055.599976   197.299957    0             0             8.442273      28.772737     
26.399994     84.799957     66.699982     177.799988    138.899994    177.799988    
138.899994    177.799988    138.899994    177.799988    2638.899994   177.799988    
2855.599976   177.799988    2909.799957   188.899994    3125          188.899994    
3125          188.899994    3125          188.899994    5625          188.899994    
5798.600006   188.899994    5837.500000   152.799988    6006.999969   122.299957    
6027.799988   118.099976    6031.999969   118.099976    6051.399994   113.899994    
6055.599976   112.500000    6059.799957   111.199951    6082.512323   103.766730    
6111.100006   94.499969     
</BasePoints>
</Item>
</Trans>
<Trans>
36            "alpha_b"     25            
<Item>
<Position>
3534.700012   1626.399994   
</Position>
<BasePoints>
-277.799988   -58.300018    0             0             -22.948590    -19.297693    
-52.799988    -43.099976    -95.800018    -69.499969    -138.899994   -69.499969    
-416.600037   -69.499969    -416.600037   -69.499969    -416.600037   -69.499969    
-513.899994   -69.499969    -513.899994   -152.799988   -548.024450   -259.834931   
-555.500031   -288.899994   
</BasePoints>
</Item>
</Trans>
<Trans>
36            "alpha_a"     38            
<Item>
<Position>
3534.700012   1626.399994   
</Position>
<BasePoints>
69.499969     -66.699982    0             0             19.297693     -22.948590    
45.899963     -55.599976    83.399963     -100          119.949514    -147.500271   
138.899994    -170.800018   
</BasePoints>
</Item>
</Trans>
<Trans>
37            "alpha_b"     26            
<Item>
<Position>
9506.900024   3538.899994   
</Position>
<BasePoints>
69.499969     -1355.599976  0             0             1.208770      -29.960384    
15.299988     -350          120.899963    -2683.300018  138.035620    -3072.793727  
138.899994    -3102.799988  
</BasePoints>
</Item>
</Trans>
<Trans>
37            "lambda_a"    30            
<Item>
<Position>
9506.900024   3538.899994   
</Position>
<BasePoints>
-3472.200012  213.899994    0             0             -2.325979     29.892676     
-11.100006    104.199982    -40.200043    252.799988    -138.800049   252.799988    
-416.600037   252.799988    -416.600037   252.799988    -416.600037   252.799988    
-511.100006   252.799988    -529.100037   208.300018    -625          208.300018    
-3333.300018  208.300018    -3333.300018  208.300018    -3333.300018  208.300018    
-3487.500000  208.300018    -3525         188.899994    -3680.500031  188.899994    
-6805.500031  188.899994    -6805.500031  188.899994    -6805.500031  188.899994    
-6922.200012  188.899994    -6872.200012  -216.699982   -6884.700012  -331.999969   
-6952.700043  -994.499969   -6934.700012  -1163.899994  -6941.600037  -1829.199982  
-6943.000031  -1998.600006  -6944.400024  -2200         -6944.400024  -2310.286635  
-6944.400024  -2340.299988  
</BasePoints>
</Item>
</Trans>
<Trans>
38            "alpha_b"     29            
<Item>
<Position>
3673.600006   1455.599976   
</Position>
<BasePoints>
-277.799988   6.900024      0             0             -29.960384    -1.208770     
-62.500000    -2.799988     -102.799988   -4.199982     -138.899994   -4.199982     
-416.699982   -4.199982     -416.699982   -4.199982     -416.699982   -4.199982     
-445.800018   -4.199982     -480.500031   -8.399963     -525.960822   -15.794445    
-555.500031   -20.899963    
</BasePoints>
</Item>
</Trans>
<Trans>
38            "beta_a"      39            
<Item>
<Position>
3673.600006   1455.599976   
</Position>
<BasePoints>
69.499969     -61.199951    0             0             20.020615     -22.395931    
45.800018     -54.199982    80.599976     -93.099976    119.454219    -136.940520   
138.899994    -159.799957   
</BasePoints>
</Item>
</Trans>
<Trans>
38            "mue_a"       40            
<Item>
<Position>
3673.600006   1455.599976   
</Position>
<BasePoints>
2708.300018   1963.800049   0             0             0             30.048245     
1.399994      75            1.399994      144.400024    2.799988      204.100037    
5.599976      337.500000    6.999969      370.800018    11.100006     505.500031    
23.600006     827.700043    -44.400024    1933.300018   277.799988    1933.300018   
277.799988    1933.300018   277.799988    1933.300018   2430.599976   1933.300018   
2586.100006   1933.300018   2623.600006   1955.500031   2777.799988   1955.500031   
2777.799988   1955.500031   2777.799988   1955.500031   4722.200012   1955.500031   
4816.699982   1955.500031   4837.500000   1988.800049   4930.599976   1988.800049   
4930.599976   1988.800049   4930.599976   1988.800049   5277.799988   1988.800049   
5308.300018   1988.800049   5341.699982   1988.800049   5386.686629   1988.800049   
5416.699982   1988.800049   
</BasePoints>
</Item>
</Trans>
<Trans>
39            "alpha_a"     42            
<Item>
<Position>
3812.500000   1295.800018   
</Position>
<BasePoints>
69.400024     66.699982     0             0             24.018811     18.057284     
47.200012     36.100006     76.399994     56.999969     114.882643    86.171541     
138.899994    104.199982    
</BasePoints>
</Item>
</Trans>
<Trans>
39            "alpha_b"     43            
<Item>
<Position>
3812.500000   1295.800018   
</Position>
<BasePoints>
2569.400024   -373.600006   0             0             1.208770      -29.960384    
1.399994      -40.200043    2.799988      -44.400024    2.799988      -45.800018    
31.900024     -137.500000   161.100006    -373.600006   208.300018    -373.600006   
208.300018    -373.600006   208.300018    -373.600006   2361.100006   -373.600006   
2516.699982   -373.600006   2554.199982   -393.000031   2708.300018   -393.000031   
2708.300018   -393.000031   2708.300018   -393.000031   4513.899994   -393.000031   
4608.300018   -393.000031   4629.199982   -434.700012   4722.200012   -434.700012   
4722.200012   -434.700012   4722.200012   -434.700012   5000          -434.700012   
5031.900024   -434.700012   5065.299988   -429.100037   5110.119608   -416.775592   
5138.899994   -408.300018   
</BasePoints>
</Item>
</Trans>
<Trans>
40            "lambda_a"    36            
<Item>
<Position>
9090.299988   3444.400024   
</Position>
<BasePoints>
-2777.799988  20.899963     0             0             -22.344268    20.059023     
-52.799988    44.499969     -95.899963    72.299957     -138.899994   72.299957     
-555.599976   72.299957     -555.599976   72.299957     -555.599976   72.299957     
-650          72.299957     -668.099976   19.499969     -763.899994   19.499969     
-2569.499969  19.499969     -2569.499969  19.499969     -2569.499969  19.499969     
-2754.199982  19.499969     -2800         -2.700043     -2986.100006  -2.700043     
-5138.899994  -2.700043     -5138.899994  -2.700043     -5138.899994  -2.700043     
-5216.699982  -2.700043     -5256.999969  22.299957     -5312.500000  -33.300018    
-5436.100006  -162.500000   -5533.399963  -1495.800018  -5553.015073  -1788.088877  
-5555.599976  -1818.000031  
</BasePoints>
</Item>
</Trans>
<Trans>
40            "alpha_b"     41            
<Item>
<Position>
9090.299988   3444.400024   
</Position>
<BasePoints>
69.400024     62.500000     0             0             24.971196     16.733228     
48.600006     33.399963     76.399994     51.399994     114.175998    77.444709     
138.899994    94.499969     
</BasePoints>
</Item>
</Trans>
<Trans>
41            "lambda_a"    25            
<Item>
<Position>
9229.199982   3538.899994   
</Position>
<BasePoints>
-3125         148.600006    0             0             -12.971355    27.044894     
-70.899963    106.900024    -106.999969   147.200012    -208.399963   147.200012    
-972.299957   147.200012    -972.299957   147.200012    -972.299957   147.200012    
-1063.899994  147.200012    -1087.500000  148.600006    -1180.599976  148.600006    
-1388.899994  148.600006    -1388.899994  148.600006    -1388.899994  148.600006    
-1480.599976  148.600006    -1504.199982  152.799988    -1597.299957  152.799988    
-2013.899994  152.799988    -2013.899994  152.799988    -2013.899994  152.799988    
-2198.600006  152.799988    -2244.499969  155.500031    -2430.599976  155.500031    
-2777.799988  155.500031    -2777.799988  155.500031    -2777.799988  155.500031    
-2993.099976  155.500031    -3047.299957  136.100006    -3263.899994  136.100006    
-5694.499969  136.100006    -5694.499969  136.100006    -5694.499969  136.100006    
-6181.999969  136.100006    -6243.099976  -1815.299988  -6250         -2171.386641  
-6250         -2201.399994  
</BasePoints>
</Item>
</Trans>
<Trans>
41            "mue_b"       34            
<Item>
<Position>
9229.199982   3538.899994   
</Position>
<BasePoints>
69.400024     -37.500000    0             0             23.970579     -17.999556    
47.200012     -37.500000    76.399994     -59.700012    115.263267    -89.767345    
138.899994    -108.300018   
</BasePoints>
</Item>
</Trans>
<Trans>
41            "beta_b"      37            
<Item>
<Position>
9229.199982   3538.899994   
</Position>
<BasePoints>
138.899994    11.100006     0             0             30.048245     0             
84.700012     0             172.200012    0             247.686690    0             
277.700043    0             
</BasePoints>
</Item>
</Trans>
<Trans>
42            "alpha_b"     44            
<Item>
<Position>
3951.399994   1400          
</Position>
<BasePoints>
69.400024     -144.400024   0             0             10.938983     -27.916305    
37.500000     -94.400024    93.000031     -234.700012   127.583157    -323.576814   
138.899994    -351.399994   
</BasePoints>
</Item>
</Trans>
<Trans>
42            "mue_a"       53            
<Item>
<Position>
3951.399994   1400          
</Position>
<BasePoints>
2361.100006   1833.300018   0             0             1.208770      29.960384     
1.399994      40.299988     2.799988      44.400024     2.799988      47.200012     
175           834.700012    356.900024    991.699982    659.700012    1740.299988   
675           1776.399994   655.500031    1822.200012   694.400024    1822.200012   
694.400024    1822.200012   694.400024    1822.200012   2222.200012   1822.200012   
2438.899994   1822.200012   2493.000031   1833.300018   2708.300018   1833.300018   
2708.300018   1833.300018   2708.300018   1833.300018   4583.300018   1833.300018   
4616.699982   1833.300018   4651.399994   1823.600006   4695.040296   1805.823451   
4722.200012   1793.099976   
</BasePoints>
</Item>
</Trans>
<Trans>
42            "beta_a"      55            
<Item>
<Position>
3951.399994   1400          
</Position>
<BasePoints>
2013.899994   -66.699982    0             0             29.960384     -1.208770     
116.699982    -5.599976     323.600006    -18.099976    495.800018    -30.599976    
677.799988    -45.800018    722.200012    -69.400024    902.799988    -69.400024    
902.799988    -69.400024    902.799988    -69.400024    1736.100006   -69.400024    
2045.800018   -69.400024    2122.200012   -88.899994    2430.500031   -88.899994    
2430.500031   -88.899994    2430.500031   -88.899994    3611.100006   -88.899994    
3755.500031   -88.899994    3786.100006   -44.400024    3923.600006   -2.799988     
3954.199982   5.599976      3973.600006   1.399994      4006.587019   21.887007     
4027.799988   43.099976     
</BasePoints>
</Item>
</Trans>
<Trans>
43            "mue_b"       33            
<Item>
<Position>
8951.399994   887.500000    
</Position>
<BasePoints>
-2777.799988  -68.099976    0             0             -15.274555    -25.823295    
-54.199982    -66.699982    -80.599976    -79.199982    -138.899994   -79.199982    
-347.200012   -79.199982    -347.200012   -79.199982    -347.200012   -79.199982    
-469.499969   -79.199982    -501.399994   -90.299988    -625          -90.299988    
-2500         -90.299988    -2500         -90.299988    -2500         -90.299988    
-2654.199982  -90.299988    -2691.699982  -79.199982    -2847.200012  -79.199982    
-4375         -79.199982    -4375         -79.199982    -4375         -79.199982    
-4466.699982  -79.199982    -4490.299988  -77.799988    -4583.300018  -77.799988    
-5069.499969  -77.799988    -5069.499969  -77.799988    -5069.499969  -77.799988    
-5205.599976  -77.799988    -5294.499969  -90.299988    -5356.999969  30.599976     
-5420.800018  159.700012    -5513.899994  591.699982    -5549.664425  756.664387    
-5555.599976  786.100006    
</BasePoints>
</Item>
</Trans>
<Trans>
43            "beta_b"      36            
<Item>
<Position>
8951.399994   887.500000    
</Position>
<BasePoints>
-2708.300018  -11.100006    0             0             -28.835929    8.399661      
-61.100006    18.099976     -101.399994   26.399994     -138.899994   26.399994     
-416.699982   26.399994     -416.699982   26.399994     -416.699982   26.399994     
-512.500000   26.399994     -527.799988   -37.500000    -625          -37.500000    
-2500         -37.500000    -2500         -37.500000    -2500         -37.500000    
-2654.199982  -37.500000    -2691.699982  -18.099976    -2847.200012  -18.099976    
-5277.799988  -18.099976    -5277.799988  -18.099976    -5277.799988  -18.099976    
-5429.199982  -18.099976    -5327.799988  516.699982    -5381.999969  661.100006    
-5387.500000  677.799988    -5395.800018  683.300018    -5407.980312  710.168970    
-5416.699982  738.899994    
</BasePoints>
</Item>
</Trans>
<Trans>
43            "alpha_a"     44            
<Item>
<Position>
8951.399994   887.500000    
</Position>
<BasePoints>
-2430.599976  93.099976     0             0             -21.195041    21.195041     
-51.399994    48.600006     -94.499969    79.199982     -138.899994   79.199982     
-2361.100006  79.199982     -2361.100006  79.199982     -2361.100006  79.199982     
-2483.300018  79.199982     -2515.299988  87.500000     -2638.899994  87.500000     
-4722.200012  87.500000     -4722.200012  87.500000     -4722.200012  87.500000     
-4773.600006  87.500000     -4800         95.800018     -4842.149526  137.800259    
-4861.100006  161.100006    
</BasePoints>
</Item>
</Trans>
<Trans>
44            "beta_b"      38            
<Item>
<Position>
4090.299988   1048.600006   
</Position>
<BasePoints>
-208.399963   69.499969     0             0             -29.960384    1.208770      
-80.599976    4.199982      -162.500000   15.299988     -218.099976   54.199982     
-348.600006   147.200012    -362.500000   211.100006    -410.842143   377.590062    
-416.699982   406.999969    
</BasePoints>
</Item>
</Trans>
<Trans>
44            "beta_a"      45            
<Item>
<Position>
4090.299988   1048.600006   
</Position>
<BasePoints>
2013.899994   44.499969     0             0             28.119104     10.555213     
61.100006     20.800018     102.799988    31.999969     138.899994    31.999969     
138.899994    31.999969     138.899994    31.999969     1805.500031   31.999969     
2083.300018   33.300018     2152.799988   33.300018     2430.500031   31.999969     
2430.500031   31.999969     2430.500031   31.999969     3472.200012   31.999969     
3568.000031   33.300018     3586.100006   84.700012     3680.500031   84.700012     
3680.500031   84.700012     3680.500031   84.700012     3888.899994   84.700012     
3927.799988   84.700012     3938.899994   93.099976     3968.000031   118.099976    
3983.300018   131.999969    3995.800018   148.600006    4015.015375   182.540296    
4027.799988   209.700012    
</BasePoints>
</Item>
</Trans>
<Trans>
44            "mue_a"       46            
<Item>
<Position>
4090.299988   1048.600006   
</Position>
<BasePoints>
2361.100006   -9.700012     0             0             29.161759     -7.268558     
62.500000     -13.899994    102.799988    -20.800018    138.899994    -20.800018    
138.899994    -20.800018    138.899994    -20.800018    2222.200012   -20.800018    
2345.800018   -20.800018    2377.799988   -20.800018    2500          -20.800018    
2500          -20.800018    2500          -20.800018    4583.300018   -20.800018    
4693.000031   -20.800018    4718.000031   1773.600006   4722.200012   2114.519919   
4722.200012   2144.499969   
</BasePoints>
</Item>
</Trans>
<Trans>
44            "mue_b"       47            
<Item>
<Position>
4090.299988   1048.600006   
</Position>
<BasePoints>
69.400024     777.799988    0             0             7.268558      29.161759     
15.299988     72.200012     27.799988     134.700012    34.700012     190.299988    
81.900024     588.899994    127.799988    1884.700012   138.035620    2172.793727   
138.899994    2202.799988   
</BasePoints>
</Item>
</Trans>
<Trans>
45            "beta_b"      39            
<Item>
<Position>
8118.099976   1258.300018   
</Position>
<BasePoints>
-2152.799988  -105.500031   0             0             -22.395931    -20.020615    
-52.799988    -44.400024    -95.899963    -72.200012    -138.899994   -72.200012    
-416.699982   -72.200012    -416.699982   -72.200012    -416.699982   -72.200012    
-511.199951   -72.200012    -529.199982   -125          -625          -125          
-1597.299957  -125          -1597.299957  -125          -1597.299957  -125          
-1875         -125          -1943.099976  -113.899994   -2222.299957  -113.899994   
-4166.699982  -113.899994   -4166.699982  -113.899994   -4166.699982  -113.899994   
-4238.899994  -113.899994   -4256.999969  -69.400024    -4293.887906  9.849880      
-4305.599976  37.500000     
</BasePoints>
</Item>
</Trans>
<Trans>
45            "mue_b"       48            
<Item>
<Position>
8118.099976   1258.300018   
</Position>
<BasePoints>
-1875         11.100006     0             0             -29.978775    0             
-62.500000    0             -102.799988   0             -138.899994   0             
-3611.199951  0             -3611.199951  0             -3611.199951  0             
-3640.299988  0             -3673.699951  2.799988      -3720.176305  7.724878      
-3750         11.100006     
</BasePoints>
</Item>
</Trans>
<Trans>
45            "alpha_a"     59            
<Item>
<Position>
8118.099976   1258.300018   
</Position>
<BasePoints>
69.400024     94.499969     0             0             23.986668     18.098184     
45.800018     36.100006     68.000031     58.399963     79.100037     83.399963     
115.200043    166.699982    133.300018    811.100006    137.997383    1014.493708   
138.800049    1044.499969   
</BasePoints>
</Item>
</Trans>
<Trans>
46            "beta_b"      40            
<Item>
<Position>
8812.500000   3193.099976   
</Position>
<BasePoints>
138.899994    102.700043    0             0             28.119104     10.555213     
69.400024     26.300049     130.599976    54.100037     173.600006    91.600037     
225           133.300018    241.699982    150           270.106791    222.250529    
277.799988    251.300049    
</BasePoints>
</Item>
</Trans>
<Trans>
46            "lambda_a"    43            
<Item>
<Position>
8812.500000   3193.099976   
</Position>
<BasePoints>
69.400024     -947.299957   0             0             2.408192      -29.930487    
18.099976     -297.299957   118.099976    -1950         136.315092    -2275.688822  
138.899994    -2305.599976  
</BasePoints>
</Item>
</Trans>
<Trans>
46            "mue_b"       49            
<Item>
<Position>
8812.500000   3193.099976   
</Position>
<BasePoints>
69.400024     100           0             0             20.066799     22.362612     
45.800018     54.100037     81.900024     94.400024     119.393294    138.240570    
138.899994    161.100006    
</BasePoints>
</Item>
</Trans>
<Trans>
47            "lambda_b"    38            
<Item>
<Position>
4229.199982   3251.399994   
</Position>
<BasePoints>
-277.799988   -9.700012     0             0             -29.098589    -7.231110     
-62.500000    -13.899994    -102.799988   -20.800018    -138.899994   -20.800018    
-416.699982   -20.800018    -416.699982   -20.800018    -416.699982   -20.800018    
-505.599976   -20.800018    -547.299957   -1461.100006  -554.735602   -1765.793757  
-555.599976   -1795.800018  
</BasePoints>
</Item>
</Trans>
<Trans>
47            "beta_a"      48            
<Item>
<Position>
4229.199982   3251.399994   
</Position>
<BasePoints>
69.400024     -863.899994   0             0             2.325979      -29.892676    
19.400024     -273.600006   115.200043    -1654.199982  136.322649    -1952.114942  
138.899994    -1981.999969  
</BasePoints>
</Item>
</Trans>
<Trans>
47            "mue_a"       49            
<Item>
<Position>
4229.199982   3251.399994   
</Position>
<BasePoints>
2361.100006   52.799988     0             0             28.835929     8.399661      
62.500000     15.299988     102.700043    23.600006     138.899994    23.600006     
138.899994    23.600006     138.899994    23.600006     1944.400024   23.600006     
2284.700012   23.600006     2369.400024   52.799988     2708.300018   52.799988     
2708.300018   52.799988     2708.300018   52.799988     3819.400024   52.799988     
3913.899994   52.799988     3934.700012   87.500000     4027.700043   87.500000     
4027.700043   87.500000     4027.700043   87.500000     4583.300018   87.500000     
4613.899994   87.500000     4647.200012   91.699982     4692.479072   98.519214     
4722.200012   102.799988    
</BasePoints>
</Item>
</Trans>
<Trans>
48            "lambda_b"    39            
<Item>
<Position>
4368.099976   1269.400024   
</Position>
<BasePoints>
-277.799988   11.199951     0             0             -29.978775    0             
-62.500000    0             -102.799988   0             -138.899994   0             
-416.699982   0             -416.699982   0             -416.699982   0             
-447.299957   0             -481.999969   5.599976      -526.819590   17.924420     
-555.599976   26.399994     
</BasePoints>
</Item>
</Trans>
<Trans>
48            "alpha_a"     50            
<Item>
<Position>
4368.099976   1269.400024   
</Position>
<BasePoints>
69.400024     173.699951    0             0             12.894666     27.146564     
40.200043     84.799957     88.800049     188.899994    126.076574    265.940260    
138.800049    293.099976    
</BasePoints>
</Item>
</Trans>
<Trans>
49            "lambda_a"    33            
<Item>
<Position>
8951.399994   3354.199982   
</Position>
<BasePoints>
-2777.799988  162.500000    0             0             -27.504259    11.947168     
-59.700012    25            -100          37.500000     -138.899994   37.500000     
-347.200012   37.500000     -347.200012   37.500000     -347.200012   37.500000     
-481.999969   37.500000     -488.899994   162.500000    -625          162.500000    
-2430.599976  162.500000    -2430.599976  162.500000    -2430.599976  162.500000    
-2615.299988  162.500000    -2661.100006  151.399994    -2847.200012  151.399994    
-5416.699982  151.399994    -5416.699982  151.399994    -5416.699982  151.399994    
-5563.899994  151.399994    -5436.100006  -33.399963    -5451.399994  -180.599976   
-5505.599976  -730.599976   -5518.099976  -868.099976   -5548.600006  -1419.499969  
-5550         -1462.500000  -5551.399994  -1472.299957  -5552.799988  -1513.899994  
-5554.199982  -1554.199982  -5554.199982  -1598.600006  -5555.599976  -1650.586623  
-5555.599976  -1680.599976  
</BasePoints>
</Item>
</Trans>
<Trans>
49            "lambda_b"    40            
<Item>
<Position>
8951.399994   3354.199982   
</Position>
<BasePoints>
69.400024     59.700012     0             0             25.874119     15.269982     
45.800018     26.399994     63.899994     37.500000     79.199982     48.600006     
86.100006     52.700043     93.000031     56.900024     114.562826    72.626526     
138.899994    90.200043     
</BasePoints>
</Item>
</Trans>
<Trans>
50            "lambda_b"    42            
<Item>
<Position>
4506.900024   1562.500000   
</Position>
<BasePoints>
-277.700043   29.199982     0             0             -29.418728    5.849853      
-62.500000    12.500000     -102.700043   18.099976     -138.800049   18.099976     
-416.600037   18.099976     -416.600037   18.099976     -416.600037   18.099976     
-483.300018   18.099976     -522.200012   -61.100006    -547.024457   -133.719614   
-555.500031   -162.500000   
</BasePoints>
</Item>
</Trans>
<Trans>
50            "beta_a"      51            
<Item>
<Position>
4506.900024   1562.500000   
</Position>
<BasePoints>
69.499969     11.100006     0             0             29.978775     0             
51.399994     0             72.299957     0             108.886641    0             
138.899994    0             
</BasePoints>
</Item>
</Trans>
<Trans>
50            "mue_a"       52            
<Item>
<Position>
4506.900024   1562.500000   
</Position>
<BasePoints>
2013.899994   1618.099976   0             0             1.208770      29.960384     
9.799957      269.400024    58.399963     1606.900024   138.899994    1606.900024   
138.899994    1606.900024   138.899994    1606.900024   1736.199951   1606.900024   
2076.399994   1606.900024   2161.199951   1609.700012   2500          1609.700012   
2500          1609.700012   2500          1609.700012   3611.199951   1609.700012   
3750          1609.700012   3906.999969   1556.900024   4000.149868   1521.472420   
4027.799988   1509.700012   
</BasePoints>
</Item>
</Trans>
<Trans>
51            "alpha_a"     54            
<Item>
<Position>
4645.800018   1562.500000   
</Position>
<BasePoints>
69.499969     93.099976     0             0             20.020615     22.395931     
47.299957     50            80.599976     86.100006     118.140354    126.967593    
138.899994    148.600006    
</BasePoints>
</Item>
</Trans>
<Trans>
51            "lambda_b"    55            
<Item>
<Position>
4645.800018   1562.500000   
</Position>
<BasePoints>
1666.699982   -127.799988   0             0             16.646252     -24.926719    
98.600006     -111.100006   154.199982    -123.600006   277.799988    -123.600006   
277.799988    -123.600006   277.799988    -123.600006   1388.899994   -123.600006   
1575          -123.600006   1620.899963   -145.800018   1805.599976   -145.800018   
1805.599976   -145.800018   1805.599976   -145.800018   3194.499969   -145.800018   
3226.399994   -145.800018   3259.799957   -140.299988   3304.566621   -127.873252   
3333.399963   -119.400024   
</BasePoints>
</Item>
</Trans>
<Trans>
52            "lambda_a"    48            
<Item>
<Position>
8534.700012   3072.200012   
</Position>
<BasePoints>
-2083.300018  -1866.600037  0             0             0             -30.048245    
-5.500031     -300          -36.100006    -1990.299988  -138.899994   -1991.600037  
-763.899994   -1991.600037  -763.899994   -1991.600037  -763.899994   -1991.600037  
-895.800018   -1990.299988  -908.300018   -1886.100006  -1041.600037  -1886.100006  
-1666.600037  -1886.100006  -1666.600037  -1886.100006  -1666.600037  -1886.100006  
-2036.100006  -1886.100006  -2129.100037  -1866.600037  -2500         -1866.600037  
-4027.799988  -1866.600037  -4027.799988  -1866.600037  -4027.799988  -1866.600037  
-4076.399994  -1866.600037  -4101.399994  -1859.700012  -4144.523371  -1823.164345  
-4166.600037  -1802.799988  
</BasePoints>
</Item>
</Trans>
<Trans>
52            "lambda_b"    53            
<Item>
<Position>
8534.700012   3072.200012   
</Position>
<BasePoints>
69.499969     69.499969     0             0             24.999818     16.695068     
44.499969     30.599976     63.899994     44.499969     79.199982     58.399963     
87.500000     66.699982     97.200012     75            118.985035    98.473220     
138.899994    120.899963    
</BasePoints>
</Item>
</Trans>
<Trans>
53            "lambda_a"    39            
<Item>
<Position>
8673.600006   3193.099976   
</Position>
<BasePoints>
-2430.500031  155.500031    0             0             -10.938983    27.916305     
-48.600006    77.700043     -76.399994    93.000031     -138.899994   93.000031     
-416.699982   93.000031     -416.699982   93.000031     -416.699982   93.000031     
-513.899994   93.000031     -526.399994   165.200043    -625          165.200043    
-2013.899994  165.200043    -2013.899994  165.200043    -2013.899994  165.200043    
-2259.700012  165.200043    -2322.200012  143.000031    -2569.400024  143.000031    
-2916.699982  143.000031    -2916.699982  143.000031    -2916.699982  143.000031    
-3225         143.000031    -3301.399994  134.700012    -3611.100006  134.700012    
-4305.500031  134.700012    -4305.500031  134.700012    -4305.500031  134.700012    
-4406.900024  134.700012    -4476.399994  151.300049    -4523.600006  61.100006     
-4705.500031  -290.299988   -4831.900024  -1580.599976  -4858.515104  -1867.388803  
-4861.100006  -1897.299957  
</BasePoints>
</Item>
</Trans>
<Trans>
53            "alpha_b"     46            
<Item>
<Position>
8673.600006   3193.099976   
</Position>
<BasePoints>
69.499969     11.100006     0             0             30.048245     0             
51.399994     0             72.200012     0             108.886641    0             
138.899994    0             
</BasePoints>
</Item>
</Trans>
<Trans>
54            "lambda_b"    56            
<Item>
<Position>
4784.700012   1711.100006   
</Position>
<BasePoints>
69.499969     562.500000    0             0             4.780448      29.621848     
26.399994     183.300018    108.399963    765.299988    134.680340    957.779060    
138.899994    987.500000    
</BasePoints>
</Item>
</Trans>
<Trans>
54            "mue_a"       65            
<Item>
<Position>
4784.700012   1711.100006   
</Position>
<BasePoints>
1458.399963   -101.399994   0             0             17.484686     -24.428393    
44.499969     -59.700012    88.899994     -105.500031   138.899994    -105.500031   
138.899994    -105.500031   138.899994    -105.500031   1319.499969   -105.500031   
1505.599976   -105.500031   1551.399994   -136.100006   1736.100006   -136.100006   
1736.100006   -136.100006   1736.100006   -136.100006   2500          -136.100006   
2695.899963   -136.100006   2841.699982   91.699982     2903.293391   206.486837    
2916.699982   233.300018    
</BasePoints>
</Item>
</Trans>
<Trans>
54            "beta_a"      67            
<Item>
<Position>
4784.700012   1711.100006   
</Position>
<BasePoints>
416.699982    11.100006     0             0             30.048245     0             
63.899994     0             104.199982    0             138.899994    0             
138.899994    0             138.899994    0             694.499969    0             
784.700012    0             819.499969    309.700012    830.815061    450.688822    
833.399963    480.599976    
</BasePoints>
</Item>
</Trans>
<Trans>
55            "alpha_b"     45            
<Item>
<Position>
7979.199982   1443.099976   
</Position>
<BasePoints>
69.400024     -72.299957    0             0             17.958972     -24.002825    
44.400024     -58.399963    83.300018     -109.799957   120.871554    -160.782606   
138.899994    -184.799957   
</BasePoints>
</Item>
</Trans>
<Trans>
55            "alpha_a"     56            
<Item>
<Position>
7979.199982   1443.099976   
</Position>
<BasePoints>
-1527.799988  209.700012    0             0             -28.530307    9.481645      
-152.799988   51.300049     -558.399963   184.700012    -694.499969   184.700012    
-1319.499969  184.700012    -1319.499969  184.700012    -1319.499969  184.700012    
-1534.799957  184.700012    -1588.899994  215.200043    -1805.599976  215.200043    
-2638.899994  215.200043    -2638.899994  215.200043    -2638.899994  215.200043    
-2754.199982  215.200043    -2995.899963  1020.800018   -3049.724959  1226.064411   
-3055.599976  1255.500031   
</BasePoints>
</Item>
</Trans>
<Trans>
56            "beta_a"      57            
<Item>
<Position>
4923.600006   2698.600006   
</Position>
<BasePoints>
69.499969     -48.600006    0             0             21.844276     -20.621003    
47.200012     -44.400024    79.199982     -75           116.823328    -111.535667   
138.899994    -131.900024   
</BasePoints>
</Item>
</Trans>
<Trans>
56            "mue_a"       58            
<Item>
<Position>
4923.600006   2698.600006   
</Position>
<BasePoints>
1458.300018   376.399994    0             0             14.395877     26.378080     
44.499969     76.399994     61.100006     94.499969     104.199982    144.499969    
218.099976    270.800018    247.200012    365.299988    416.699982    365.299988    
416.699982    365.299988    416.699982    365.299988    1319.499969   365.299988    
1756.999969   365.299988    1870.800018   383.300018    2301.399994   315.299988    
2423.600006   295.800018    2447.200012   243.099976    2569.499969   243.099976    
2569.499969   243.099976    2569.499969   243.099976    2777.799988   243.099976    
2840.299988   243.099976    2879.199982   176.399994    2906.683327   110.310551    
2916.699982   81.999969     
</BasePoints>
</Item>
</Trans>
<Trans>
56            "alpha_b"     59            
<Item>
<Position>
4923.600006   2698.600006   
</Position>
<BasePoints>
1666.699982   429.199982    0             0             3.601726      29.757263     
69.499969     233.300018    68.099976     418.099976    277.799988    418.099976    
277.799988    418.099976    277.799988    418.099976    1319.499969   418.099976    
1505.599976   418.099976    1551.399994   420.800018    1736.100006   420.800018    
1736.100006   420.800018    1736.100006   420.800018    3194.499969   420.800018    
3305.599976   420.800018    3316.699982   -181.900024   3320.800018   -225          
3326.399994   -263.899994   3326.399994   -273.600006   3329.199982   -312.500000   
3330.599976   -323.600006   3330.599976   -334.700012   3332.497352   -365.793757   
3333.300018   -395.800018   
</BasePoints>
</Item>
</Trans>
<Trans>
57            "alpha_b"     60            
<Item>
<Position>
5062.500000   2566.699982   
</Position>
<BasePoints>
69.400024     125           0             0             20.020615     22.395931     
40.299988     48.600006     65.299988     80.500031     79.199982     113.899994    
109.700012    179.100037    125           261.100006    135.463534    331.276311    
138.899994    361.100006    
</BasePoints>
</Item>
</Trans>
<Trans>
57            "alpha_a"     71            
<Item>
<Position>
5062.500000   2566.699982   
</Position>
<BasePoints>
694.400024    111.100006    0             0             29.892676     2.325979      
48.600006     5.500031      65.299988     8.300018      79.199982     11.100006     
197.200012    34.700012     220.800018    61.100006     337.500000    83.300018     
398.600006    94.400024     415.299988    93.000031     476.399994    97.200012     
637.500000    104.100037    1190.299988   108.300018    1329.199982   94.400024     
1333.300018   94.400024     1336.100006   93.000031     1359.645273   88.581661     
1388.899994   81.900024     
</BasePoints>
</Item>
</Trans>
<Trans>
58            "lambda_a"    55            
<Item>
<Position>
7840.299988   2780.599976   
</Position>
<BasePoints>
69.400024     -579.199982   0             0             3.508018      -29.775070    
22.200012     -219.499969   111.100006    -1073.699951  135.463534    -1307.676305  
138.899994    -1337.500000  
</BasePoints>
</Item>
</Trans>
<Trans>
58            "alpha_b"     61            
<Item>
<Position>
7840.299988   2780.599976   
</Position>
<BasePoints>
277.799988    288.800049    0             0             1.208770      29.960384     
6.900024      109.700012    31.900024     277.700043    138.899994    277.700043    
138.899994    277.700043    138.899994    277.700043    416.600037    277.700043    
447.200012    277.700043    480.500031    277.700043    525.486678    277.700043    
555.500031    277.700043    
</BasePoints>
</Item>
</Trans>
<Trans>
59            "beta_b"      42            
<Item>
<Position>
8256.900024   2302.799988   
</Position>
<BasePoints>
-2152.700043  -916.699982   0             0             -1.122477     -29.960384    
-2.700043     -44.499969    -2.700043     -56.999969    -4.100037     -66.699982    
-6.900024     -102.799988   -8.300018     -112.500000   -12.500000    -147.200012   
-38.800049    -395.899963   6.999969      -477.799988   -104.100037   -700          
-152.700043   -800          -151.300049   -845.899963   -243.000031   -906.999969   
-408.300018   -1020.899963  -493.000031   -938.899994   -694.400024   -938.899994   
-1875         -938.899994   -1875         -938.899994   -1875         -938.899994   
-2090.200043  -938.899994   -2144.400024  -919.499969   -2361.100006  -919.499969   
-3263.800049  -919.499969   -3263.800049  -919.499969   -3263.800049  -919.499969   
-3577.700043  -919.499969   -3654.100037  -845.899963   -3968.000031  -861.100006   
-4091.600037  -868.099976   -4122.200012  -869.499969   -4245.800018  -888.899994   
-4250         -888.899994   -4252.700043  -890.299988   -4276.245309  -896.118351   
-4305.500031  -902.799988   
</BasePoints>
</Item>
</Trans>
<Trans>
59            "mue_b"       50            
<Item>
<Position>
8256.900024   2302.799988   
</Position>
<BasePoints>
-1875         -819.499969   0             0             -2.325979     -29.892676    
-16.600037    -173.600006   -72.200012    -680.599976   -138.800049   -680.599976   
-416.600037   -680.599976   -416.600037   -680.599976   -416.600037   -680.599976   
-584.700012   -680.599976   -594.400024   -833.399963   -763.800049   -833.399963   
-1736.100006  -833.399963   -1736.100006  -833.399963   -1736.100006  -833.399963   
-1951.300049  -833.399963   -2005.500031  -811.100006   -2222.200012  -811.100006   
-3333.300018  -811.100006   -3333.300018  -811.100006   -3333.300018  -811.100006   
-3472.200012  -811.100006   -3509.700012  -822.200012   -3645.800018  -787.500000   
-3666.600037  -781.999969   -3688.800049  -772.200012   -3723.642558  -754.732380   
-3750         -740.299988   
</BasePoints>
</Item>
</Trans>
<Trans>
59            "beta_a"      60            
<Item>
<Position>
8256.900024   2302.799988   
</Position>
<BasePoints>
-1527.700043  702.799988    0             0             -2.325979     29.892676     
-16.600037    175           -70.800018    691.600037    -138.800049   691.600037    
-1458.300018  691.600037    -1458.300018  691.600037    -1458.300018  691.600037    
-1673.600006  691.600037    -1727.700043  708.300018    -1944.400024  708.300018    
-2916.600037  708.300018    -2916.600037  708.300018    -2916.600037  708.300018    
-2970.800018  708.300018    -2998.600006  698.600006    -3039.406991  650.358757    
-3055.500031  625           
</BasePoints>
</Item>
</Trans>
<Trans>
59            "mue_a"       61            
<Item>
<Position>
8256.900024   2302.799988   
</Position>
<BasePoints>
69.499969     431.900024    0             0             5.938291      29.437094     
27.799988     155.500031    104.199982    566.600037    133.024977    726.064411    
138.899994    755.500031    
</BasePoints>
</Item>
</Trans>
<Trans>
60            "mue_b"       51            
<Item>
<Position>
5201.399994   2927.799988   
</Position>
<BasePoints>
-277.799988   191.600037    0             0             -14.428557    26.351612     
-47.200012    81.900024     -116.699982   180.500031    -208.300018   180.500031    
-416.699982   180.500031    -416.699982   180.500031    -416.699982   180.500031    
-493.099976   180.500031    -544.499969   -1052.799988  -554.735602   -1335.293727  
-555.599976   -1365.299988  
</BasePoints>
</Item>
</Trans>
<Trans>
60            "beta_b"      55            
<Item>
<Position>
5201.399994   2927.799988   
</Position>
<BasePoints>
1388.899994   -1231.999969  0             0             4.695130      -29.621848    
141.699982    -533.399963   216.699982    -655.599976   476.399994    -1108.399963  
506.900024    -1161.100006  497.200012    -1216.699982  555.500031    -1216.699982  
555.500031    -1216.699982  555.500031    -1216.699982  972.200012    -1216.699982  
1220.800018   -1216.699982  1280.500031   -1247.200012  1527.799988   -1247.200012  
1527.799988   -1247.200012  1527.799988   -1247.200012  2083.300018   -1247.200012  
2231.900024   -1247.200012  2587.500000   -1372.200012  2718.000031   -1438.899994  
2726.399994   -1443.099976  2733.300018   -1447.200012  2754.940551   -1465.254237  
2777.799988   -1484.700012  
</BasePoints>
</Item>
</Trans>
<Trans>
60            "alpha_a"     62            
<Item>
<Position>
5201.399994   2927.799988   
</Position>
<BasePoints>
69.400024     -44.499969    0             0             22.395931     -20.020615    
41.699982     -37.500000    62.500000     -56.999969    79.199982     -75           
90.299988     -86.100006    100           -100          120.871554    -127.382643   
138.899994    -151.399994   
</BasePoints>
</Item>
</Trans>
<Trans>
61            "lambda_a"    45            
<Item>
<Position>
8395.800018   3058.300018   
</Position>
<BasePoints>
-138.899994   -1293.000031  0             0             -1.208770     -29.960384    
-15.200043    -269.400024   -97.200012    -1611.100006  -198.600006   -1758.300018  
-206.900024   -1769.400024  -219.400024   -1779.100037  -249.237115   -1790.491654  
-277.700043   -1800         
</BasePoints>
</Item>
</Trans>
<Trans>
61            "mue_b"       52            
<Item>
<Position>
8395.800018   3058.300018   
</Position>
<BasePoints>
69.499969     16.699982     0             0             29.930487     2.408192      
51.399994     5.599976      72.299957     6.999969      109.076299    10.524865     
138.899994    13.899994     
</BasePoints>
</Item>
</Trans>
<Trans>
61            "beta_b"      53            
<Item>
<Position>
8395.800018   3058.300018   
</Position>
<BasePoints>
138.899994    100           0             0             24.018811     18.057284     
52.799988     36.100006     69.499969     43.099976     104.199982    61.100006     
147.299957    81.999969     195.899963    102.799988    249.880985    123.766484    
277.799988    134.799957    
</BasePoints>
</Item>
</Trans>
<Trans>
62            "mue_b"       54            
<Item>
<Position>
5340.299988   2776.399994   
</Position>
<BasePoints>
-277.799988   50            0             0             -28.857115    8.380679      
-116.699982   33.300018     -334.700012   80.500031     -451.399994   -30.599976    
-522.200012   -100          -548.600006   -819.499969   -554.735602   -1035.293727  
-555.599976   -1065.299988  
</BasePoints>
</Item>
</Trans>
<Trans>
62            "beta_b"      56            
<Item>
<Position>
5340.299988   2776.399994   
</Position>
<BasePoints>
-208.399963   -34.700012    0             0             -28.857115    -8.380679     
-41.699982    -11.100006    -51.399994    -13.899994    -59.700012    -15.299988    
-168.099976   -40.299988    -298.600006   -61.100006    -386.979041   -73.519214    
-416.699982   -77.799988    
</BasePoints>
</Item>
</Trans>
<Trans>
62            "beta_a"      63            
<Item>
<Position>
5340.299988   2776.399994   
</Position>
<BasePoints>
69.400024     -83.300018    0             0             16.598786     -24.983694    
43.000031     -65.299988    84.700012     -127.799988   122.220065    -186.140080   
138.899994    -211.100006   
</BasePoints>
</Item>
</Trans>
<Trans>
62            "mue_a"       64            
<Item>
<Position>
5340.299988   2776.399994   
</Position>
<BasePoints>
1111.100006   59.700012     0             0             24.954961     16.636640     
55.500031     36.100006     98.600006     56.900024     138.899994    56.900024     
138.899994    56.900024     138.899994    56.900024     833.300018    56.900024     
988.899994    56.900024     1026.399994   48.600006     1180.500031   48.600006     
1180.500031   48.600006     1180.500031   48.600006     2083.300018   48.600006     
2116.600037   48.600006     2151.399994   37.500000     2195.505196   17.949996     
2222.200012   4.199982      
</BasePoints>
</Item>
</Trans>
<Trans>
63            "beta_b"      57            
<Item>
<Position>
5479.199982   2565.299988   
</Position>
<BasePoints>
-208.399963   -43.099976    0             0             -28.138137    -10.530752    
-97.299957    -36.100006    -241.699982   -77.799988    -356.999969   -40.299988    
-363.899994   -37.500000    -372.299957   -34.700012    -393.520003   -17.668353    
-416.699982   1.399994      
</BasePoints>
</Item>
</Trans>
<Trans>
63            "alpha_a"     66            
<Item>
<Position>
5479.199982   2565.299988   
</Position>
<BasePoints>
416.600037    27.799988     0             0             29.844527     3.526329      
147.200012    18.000031     508.300018    51.399994     773.600006    -56.999969    
783.300018    -61.100006    791.600037    -66.699982    812.547798    -86.750709    
833.300018    -108.399963   
</BasePoints>
</Item>
</Trans>
<Trans>
63            "mue_b"       67            
<Item>
<Position>
5479.199982   2565.299988   
</Position>
<BasePoints>
69.400024     -273.600006   0             0             3.526329      -29.844527    
15.200043     -101.399994   37.500000     -245.899963   59.700012     -290.299988   
70.800018     -309.700012   86.100006     -327.799988   116.040557    -354.154231   
138.899994    -373.600006   
</BasePoints>
</Item>
</Trans>
<Trans>
64            "beta_b"      58            
<Item>
<Position>
7562.500000   2780.599976   
</Position>
<BasePoints>
138.899994    11.100006     0             0             30.048245     0             
84.700012     0             172.200012    0             247.786635    0             
277.799988    0             
</BasePoints>
</Item>
</Trans>
<Trans>
64            "lambda_a"    60            
<Item>
<Position>
7562.500000   2780.599976   
</Position>
<BasePoints>
-1180.599976  187.500000    0             0             -10.938983    27.916305     
-38.899994    58.300018     -61.100006    54.100037     -104.199982   63.800049     
-663.899994   181.900024    -815.299988   177.700043    -1388.899994  177.700043    
-2222.200012  177.700043    -2222.200012  177.700043    -2222.200012  177.700043    
-2252.799988  177.700043    -2287.500000  169.400024    -2332.512323  156.466773    
-2361.100006  147.200012    
</BasePoints>
</Item>
</Trans>
<Trans>
64            "mue_b"       65            
<Item>
<Position>
7562.500000   2780.599976   
</Position>
<BasePoints>
69.400024     -358.399963   0             0             4.772550      -29.658082    
26.399994     -165.299988   105.599976    -634.799957   133.856670    -806.608495   
138.899994    -836.199951   
</BasePoints>
</Item>
</Trans>
<Trans>
65            "lambda_a"    51            
<Item>
<Position>
7701.399994   1944.400024   
</Position>
<BasePoints>
-1527.799988  -391.600037   0             0             -2.412078     -29.892676    
-2.799988     -38.800049    -4.199982     -43.000031    -4.199982     -44.400024    
-30.599976    -147.200012   -36.100006    -179.100037   -104.199982   -259.700012   
-118.099976   -277.700043   -323.600006   -422.200012   -347.200012   -422.200012   
-1180.599976  -422.200012   -1180.599976  -422.200012   -1180.599976  -422.200012   
-1365.299988  -422.200012   -1411.100006  -400          -1597.200012  -400          
-2916.699982  -400          -2916.699982  -400          -2916.699982  -400          
-2945.800018  -400          -2980.599976  -395.800018   -3026.164356  -387.775041   
-3055.599976  -381.900024   
</BasePoints>
</Item>
</Trans>
<Trans>
65            "lambda_b"    58            
<Item>
<Position>
7701.399994   1944.400024   
</Position>
<BasePoints>
69.400024     477.799988    0             0             4.684399      29.639265     
26.399994     165.299988    105.500031    634.799957    133.795940    806.608495    
138.899994    836.199951    
</BasePoints>
</Item>
</Trans>
<Trans>
66            "mue_b"       68            
<Item>
<Position>
6312.500000   2456.900024   
</Position>
<BasePoints>
-277.799988   -16.600037    0             0             -29.844527    -3.526329     
-130.599976   -13.800049    -397.200012   -41.600037    -525.809973   -54.874486    
-555.599976   -58.300018    
</BasePoints>
</Item>
</Trans>
<Trans>
66            "beta_b"      71            
<Item>
<Position>
6312.500000   2456.900024   
</Position>
<BasePoints>
69.400024     81.999969     0             0             24.018811     18.057284     
44.400024     33.399963     65.299988     51.399994     79.199982     70.899963     
97.200012     93.099976     111.100006    122.299957    128.619361    163.505151    
138.899994    191.699982    
</BasePoints>
</Item>
</Trans>
<Trans>
66            "mue_a"       77            
<Item>
<Position>
6312.500000   2456.900024   
</Position>
<BasePoints>
416.699982    43.099976     0             0             29.892676     2.412078      
166.699982    12.500000     630.599976    47.299957     803.388864    59.976610     
833.300018    62.500000     
</BasePoints>
</Item>
</Trans>
<Trans>
67            "lambda_b"    57            
<Item>
<Position>
5618.099976   2191.699982   
</Position>
<BasePoints>
-277.799988   11.100006     0             0             -29.978775    0             
-62.500000    0             -102.799988   0             -138.899994   0             
-416.699982   0             -416.699982   0             -416.699982   0             
-575          0             -518.099976   170.800018    -552.163516   345.176305    
-555.599976   375           
</BasePoints>
</Item>
</Trans>
<Trans>
67            "alpha_a"     68            
<Item>
<Position>
5618.099976   2191.699982   
</Position>
<BasePoints>
69.400024     125           0             0             16.636640     24.954961     
43.000031     63.899994     84.700012     126.399994    121.801745    182.169686    
138.800049    206.900024    
</BasePoints>
</Item>
</Trans>
<Trans>
68            "beta_a"      69            
<Item>
<Position>
5756.900024   2398.600006   
</Position>
<BasePoints>
69.499969     -87.500000    0             0             16.646252     -24.926719    
25            -37.500000    30.599976     -45.800018    34.799957     -54.199982    
63.899994     -105.500031   95.899963     -162.500000   124.790886    -219.255758   
138.899994    -245.800018   
</BasePoints>
</Item>
</Trans>
<Trans>
68            "mue_a"       70            
<Item>
<Position>
5756.900024   2398.600006   
</Position>
<BasePoints>
763.899994    20.800018     0             0             29.639265     -4.684399     
62.500000     -9.700012     104.199982    -15.299988    138.899994    -15.299988    
138.899994    -15.299988    138.899994    -15.299988    486.199951    -15.299988    
765.299988    -15.299988    833.399963    47.200012     1111.199951   47.200012     
1111.199951   47.200012     1111.199951   47.200012     1388.899994   47.200012     
1420.899963   47.200012     1455.599976   55.599976     1499.605158   70.319343     
1527.799988   80.599976     
</BasePoints>
</Item>
</Trans>
<Trans>
68            "lambda_b"    71            
<Item>
<Position>
5756.900024   2398.600006   
</Position>
<BasePoints>
347.299957    238.899994    0             0             9.560898      28.426736     
25            73.600006     55.599976     138.899994    104.199982    170.800018    
193.099976    227.799988    520.899963    244.499969    664.493708    249.135627    
694.499969    250           
</BasePoints>
</Item>
</Trans>
<Trans>
69            "lambda_b"    72            
<Item>
<Position>
5895.800018   2152.799988   
</Position>
<BasePoints>
69.499969     88.899994     0             0             21.195041     21.195041     
47.299957     48.600006     79.199982     81.900024     117.673824    120.373866    
138.899994    141.600037    
</BasePoints>
</Item>
</Trans>
<Trans>
70            "lambda_a"    67            
<Item>
<Position>
7284.700012   2479.199982   
</Position>
<BasePoints>
-833.300018   -516.699982   0             0             -2.408192     -29.930487    
-13.899994    -138.899994   -52.799988    -441.699982   -138.899994   -441.699982   
-416.600037   -441.699982   -416.600037   -441.699982   -416.600037   -441.699982   
-512.500000   -441.699982   -540.299988   -419.499969   -634.700012   -441.699982   
-666.600037   -450          -1145.800018  -715.299988   -1180.500031  -715.299988   
-1527.799988  -715.299988   -1527.799988  -715.299988   -1527.799988  -715.299988   
-1605.500031  -715.299988   -1647.200012  -448.600006   -1663.224908  -317.323695   
-1666.600037  -287.500000   
</BasePoints>
</Item>
</Trans>
<Trans>
70            "lambda_b"    73            
<Item>
<Position>
7284.700012   2479.199982   
</Position>
<BasePoints>
69.499969     102.700043    0             0             21.195041     21.195041     
41.699982     41.600037     63.899994     66.600037     79.199982     91.600037     
97.200012     120.800018    112.500000    154.100037    129.633233    200.512353    
138.899994    229.100037    
</BasePoints>
</Item>
</Trans>
<Trans>
71            "alpha_b"     62            
<Item>
<Position>
6451.399994   2648.600006   
</Position>
<BasePoints>
-555.599976   131.999969    0             0             -21.844276    20.621003     
-34.700012    31.999969     -47.200012    40.299988     -59.700012    45.800018     
-176.399994   94.499969     -497.200012   123.600006    -625          123.600006    
-972.200012   123.600006    -972.200012   123.600006    -972.200012   123.600006    
-1001.399994  123.600006    -1034.700012  125           -1081.093745  126.935614    
-1111.100006  127.799988    
</BasePoints>
</Item>
</Trans>
<Trans>
71            "beta_a"      72            
<Item>
<Position>
6451.399994   2648.600006   
</Position>
<BasePoints>
-208.300018   -156.900024   0             0             -23.474784    -18.746069    
-87.500000    -70.800018    -236.100006   -193.000031   -356.999969   -298.600006   
-365.299988   -305.500031   -372.200012   -313.899994   -394.687867   -333.834228   
-416.699982   -354.199982   
</BasePoints>
</Item>
</Trans>
<Trans>
71            "mue_a"       73            
<Item>
<Position>
6451.399994   2648.600006   
</Position>
<BasePoints>
486.100006    70.800018     0             0             24.002825     17.958972     
55.500031     37.500000     98.600006     59.700012     138.899994    59.700012     
138.899994    59.700012     138.899994    59.700012     833.300018    59.700012     
863.899994    59.700012     897.200012    59.700012     942.186660    59.700012     
972.200012    59.700012     
</BasePoints>
</Item>
</Trans>
<Trans>
72            "alpha_b"     63            
<Item>
<Position>
6034.700012   2294.400024   
</Position>
<BasePoints>
-277.799988   33.399963     0             0             -29.147898    7.055943      
-62.500000    15.299988     -102.799988   22.299957     -138.899994   22.299957     
-416.600037   22.299957     -416.600037   22.299957     -416.600037   22.299957     
-462.500000   22.299957     -513.899994   152.799988    -546.293804   242.312280    
-555.500031   270.899963    
</BasePoints>
</Item>
</Trans>
<Trans>
72            "alpha_a"     74            
<Item>
<Position>
6034.700012   2294.400024   
</Position>
<BasePoints>
69.499969     -95.800018    0             0             15.309872     -25.798465    
41.699982     -72.200012    86.100006     -150          124.463753    -213.896710   
138.899994    -240.200043   
</BasePoints>
</Item>
</Trans>
<Trans>
73            "lambda_a"    57            
<Item>
<Position>
7423.600006   2708.300018   
</Position>
<BasePoints>
-1180.500031  200           0             0             -24.018811    18.057284     
-54.199982    40.299988     -97.200012    63.899994     -138.899994   63.899994     
-416.699982   63.899994     -416.699982   63.899994     -416.699982   63.899994     
-529.199982   63.899994     -548.600006   113.899994    -659.700012   136.100006    
-887.500000   180.599976    -947.200012   188.899994    -1180.500031  188.899994    
-1666.699982  188.899994    -1666.699982  188.899994    -1666.699982  188.899994    
-1813.899994  188.899994    -2073.600006  140.299988    -2118.000031  115.299988    
-2213.899994  59.799957     -2202.799988  4.199982      -2281.900024  -73.600006    
-2300         -91.600037    -2311.100006  -101.399994   -2337.800259  -122.649557   
-2361.100006  -141.600037   
</BasePoints>
</Item>
</Trans>
<Trans>
73            "alpha_b"     64            
<Item>
<Position>
7423.600006   2708.300018   
</Position>
<BasePoints>
69.499969     50            0             0             26.378080     14.395877     
50            26.399994     75            38.899994     112.205177    58.488040     
138.899994    72.299957     
</BasePoints>
</Item>
</Trans>
<Trans>
74            "alpha_b"     66            
<Item>
<Position>
6173.600006   2054.199982   
</Position>
<BasePoints>
69.499969     120.800018    0             0             20.020615     22.395931     
41.699982     47.200012     65.299988     77.700043     79.199982     109.700012    
115.299988    190.200043    129.199982    294.400024    136.315092    372.788889    
138.899994    402.700043    
</BasePoints>
</Item>
</Trans>
<Trans>
74            "beta_a"      75            
<Item>
<Position>
6173.600006   2054.199982   
</Position>
<BasePoints>
416.699982    -262.500000   0             0             7.231110      -29.098589    
18.099976     -43.099976    25            -37.500000    34.700012     -45.899963    
51.399994     -62.500000    48.600006     -72.299957    59.700012     -90.299988    
77.799988     -118.099976   79.199982     -130.599976   104.199982    -148.600006   
263.899994    -265.299988   327.799988    -262.500000   520.800018    -294.499969   
612.500000    -311.100006   641.699982    -325          729.199982    -294.499969   
770.800018    -280.599976   790.299988    -269.499969   819.550004    -226.694816   
833.300018    -200          
</BasePoints>
</Item>
</Trans>
<Trans>
74            "mue_a"       76            
<Item>
<Position>
6173.600006   2054.199982   
</Position>
<BasePoints>
416.699982    237.500000    0             0             23.474784     18.746069     
73.600006     58.300018     162.500000    129.100037    198.600006    145.800018    
404.199982    238.899994    675           272.200012    803.388864    283.515104    
833.300018    286.100006    
</BasePoints>
</Item>
</Trans>
<Trans>
76            "lambda_a"    72            
<Item>
<Position>
7006.900024   2340.299988   
</Position>
<BasePoints>
-486.100006   5.500031      0             0             -29.418728    5.849853      
-43.000031    8.300018      -51.300049    9.700012      -59.700012    11.100006     
-68.000031    11.100006     -69.400024    11.100006     -79.100037    11.100006     
-263.800049   6.900024      -309.700012   5.500031      -495.800018   -5.599976     
-651.300049   -16.699982    -837.500000   -33.399963    -942.288858   -43.315061    
-972.200012   -45.899963    
</BasePoints>
</Item>
</Trans>
<Trans>
76            "alpha_b"     77            
<Item>
<Position>
7006.900024   2340.299988   
</Position>
<BasePoints>
69.499969     109.700012    0             0             18.057284     24.018811     
44.499969     56.900024     81.999969     106.900024    120.361997    155.517268    
138.899994    179.100037    
</BasePoints>
</Item>
</Trans>
<Trans>
77            "lambda_a"    63            
<Item>
<Position>
7145.800018   2519.400024   
</Position>
<BasePoints>
-833.300018   269.499969    0             0             -26.351612    14.428557     
-155.500031   81.999969     -643.000031   316.699982    -1051.399994  247.299957    
-1191.600037  222.299957    -1216.600037  181.999969    -1354.100037  140.299988    
-1463.899994  105.599976    -1495.800018  108.399963    -1606.900024  72.299957     
-1612.500000  70.899963     -1618.000031  69.499969     -1639.786855  59.306554     
-1666.600037  45.899963     
</BasePoints>
</Item>
</Trans>
<Trans>
77            "mue_b"       70            
<Item>
<Position>
7145.800018   2519.400024   
</Position>
<BasePoints>
69.499969     -8.300018     0             0             28.857115     -8.380679     
51.399994     -15.200043    72.299957     -22.200012    110.119608    -31.724469    
138.899994    -40.200043    
</BasePoints>
</Item>
</Trans>
<Trans>
77            "beta_b"      73            
<Item>
<Position>
7145.800018   2519.400024   
</Position>
<BasePoints>
138.899994    126.399994    0             0             24.999818     16.695068     
77.799988     52.799988     180.599976    122.299957    253.069650    171.901690    
277.799988    188.899994    
</BasePoints>
</Item>
</Trans>
<Trans>
80            "mue_b"       83            
<Item>
<Position>
6729.199982   1806.900024   
</Position>
<BasePoints>
69.400024     11.199951     0             0             30.048245     0             
51.399994     0             72.200012     0             108.919943    0             
138.899994    0             
</BasePoints>
</Item>
</Trans>
<Trans>
81            "mue_b"       84            
<Item>
<Position>
6729.199982   2177.799988   
</Position>
<BasePoints>
69.400024     13.899994     0             0             29.960384     1.208770      
51.399994     2.799988      72.200012     4.100037      108.927328    5.176756      
138.899994    6.900024      
</BasePoints>
</Item>
</Trans>
</TransRel>
</GraphData>
</VioModels>
<VioLayout>
0             =AAAAAETd4gkAAAAAAAAAZSEAAAAHAAAACAAAAAEAAABJbg=== 1             150           338           0.100000      
</VioLayout>
</VioSystem>
</Value>
</Variable>
</VariablePool>

<Functions>
<WspLuaFunction>
"BufferModel" +Shown+       
<VioLuaFunctionDefinition>
<LuaFunctionDefinition>
"::BufferModel" 
<TextDoc>
""            
</TextDoc>
<HtmlDoc>
""            
</HtmlDoc>
<Keywords>
""            
</Keywords>

<VariantSignatures>

<Signature>
"BigBuffer"   

"Size"        "Integer"     +In+          
"Buffer"      "Generator"   +Out+         

</Signature>

</VariantSignatures>

<LuaCode>

__VERBATIM__
-- Model of a variable size buffer
function BigBuffer(qn,buffer)

-- Say hello on console
faudes.Print("BigBuffer()")

-- Clear result, set alphabet
buffer:Clear()
buffer:InsEvent('beta_a')
buffer:InsEvent('alpha_b')


-- Insert states
for i=1,qn do
  buffer:InsState(string.format('s%d',i))
end

-- Have marked initial state
buffer:SetMarkedState('s1')
buffer:SetInitState('s1')

-- Insert transitions
for i=1,qn-1 do
  s1=string.format('s%d',i)
  s2=string.format('s%d',i+1)
  buffer:SetTransition(s1,'beta_a',s2)
  buffer:SetTransition(s2,'alpha_b',s1)
end

-- By convention, return all parameters
return qn,buffer
end__VERBATIM__
</LuaCode>
</LuaFunctionDefinition>
<VioLayout>
1             178           342           
</VioLayout>
</VioLuaFunctionDefinition>
</WspLuaFunction>
</Functions>

<Script>
<BufferModel>
"AnonymousOperation_1458777923" 0             
<Parameters>
"BufferSize"  "BufferAB"    
</Parameters>
<Options>
"Clear Operands" 0             "Minimal Realisation" 0             "Clear State Names" 0             
</Options>
</BufferModel>
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
