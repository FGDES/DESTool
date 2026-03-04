<Project application="DESTool" version="0.87">

<VariablePool>
<Variable>
MachineA      System        +Visual+      +Plant+      
<File>
MachineA.vio 
</File>
</Variable>
<Variable>
MachineB      System        +Visual+      +Plant+      
<File>
MachineB.vio 
</File>
</Variable>
<Variable>
BufferSize    Integer      
<Value>
<Integer>
10            
</Integer>
</Value>
</Variable>
<Variable>
BufferAB      Generator     +Visual+      +Plant+      
<Value>
<VioGenerator>
<Generator name="BufferAB" ftype="Generator">

<Alphabet ftype="EventSet">
<Event name="beta_a"/>
<Event name="alpha_b"/>
</Alphabet>

<StateSet>
<State id="1" name="s1">
<Initial/>
<Marked/>
</State>
<State id="2" name="s2"/>
<State id="3" name="s3"/>
<State id="4" name="s4"/>
<State id="5" name="s5"/>
<State id="6" name="s6"/>
<State id="7" name="s7"/>
<State id="8" name="s8"/>
<State id="9" name="s9"/>
<State id="10" name="s10"/>
</StateSet>

<TransitionRelation>
<Transition x1="1" event="beta_a" x2="2"/>
<Transition x1="2" event="beta_a" x2="3"/>
<Transition x1="2" event="alpha_b" x2="1"/>
<Transition x1="3" event="beta_a" x2="4"/>
<Transition x1="3" event="alpha_b" x2="2"/>
<Transition x1="4" event="beta_a" x2="5"/>
<Transition x1="4" event="alpha_b" x2="3"/>
<Transition x1="5" event="beta_a" x2="6"/>
<Transition x1="5" event="alpha_b" x2="4"/>
<Transition x1="6" event="beta_a" x2="7"/>
<Transition x1="6" event="alpha_b" x2="5"/>
<Transition x1="7" event="beta_a" x2="8"/>
<Transition x1="7" event="alpha_b" x2="6"/>
<Transition x1="8" event="beta_a" x2="9"/>
<Transition x1="8" event="alpha_b" x2="7"/>
<Transition x1="9" event="beta_a" x2="10"/>
<Transition x1="9" event="alpha_b" x2="8"/>
<Transition x1="10" event="alpha_b" x2="9"/>
</TransitionRelation>

</Generator>
<VioModels>
<TransitionList>
<Transition x1="1" event="beta_a" x2="2"/>
<Transition x1="2" event="beta_a" x2="3"/>
<Transition x1="2" event="alpha_b" x2="1"/>
<Transition x1="3" event="beta_a" x2="4"/>
<Transition x1="3" event="alpha_b" x2="2"/>
<Transition x1="4" event="beta_a" x2="5"/>
<Transition x1="4" event="alpha_b" x2="3"/>
<Transition x1="5" event="beta_a" x2="6"/>
<Transition x1="5" event="alpha_b" x2="4"/>
<Transition x1="6" event="beta_a" x2="7"/>
<Transition x1="6" event="alpha_b" x2="5"/>
<Transition x1="7" event="beta_a" x2="8"/>
<Transition x1="7" event="alpha_b" x2="6"/>
<Transition x1="8" event="beta_a" x2="9"/>
<Transition x1="8" event="alpha_b" x2="7"/>
<Transition x1="9" event="beta_a" x2="10"/>
<Transition x1="9" event="alpha_b" x2="8"/>
<Transition x1="10" event="alpha_b" x2="9"/>
</TransitionList>
<StateList>
<State id="1"/>
<State id="2"/>
<State id="3"/>
<State id="4"/>
<State id="5"/>
<State id="6"/>
<State id="7"/>
<State id="8"/>
<State id="9"/>
<State id="10"/>
</StateList>
<EventList>
<Event name="beta_a"/>
<Event name="alpha_b"/>
</EventList>
<GraphData>
<States>
<State>
1             
<Item>
<Position>
27.800000      61.100000     
</Position>
<BasePoints>
0              0              30             30             -50            0             
-30.057877     0             
</BasePoints>
</Item>
</State>
<State>
2             
<Item>
<Position>
152.800000     61.100000     
</Position>
<BasePoints>
0              0              30             30             -50            0             
-30.057877     0             
</BasePoints>
</Item>
</State>
<State>
3             
<Item>
<Position>
277.800012     61.100000     
</Position>
<BasePoints>
0              0              30             30             -50            0             
-30.057877     0             
</BasePoints>
</Item>
</State>
<State>
4             
<Item>
<Position>
402.799988     61.100000     
</Position>
<BasePoints>
0              0              30             30             -50            0             
-30.057877     0             
</BasePoints>
</Item>
</State>
<State>
5             
<Item>
<Position>
527.799988     61.100000     
</Position>
<BasePoints>
0              0              30             30             -50            0             
-30.057877     0             
</BasePoints>
</Item>
</State>
<State>
6             
<Item>
<Position>
652.799988     61.100000     
</Position>
<BasePoints>
0              0              30             30             -50            0             
-30.057877     0             
</BasePoints>
</Item>
</State>
<State>
7             
<Item>
<Position>
777.799988     61.100000     
</Position>
<BasePoints>
0              0              30             30             -50            0             
-30.057877     0             
</BasePoints>
</Item>
</State>
<State>
8             
<Item>
<Position>
902.799988     61.100000     
</Position>
<BasePoints>
0              0              30             30             -50            0             
-30.057877     0             
</BasePoints>
</Item>
</State>
<State>
9             
<Item>
<Position>
1027.799988    61.100000     
</Position>
<BasePoints>
0              0              30             30             -50            0             
-30.057877     0             
</BasePoints>
</Item>
</State>
<State>
10            
<Item>
<Position>
1159.700012    61.100000     
</Position>
<BasePoints>
0              0              30             30             -50            0             
-30.057877     0             
</BasePoints>
</Item>
</State>
</States>
<TransRel>
<Trans>
1              beta_a        2              +Free+       
<Item>
<Position>
27.800000      61.100000     
</Position>
<BasePoints>
62.500000      11.100000      0              0              30.054920      0             
44.400001      0              65.300000      0              94.975184      0             
125            0             
</BasePoints>
</Item>
</Trans>
<Trans>
2              alpha_b       1              +Free+       
<Item>
<Position>
152.800000     61.100000     
</Position>
<BasePoints>
-62.500000     -16.700000     0              0              -24.000693     -18.054575    
-36.099994     -25            -54.200000     -31.900001     -72.200000     -27.800000    
-77.800000     -26.400000     -83.399999     -25            -99.284448     -15.454057    
-125           0             
</BasePoints>
</Item>
</Trans>
<Trans>
2              beta_a        3              +Free+       
<Item>
<Position>
152.800000     61.100000     
</Position>
<BasePoints>
62.500012      11.100000      0              0              30.054920      0             
44.400001      0              65.300000      0              94.975189      0             
125.000012     0             
</BasePoints>
</Item>
</Trans>
<Trans>
3              alpha_b       2              +Free+       
<Item>
<Position>
277.800012     61.100000     
</Position>
<BasePoints>
-62.500000     -16.700000     0              0              -24.000707     -18.054575    
-36.100006     -25            -54.200006     -31.900001     -72.200012     -27.800000    
-77.800012     -26.400000     -83.400011     -25            -99.284460     -15.454057    
-125.000012    0             
</BasePoints>
</Item>
</Trans>
<Trans>
3              beta_a        4              +Free+       
<Item>
<Position>
277.800012     61.100000     
</Position>
<BasePoints>
62.500000      11.100000      0              0              30.054907      0             
44.399977      0              65.299988      0              94.975166      0             
124.999976     0             
</BasePoints>
</Item>
</Trans>
<Trans>
4              alpha_b       3              +Free+       
<Item>
<Position>
402.799988     61.100000     
</Position>
<BasePoints>
-62.499976     -16.700000     0              0              -25.163610     -16.313706    
-31.999993     -20.800000     -43.099999     -25            -52.799988     -27.800000    
-65.299988     -30.500001     -77.799988     -27.800000     -99.141463     -15.230230    
-124.999976    0             
</BasePoints>
</Item>
</Trans>
<Trans>
4              beta_a        5              +Free+       
<Item>
<Position>
402.799988     61.100000     
</Position>
<BasePoints>
62.500000      11.100000      0              0              30.054960      0             
44.400024      0              65.300035      0              94.975201      0             
125            0             
</BasePoints>
</Item>
</Trans>
<Trans>
5              alpha_b       4              +Free+       
<Item>
<Position>
527.799988     61.100000     
</Position>
<BasePoints>
-62.500000     -16.700000     0              0              -24.000654     -18.054575    
-36.100006     -25            -54.199982     -31.900001     -72.199965     -27.800000    
-77.799988     -26.400000     -83.400011     -25            -99.284455     -15.454057    
-125           0             
</BasePoints>
</Item>
</Trans>
<Trans>
5              beta_a        6              +Free+       
<Item>
<Position>
527.799988     61.100000     
</Position>
<BasePoints>
62.500000      11.100000      0              0              30.054960      0             
44.400024      0              65.300035      0              94.975201      0             
125            0             
</BasePoints>
</Item>
</Trans>
<Trans>
6              alpha_b       5              +Free+       
<Item>
<Position>
652.799988     61.100000     
</Position>
<BasePoints>
-62.500000     -16.700000     0              0              -24.000654     -18.054575    
-36.100006     -25            -54.199982     -31.900001     -72.199965     -27.800000    
-77.799988     -26.400000     -83.400011     -25            -99.284455     -15.454057    
-125           0             
</BasePoints>
</Item>
</Trans>
<Trans>
6              beta_a        7              +Free+       
<Item>
<Position>
652.799988     61.100000     
</Position>
<BasePoints>
62.500000      11.100000      0              0              30.054960      0             
44.400024      0              65.300035      0              94.975201      0             
125            0             
</BasePoints>
</Item>
</Trans>
<Trans>
7              alpha_b       6              +Free+       
<Item>
<Position>
777.799988     61.100000     
</Position>
<BasePoints>
-62.500000     -16.700000     0              0              -24.000654     -18.054575    
-36.100006     -25            -54.199982     -31.900001     -72.199965     -27.800000    
-77.799988     -26.400000     -83.400011     -25            -99.284455     -15.454057    
-125           0             
</BasePoints>
</Item>
</Trans>
<Trans>
7              beta_a        8              +Free+       
<Item>
<Position>
777.799988     61.100000     
</Position>
<BasePoints>
62.500000      11.100000      0              0              30.054907      0             
44.400024      0              65.299988      0              94.975177      0             
125            0             
</BasePoints>
</Item>
</Trans>
<Trans>
8              alpha_b       7              +Free+       
<Item>
<Position>
902.799988     61.100000     
</Position>
<BasePoints>
-62.500000     -16.700000     0              0              -25.163635     -16.313706    
-31.999969     -20.800000     -43.099976     -25            -52.799988     -27.800000    
-65.299988     -30.500001     -77.799988     -27.800000     -99.141474     -15.230230    
-125           0             
</BasePoints>
</Item>
</Trans>
<Trans>
8              beta_a        9              +Free+       
<Item>
<Position>
902.799988     61.100000     
</Position>
<BasePoints>
62.500000      11.100000      0              0              30.054907      0             
44.400024      0              65.299988      0              94.975177      0             
125            0             
</BasePoints>
</Item>
</Trans>
<Trans>
9              alpha_b       8              +Free+       
<Item>
<Position>
1027.799988    61.100000     
</Position>
<BasePoints>
-62.500000     -16.700000     0              0              -25.163635     -16.313706    
-31.999969     -20.800000     -43.099976     -25            -52.799988     -27.800000    
-65.299988     -30.500001     -77.799988     -27.800000     -99.141474     -15.230230    
-125           0             
</BasePoints>
</Item>
</Trans>
<Trans>
9              beta_a        10             +Free+       
<Item>
<Position>
1027.799988    61.100000     
</Position>
<BasePoints>
62.500000      11.100000      0              0              30.054907      0             
44.400024      0              63.899994      0              101.863050     0             
131.900024     0             
</BasePoints>
</Item>
</Trans>
<Trans>
10             alpha_b       9              +Free+       
<Item>
<Position>
1159.700012    61.100000     
</Position>
<BasePoints>
-69.400024     -16.700000     0              0              -25.003344     -16.668875    
-44.400024     -26.400000     -62.500000     -31.900001     -79.100037     -27.800000    
-84.700012     -26.400000     -90.299988     -25            -106.184450    -15.454057    
-131.900024    0             
</BasePoints>
</Item>
</Trans>
</TransRel>
</GraphData>
</VioModels>
<VioLayout>
0             =BAAAAAAAAADgCVeABwAAgKAAV4AHAACAYAJXgAcAAIBgBg===  0              150            845            0.938037       0             
300           
</VioLayout>
</VioGenerator>
</Value>
</Variable>
<Variable>
Sigma         EventSet      +Visual+     
<File>
SigmaAB.vio  
</File>
</Variable>
<Variable>
PlantAB       System        +Visual+     
<Value>
<VioSystem>
<Generator name="PlantAB" ftype="System">

<Alphabet>
<Event name="beta_a"/>
<Event name="alpha_b">
<Controllable/>
</Event>
<Event name="alpha_a">
<Controllable/>
</Event>
<Event name="mue_a"/>
<Event name="lambda_a">
<Controllable/>
</Event>
<Event name="beta_b"/>
<Event name="mue_b"/>
<Event name="lambda_b">
<Controllable/>
</Event>
</Alphabet>

<StateSet>
<State id="1" name="I|I">
<Initial/>
<Marked/>
</State>
<State id="2" name="B|I"/>
<State id="3" name="I|B"/>
<State id="4" name="B|B"/>
<State id="5" name="I|D"/>
<State id="6" name="B|D"/>
<State id="7" name="D|D"/>
<State id="8" name="D|I"/>
<State id="9" name="D|B"/>
</StateSet>

<TransitionRelation>
<Transition x1="1" event="alpha_b" x2="3"/>
<Transition x1="1" event="alpha_a" x2="2"/>
<Transition x1="2" event="beta_a" x2="1"/>
<Transition x1="2" event="alpha_b" x2="4"/>
<Transition x1="2" event="mue_a" x2="8"/>
<Transition x1="3" event="alpha_a" x2="4"/>
<Transition x1="3" event="beta_b" x2="1"/>
<Transition x1="3" event="mue_b" x2="5"/>
<Transition x1="4" event="beta_a" x2="3"/>
<Transition x1="4" event="mue_a" x2="9"/>
<Transition x1="4" event="beta_b" x2="2"/>
<Transition x1="4" event="mue_b" x2="6"/>
<Transition x1="5" event="alpha_a" x2="6"/>
<Transition x1="5" event="lambda_b" x2="1"/>
<Transition x1="6" event="beta_a" x2="5"/>
<Transition x1="6" event="mue_a" x2="7"/>
<Transition x1="6" event="lambda_b" x2="2"/>
<Transition x1="7" event="lambda_a" x2="5"/>
<Transition x1="7" event="lambda_b" x2="8"/>
<Transition x1="8" event="alpha_b" x2="9"/>
<Transition x1="8" event="lambda_a" x2="1"/>
<Transition x1="9" event="lambda_a" x2="3"/>
<Transition x1="9" event="beta_b" x2="8"/>
<Transition x1="9" event="mue_b" x2="7"/>
</TransitionRelation>

</Generator>
<VioModels>
<TransitionList>
<Transition x1="1" event="alpha_a" x2="2"/>
<Transition x1="3" event="alpha_a" x2="4"/>
<Transition x1="5" event="alpha_a" x2="6"/>
<Transition x1="1" event="alpha_b" x2="3"/>
<Transition x1="2" event="alpha_b" x2="4"/>
<Transition x1="8" event="alpha_b" x2="9"/>
<Transition x1="2" event="beta_a" x2="1"/>
<Transition x1="4" event="beta_a" x2="3"/>
<Transition x1="6" event="beta_a" x2="5"/>
<Transition x1="3" event="beta_b" x2="1"/>
<Transition x1="4" event="beta_b" x2="2"/>
<Transition x1="9" event="beta_b" x2="8"/>
<Transition x1="7" event="lambda_a" x2="5"/>
<Transition x1="8" event="lambda_a" x2="1"/>
<Transition x1="9" event="lambda_a" x2="3"/>
<Transition x1="5" event="lambda_b" x2="1"/>
<Transition x1="6" event="lambda_b" x2="2"/>
<Transition x1="7" event="lambda_b" x2="8"/>
<Transition x1="2" event="mue_a" x2="8"/>
<Transition x1="4" event="mue_a" x2="9"/>
<Transition x1="6" event="mue_a" x2="7"/>
<Transition x1="3" event="mue_b" x2="5"/>
<Transition x1="4" event="mue_b" x2="6"/>
<Transition x1="9" event="mue_b" x2="7"/>
</TransitionList>
<StateList>
<State id="1"/>
<State id="2"/>
<State id="3"/>
<State id="4"/>
<State id="5"/>
<State id="6"/>
<State id="7"/>
<State id="8"/>
<State id="9"/>
</StateList>
<EventList>
<Event name="beta_a"/>
<Event name="alpha_b"/>
<Event name="alpha_a"/>
<Event name="mue_a"/>
<Event name="lambda_a"/>
<Event name="beta_b"/>
<Event name="mue_b"/>
<Event name="lambda_b"/>
</EventList>
<GraphData>
<States>
<State>
1             
<Item>
<Position>
77.778000      140.280000    
</Position>
<BasePoints>
0              0              25             25             -77.083560     0             
-25.024153     0             
</BasePoints>
</Item>
</State>
<State>
2             
<Item>
<Position>
229.860000     258.330000    
</Position>
<BasePoints>
0              0              25             25             -60            0             
-25.048612     0             
</BasePoints>
</Item>
</State>
<State>
3             
<Item>
<Position>
699.790000     129.170000    
</Position>
<BasePoints>
0              0              25             25             -60            0             
-25.048612     0             
</BasePoints>
</Item>
</State>
<State>
4             
<Item>
<Position>
860.680000     236.110000    
</Position>
<BasePoints>
0              0              26.163000      26.163000      -60            0             
-26.161885     0             
</BasePoints>
</Item>
</State>
<State>
5             
<Item>
<Position>
860.680000     145.830000    
</Position>
<BasePoints>
0              0              25             25             -60            0             
-25.048612     0             
</BasePoints>
</Item>
</State>
<State>
6             
<Item>
<Position>
1013.900000    276.390000    
</Position>
<BasePoints>
0              0              26.980500      26.980500      -60            0             
-26.982191     0             
</BasePoints>
</Item>
</State>
<State>
7             
<Item>
<Position>
1163.300000    336.110000    
</Position>
<BasePoints>
0              0              27.798000      27.798000      -60            0             
-27.802496     0             
</BasePoints>
</Item>
</State>
<State>
8             
<Item>
<Position>
376.390000     345.830000    
</Position>
<BasePoints>
0              0              25             25             -60            0             
-25.048612     0             
</BasePoints>
</Item>
</State>
<State>
9             
<Item>
<Position>
538.090000     340.280000    
</Position>
<BasePoints>
0              0              26.980500      26.980500      -60            0             
-26.982191     0             
</BasePoints>
</Item>
</State>
</States>
<TransRel>
<Trans>
1              alpha_a       2              +Free+       
<Item>
<Position>
77.778000      140.280000    
</Position>
<BasePoints>
73.612000      34.030000      0              0              20.158780      14.847461     
45.652000      35             90.932000      70.800000      132.315797     102.776850    
152.082000     118.050000    
</BasePoints>
</Item>
</Trans>
<Trans>
1              alpha_b       3              +Free+       
<Item>
<Position>
77.778000      140.280000    
</Position>
<BasePoints>
298.612000     -13.200000     0              0              24.985849      -0.424962     
119.522000     -2.120000      465.902000     -8.340000      596.992495     -10.666056    
622.012000     -11.110000    
</BasePoints>
</Item>
</Trans>
<Trans>
2              beta_a        1              +Free+       
<Item>
<Position>
229.860000     258.330000    
</Position>
<BasePoints>
-78.470000     -32.640000     0              0              -24.973814     -0.502036     
-47.430000     -2.140000      -79.990000     -7.630000      -102.080000    -25           
-119.950000    -39.050000     -131.949000    -61.500000     -143.686720    -94.469159    
-152.082000    -118.050000   
</BasePoints>
</Item>
</Trans>
<Trans>
2              alpha_b       4              +Free+       
<Item>
<Position>
229.860000     258.330000    
</Position>
<BasePoints>
308.230000     -39.580000     0              0              23.955986      -7.132011     
33.480000      -9.810000      44.600000      -12.500000     54.860000      -13.890000    
254.800000     -40.900000     497.430000     -30.430000     604.688265     -23.828378    
630.820000     -22.220000    
</BasePoints>
</Item>
</Trans>
<Trans>
2              mue_a         8              +Free+       
<Item>
<Position>
229.860000     258.330000    
</Position>
<BasePoints>
75.700000      32.640000      0              0              19.932931      15.164855     
30.170000      23.200000      42.880000      32.700000      54.860000      40.280000     
72.680000      51.540000      93.460000      62.550000      123.882028     76.852423     
146.530000     87.500000     
</BasePoints>
</Item>
</Trans>
<Trans>
3              beta_b        1              +Free+       
<Item>
<Position>
699.790000     129.170000    
</Position>
<BasePoints>
-323.400000    -67.364000     0              0              -21.423711     -12.884051    
-50.870000     -30.527000     -107.550000    -59.726000     -160.310000    -59.726000    
-471.320000    -59.726000     -471.320000    -59.726000     -471.320000    -59.726000    
-516.250000    -59.726000     -562.090000    -33.211000     -601.881667    -3.779297     
-622.012000    11.110000     
</BasePoints>
</Item>
</Trans>
<Trans>
3              alpha_a       4              +Free+       
<Item>
<Position>
699.790000     129.170000    
</Position>
<BasePoints>
79.870000      38.190000      0              0              17.784662      17.556908     
26.940000      26.770000      38.520000      37.570000      50             45.830000     
74.440000      63.410000      83.460000      63.060000      109.730000     77.770000     
114.940000     80.690000      120.420000     83.830000      138.165211     93.963230     
160.890000     106.940000    
</BasePoints>
</Item>
</Trans>
<Trans>
3              mue_b         5              +Free+       
<Item>
<Position>
699.790000     129.170000    
</Position>
<BasePoints>
79.870000      -28.480000     0              0              23.282537      -9.228933     
31.490000      -12.220000     41.030000      -15.170000     50             -16.670000    
76.190000      -21.030000     84.330000      -24.390000     109.730000     -16.670000    
116.580000     -14.590000     123.350000     -11.210000     140.778145     1.728796      
160.890000     16.660000     
</BasePoints>
</Item>
</Trans>
<Trans>
4              beta_b        2              +Free+       
<Item>
<Position>
860.680000     236.110000    
</Position>
<BasePoints>
-322.590000    20.140000      0              0              -25.294486     6.876657      
-56.030000     15.090000      -111.280000    27.780000      -159.500000    27.780000     
-485.680000    27.780000      -485.680000    27.780000      -485.680000    27.780000     
-521.620000    27.780000      -562.580000    26.020000      -605.829837    23.611598     
-630.820000    22.220000     
</BasePoints>
</Item>
</Trans>
<Trans>
4              beta_a        3              +Free+       
<Item>
<Position>
860.680000     236.110000    
</Position>
<BasePoints>
-81.020000     -107.640000    0              0              -11.237955     -23.623657    
-19.530000     -40.710000     -32.930000     -62.980000     -51.160000     -76.390000    
-71.630000     -91.440000     -99.250000     -99.080000     -136.078010    -103.776109   
-160.890000    -106.940000   
</BasePoints>
</Item>
</Trans>
<Trans>
4              mue_b         6              +Free+       
<Item>
<Position>
860.680000     236.110000    
</Position>
<BasePoints>
74.770000      31.250000      0              0              18.832502      18.217967     
27.820000      26.280000      39.160000      34.670000      51.160000      38.890000     
70.420000      45.670000      93.060000      46.550000      126.371327     43.078224     
153.220000     40.280000     
</BasePoints>
</Item>
</Trans>
<Trans>
4              mue_a         9              +Free+       
<Item>
<Position>
860.680000     236.110000    
</Position>
<BasePoints>
-160.890000    71.530000      0              0              -17.364462     19.623336     
-26.390000     29.430000      -38.300000     40.470000      -51.160000     47.220000     
-126.190000    86.620000      -226.450000    98.760000      -295.644589    102.653725    
-322.590000    104.170000    
</BasePoints>
</Item>
</Trans>
<Trans>
5              lambda_b      1              +Free+       
<Item>
<Position>
860.680000     145.830000    
</Position>
<BasePoints>
-404.430000    -138.191100    0              0              -13.653215     -20.990319    
-36.960000     -57.878000     -91.510000     -130.552000    -159.500000    -130.552000   
-632.210000    -130.552000    -632.210000    -130.552000    -632.210000    -130.552000   
-689.610000    -130.552000    -736.550000    -75.556000     -769.096024    -26.401337    
-782.902000    -5.550000     
</BasePoints>
</Item>
</Trans>
<Trans>
5              alpha_a       6              +Free+       
<Item>
<Position>
860.680000     145.830000    
</Position>
<BasePoints>
74.770000      74.310000      0              0              10.728953      22.565732     
19.140000      40.580000      32.930000      65.380000      51.160000      81.950000     
69.140000      98.280000      93.600000      110.260000     127.660327     121.857193    
153.220000     130.560000    
</BasePoints>
</Item>
</Trans>
<Trans>
6              lambda_b      2              +Free+       
<Item>
<Position>
1013.900000    276.390000    
</Position>
<BasePoints>
-393.970000    203.470000     0              0              -12.923816     23.670467     
-41.970000     79.020000      -122.710000    211.110000     -232.860000    211.110000    
-638.900000    211.110000     -638.900000    211.110000     -638.900000    211.110000    
-740.430000    211.110000     -694.490000    96.020000      -754.180000    13.890000     
-754.940000    12.840000      -755.730000    11.780000      -766.816289    0.094557      
-784.040000    -18.060000    
</BasePoints>
</Item>
</Trans>
<Trans>
6              beta_a        5              +Free+       
<Item>
<Position>
1013.900000    276.390000    
</Position>
<BasePoints>
-78.450000     -103.470000    0              0              -16.672387     -21.188854    
-26.890000     -34.510000     -40.660000     -51.100000     -54.840000     -63.890000    
-73.640000     -80.870000     -81.170000     -81.490000     -102.060000    -95.830000    
-107.940000    -99.870000     -114.190000    -104.200000    -132.462793    -116.541041   
-153.220000    -130.560000   
</BasePoints>
</Item>
</Trans>
<Trans>
6              mue_a         7              +Free+       
<Item>
<Position>
1013.900000    276.390000    
</Position>
<BasePoints>
75.700000      14.580000      0              0              25.224026      9.715191      
48.600000      19.230000      83.500000      33.450000      123.593531     49.432656     
149.400000     59.720000     
</BasePoints>
</Item>
</Trans>
<Trans>
7              lambda_a      5              +Free+       
<Item>
<Position>
1163.300000    336.110000    
</Position>
<BasePoints>
-149.400000    -165.970000    0              0              -18.155893     -21.090278    
-28.100000     -32.960000     -40.500000     -47            -52.800000     -58.330000    
-114.500000    -115.090000    -127.600000    -136.770000    -204.240000    -170.830000   
-222.930000    -179.150000    -245.240000    -183.930000    -277.723701    -187.524833   
-302.620000    -190.280000   
</BasePoints>
</Item>
</Trans>
<Trans>
7              lambda_b      8              +Free+       
<Item>
<Position>
1163.300000    336.110000    
</Position>
<BasePoints>
-383.640000    90.970000      0              0              -18.049929     21.107567     
-43.300000     50.400000      -93.100000     98.610000      -148           98.610000     
-626.600000    98.610000      -626.600000    98.610000      -626.600000    98.610000     
-678.180000    98.610000      -728.560000    62.510000      -768.336457    26.523724     
-786.910000    9.720000      
</BasePoints>
</Item>
</Trans>
<Trans>
8              lambda_a      1              +Free+       
<Item>
<Position>
376.390000     345.830000    
</Position>
<BasePoints>
-146.530000    -42.360000     0              0              -24.951054     -1.437181     
-59.560000     -4.250000      -125.330000    -12.320000     -176.390000    -34.720000    
-212.800000    -50.690000     -224.080000    -56.220000     -248.610000    -87.500000    
-267.250000    -111.260000    -279.821000    -143.170000    -291.400240    -181.609307   
-298.612000    -205.550000   
</BasePoints>
</Item>
</Trans>
<Trans>
8              alpha_b       9              +Free+       
<Item>
<Position>
376.390000     345.830000    
</Position>
<BasePoints>
79.860000      -11.800000     0              0              24.981872      -0.821965     
50.630000      -1.720000      90.370000      -3.110000      134.742352     -4.627854     
161.700000     -5.550000     
</BasePoints>
</Item>
</Trans>
<Trans>
9              lambda_a      3              +Free+       
<Item>
<Position>
538.090000     340.280000    
</Position>
<BasePoints>
81.840000      -149.310000    0              0              17.125639      -20.916963    
45.340000      -58.390000     104.190000     -136.550000    146.435479     -191.320003   
161.700000     -211.110000   
</BasePoints>
</Item>
</Trans>
<Trans>
9              mue_b         7              +Free+       
<Item>
<Position>
538.090000     340.280000    
</Position>
<BasePoints>
322.590000     -7.640000      0              0              26.908152      1.666877      
35.080000      2.130000       43.890000      2.550000       51.980000      2.780000      
78.520000      3.500000       85.160000      2.960000       111.700000     2.780000      
286.990000     1.590000       496.010000     -1.890000      597.380609     -3.678893     
625.210000     -4.170000     
</BasePoints>
</Item>
</Trans>
<Trans>
9              beta_b        8              +Free+       
<Item>
<Position>
538.090000     340.280000    
</Position>
<BasePoints>
-81.840000     15.970000      0              0              -23.670467     12.953640     
-32.330000     17.280000      -42.330000     21.470000      -51.980000     23.610000     
-77.890000     29.360000      -85.580000     28.300000      -111.700000    23.610000     
-116.220000    22.800000      -120.870000    21.590000      -138.385910    14.708903     
-161.700000    5.550000      
</BasePoints>
</Item>
</Trans>
</TransRel>
</GraphData>
</VioModels>
<VioLayout>
0             =AQAAAAMAAAANBAAAAAAAAAAAAAAAAAAAAAAAAAgAAAAAAA===  0              150            726            0.612336       0             
300           
</VioLayout>
</VioSystem>
</Value>
</Variable>
<Variable>
FullBufferAB  Generator     +Visual+     
<Value>
<VioGenerator>
<Generator name="FullBufferAB" ftype="Generator">

<Alphabet ftype="EventSet">
<Event name="beta_a"/>
<Event name="alpha_b"/>
<Event name="alpha_a"/>
<Event name="mue_a"/>
<Event name="lambda_a"/>
<Event name="beta_b"/>
<Event name="mue_b"/>
<Event name="lambda_b"/>
</Alphabet>

<StateSet>
<State id="1" name="s1">
<Initial/>
<Marked/>
</State>
<State id="2" name="s2"/>
<State id="3" name="s3"/>
<State id="4" name="s4"/>
<State id="5" name="s5"/>
<State id="6" name="s6"/>
<State id="7" name="s7"/>
<State id="8" name="s8"/>
<State id="9" name="s9"/>
<State id="10" name="s10"/>
</StateSet>

<TransitionRelation>
<Transition x1="1" event="beta_a" x2="2"/>
<Transition x1="1" event="alpha_a" x2="1"/>
<Transition x1="1" event="mue_a" x2="1"/>
<Transition x1="1" event="lambda_a" x2="1"/>
<Transition x1="1" event="beta_b" x2="1"/>
<Transition x1="1" event="mue_b" x2="1"/>
<Transition x1="1" event="lambda_b" x2="1"/>
<Transition x1="2" event="beta_a" x2="3"/>
<Transition x1="2" event="alpha_b" x2="1"/>
<Transition x1="2" event="alpha_a" x2="2"/>
<Transition x1="2" event="mue_a" x2="2"/>
<Transition x1="2" event="lambda_a" x2="2"/>
<Transition x1="2" event="beta_b" x2="2"/>
<Transition x1="2" event="mue_b" x2="2"/>
<Transition x1="2" event="lambda_b" x2="2"/>
<Transition x1="3" event="beta_a" x2="4"/>
<Transition x1="3" event="alpha_b" x2="2"/>
<Transition x1="3" event="alpha_a" x2="3"/>
<Transition x1="3" event="mue_a" x2="3"/>
<Transition x1="3" event="lambda_a" x2="3"/>
<Transition x1="3" event="beta_b" x2="3"/>
<Transition x1="3" event="mue_b" x2="3"/>
<Transition x1="3" event="lambda_b" x2="3"/>
<Transition x1="4" event="beta_a" x2="5"/>
<Transition x1="4" event="alpha_b" x2="3"/>
<Transition x1="4" event="alpha_a" x2="4"/>
<Transition x1="4" event="mue_a" x2="4"/>
<Transition x1="4" event="lambda_a" x2="4"/>
<Transition x1="4" event="beta_b" x2="4"/>
<Transition x1="4" event="mue_b" x2="4"/>
<Transition x1="4" event="lambda_b" x2="4"/>
<Transition x1="5" event="beta_a" x2="6"/>
<Transition x1="5" event="alpha_b" x2="4"/>
<Transition x1="5" event="alpha_a" x2="5"/>
<Transition x1="5" event="mue_a" x2="5"/>
<Transition x1="5" event="lambda_a" x2="5"/>
<Transition x1="5" event="beta_b" x2="5"/>
<Transition x1="5" event="mue_b" x2="5"/>
<Transition x1="5" event="lambda_b" x2="5"/>
<Transition x1="6" event="beta_a" x2="7"/>
<Transition x1="6" event="alpha_b" x2="5"/>
<Transition x1="6" event="alpha_a" x2="6"/>
<Transition x1="6" event="mue_a" x2="6"/>
<Transition x1="6" event="lambda_a" x2="6"/>
<Transition x1="6" event="beta_b" x2="6"/>
<Transition x1="6" event="mue_b" x2="6"/>
<Transition x1="6" event="lambda_b" x2="6"/>
<Transition x1="7" event="beta_a" x2="8"/>
<Transition x1="7" event="alpha_b" x2="6"/>
<Transition x1="7" event="alpha_a" x2="7"/>
<Transition x1="7" event="mue_a" x2="7"/>
<Transition x1="7" event="lambda_a" x2="7"/>
<Transition x1="7" event="beta_b" x2="7"/>
<Transition x1="7" event="mue_b" x2="7"/>
<Transition x1="7" event="lambda_b" x2="7"/>
<Transition x1="8" event="beta_a" x2="9"/>
<Transition x1="8" event="alpha_b" x2="7"/>
<Transition x1="8" event="alpha_a" x2="8"/>
<Transition x1="8" event="mue_a" x2="8"/>
<Transition x1="8" event="lambda_a" x2="8"/>
<Transition x1="8" event="beta_b" x2="8"/>
<Transition x1="8" event="mue_b" x2="8"/>
<Transition x1="8" event="lambda_b" x2="8"/>
<Transition x1="9" event="beta_a" x2="10"/>
<Transition x1="9" event="alpha_b" x2="8"/>
<Transition x1="9" event="alpha_a" x2="9"/>
<Transition x1="9" event="mue_a" x2="9"/>
<Transition x1="9" event="lambda_a" x2="9"/>
<Transition x1="9" event="beta_b" x2="9"/>
<Transition x1="9" event="mue_b" x2="9"/>
<Transition x1="9" event="lambda_b" x2="9"/>
<Transition x1="10" event="alpha_b" x2="9"/>
<Transition x1="10" event="alpha_a" x2="10"/>
<Transition x1="10" event="mue_a" x2="10"/>
<Transition x1="10" event="lambda_a" x2="10"/>
<Transition x1="10" event="beta_b" x2="10"/>
<Transition x1="10" event="mue_b" x2="10"/>
<Transition x1="10" event="lambda_b" x2="10"/>
</TransitionRelation>

</Generator>
<VioModels>
<TransitionList>
<Transition x1="1" event="beta_a" x2="2"/>
<Transition x1="1" event="alpha_a" x2="1"/>
<Transition x1="1" event="mue_a" x2="1"/>
<Transition x1="1" event="lambda_a" x2="1"/>
<Transition x1="1" event="beta_b" x2="1"/>
<Transition x1="1" event="mue_b" x2="1"/>
<Transition x1="1" event="lambda_b" x2="1"/>
<Transition x1="2" event="beta_a" x2="3"/>
<Transition x1="2" event="alpha_b" x2="1"/>
<Transition x1="2" event="alpha_a" x2="2"/>
<Transition x1="2" event="mue_a" x2="2"/>
<Transition x1="2" event="lambda_a" x2="2"/>
<Transition x1="2" event="beta_b" x2="2"/>
<Transition x1="2" event="mue_b" x2="2"/>
<Transition x1="2" event="lambda_b" x2="2"/>
<Transition x1="3" event="beta_a" x2="4"/>
<Transition x1="3" event="alpha_b" x2="2"/>
<Transition x1="3" event="alpha_a" x2="3"/>
<Transition x1="3" event="mue_a" x2="3"/>
<Transition x1="3" event="lambda_a" x2="3"/>
<Transition x1="3" event="beta_b" x2="3"/>
<Transition x1="3" event="mue_b" x2="3"/>
<Transition x1="3" event="lambda_b" x2="3"/>
<Transition x1="4" event="beta_a" x2="5"/>
<Transition x1="4" event="alpha_b" x2="3"/>
<Transition x1="4" event="alpha_a" x2="4"/>
<Transition x1="4" event="mue_a" x2="4"/>
<Transition x1="4" event="lambda_a" x2="4"/>
<Transition x1="4" event="beta_b" x2="4"/>
<Transition x1="4" event="mue_b" x2="4"/>
<Transition x1="4" event="lambda_b" x2="4"/>
<Transition x1="5" event="beta_a" x2="6"/>
<Transition x1="5" event="alpha_b" x2="4"/>
<Transition x1="5" event="alpha_a" x2="5"/>
<Transition x1="5" event="mue_a" x2="5"/>
<Transition x1="5" event="lambda_a" x2="5"/>
<Transition x1="5" event="beta_b" x2="5"/>
<Transition x1="5" event="mue_b" x2="5"/>
<Transition x1="5" event="lambda_b" x2="5"/>
<Transition x1="6" event="beta_a" x2="7"/>
<Transition x1="6" event="alpha_b" x2="5"/>
<Transition x1="6" event="alpha_a" x2="6"/>
<Transition x1="6" event="mue_a" x2="6"/>
<Transition x1="6" event="lambda_a" x2="6"/>
<Transition x1="6" event="beta_b" x2="6"/>
<Transition x1="6" event="mue_b" x2="6"/>
<Transition x1="6" event="lambda_b" x2="6"/>
<Transition x1="7" event="beta_a" x2="8"/>
<Transition x1="7" event="alpha_b" x2="6"/>
<Transition x1="7" event="alpha_a" x2="7"/>
<Transition x1="7" event="mue_a" x2="7"/>
<Transition x1="7" event="lambda_a" x2="7"/>
<Transition x1="7" event="beta_b" x2="7"/>
<Transition x1="7" event="mue_b" x2="7"/>
<Transition x1="7" event="lambda_b" x2="7"/>
<Transition x1="8" event="beta_a" x2="9"/>
<Transition x1="8" event="alpha_b" x2="7"/>
<Transition x1="8" event="alpha_a" x2="8"/>
<Transition x1="8" event="mue_a" x2="8"/>
<Transition x1="8" event="lambda_a" x2="8"/>
<Transition x1="8" event="beta_b" x2="8"/>
<Transition x1="8" event="mue_b" x2="8"/>
<Transition x1="8" event="lambda_b" x2="8"/>
<Transition x1="9" event="beta_a" x2="10"/>
<Transition x1="9" event="alpha_b" x2="8"/>
<Transition x1="9" event="alpha_a" x2="9"/>
<Transition x1="9" event="mue_a" x2="9"/>
<Transition x1="9" event="lambda_a" x2="9"/>
<Transition x1="9" event="beta_b" x2="9"/>
<Transition x1="9" event="mue_b" x2="9"/>
<Transition x1="9" event="lambda_b" x2="9"/>
<Transition x1="10" event="alpha_b" x2="9"/>
<Transition x1="10" event="alpha_a" x2="10"/>
<Transition x1="10" event="mue_a" x2="10"/>
<Transition x1="10" event="lambda_a" x2="10"/>
<Transition x1="10" event="beta_b" x2="10"/>
<Transition x1="10" event="mue_b" x2="10"/>
<Transition x1="10" event="lambda_b" x2="10"/>
</TransitionList>
<StateList>
<State id="1"/>
<State id="2"/>
<State id="3"/>
<State id="4"/>
<State id="5"/>
<State id="6"/>
<State id="7"/>
<State id="8"/>
<State id="9"/>
<State id="10"/>
</StateList>
<EventList>
<Event name="beta_a"/>
<Event name="alpha_b"/>
<Event name="alpha_a"/>
<Event name="mue_a"/>
<Event name="lambda_a"/>
<Event name="beta_b"/>
<Event name="mue_b"/>
<Event name="lambda_b"/>
</EventList>
<GraphData>
<States/>
<TransRel/>
</GraphData>
</VioModels>
<VioLayout>
0             ==  0              150            150            1              0             
300           
</VioLayout>
</VioGenerator>
</Value>
</Variable>
<Variable>
SuperAB       System        +Visual+      +Supervisor+ 
<Value>
<VioSystem>
<Generator name="SuperAB" ftype="System">

<Alphabet>
<Event name="beta_a"/>
<Event name="alpha_b">
<Controllable/>
</Event>
<Event name="alpha_a">
<Controllable/>
</Event>
<Event name="mue_a"/>
<Event name="lambda_a">
<Controllable/>
</Event>
<Event name="beta_b"/>
<Event name="mue_b"/>
<Event name="lambda_b">
<Controllable/>
</Event>
</Alphabet>

<StateSet>
<State id="1" name="I|I|s1">
<Initial/>
<Marked/>
</State>
<State id="2" name="B|I|s1"/>
<State id="3" name="I|I|s2"/>
<State id="4" name="D|I|s1"/>
<State id="5" name="I|B|s1"/>
<State id="6" name="B|I|s2"/>
<State id="7" name="I|I|s3"/>
<State id="8" name="B|B|s1"/>
<State id="9" name="D|I|s2"/>
<State id="10" name="D|B|s1"/>
<State id="11" name="D|D|s1"/>
<State id="12" name="I|D|s1"/>
<State id="13" name="B|D|s1"/>
<State id="14" name="I|D|s2"/>
<State id="15" name="B|D|s2"/>
<State id="16" name="I|D|s3"/>
<State id="17" name="D|D|s2"/>
<State id="18" name="B|D|s3"/>
<State id="19" name="I|D|s4"/>
<State id="20" name="D|D|s3"/>
<State id="21" name="B|I|s3"/>
<State id="22" name="I|I|s4"/>
<State id="23" name="B|B|s2"/>
<State id="24" name="D|I|s3"/>
<State id="25" name="D|B|s2"/>
<State id="26" name="I|B|s2"/>
<State id="27" name="I|B|s3"/>
<State id="28" name="B|B|s3"/>
<State id="29" name="I|B|s4"/>
<State id="30" name="D|B|s3"/>
<State id="31" name="B|B|s4"/>
<State id="32" name="I|B|s5"/>
<State id="33" name="D|B|s4"/>
<State id="34" name="B|I|s4"/>
<State id="35" name="B|D|s4"/>
<State id="36" name="I|D|s5"/>
<State id="37" name="D|D|s4"/>
<State id="38" name="D|I|s4"/>
<State id="39" name="B|D|s5"/>
<State id="40" name="I|I|s5"/>
<State id="41" name="B|I|s5"/>
<State id="42" name="I|I|s6"/>
<State id="43" name="D|I|s5"/>
<State id="44" name="B|I|s6"/>
<State id="45" name="I|I|s7"/>
<State id="46" name="B|B|s5"/>
<State id="47" name="D|I|s6"/>
<State id="48" name="D|B|s5"/>
<State id="49" name="D|D|s5"/>
<State id="50" name="I|B|s6"/>
<State id="51" name="B|B|s6"/>
<State id="52" name="I|D|s6"/>
<State id="53" name="B|D|s6"/>
<State id="54" name="I|D|s7"/>
<State id="55" name="D|D|s6"/>
<State id="56" name="B|D|s7"/>
<State id="57" name="I|D|s8"/>
<State id="58" name="D|D|s7"/>
<State id="59" name="B|I|s7"/>
<State id="60" name="I|I|s8"/>
<State id="61" name="D|I|s7"/>
<State id="62" name="D|B|s6"/>
<State id="63" name="I|B|s7"/>
<State id="64" name="B|I|s8"/>
<State id="65" name="I|I|s9"/>
<State id="66" name="B|B|s7"/>
<State id="67" name="D|I|s8"/>
<State id="68" name="D|B|s7"/>
<State id="69" name="I|B|s8"/>
<State id="70" name="B|B|s8"/>
<State id="71" name="I|B|s9"/>
<State id="72" name="D|B|s8"/>
<State id="73" name="B|D|s8"/>
<State id="74" name="I|D|s9"/>
<State id="75" name="D|D|s8"/>
<State id="76" name="B|D|s9"/>
<State id="77" name="I|D|s10"/>
<State id="78" name="D|D|s9"/>
<State id="79" name="B|I|s9"/>
<State id="80" name="I|I|s10"/>
<State id="81" name="D|I|s9"/>
<State id="84" name="B|B|s9"/>
<State id="85" name="I|B|s10"/>
<State id="86" name="D|B|s9"/>
</StateSet>

<TransitionRelation>
<Transition x1="1" event="alpha_a" x2="2"/>
<Transition x1="2" event="beta_a" x2="3"/>
<Transition x1="2" event="mue_a" x2="4"/>
<Transition x1="3" event="alpha_b" x2="5"/>
<Transition x1="3" event="alpha_a" x2="6"/>
<Transition x1="4" event="lambda_a" x2="1"/>
<Transition x1="5" event="alpha_a" x2="8"/>
<Transition x1="5" event="beta_b" x2="1"/>
<Transition x1="5" event="mue_b" x2="12"/>
<Transition x1="6" event="beta_a" x2="7"/>
<Transition x1="6" event="alpha_b" x2="8"/>
<Transition x1="6" event="mue_a" x2="9"/>
<Transition x1="7" event="alpha_b" x2="26"/>
<Transition x1="7" event="alpha_a" x2="21"/>
<Transition x1="8" event="beta_a" x2="26"/>
<Transition x1="8" event="mue_a" x2="10"/>
<Transition x1="8" event="beta_b" x2="2"/>
<Transition x1="8" event="mue_b" x2="13"/>
<Transition x1="9" event="alpha_b" x2="10"/>
<Transition x1="9" event="lambda_a" x2="3"/>
<Transition x1="10" event="lambda_a" x2="5"/>
<Transition x1="10" event="beta_b" x2="4"/>
<Transition x1="10" event="mue_b" x2="11"/>
<Transition x1="11" event="lambda_a" x2="12"/>
<Transition x1="11" event="lambda_b" x2="4"/>
<Transition x1="12" event="alpha_a" x2="13"/>
<Transition x1="12" event="lambda_b" x2="1"/>
<Transition x1="13" event="beta_a" x2="14"/>
<Transition x1="13" event="mue_a" x2="11"/>
<Transition x1="13" event="lambda_b" x2="2"/>
<Transition x1="14" event="alpha_a" x2="15"/>
<Transition x1="14" event="lambda_b" x2="3"/>
<Transition x1="15" event="beta_a" x2="16"/>
<Transition x1="15" event="mue_a" x2="17"/>
<Transition x1="15" event="lambda_b" x2="6"/>
<Transition x1="16" event="alpha_a" x2="18"/>
<Transition x1="16" event="lambda_b" x2="7"/>
<Transition x1="17" event="lambda_a" x2="14"/>
<Transition x1="17" event="lambda_b" x2="9"/>
<Transition x1="18" event="beta_a" x2="19"/>
<Transition x1="18" event="mue_a" x2="20"/>
<Transition x1="18" event="lambda_b" x2="21"/>
<Transition x1="19" event="alpha_a" x2="35"/>
<Transition x1="19" event="lambda_b" x2="22"/>
<Transition x1="20" event="lambda_a" x2="16"/>
<Transition x1="20" event="lambda_b" x2="24"/>
<Transition x1="21" event="beta_a" x2="22"/>
<Transition x1="21" event="alpha_b" x2="23"/>
<Transition x1="21" event="mue_a" x2="24"/>
<Transition x1="22" event="alpha_b" x2="27"/>
<Transition x1="22" event="alpha_a" x2="34"/>
<Transition x1="23" event="beta_a" x2="27"/>
<Transition x1="23" event="mue_a" x2="25"/>
<Transition x1="23" event="beta_b" x2="6"/>
<Transition x1="23" event="mue_b" x2="15"/>
<Transition x1="24" event="alpha_b" x2="25"/>
<Transition x1="24" event="lambda_a" x2="7"/>
<Transition x1="25" event="lambda_a" x2="26"/>
<Transition x1="25" event="beta_b" x2="9"/>
<Transition x1="25" event="mue_b" x2="17"/>
<Transition x1="26" event="alpha_a" x2="23"/>
<Transition x1="26" event="beta_b" x2="3"/>
<Transition x1="26" event="mue_b" x2="14"/>
<Transition x1="27" event="alpha_a" x2="28"/>
<Transition x1="27" event="beta_b" x2="7"/>
<Transition x1="27" event="mue_b" x2="16"/>
<Transition x1="28" event="beta_a" x2="29"/>
<Transition x1="28" event="mue_a" x2="30"/>
<Transition x1="28" event="beta_b" x2="21"/>
<Transition x1="28" event="mue_b" x2="18"/>
<Transition x1="29" event="alpha_a" x2="31"/>
<Transition x1="29" event="beta_b" x2="22"/>
<Transition x1="29" event="mue_b" x2="19"/>
<Transition x1="30" event="lambda_a" x2="27"/>
<Transition x1="30" event="beta_b" x2="24"/>
<Transition x1="30" event="mue_b" x2="20"/>
<Transition x1="31" event="beta_a" x2="32"/>
<Transition x1="31" event="mue_a" x2="33"/>
<Transition x1="31" event="beta_b" x2="34"/>
<Transition x1="31" event="mue_b" x2="35"/>
<Transition x1="32" event="alpha_a" x2="46"/>
<Transition x1="32" event="beta_b" x2="40"/>
<Transition x1="32" event="mue_b" x2="36"/>
<Transition x1="33" event="lambda_a" x2="29"/>
<Transition x1="33" event="beta_b" x2="38"/>
<Transition x1="33" event="mue_b" x2="37"/>
<Transition x1="34" event="beta_a" x2="40"/>
<Transition x1="34" event="alpha_b" x2="28"/>
<Transition x1="34" event="mue_a" x2="38"/>
<Transition x1="35" event="beta_a" x2="36"/>
<Transition x1="35" event="mue_a" x2="37"/>
<Transition x1="35" event="lambda_b" x2="34"/>
<Transition x1="36" event="alpha_a" x2="39"/>
<Transition x1="36" event="lambda_b" x2="40"/>
<Transition x1="37" event="lambda_a" x2="19"/>
<Transition x1="37" event="lambda_b" x2="38"/>
<Transition x1="38" event="alpha_b" x2="30"/>
<Transition x1="38" event="lambda_a" x2="22"/>
<Transition x1="39" event="beta_a" x2="52"/>
<Transition x1="39" event="mue_a" x2="49"/>
<Transition x1="39" event="lambda_b" x2="41"/>
<Transition x1="40" event="alpha_b" x2="29"/>
<Transition x1="40" event="alpha_a" x2="41"/>
<Transition x1="41" event="beta_a" x2="42"/>
<Transition x1="41" event="alpha_b" x2="31"/>
<Transition x1="41" event="mue_a" x2="43"/>
<Transition x1="42" event="alpha_b" x2="32"/>
<Transition x1="42" event="alpha_a" x2="44"/>
<Transition x1="43" event="alpha_b" x2="33"/>
<Transition x1="43" event="lambda_a" x2="40"/>
<Transition x1="44" event="beta_a" x2="45"/>
<Transition x1="44" event="alpha_b" x2="46"/>
<Transition x1="44" event="mue_a" x2="47"/>
<Transition x1="45" event="alpha_b" x2="50"/>
<Transition x1="45" event="alpha_a" x2="59"/>
<Transition x1="46" event="beta_a" x2="50"/>
<Transition x1="46" event="mue_a" x2="48"/>
<Transition x1="46" event="beta_b" x2="41"/>
<Transition x1="46" event="mue_b" x2="39"/>
<Transition x1="47" event="alpha_b" x2="48"/>
<Transition x1="47" event="lambda_a" x2="42"/>
<Transition x1="48" event="lambda_a" x2="32"/>
<Transition x1="48" event="beta_b" x2="43"/>
<Transition x1="48" event="mue_b" x2="49"/>
<Transition x1="49" event="lambda_a" x2="36"/>
<Transition x1="49" event="lambda_b" x2="43"/>
<Transition x1="50" event="alpha_a" x2="51"/>
<Transition x1="50" event="beta_b" x2="42"/>
<Transition x1="50" event="mue_b" x2="52"/>
<Transition x1="51" event="beta_a" x2="63"/>
<Transition x1="51" event="mue_a" x2="62"/>
<Transition x1="51" event="beta_b" x2="44"/>
<Transition x1="51" event="mue_b" x2="53"/>
<Transition x1="52" event="alpha_a" x2="53"/>
<Transition x1="52" event="lambda_b" x2="42"/>
<Transition x1="53" event="beta_a" x2="54"/>
<Transition x1="53" event="mue_a" x2="55"/>
<Transition x1="53" event="lambda_b" x2="44"/>
<Transition x1="54" event="alpha_a" x2="56"/>
<Transition x1="54" event="lambda_b" x2="45"/>
<Transition x1="55" event="lambda_a" x2="52"/>
<Transition x1="55" event="lambda_b" x2="47"/>
<Transition x1="56" event="beta_a" x2="57"/>
<Transition x1="56" event="mue_a" x2="58"/>
<Transition x1="56" event="lambda_b" x2="59"/>
<Transition x1="57" event="alpha_a" x2="73"/>
<Transition x1="57" event="lambda_b" x2="60"/>
<Transition x1="58" event="lambda_a" x2="54"/>
<Transition x1="58" event="lambda_b" x2="61"/>
<Transition x1="59" event="beta_a" x2="60"/>
<Transition x1="59" event="alpha_b" x2="51"/>
<Transition x1="59" event="mue_a" x2="61"/>
<Transition x1="60" event="alpha_b" x2="63"/>
<Transition x1="60" event="alpha_a" x2="64"/>
<Transition x1="61" event="alpha_b" x2="62"/>
<Transition x1="61" event="lambda_a" x2="45"/>
<Transition x1="62" event="lambda_a" x2="50"/>
<Transition x1="62" event="beta_b" x2="47"/>
<Transition x1="62" event="mue_b" x2="55"/>
<Transition x1="63" event="alpha_a" x2="66"/>
<Transition x1="63" event="beta_b" x2="45"/>
<Transition x1="63" event="mue_b" x2="54"/>
<Transition x1="64" event="beta_a" x2="65"/>
<Transition x1="64" event="alpha_b" x2="66"/>
<Transition x1="64" event="mue_a" x2="67"/>
<Transition x1="65" event="alpha_b" x2="69"/>
<Transition x1="65" event="alpha_a" x2="79"/>
<Transition x1="66" event="beta_a" x2="69"/>
<Transition x1="66" event="mue_a" x2="68"/>
<Transition x1="66" event="beta_b" x2="59"/>
<Transition x1="66" event="mue_b" x2="56"/>
<Transition x1="67" event="alpha_b" x2="68"/>
<Transition x1="67" event="lambda_a" x2="60"/>
<Transition x1="68" event="lambda_a" x2="63"/>
<Transition x1="68" event="beta_b" x2="61"/>
<Transition x1="68" event="mue_b" x2="58"/>
<Transition x1="69" event="alpha_a" x2="70"/>
<Transition x1="69" event="beta_b" x2="60"/>
<Transition x1="69" event="mue_b" x2="57"/>
<Transition x1="70" event="beta_a" x2="71"/>
<Transition x1="70" event="mue_a" x2="72"/>
<Transition x1="70" event="beta_b" x2="64"/>
<Transition x1="70" event="mue_b" x2="73"/>
<Transition x1="71" event="alpha_a" x2="84"/>
<Transition x1="71" event="beta_b" x2="65"/>
<Transition x1="71" event="mue_b" x2="74"/>
<Transition x1="72" event="lambda_a" x2="69"/>
<Transition x1="72" event="beta_b" x2="67"/>
<Transition x1="72" event="mue_b" x2="75"/>
<Transition x1="73" event="beta_a" x2="74"/>
<Transition x1="73" event="mue_a" x2="75"/>
<Transition x1="73" event="lambda_b" x2="64"/>
<Transition x1="74" event="alpha_a" x2="76"/>
<Transition x1="74" event="lambda_b" x2="65"/>
<Transition x1="75" event="lambda_a" x2="57"/>
<Transition x1="75" event="lambda_b" x2="67"/>
<Transition x1="76" event="beta_a" x2="77"/>
<Transition x1="76" event="mue_a" x2="78"/>
<Transition x1="76" event="lambda_b" x2="79"/>
<Transition x1="77" event="lambda_b" x2="80"/>
<Transition x1="78" event="lambda_a" x2="74"/>
<Transition x1="78" event="lambda_b" x2="81"/>
<Transition x1="79" event="beta_a" x2="80"/>
<Transition x1="79" event="alpha_b" x2="70"/>
<Transition x1="79" event="mue_a" x2="81"/>
<Transition x1="80" event="alpha_b" x2="71"/>
<Transition x1="81" event="alpha_b" x2="72"/>
<Transition x1="81" event="lambda_a" x2="65"/>
<Transition x1="84" event="beta_a" x2="85"/>
<Transition x1="84" event="mue_a" x2="86"/>
<Transition x1="84" event="beta_b" x2="79"/>
<Transition x1="84" event="mue_b" x2="76"/>
<Transition x1="85" event="beta_b" x2="80"/>
<Transition x1="85" event="mue_b" x2="77"/>
<Transition x1="86" event="lambda_a" x2="71"/>
<Transition x1="86" event="beta_b" x2="81"/>
<Transition x1="86" event="mue_b" x2="78"/>
</TransitionRelation>

</Generator>
<VioModels>
<TransitionList>
<Transition x1="1" event="alpha_a" x2="2"/>
<Transition x1="2" event="beta_a" x2="3"/>
<Transition x1="2" event="mue_a" x2="4"/>
<Transition x1="4" event="lambda_a" x2="1"/>
<Transition x1="11" event="lambda_b" x2="4"/>
<Transition x1="21" event="beta_a" x2="22"/>
<Transition x1="35" event="beta_a" x2="36"/>
<Transition x1="35" event="mue_a" x2="37"/>
<Transition x1="44" event="beta_a" x2="45"/>
<Transition x1="45" event="alpha_a" x2="59"/>
<Transition x1="56" event="beta_a" x2="57"/>
<Transition x1="56" event="mue_a" x2="58"/>
<Transition x1="59" event="beta_a" x2="60"/>
<Transition x1="59" event="mue_a" x2="61"/>
<Transition x1="61" event="lambda_a" x2="45"/>
<Transition x1="63" event="alpha_a" x2="66"/>
<Transition x1="79" event="beta_a" x2="80"/>
<Transition x1="79" event="mue_a" x2="81"/>
<Transition x1="3" event="alpha_b" x2="5"/>
<Transition x1="3" event="alpha_a" x2="6"/>
<Transition x1="5" event="alpha_a" x2="8"/>
<Transition x1="5" event="beta_b" x2="1"/>
<Transition x1="5" event="mue_b" x2="12"/>
<Transition x1="6" event="beta_a" x2="7"/>
<Transition x1="6" event="alpha_b" x2="8"/>
<Transition x1="6" event="mue_a" x2="9"/>
<Transition x1="7" event="alpha_b" x2="26"/>
<Transition x1="7" event="alpha_a" x2="21"/>
<Transition x1="8" event="beta_a" x2="26"/>
<Transition x1="8" event="mue_a" x2="10"/>
<Transition x1="8" event="beta_b" x2="2"/>
<Transition x1="8" event="mue_b" x2="13"/>
<Transition x1="9" event="alpha_b" x2="10"/>
<Transition x1="9" event="lambda_a" x2="3"/>
<Transition x1="10" event="lambda_a" x2="5"/>
<Transition x1="10" event="beta_b" x2="4"/>
<Transition x1="10" event="mue_b" x2="11"/>
<Transition x1="11" event="lambda_a" x2="12"/>
<Transition x1="12" event="alpha_a" x2="13"/>
<Transition x1="12" event="lambda_b" x2="1"/>
<Transition x1="13" event="beta_a" x2="14"/>
<Transition x1="13" event="mue_a" x2="11"/>
<Transition x1="13" event="lambda_b" x2="2"/>
<Transition x1="14" event="alpha_a" x2="15"/>
<Transition x1="14" event="lambda_b" x2="3"/>
<Transition x1="15" event="beta_a" x2="16"/>
<Transition x1="15" event="mue_a" x2="17"/>
<Transition x1="15" event="lambda_b" x2="6"/>
<Transition x1="16" event="alpha_a" x2="18"/>
<Transition x1="16" event="lambda_b" x2="7"/>
<Transition x1="17" event="lambda_a" x2="14"/>
<Transition x1="17" event="lambda_b" x2="9"/>
<Transition x1="18" event="beta_a" x2="19"/>
<Transition x1="18" event="mue_a" x2="20"/>
<Transition x1="18" event="lambda_b" x2="21"/>
<Transition x1="19" event="alpha_a" x2="35"/>
<Transition x1="19" event="lambda_b" x2="22"/>
<Transition x1="20" event="lambda_a" x2="16"/>
<Transition x1="20" event="lambda_b" x2="24"/>
<Transition x1="21" event="alpha_b" x2="23"/>
<Transition x1="21" event="mue_a" x2="24"/>
<Transition x1="22" event="alpha_b" x2="27"/>
<Transition x1="22" event="alpha_a" x2="34"/>
<Transition x1="23" event="beta_a" x2="27"/>
<Transition x1="23" event="mue_a" x2="25"/>
<Transition x1="23" event="beta_b" x2="6"/>
<Transition x1="23" event="mue_b" x2="15"/>
<Transition x1="24" event="alpha_b" x2="25"/>
<Transition x1="24" event="lambda_a" x2="7"/>
<Transition x1="25" event="lambda_a" x2="26"/>
<Transition x1="25" event="beta_b" x2="9"/>
<Transition x1="25" event="mue_b" x2="17"/>
<Transition x1="26" event="alpha_a" x2="23"/>
<Transition x1="26" event="beta_b" x2="3"/>
<Transition x1="26" event="mue_b" x2="14"/>
<Transition x1="27" event="alpha_a" x2="28"/>
<Transition x1="27" event="beta_b" x2="7"/>
<Transition x1="27" event="mue_b" x2="16"/>
<Transition x1="28" event="beta_a" x2="29"/>
<Transition x1="28" event="mue_a" x2="30"/>
<Transition x1="28" event="beta_b" x2="21"/>
<Transition x1="28" event="mue_b" x2="18"/>
<Transition x1="29" event="alpha_a" x2="31"/>
<Transition x1="29" event="beta_b" x2="22"/>
<Transition x1="29" event="mue_b" x2="19"/>
<Transition x1="30" event="lambda_a" x2="27"/>
<Transition x1="30" event="beta_b" x2="24"/>
<Transition x1="30" event="mue_b" x2="20"/>
<Transition x1="31" event="beta_a" x2="32"/>
<Transition x1="31" event="mue_a" x2="33"/>
<Transition x1="31" event="beta_b" x2="34"/>
<Transition x1="31" event="mue_b" x2="35"/>
<Transition x1="32" event="alpha_a" x2="46"/>
<Transition x1="32" event="beta_b" x2="40"/>
<Transition x1="32" event="mue_b" x2="36"/>
<Transition x1="33" event="lambda_a" x2="29"/>
<Transition x1="33" event="beta_b" x2="38"/>
<Transition x1="33" event="mue_b" x2="37"/>
<Transition x1="34" event="beta_a" x2="40"/>
<Transition x1="34" event="alpha_b" x2="28"/>
<Transition x1="34" event="mue_a" x2="38"/>
<Transition x1="35" event="lambda_b" x2="34"/>
<Transition x1="36" event="alpha_a" x2="39"/>
<Transition x1="36" event="lambda_b" x2="40"/>
<Transition x1="37" event="lambda_a" x2="19"/>
<Transition x1="37" event="lambda_b" x2="38"/>
<Transition x1="38" event="alpha_b" x2="30"/>
<Transition x1="38" event="lambda_a" x2="22"/>
<Transition x1="39" event="beta_a" x2="52"/>
<Transition x1="39" event="mue_a" x2="49"/>
<Transition x1="39" event="lambda_b" x2="41"/>
<Transition x1="40" event="alpha_b" x2="29"/>
<Transition x1="40" event="alpha_a" x2="41"/>
<Transition x1="41" event="beta_a" x2="42"/>
<Transition x1="41" event="alpha_b" x2="31"/>
<Transition x1="41" event="mue_a" x2="43"/>
<Transition x1="42" event="alpha_b" x2="32"/>
<Transition x1="42" event="alpha_a" x2="44"/>
<Transition x1="43" event="alpha_b" x2="33"/>
<Transition x1="43" event="lambda_a" x2="40"/>
<Transition x1="44" event="alpha_b" x2="46"/>
<Transition x1="44" event="mue_a" x2="47"/>
<Transition x1="45" event="alpha_b" x2="50"/>
<Transition x1="46" event="beta_a" x2="50"/>
<Transition x1="46" event="mue_a" x2="48"/>
<Transition x1="46" event="beta_b" x2="41"/>
<Transition x1="46" event="mue_b" x2="39"/>
<Transition x1="47" event="alpha_b" x2="48"/>
<Transition x1="47" event="lambda_a" x2="42"/>
<Transition x1="48" event="lambda_a" x2="32"/>
<Transition x1="48" event="beta_b" x2="43"/>
<Transition x1="48" event="mue_b" x2="49"/>
<Transition x1="49" event="lambda_a" x2="36"/>
<Transition x1="49" event="lambda_b" x2="43"/>
<Transition x1="50" event="alpha_a" x2="51"/>
<Transition x1="50" event="beta_b" x2="42"/>
<Transition x1="50" event="mue_b" x2="52"/>
<Transition x1="51" event="beta_a" x2="63"/>
<Transition x1="51" event="mue_a" x2="62"/>
<Transition x1="51" event="beta_b" x2="44"/>
<Transition x1="51" event="mue_b" x2="53"/>
<Transition x1="52" event="alpha_a" x2="53"/>
<Transition x1="52" event="lambda_b" x2="42"/>
<Transition x1="53" event="beta_a" x2="54"/>
<Transition x1="53" event="mue_a" x2="55"/>
<Transition x1="53" event="lambda_b" x2="44"/>
<Transition x1="54" event="alpha_a" x2="56"/>
<Transition x1="54" event="lambda_b" x2="45"/>
<Transition x1="55" event="lambda_a" x2="52"/>
<Transition x1="55" event="lambda_b" x2="47"/>
<Transition x1="56" event="lambda_b" x2="59"/>
<Transition x1="57" event="alpha_a" x2="73"/>
<Transition x1="57" event="lambda_b" x2="60"/>
<Transition x1="58" event="lambda_a" x2="54"/>
<Transition x1="58" event="lambda_b" x2="61"/>
<Transition x1="59" event="alpha_b" x2="51"/>
<Transition x1="60" event="alpha_b" x2="63"/>
<Transition x1="60" event="alpha_a" x2="64"/>
<Transition x1="61" event="alpha_b" x2="62"/>
<Transition x1="62" event="lambda_a" x2="50"/>
<Transition x1="62" event="beta_b" x2="47"/>
<Transition x1="62" event="mue_b" x2="55"/>
<Transition x1="63" event="beta_b" x2="45"/>
<Transition x1="63" event="mue_b" x2="54"/>
<Transition x1="64" event="beta_a" x2="65"/>
<Transition x1="64" event="alpha_b" x2="66"/>
<Transition x1="64" event="mue_a" x2="67"/>
<Transition x1="65" event="alpha_b" x2="69"/>
<Transition x1="65" event="alpha_a" x2="79"/>
<Transition x1="66" event="beta_a" x2="69"/>
<Transition x1="66" event="mue_a" x2="68"/>
<Transition x1="66" event="beta_b" x2="59"/>
<Transition x1="66" event="mue_b" x2="56"/>
<Transition x1="67" event="alpha_b" x2="68"/>
<Transition x1="67" event="lambda_a" x2="60"/>
<Transition x1="68" event="lambda_a" x2="63"/>
<Transition x1="68" event="beta_b" x2="61"/>
<Transition x1="68" event="mue_b" x2="58"/>
<Transition x1="69" event="alpha_a" x2="70"/>
<Transition x1="69" event="beta_b" x2="60"/>
<Transition x1="69" event="mue_b" x2="57"/>
<Transition x1="70" event="beta_a" x2="71"/>
<Transition x1="70" event="mue_a" x2="72"/>
<Transition x1="70" event="beta_b" x2="64"/>
<Transition x1="70" event="mue_b" x2="73"/>
<Transition x1="71" event="alpha_a" x2="84"/>
<Transition x1="71" event="beta_b" x2="65"/>
<Transition x1="71" event="mue_b" x2="74"/>
<Transition x1="72" event="lambda_a" x2="69"/>
<Transition x1="72" event="beta_b" x2="67"/>
<Transition x1="72" event="mue_b" x2="75"/>
<Transition x1="73" event="beta_a" x2="74"/>
<Transition x1="73" event="mue_a" x2="75"/>
<Transition x1="73" event="lambda_b" x2="64"/>
<Transition x1="74" event="alpha_a" x2="76"/>
<Transition x1="74" event="lambda_b" x2="65"/>
<Transition x1="75" event="lambda_a" x2="57"/>
<Transition x1="75" event="lambda_b" x2="67"/>
<Transition x1="76" event="beta_a" x2="77"/>
<Transition x1="76" event="mue_a" x2="78"/>
<Transition x1="76" event="lambda_b" x2="79"/>
<Transition x1="77" event="lambda_b" x2="80"/>
<Transition x1="78" event="lambda_a" x2="74"/>
<Transition x1="78" event="lambda_b" x2="81"/>
<Transition x1="79" event="alpha_b" x2="70"/>
<Transition x1="80" event="alpha_b" x2="71"/>
<Transition x1="81" event="alpha_b" x2="72"/>
<Transition x1="81" event="lambda_a" x2="65"/>
<Transition x1="84" event="beta_a" x2="85"/>
<Transition x1="84" event="mue_a" x2="86"/>
<Transition x1="84" event="beta_b" x2="79"/>
<Transition x1="84" event="mue_b" x2="76"/>
<Transition x1="85" event="beta_b" x2="80"/>
<Transition x1="85" event="mue_b" x2="77"/>
<Transition x1="86" event="lambda_a" x2="71"/>
<Transition x1="86" event="beta_b" x2="81"/>
<Transition x1="86" event="mue_b" x2="78"/>
</TransitionList>
<StateList>
<State id="1"/>
<State id="2"/>
<State id="3"/>
<State id="4"/>
<State id="5"/>
<State id="6"/>
<State id="7"/>
<State id="8"/>
<State id="9"/>
<State id="10"/>
<State id="11"/>
<State id="12"/>
<State id="13"/>
<State id="14"/>
<State id="15"/>
<State id="16"/>
<State id="17"/>
<State id="18"/>
<State id="19"/>
<State id="20"/>
<State id="21"/>
<State id="22"/>
<State id="23"/>
<State id="24"/>
<State id="25"/>
<State id="26"/>
<State id="27"/>
<State id="28"/>
<State id="29"/>
<State id="30"/>
<State id="31"/>
<State id="32"/>
<State id="33"/>
<State id="34"/>
<State id="35"/>
<State id="36"/>
<State id="37"/>
<State id="38"/>
<State id="39"/>
<State id="40"/>
<State id="41"/>
<State id="42"/>
<State id="43"/>
<State id="44"/>
<State id="45"/>
<State id="46"/>
<State id="47"/>
<State id="48"/>
<State id="49"/>
<State id="50"/>
<State id="51"/>
<State id="52"/>
<State id="53"/>
<State id="54"/>
<State id="55"/>
<State id="56"/>
<State id="57"/>
<State id="58"/>
<State id="59"/>
<State id="60"/>
<State id="61"/>
<State id="62"/>
<State id="63"/>
<State id="64"/>
<State id="65"/>
<State id="66"/>
<State id="67"/>
<State id="68"/>
<State id="69"/>
<State id="70"/>
<State id="71"/>
<State id="72"/>
<State id="73"/>
<State id="74"/>
<State id="75"/>
<State id="76"/>
<State id="77"/>
<State id="78"/>
<State id="79"/>
<State id="80"/>
<State id="81"/>
<State id="84"/>
<State id="85"/>
<State id="86"/>
</StateList>
<EventList>
<Event name="beta_a"/>
<Event name="alpha_b"/>
<Event name="alpha_a"/>
<Event name="mue_a"/>
<Event name="lambda_a"/>
<Event name="beta_b"/>
<Event name="mue_b"/>
<Event name="lambda_b"/>
</EventList>
<GraphData>
<States>
<State>
1             
<Item>
<Position>
83.291000      234.660000    
</Position>
<BasePoints>
0              0              30.902000      30.902000      -82.791000     0             
-30.909003     0             
</BasePoints>
</Item>
</State>
<State>
2             
<Item>
<Position>
245.100000     333.270000    
</Position>
<BasePoints>
0              0              34.034000      34.034000      -60            0             
-34.009724     0             
</BasePoints>
</Item>
</State>
<State>
3             
<Item>
<Position>
400.660000     465.220000    
</Position>
<BasePoints>
0              0              30.902000      30.902000      -60            0             
-30.848751     0             
</BasePoints>
</Item>
</State>
<State>
4             
<Item>
<Position>
12347          3630.500000   
</Position>
<BasePoints>
0              0              34.660500      34.660500      -60            0             
-34.712162     0             
</BasePoints>
</Item>
</State>
<State>
5             
<Item>
<Position>
562.470000     192.990000    
</Position>
<BasePoints>
0              0              34.034000      34.034000      -60            0             
-34.009724     0             
</BasePoints>
</Item>
</State>
<State>
6             
<Item>
<Position>
1403.700000    433.270000    
</Position>
<BasePoints>
0              0              34.034000      34.034000      -60            0             
-34.009724     0             
</BasePoints>
</Item>
</State>
<State>
7             
<Item>
<Position>
1571.800000    758.270000    
</Position>
<BasePoints>
0              0              30.902000      30.902000      -60            0             
-30.848751     0             
</BasePoints>
</Item>
</State>
<State>
8             
<Item>
<Position>
1571.800000    256.880000    
</Position>
<BasePoints>
0              0              37.166000      37.166000      -60            0             
-37.170696     0             
</BasePoints>
</Item>
</State>
<State>
9             
<Item>
<Position>
11827          874.940000    
</Position>
<BasePoints>
0              0              34.660500      34.660500      -60            0             
-34.712162     0             
</BasePoints>
</Item>
</State>
<State>
10            
<Item>
<Position>
11999          226.330000    
</Position>
<BasePoints>
0              0              37.792500      37.792500      -60            0             
-37.756062     0             
</BasePoints>
</Item>
</State>
<State>
11            
<Item>
<Position>
12166          155.490000    
</Position>
<BasePoints>
0              0              38.419000      38.419000      -60            0             
-38.458500     0             
</BasePoints>
</Item>
</State>
<State>
12            
<Item>
<Position>
721.790000     34.660000     
</Position>
<BasePoints>
0              0              34.660500      34.660500      -60            0             
-34.712162     0             
</BasePoints>
</Item>
</State>
<State>
13            
<Item>
<Position>
891.120000     177.720000    
</Position>
<BasePoints>
0              0              37.792500      37.792500      -60            0             
-37.756062     0             
</BasePoints>
</Item>
</State>
<State>
14            
<Item>
<Position>
1054.200000    580.490000    
</Position>
<BasePoints>
0              0              34.660500      34.660500      -60            0             
-34.712162     0             
</BasePoints>
</Item>
</State>
<State>
15            
<Item>
<Position>
1223.500000    642.990000    
</Position>
<BasePoints>
0              0              37.792500      37.792500      -60            0             
-37.756062     0             
</BasePoints>
</Item>
</State>
<State>
16            
<Item>
<Position>
11290          890.220000    
</Position>
<BasePoints>
0              0              34.660500      34.660500      -60            0             
-34.712162     0             
</BasePoints>
</Item>
</State>
<State>
17            
<Item>
<Position>
11643          2227.700000   
</Position>
<BasePoints>
0              0              38.419000      38.419000      -60            0             
-38.458500     0             
</BasePoints>
</Item>
</State>
<State>
18            
<Item>
<Position>
2390.900000    980.490000    
</Position>
<BasePoints>
0              0              37.792500      37.792500      -60            0             
-37.756062     0             
</BasePoints>
</Item>
</State>
<State>
19            
<Item>
<Position>
2553.900000    1249.900000   
</Position>
<BasePoints>
0              0              34.660500      34.660500      -60            0             
-34.712162     0             
</BasePoints>
</Item>
</State>
<State>
20            
<Item>
<Position>
11108          1061          
</Position>
<BasePoints>
0              0              38.419000      38.419000      -60            0             
-38.458500     0             
</BasePoints>
</Item>
</State>
<State>
21            
<Item>
<Position>
1739.800000    1058.300000   
</Position>
<BasePoints>
0              0              34.034000      34.034000      -60            0             
-34.009724     0             
</BasePoints>
</Item>
</State>
<State>
22            
<Item>
<Position>
1895.400000    1138.800000   
</Position>
<BasePoints>
0              0              30.902000      30.902000      -60            0             
-30.848751     0             
</BasePoints>
</Item>
</State>
<State>
23            
<Item>
<Position>
11827          636.050000    
</Position>
<BasePoints>
0              0              37.166000      37.166000      -60            0             
-37.170696     0             
</BasePoints>
</Item>
</State>
<State>
24            
<Item>
<Position>
11290          1148.500000   
</Position>
<BasePoints>
0              0              34.660500      34.660500      -60            0             
-34.712162     0             
</BasePoints>
</Item>
</State>
<State>
25            
<Item>
<Position>
11459          874.940000    
</Position>
<BasePoints>
0              0              37.792500      37.792500      -60            0             
-37.756062     0             
</BasePoints>
</Item>
</State>
<State>
26            
<Item>
<Position>
11643          586.050000    
</Position>
<BasePoints>
0              0              34.034000      34.034000      -60            0             
-34.009724     0             
</BasePoints>
</Item>
</State>
<State>
27            
<Item>
<Position>
2057.200000    911.050000    
</Position>
<BasePoints>
0              0              34.034000      34.034000      -60            0             
-34.009724     0             
</BasePoints>
</Item>
</State>
<State>
28            
<Item>
<Position>
2225.300000    1470.800000   
</Position>
<BasePoints>
0              0              37.166000      37.166000      -60            0             
-37.170696     0             
</BasePoints>
</Item>
</State>
<State>
29            
<Item>
<Position>
3220.800000    1273.500000   
</Position>
<BasePoints>
0              0              34.034000      34.034000      -60            0             
-34.009724     0             
</BasePoints>
</Item>
</State>
<State>
30            
<Item>
<Position>
10941          1148.500000   
</Position>
<BasePoints>
0              0              37.792500      37.792500      -60            0             
-37.756062     0             
</BasePoints>
</Item>
</State>
<State>
31            
<Item>
<Position>
3388.900000    1455.500000   
</Position>
<BasePoints>
0              0              37.166000      37.166000      -60            0             
-37.170696     0             
</BasePoints>
</Item>
</State>
<State>
32            
<Item>
<Position>
3550.700000    1912.400000   
</Position>
<BasePoints>
0              0              34.034000      34.034000      -60            0             
-34.009724     0             
</BasePoints>
</Item>
</State>
<State>
33            
<Item>
<Position>
10424          1305.500000   
</Position>
<BasePoints>
0              0              37.792500      37.792500      -60            0             
-37.756062     0             
</BasePoints>
</Item>
</State>
<State>
34            
<Item>
<Position>
2903.400000    1606.900000   
</Position>
<BasePoints>
0              0              34.034000      34.034000      -60            0             
-34.009724     0             
</BasePoints>
</Item>
</State>
<State>
35            
<Item>
<Position>
2723.300000    1440.200000   
</Position>
<BasePoints>
0              0              37.792500      37.792500      -60            0             
-37.756062     0             
</BasePoints>
</Item>
</State>
<State>
36            
<Item>
<Position>
3710           2433.300000   
</Position>
<BasePoints>
0              0              34.660500      34.660500      -60            0             
-34.712162     0             
</BasePoints>
</Item>
</State>
<State>
37            
<Item>
<Position>
10591          1222.200000   
</Position>
<BasePoints>
0              0              38.419000      38.419000      -60            0             
-38.458500     0             
</BasePoints>
</Item>
</State>
<State>
38            
<Item>
<Position>
10772          1222.200000   
</Position>
<BasePoints>
0              0              34.660500      34.660500      -60            0             
-34.712162     0             
</BasePoints>
</Item>
</State>
<State>
39            
<Item>
<Position>
3879.400000    2433.300000   
</Position>
<BasePoints>
0              0              37.792500      37.792500      -60            0             
-37.756062     0             
</BasePoints>
</Item>
</State>
<State>
40            
<Item>
<Position>
3059           1645.800000   
</Position>
<BasePoints>
0              0              30.902000      30.902000      -60            0             
-30.848751     0             
</BasePoints>
</Item>
</State>
<State>
41            
<Item>
<Position>
4059.500000    1686          
</Position>
<BasePoints>
0              0              34.034000      34.034000      -60            0             
-34.009724     0             
</BasePoints>
</Item>
</State>
<State>
42            
<Item>
<Position>
4215.100000    2758.300000   
</Position>
<BasePoints>
0              0              30.902000      30.902000      -60            0             
-30.848751     0             
</BasePoints>
</Item>
</State>
<State>
43            
<Item>
<Position>
10254          1434.700000   
</Position>
<BasePoints>
0              0              34.660500      34.660500      -60            0             
-34.712162     0             
</BasePoints>
</Item>
</State>
<State>
44            
<Item>
<Position>
4376.900000    2536          
</Position>
<BasePoints>
0              0              34.034000      34.034000      -60            0             
-34.009724     0             
</BasePoints>
</Item>
</State>
<State>
45            
<Item>
<Position>
4545           2501.300000   
</Position>
<BasePoints>
0              0              30.902000      30.902000      -60            0             
-30.848751     0             
</BasePoints>
</Item>
</State>
<State>
46            
<Item>
<Position>
4545           1727.700000   
</Position>
<BasePoints>
0              0              37.166000      37.166000      -60            0             
-37.170696     0             
</BasePoints>
</Item>
</State>
<State>
47            
<Item>
<Position>
9736.800000    2963.800000   
</Position>
<BasePoints>
0              0              34.660500      34.660500      -60            0             
-34.712162     0             
</BasePoints>
</Item>
</State>
<State>
48            
<Item>
<Position>
9906.200000    2963.800000   
</Position>
<BasePoints>
0              0              37.792500      37.792500      -60            0             
-37.756062     0             
</BasePoints>
</Item>
</State>
<State>
49            
<Item>
<Position>
10073          3023.500000   
</Position>
<BasePoints>
0              0              38.419000      38.419000      -60            0             
-38.458500     0             
</BasePoints>
</Item>
</State>
<State>
50            
<Item>
<Position>
4713           2797.200000   
</Position>
<BasePoints>
0              0              34.034000      34.034000      -60            0             
-34.009724     0             
</BasePoints>
</Item>
</State>
<State>
51            
<Item>
<Position>
6422.900000    2740.200000   
</Position>
<BasePoints>
0              0              37.166000      37.166000      -60            0             
-37.170696     0             
</BasePoints>
</Item>
</State>
<State>
52            
<Item>
<Position>
4872.400000    2723.500000   
</Position>
<BasePoints>
0              0              34.660500      34.660500      -60            0             
-34.712162     0             
</BasePoints>
</Item>
</State>
<State>
53            
<Item>
<Position>
5041.700000    2026.300000   
</Position>
<BasePoints>
0              0              37.792500      37.792500      -60            0             
-37.756062     0             
</BasePoints>
</Item>
</State>
<State>
54            
<Item>
<Position>
5204.800000    1949.900000   
</Position>
<BasePoints>
0              0              34.660500      34.660500      -60            0             
-34.712162     0             
</BasePoints>
</Item>
</State>
<State>
55            
<Item>
<Position>
9555.400000    2849.900000   
</Position>
<BasePoints>
0              0              38.419000      38.419000      -60            0             
-38.458500     0             
</BasePoints>
</Item>
</State>
<State>
56            
<Item>
<Position>
5374.100000    1916.600000   
</Position>
<BasePoints>
0              0              37.792500      37.792500      -60            0             
-37.756062     0             
</BasePoints>
</Item>
</State>
<State>
57            
<Item>
<Position>
5537.200000    1916.600000   
</Position>
<BasePoints>
0              0              34.660500      34.660500      -60            0             
-34.712162     0             
</BasePoints>
</Item>
</State>
<State>
58            
<Item>
<Position>
9037.800000    1931.900000   
</Position>
<BasePoints>
0              0              38.419000      38.419000      -60            0             
-38.458500     0             
</BasePoints>
</Item>
</State>
<State>
59            
<Item>
<Position>
6243.400000    2586          
</Position>
<BasePoints>
0              0              34.034000      34.034000      -60            0             
-34.009724     0             
</BasePoints>
</Item>
</State>
<State>
60            
<Item>
<Position>
5711.100000    2216.600000   
</Position>
<BasePoints>
0              0              30.902000      30.902000      -60            0             
-30.848751     0             
</BasePoints>
</Item>
</State>
<State>
61            
<Item>
<Position>
9219.300000    2679.100000   
</Position>
<BasePoints>
0              0              34.660500      34.660500      -60            0             
-34.712162     0             
</BasePoints>
</Item>
</State>
<State>
62            
<Item>
<Position>
9388.600000    2859.700000   
</Position>
<BasePoints>
0              0              37.792500      37.792500      -60            0             
-37.756062     0             
</BasePoints>
</Item>
</State>
<State>
63            
<Item>
<Position>
5884.300000    2449.900000   
</Position>
<BasePoints>
0              0              34.034000      34.034000      -60            0             
-34.009724     0             
</BasePoints>
</Item>
</State>
<State>
64            
<Item>
<Position>
6786.400000    2226.300000   
</Position>
<BasePoints>
0              0              34.034000      34.034000      -60            0             
-34.009724     0             
</BasePoints>
</Item>
</State>
<State>
65            
<Item>
<Position>
6959.700000    2279.100000   
</Position>
<BasePoints>
0              0              30.902000      30.902000      -60            0             
-30.848751     0             
</BasePoints>
</Item>
</State>
<State>
66            
<Item>
<Position>
6063.900000    2205.500000   
</Position>
<BasePoints>
0              0              37.166000      37.166000      -60            0             
-37.170696     0             
</BasePoints>
</Item>
</State>
<State>
67            
<Item>
<Position>
8701.700000    1958.300000   
</Position>
<BasePoints>
0              0              34.660500      34.660500      -60            0             
-34.712162     0             
</BasePoints>
</Item>
</State>
<State>
68            
<Item>
<Position>
8871           2679.100000   
</Position>
<BasePoints>
0              0              37.792500      37.792500      -60            0             
-37.756062     0             
</BasePoints>
</Item>
</State>
<State>
69            
<Item>
<Position>
6243.400000    2104.100000   
</Position>
<BasePoints>
0              0              34.034000      34.034000      -60            0             
-34.009724     0             
</BasePoints>
</Item>
</State>
<State>
70            
<Item>
<Position>
6422.900000    2065.200000   
</Position>
<BasePoints>
0              0              37.166000      37.166000      -60            0             
-37.170696     0             
</BasePoints>
</Item>
</State>
<State>
71            
<Item>
<Position>
7488.200000    2227.700000   
</Position>
<BasePoints>
0              0              34.034000      34.034000      -60            0             
-34.009724     0             
</BasePoints>
</Item>
</State>
<State>
72            
<Item>
<Position>
8353.400000    1916.600000   
</Position>
<BasePoints>
0              0              37.792500      37.792500      -60            0             
-37.756062     0             
</BasePoints>
</Item>
</State>
<State>
73            
<Item>
<Position>
6606.200000    2266.600000   
</Position>
<BasePoints>
0              0              37.792500      37.792500      -60            0             
-37.756062     0             
</BasePoints>
</Item>
</State>
<State>
74            
<Item>
<Position>
8184.100000    2508.300000   
</Position>
<BasePoints>
0              0              34.660500      34.660500      -60            0             
-34.712162     0             
</BasePoints>
</Item>
</State>
<State>
75            
<Item>
<Position>
8520.300000    1877.700000   
</Position>
<BasePoints>
0              0              38.419000      38.419000      -60            0             
-38.458500     0             
</BasePoints>
</Item>
</State>
<State>
76            
<Item>
<Position>
7834           2466.600000   
</Position>
<BasePoints>
0              0              37.792500      37.792500      -60            0             
-37.756062     0             
</BasePoints>
</Item>
</State>
<State>
77            
<Item>
<Position>
8002.100000    2427.700000   
</Position>
<BasePoints>
0              0              39.045000      39.045000      -60            0             
-39.043865     0             
</BasePoints>
</Item>
</State>
<State>
78            
<Item>
<Position>
8002.100000    2272.200000   
</Position>
<BasePoints>
0              0              38.419000      38.419000      -60            0             
-38.458500     0             
</BasePoints>
</Item>
</State>
<State>
79            
<Item>
<Position>
7132.900000    2299.900000   
</Position>
<BasePoints>
0              0              34.034000      34.034000      -60            0             
-34.009724     0             
</BasePoints>
</Item>
</State>
<State>
80            
<Item>
<Position>
7310.600000    2397.200000   
</Position>
<BasePoints>
0              0              35.287000      35.287000      -60            0             
-35.297527     0             
</BasePoints>
</Item>
</State>
<State>
81            
<Item>
<Position>
8184.100000    2074.900000   
</Position>
<BasePoints>
0              0              34.660500      34.660500      -60            0             
-34.712162     0             
</BasePoints>
</Item>
</State>
<State>
84            
<Item>
<Position>
7667.800000    2330.500000   
</Position>
<BasePoints>
0              0              37.166000      37.166000      -60            0             
-37.170696     0             
</BasePoints>
</Item>
</State>
<State>
85            
<Item>
<Position>
7834           2365.200000   
</Position>
<BasePoints>
0              0              38.419000      38.419000      -60            0             
-38.458500     0             
</BasePoints>
</Item>
</State>
<State>
86            
<Item>
<Position>
7834           2197.200000   
</Position>
<BasePoints>
0              0              37.792500      37.792500      -60            0             
-37.756062     0             
</BasePoints>
</Item>
</State>
</States>
<TransRel>
<Trans>
1              alpha_a       2              +Free+       
<Item>
<Position>
83.291000      234.660000    
</Position>
<BasePoints>
79.339000      26.380000      0              0              26.623591      15.654541     
51.689000      31.190000      89.649000      54.730000      132.625808     81.096017     
161.809000     98.610000     
</BasePoints>
</Item>
</Trans>
<Trans>
2              beta_a        3              +Free+       
<Item>
<Position>
245.100000     333.270000    
</Position>
<BasePoints>
79.350000      41.940000      0              0              26.385477      21.598029     
52.020000      43.720000      91.380000      77.720000      131.778462     112.202712    
155.560000     131.950000    
</BasePoints>
</Item>
</Trans>
<Trans>
2              mue_a         4              +Free+       
<Item>
<Position>
245.100000     333.270000    
</Position>
<BasePoints>
5910.100000    3320.830000    0              0              2.004174       33.972709     
8.740000       387.880000     67.160000      3329.130000    154.170000     3329.130000   
154.170000     3329.130000    154.170000     3329.130000    11921.900000   3329.130000   
11966.900000   3329.130000    12016.900000   3319.330000    12068.386429   3306.326541   
12101.900000   3297.230000   
</BasePoints>
</Item>
</Trans>
<Trans>
3              alpha_b       5              +Free+       
<Item>
<Position>
400.660000     465.220000    
</Position>
<BasePoints>
79.340000      -178.770000    0              0              16.403871      -26.244195    
39.960000      -67.320000     87.040000      -149.130000    127.780000     -218.060000   
130.080000     -221.960000    132.490000     -226.010000    143.524817     -243.554427   
161.810000     -272.230000   
</BasePoints>
</Item>
</Trans>
<Trans>
3              alpha_a       6              +Free+       
<Item>
<Position>
400.660000     465.220000    
</Position>
<BasePoints>
490.460000     -40.280000     0              0              29.575915      -9.176677     
61.330000      -18.680000     113.960000     -31.950000     160.430000     -31.950000    
160.430000     -31.950000     160.430000     -31.950000     824.240000     -31.950000    
867.840000     -31.950000     917.440000     -31.950000     969.010667     -31.950000    
1003.040000    -31.950000    
</BasePoints>
</Item>
</Trans>
<Trans>
4              lambda_a      1              +Free+       
<Item>
<Position>
12347          3630.500000   
</Position>
<BasePoints>
-6283.100000   79.200000      0              0              -26.867804     21.991795     
-60            48.000000      -120           87.500000      -180           87.500000     
-12103.290000  87.500000      -12103.290000  87.500000      -12103.290000  87.500000     
-12193.500000  87.500000      -12253.630000  -2934.480000   -12262.222742  -3364.955871  
-12263.709000  -3395.840000  
</BasePoints>
</Item>
</Trans>
<Trans>
5              beta_b        1              +Free+       
<Item>
<Position>
562.470000     192.990000    
</Position>
<BasePoints>
-238.020000    11.060000      0              0              -33.898407     2.846280      
-117.550000    10.160000      -336.650000    29.330000      -448.411879    39.058012     
-479.179000    41.670000     
</BasePoints>
</Item>
</Trans>
<Trans>
5              alpha_a       8              +Free+       
<Item>
<Position>
562.470000     192.990000    
</Position>
<BasePoints>
491.730000     52.780000      0              0              33.129414      8.032572      
102.150000     24.740000      268.580000     61.110000      410.370000     61.110000     
410.370000     61.110000      410.370000     61.110000      842.630000     61.110000     
880.630000     61.110000      923.630000     61.860000      972.185938     62.973640     
1009.330000    63.890000     
</BasePoints>
</Item>
</Trans>
<Trans>
5              mue_b         12             +Free+       
<Item>
<Position>
562.470000     192.990000    
</Position>
<BasePoints>
79.350000      -132.523000    0              0              15.110376      -30.496381    
25.460000      -51.090000     40.570000      -76.950000     59.040000      -95.830000    
68.090000      -105.088000    92.670000      -120.633000    128.964146     -141.576669   
159.320000     -158.330000   
</BasePoints>
</Item>
</Trans>
<Trans>
6              beta_a        7              +Free+       
<Item>
<Position>
1403.700000    433.270000    
</Position>
<BasePoints>
82.500000      106.070000     0              0              16.470423      29.755903     
46.400000      88.430000      112.100000     217.610000     153.327943     297.800867    
168.100000     325           
</BasePoints>
</Item>
</Trans>
<Trans>
6              alpha_b       8              +Free+       
<Item>
<Position>
1403.700000    433.270000    
</Position>
<BasePoints>
82.500000      -105.550000    0              0              26.525828      -21.299258    
48.900000      -40.690000     80.700000      -69.540000     105.900000     -97.220000    
116.300000     -108.610000    126.700000     -121.630000    145.705467     -146.663176   
168.100000     -176.390000   
</BasePoints>
</Item>
</Trans>
<Trans>
6              mue_a         9              +Free+       
<Item>
<Position>
1403.700000    433.270000    
</Position>
<BasePoints>
5110.600000    9.720000       0              0              33.468846      6.026384      
66.800000      11.760000      120.200000     19.450000      166.700000     19.450000     
166.700000     19.450000      166.700000     19.450000      3390.100000    19.450000     
3499.600000    19.450000      3527           18.060000      3636.600000    18.060000     
3636.600000    18.060000      3636.600000    18.060000      9798.300000    18.060000     
10015.300000   18.060000      10155.300000   -72.980000     10278.300000   105.560000    
10300.300000   137.900000     10289.300000   153.600000     10303.300000   190.280000    
10331.300000   265.020000     10373.300000   348.290000     10406.650357   411.208091    
10423.300000   441.670000    
</BasePoints>
</Item>
</Trans>
<Trans>
7              alpha_a       21             +Free+       
<Item>
<Position>
1571.800000    758.270000    
</Position>
<BasePoints>
85.600000      105.980000     0              0              15.952972      26.541758     
44.600000      78.510000      108.000000     193.580000     150.913187     270.602711    
168            300.030000    
</BasePoints>
</Item>
</Trans>
<Trans>
7              alpha_b       26             +Free+       
<Item>
<Position>
1571.800000    758.270000    
</Position>
<BasePoints>
4942.500000    -87.500000     0              0              24.252562      -19.122596    
54.800000      -42.590000     111.300000     -79.170000     166.600000     -79.170000    
166.600000     -79.170000     166.600000     -79.170000     9284.200000    -79.170000    
9439.200000    -79.170000     9473.200000    -131.940000    9627.200000    -131.940000   
9627.200000    -131.940000    9627.200000    -131.940000    9888.200000    -131.940000   
9935.200000    -131.940000    9988.200000    -144.950000    10038.962354   -161.218046   
10071.200000   -172.220000   
</BasePoints>
</Item>
</Trans>
<Trans>
8              beta_b        2              +Free+       
<Item>
<Position>
1571.800000    256.880000    
</Position>
<BasePoints>
-680.680000    42.690000      0              0              -36.850936     5.182779      
-64            8.970000       -101.200000    13.790000      -134.100000    16.670000     
-576.360000    55.490000      -1113.410000   71.180000      -1292.675867   75.621474     
-1326.700000   76.390000     
</BasePoints>
</Item>
</Trans>
<Trans>
8              mue_a         10             +Free+       
<Item>
<Position>
1571.800000    256.880000    
</Position>
<BasePoints>
5126.400000    -38.890000     0              0              35.730112      -10.150146    
69.000000      -19.060000     120.800000     -30.550000     166.600000     -30.550000    
166.600000     -30.550000     166.600000     -30.550000     10257.200000   -30.550000    
10296.200000   -30.550000     10340.200000   -30.550000     10389.426377   -30.550000    
10427.200000   -30.550000    
</BasePoints>
</Item>
</Trans>
<Trans>
8              mue_b         13             +Free+       
<Item>
<Position>
1571.800000    256.880000    
</Position>
<BasePoints>
-348.300000    -75            0              0              -31.230019     -20.121620    
-63.700000     -39.970000     -116.600000    -66.660000     -166.700000    -66.660000    
-519           -66.660000     -519           -66.660000     -519           -66.660000    
-555.200000    -66.660000     -595.850000    -69.870000     -643.144728    -74.867048    
-680.680000    -79.160000    
</BasePoints>
</Item>
</Trans>
<Trans>
8              beta_a        26             +Free+       
<Item>
<Position>
1571.800000    256.880000    
</Position>
<BasePoints>
4942.500000    13.890000      0              0              36.385721      7.485915      
70             13.970000      121.500000     22.220000      166.600000     22.220000     
166.600000     22.220000      166.600000     22.220000      9454.200000    22.220000     
9719.200000    22.220000      9798.200000    81.720000      10008.200000   244.450000    
10023.200000   255.830000     10035.200000   271.560000     10054.003392   299.736286    
10071.200000   329.170000    
</BasePoints>
</Item>
</Trans>
<Trans>
9              lambda_a      3              +Free+       
<Item>
<Position>
11827          874.940000    
</Position>
<BasePoints>
-5854.500000   2726.360000    0              0              -0.989233      34.692402     
-5             353.660000     -40            2734.760000    -182           2734.760000   
-11265.910000  2734.760000    -11265.910000  2734.760000    -11265.910000  2734.760000   
-11428.170000  2734.760000    -11426.250000  29.020000      -11425.538967  -378.834254   
-11426.340000  -409.720000   
</BasePoints>
</Item>
</Trans>
<Trans>
9              alpha_b       10             +Free+       
<Item>
<Position>
11827          874.940000    
</Position>
<BasePoints>
86             -409.810000    0              0              9.931469       -33.280352    
38             -139.480000    124            -467.950000    161.565864     -612.278337   
172            -648.610000   
</BasePoints>
</Item>
</Trans>
<Trans>
10             beta_b        4              +Free+       
<Item>
<Position>
11999          226.330000    
</Position>
<BasePoints>
167            1244.670000    0              0              4.985304       37.539338     
40             380.600000     302            2959.970000    343.896297     3369.698899   
348            3404.170000   
</BasePoints>
</Item>
</Trans>
<Trans>
10             lambda_a      5              +Free+       
<Item>
<Position>
11999          226.330000    
</Position>
<BasePoints>
-5843.800000   -152.781000    0              0              -35.330589     -13.592463    
-129           -50.010000     -395           -144.447000    -625           -144.447000   
-10863.100000  -144.447000    -10863.100000  -144.447000    -10863.100000  -144.447000   
-11061.950000  -144.447000    -11292.670000  -78.940000     -11404.090231  -43.729207    
-11436.530000  -33.340000    
</BasePoints>
</Item>
</Trans>
<Trans>
10             mue_b         11             +Free+       
<Item>
<Position>
11999          226.330000    
</Position>
<BasePoints>
83             -52.180000     0              0              35.048790      -14.292118    
59             -24.770000     90             -38.340000     131.523936     -56.072219    
167            -70.840000    
</BasePoints>
</Item>
</Trans>
<Trans>
11             lambda_b      4              +Free+       
<Item>
<Position>
12166          155.490000    
</Position>
<BasePoints>
93             831.080000     0              0              4.931703       38.092471     
20             225.980000     87             1059.210000    122            1743.010000   
156            2407.810000    175            3217.210000    179.620358     3440.311991   
181            3475.010000   
</BasePoints>
</Item>
</Trans>
<Trans>
11             lambda_a      12             +Free+       
<Item>
<Position>
12166          155.490000    
</Position>
<BasePoints>
-5834.400000   -134.718000    0              0              -22.107296     -31.392360    
-50            -68.666000     -103           -126.385000    -165           -126.385000   
-11276.270000  -126.385000    -11276.270000  -126.385000    -11276.270000  -126.385000   
-11315.620000  -126.385000    -11360.170000  -124.817000    -11409.584433  -122.541558   
-11444.210000  -120.830000   
</BasePoints>
</Item>
</Trans>
<Trans>
12             lambda_b      1              +Free+       
<Item>
<Position>
721.790000     34.660000     
</Position>
<BasePoints>
-321.130000    -13.888000     0              0              -34.652001     -1.863437     
-66.650000     -3.492000      -115.500000    -5.555000      -157.930000    -5.555000     
-478.080000    -5.555000      -478.080000    -5.555000      -478.080000    -5.555000     
-558.640000    -5.555000      -604.180000    94.430000      -629.249028    170.502213    
-638.499000    200           
</BasePoints>
</Item>
</Trans>
<Trans>
12             alpha_a       13             +Free+       
<Item>
<Position>
721.790000     34.660000     
</Position>
<BasePoints>
83.100000      42.023000      0              0              26.917559      21.931093     
53.960000      45.149000      96.600000      81.780000      140.204279     118.880024    
169.330000     143.060000    
</BasePoints>
</Item>
</Trans>
<Trans>
13             lambda_b      2              +Free+       
<Item>
<Position>
891.120000     177.720000    
</Position>
<BasePoints>
-328.650000    83.330000      0              0              -27.878318     25.587084     
-59.380000     53.120000      -113.150000    91.660000      -167.940000    91.660000     
-491.850000    91.660000      -491.850000    91.660000      -491.850000    91.660000     
-532.120000    91.660000      -574.060000    110.790000     -617.468427    137.004662    
-646.020000    155.550000    
</BasePoints>
</Item>
</Trans>
<Trans>
13             mue_a         11             +Free+       
<Item>
<Position>
891.120000     177.720000    
</Position>
<BasePoints>
5531.780000    -48.620000     0              0              34.874620      -14.494640    
67.050000      -27.070000     116.780000     -43.060000     161.680000     -43.060000    
161.680000     -43.060000     161.680000     -43.060000     4567.480000    -43.060000    
4756.080000    -43.060000     4803.180000    -40.280000     4991.780000    -40.280000    
4991.780000    -40.280000     4991.780000    -40.280000     5533.180000    -40.280000    
5654.280000    -40.280000     5684.580000    -41.670000     5805.680000    -41.670000    
5805.680000    -41.670000     5805.680000    -41.670000     6154.980000    -41.670000    
6271.880000    -41.670000     6301.180000    -43.060000     6418.080000    -43.060000    
6418.080000    -43.060000     6418.080000    -43.060000     10482.880000   -43.060000    
10642.880000   -43.060000     10682.880000   -56.950000     10843.880000   -56.950000    
10843.880000   -56.950000     10843.880000   -56.950000     11109.880000   -56.950000    
11147.880000   -56.950000     11190.880000   -47.630000     11238.195208   -33.813928    
11274.880000   -22.230000    
</BasePoints>
</Item>
</Trans>
<Trans>
13             beta_a        14             +Free+       
<Item>
<Position>
891.120000     177.720000    
</Position>
<BasePoints>
83.110000      156.980000     0              0              15.174834      34.662725     
44.250000      107.680000     110.680000     274.700000     149.430443     370.861589    
163.080000     402.770000    
</BasePoints>
</Item>
</Trans>
<Trans>
14             lambda_b      3              +Free+       
<Item>
<Position>
1054.200000    580.490000    
</Position>
<BasePoints>
-332.410000    -8.330000      0              0              -34.650504     0             
-67.600000     0              -118           0              -161.690000    0             
-493.110000    0              -493.110000    0              -493.110000    0             
-547.540000    0              -595.920000    -44.810000     -634.395944    -90.945788    
-653.540000    -115.270000   
</BasePoints>
</Item>
</Trans>
<Trans>
14             alpha_a       15             +Free+       
<Item>
<Position>
1054.200000    580.490000    
</Position>
<BasePoints>
83.100000      13.890000      0              0              32.575218      11.967420     
41.500000      15.360000      50.900000      18.940000      59.700000      22.230000     
78.900000      29.460000      100            37.350000      133.764814     49.705934     
169.300000     62.500000     
</BasePoints>
</Item>
</Trans>
<Trans>
15             lambda_b      6              +Free+       
<Item>
<Position>
1223.500000    642.990000    
</Position>
<BasePoints>
92             -83.330000     0              0              35.024454      -14.198299    
61.700000      -26.940000     97.700000      -47.600000     121.200000     -75           
142.500000     -100           157            -134.120000    170.583892     -177.018412   
180.200000     -209.720000   
</BasePoints>
</Item>
</Trans>
<Trans>
15             beta_a        16             +Free+       
<Item>
<Position>
1223.500000    642.990000    
</Position>
<BasePoints>
4931.700000    -25            0              0              37.752744      -1.729511     
131.200000     -6.030000      383.700000     -16.660000     594.300000     -16.660000    
594.300000     -16.660000     594.300000     -16.660000     9632.500000    -16.660000    
9819.500000    -16.660000     9862.500000    57.090000      10006.500000   176.390000    
10016.500000   185.160000     10027.500000   196.060000     10045.418867   219.640917    
10066.500000   247.230000    
</BasePoints>
</Item>
</Trans>
<Trans>
15             mue_a         17             +Free+       
<Item>
<Position>
1223.500000    642.990000    
</Position>
<BasePoints>
5108.100000    2839.910000    0              0              1.683413       37.728257     
4.700000       376.010000     31.100000      2847.210000    178.800000     2847.210000   
178.800000     2847.210000    178.800000     2847.210000    4933.100000    2847.210000   
5091.400000    2847.210000    5131           2850.010000    5289.400000    2850.010000   
5289.400000    2850.010000    5289.400000    2850.010000    10236.500000   2850.010000   
10361.500000   2850.010000    10407.500000   1881.410000    10417.383904   1623.081866   
10419.500000   1584.710000   
</BasePoints>
</Item>
</Trans>
<Trans>
16             lambda_b      7              +Free+       
<Item>
<Position>
11290          890.220000    
</Position>
<BasePoints>
-4958.400000   -166.670000    0              0              -29.559574     -18.208698    
-98            -60.240000     -273           -158.340000    -434           -158.340000   
-9551.600000   -158.340000    -9551.600000   -158.340000    -9551.600000   -158.340000   
-9592.800000   -158.340000    -9639.200000   -150.220000    -9688.152321   -139.177154   
-9718.200000   -131.950000   
</BasePoints>
</Item>
</Trans>
<Trans>
16             alpha_a       18             +Free+       
<Item>
<Position>
11290          890.220000    
</Position>
<BasePoints>
-4503.600000   47.220000      0              0              -31.188263     15.077576     
-67            31.910000      -126           55.550000      -180           55.550000     
-4416.800000   55.550000      -4416.800000   55.550000      -4416.800000   55.550000     
-4656.900000   55.550000      -4716.900000   55.550000      -4957          55.550000     
-8737.400000   55.550000      -8737.400000   55.550000      -8737.400000   55.550000     
-8775.200000   55.550000      -8816.800000   64.870000      -8863.091625   78.653939     
-8899.100000   90.270000     
</BasePoints>
</Item>
</Trans>
<Trans>
17             lambda_b      9              +Free+       
<Item>
<Position>
11643          2227.700000   
</Position>
<BasePoints>
93             -884.900000    0              0              6.904384       -37.776842    
33             -230.000000    147            -1084.700000   178.575615     -1318.518569  
184            -1352.760000  
</BasePoints>
</Item>
</Trans>
<Trans>
17             lambda_a      14             +Free+       
<Item>
<Position>
11643          2227.700000   
</Position>
<BasePoints>
-5399.600000   1309.700000    0              0              -2.001949      38.437427     
-6             227.500000     -26            1054.100000    -63            1162.500000   
-92            1247.700000    -136           1318.100000    -183           1318.100000   
-10420.900000  1318.100000    -10420.900000  1318.100000    -10420.900000  1318.100000   
-10573.100000  1318.100000    -10586.200000  -1206.900000   -10587.765268  -1612.498195  
-10588.800000  -1647.210000  
</BasePoints>
</Item>
</Trans>
<Trans>
18             beta_a        19             +Free+       
<Item>
<Position>
2390.900000    980.490000    
</Position>
<BasePoints>
83.100000      101.210000     0              0              20.001978      32.131257     
45             74.810000      89.500000      150.810000     128.400000     215.310000    
130.700000     219.110000     133.100000     223.010000     144.139042     240.329833    
163            269.410000    
</BasePoints>
</Item>
</Trans>
<Trans>
18             mue_a         20             +Free+       
<Item>
<Position>
2390.900000    980.490000    
</Position>
<BasePoints>
4307.300000    20.710000      0              0              37.590855      4.372410      
85.600000      9.770000       171.200000     18.060000      244.800000     18.060000     
244.800000     18.060000      244.800000     18.060000      3942.100000    18.060000     
4103.900000    18.060000      4144.100000    29.210000      4305.900000    29.210000     
4305.900000    29.210000      4305.900000    29.210000      8552.100000    29.210000     
8592.100000    29.210000      8636.100000    43.610000      8682.441496    63.958796     
8717.100000    80.510000     
</BasePoints>
</Item>
</Trans>
<Trans>
18             lambda_b      21             +Free+       
<Item>
<Position>
2390.900000    980.490000    
</Position>
<BasePoints>
-333.700000    16.670000      0              0              -37.308355     5.896492      
-86.300000     13.390000      -174.200000    25.010000      -249.800000    25.010000     
-496.900000    25.010000      -496.900000    25.010000      -496.900000    25.010000     
-535.500000    25.010000      -576.800000    40.310000      -620.994663    61.943674     
-651.100000    77.810000     
</BasePoints>
</Item>
</Trans>
<Trans>
19             lambda_b      22             +Free+       
<Item>
<Position>
2553.900000    1249.900000   
</Position>
<BasePoints>
-328.600000    -22.200000     0              0              -34.433528     -4.504386     
-66.800000     -8.600000      -117.500000    -13.900000     -161.600000    -13.900000    
-498.100000    -13.900000     -498.100000    -13.900000     -498.100000    -13.900000    
-548.100000    -13.900000     -595.800000    -49.300000     -636.899397    -88.974155    
-658.500000    -111.100000   
</BasePoints>
</Item>
</Trans>
<Trans>
19             alpha_a       35             +Free+       
<Item>
<Position>
2553.900000    1249.900000   
</Position>
<BasePoints>
83.100000      58.700000      0              0              23.642669      25.423289     
52             57.800000      100.300000     113.000000     143.936415     162.374466    
169.400000     190.300000    
</BasePoints>
</Item>
</Trans>
<Trans>
20             lambda_a      16             +Free+       
<Item>
<Position>
11108          1061          
</Position>
<BasePoints>
93             -87.450000     0              0              34.691648      -16.651991    
61             -31            96             -53.100000     122            -79.120000    
136            -92.940000     148            -110.460000    164.950163     -140.554049   
182            -170.780000   
</BasePoints>
</Item>
</Trans>
<Trans>
20             lambda_b      24             +Free+       
<Item>
<Position>
11108          1061          
</Position>
<BasePoints>
93             22.500000      0              0              34.726796      16.371204     
64             30.400000      105            50.500000      150.628300     72.700741     
182            87.500000     
</BasePoints>
</Item>
</Trans>
<Trans>
21             beta_a        22             +Free+       
<Item>
<Position>
1739.800000    1058.300000   
</Position>
<BasePoints>
79.400000      22.300000      0              0              30.417630      15.258034     
54.300000      27.900000      87.400000      45.300000      128.056807     66.467330     
155.600000     80.500000     
</BasePoints>
</Item>
</Trans>
<Trans>
21             alpha_b       23             +Free+       
<Item>
<Position>
1739.800000    1058.300000   
</Position>
<BasePoints>
4958.400000    -281.970000    0              0              23.713441      -24.407977    
34.100000      -35.100000     46.700000      -47.300000     59.100000      -57           
252.100000     -208.230000    321.300000     -273.640000    566.600000     -273.640000   
566.600000     -273.640000    566.600000     -273.640000    9116.200000    -273.640000   
9300.200000    -273.640000    9862.200000    -378.990000    10050.723937   -415.263431   
10087.200000   -422.250000   
</BasePoints>
</Item>
</Trans>
<Trans>
21             mue_a         24             +Free+       
<Item>
<Position>
1739.800000    1058.300000   
</Position>
<BasePoints>
4683.100000    2309.900000    0              0              1.771901       33.961431     
5.400000       322.900000     34.500000      2318           154.200000     2318          
154.200000     2318           154.200000     2318           4593.200000    2318          
4833.300000    2318           4893.300000    2329.100000    5133.400000    2329.100000   
5133.400000    2329.100000    5133.400000    2329.100000    9370.200000    2329.100000   
9483.200000    2329.100000    9538.200000    473.400000     9548.154148    124.774894    
9550.200000    90.200000     
</BasePoints>
</Item>
</Trans>
<Trans>
22             alpha_b       27             +Free+       
<Item>
<Position>
1895.400000    1138.800000   
</Position>
<BasePoints>
79.300000      -149.300000    0              0              18.590519      -24.654806    
46             -63.800000     99.100000      -139.990000    141.651545     -200.265614   
161.800000     -227.750000   
</BasePoints>
</Item>
</Trans>
<Trans>
22             alpha_a       34             +Free+       
<Item>
<Position>
1895.400000    1138.800000   
</Position>
<BasePoints>
495.500000     548.600000     0              0              3.448617       30.741957     
12.100000      148.500000     50.200000      557.000000     160.400000     557.000000    
160.400000     557.000000     160.400000     557.000000     829.300000     557.000000    
881.900000     557.000000     934.800000     525.300000     981.554895     489.595123    
1008           468.100000    
</BasePoints>
</Item>
</Trans>
<Trans>
23             beta_b        6              +Free+       
<Item>
<Position>
11827          636.050000    
</Position>
<BasePoints>
-5312.700000   -245.830000    0              0              -18.888762     -32.011482    
-43            -73.100000     -89            -143.630000    -145           -187.500000   
-314           -319.530000    -411           -237.500000    -625           -237.500000   
-6872.900000   -237.500000    -6872.900000   -237.500000    -6872.900000   -237.500000   
-6979.400000   -237.500000    -7006.100000   -236.110000    -7112.600000   -236.110000   
-10171         -236.110000    -10171         -236.110000    -10171         -236.110000   
-10242.400000  -236.110000    -10324.200000  -222.690000    -10389.923219  -209.687899   
-10423.300000  -202.780000   
</BasePoints>
</Item>
</Trans>
<Trans>
23             mue_b         15             +Free+       
<Item>
<Position>
11827          636.050000    
</Position>
<BasePoints>
-5404.100000   -309.720000    0              0              -2.979441      -37.113900    
-11            -126.280000    -45            -343.060000    -182           -343.060000   
-456           -343.060000    -456           -343.060000    -456           -343.060000   
-610           -343.060000    -647           -304.170000    -801           -304.170000   
-3043.600000   -304.170000    -3043.600000   -304.170000    -3043.600000   -304.170000   
-3159.900000   -304.170000    -3189          -302.780000    -3305.300000   -302.780000   
-4607.300000   -302.780000    -4607.300000   -302.780000    -4607.300000   -302.780000   
-4722.200000   -302.780000    -4751.000000   -301.390000    -4866          -301.390000   
-10256.600000  -301.390000    -10256.600000  -301.390000    -10256.600000  -301.390000   
-10348.700000  -301.390000    -10386.600000  -308.920000    -10457.300000  -250.000000   
-10523.300000  -195.090000    -10564.900000  -101.920000    -10591.118646  -28.791049    
-10603.500000  6.940000      
</BasePoints>
</Item>
</Trans>
<Trans>
23             mue_a         25             +Free+       
<Item>
<Position>
11827          636.050000    
</Position>
<BasePoints>
-184           155.680000     0              0              -9.911900      35.900900     
-18            65.370000      -34            105.480000     -62            130.550000    
-72            139.500000     -234           194.410000     -332.026376    227.293796    
-368           238.890000    
</BasePoints>
</Item>
</Trans>
<Trans>
23             beta_a        27             +Free+       
<Item>
<Position>
11827          636.050000    
</Position>
<BasePoints>
-4952.400000   193.050000     0              0              -24.902415     27.552032     
-35            38.240000      -48            49.540000      -62            56.940000     
-136           97.090000      -164           83.990000      -247           101.390000    
-492           152.840000     -551           201.390000     -801           201.390000    
-9603.100000   201.390000     -9603.100000   201.390000     -9603.100000   201.390000    
-9649.100000   201.390000     -9696.500000   225.440000     -9741.930928   255.369595    
-9769.800000   275           
</BasePoints>
</Item>
</Trans>
<Trans>
24             lambda_a      7              +Free+       
<Item>
<Position>
11290          1148.500000   
</Position>
<BasePoints>
-4958.400000   2281.600000    0              0              -1.974552      34.653390     
-5             286.600000     -24            1809.400000    -60            2011.200000   
-112           2299.500000    -77            2291.700000    -180           2291.700000   
-4777.100000   2291.700000    -4777.100000   2291.700000    -4777.100000   2291.700000   
-4935.500000   2291.700000    -4975.100000   2288.900000    -5133.400000   2288.900000   
-9551.600000   2288.900000    -9551.600000   2288.900000    -9551.600000   2288.900000   
-9689          2288.900000    -9713.500000   14.300000      -9717.083806   -359.344254   
-9718.200000   -390.230000   
</BasePoints>
</Item>
</Trans>
<Trans>
24             alpha_b       25             +Free+       
<Item>
<Position>
11290          1148.500000   
</Position>
<BasePoints>
83             -177.640000    0              0              18.888762      -29.029045    
48             -76.900000     105            -171.580000    148.654676     -241.638889   
169            -273.560000   
</BasePoints>
</Item>
</Trans>
<Trans>
25             beta_b        9              +Free+       
<Item>
<Position>
11459          874.940000    
</Position>
<BasePoints>
184            -8.340000      0              0              37.777525      0             
105            0              243            0              333.318136     0             
368            0             
</BasePoints>
</Item>
</Trans>
<Trans>
25             mue_b         17             +Free+       
<Item>
<Position>
11459          874.940000    
</Position>
<BasePoints>
92             467.860000     0              0              5.953165       37.296579     
32             227.060000     146            1076.560000    178.325859     1314.743256   
184            1352.760000   
</BasePoints>
</Item>
</Trans>
<Trans>
25             lambda_a      26             +Free+       
<Item>
<Position>
11459          874.940000    
</Position>
<BasePoints>
92             -195.540000    0              0              20.959004      -31.408565    
54             -83.750000     120            -188.540000    165.533339     -260.246156   
184            -288.890000   
</BasePoints>
</Item>
</Trans>
<Trans>
26             beta_b        3              +Free+       
<Item>
<Position>
11643          586.050000    
</Position>
<BasePoints>
-5758.700000   -87.500000     0              0              -29.340397     -17.351304    
-64            -36.490000     -126           -65.280000     -183           -65.280000    
-1138          -65.280000     -1138          -65.280000     -1138          -65.280000    
-1249          -65.280000     -1276          -66.670000     -1387          -66.670000    
-3549.100000   -66.670000     -3549.100000   -66.670000     -3549.100000   -66.670000    
-3664.000000   -66.670000     -3692.700000   -69.450000     -3807.600000   -69.450000    
-4423.300000   -69.450000     -4423.300000   -69.450000     -4423.300000   -69.450000    
-4856.600000   -69.450000     -4964.900000   -79.170000     -5398.200000   -79.170000    
-10158.200000  -79.170000     -10158.200000  -79.170000     -10158.200000  -79.170000    
-10273.800000  -79.170000     -10302.500000  -88.890000     -10418.100000  -88.890000    
-11081.910000  -88.890000     -11081.910000  -88.890000     -11081.910000  -88.890000    
-11121.480000  -88.890000     -11165.530000  -98.510000     -11212.709751  -111.881179   
-11242.340000  -120.830000   
</BasePoints>
</Item>
</Trans>
<Trans>
26             mue_b         14             +Free+       
<Item>
<Position>
11643          586.050000    
</Position>
<BasePoints>
-5399.600000   -23.080000     0              0              -33.900066     -3.609360     
-70            -7.310000      -131           -12.500000     -183           -12.500000    
-4511.500000   -12.500000     -4511.500000   -12.500000     -4511.500000   -12.500000    
-5104.400000   -12.500000     -5252.600000   -15.280000     -5845.500000   -15.280000    
-6439.600000   -15.280000     -6439.600000   -15.280000     -6439.600000   -15.280000    
-6731.600000   -15.280000     -6804.600000   -18.060000     -7096.700000   -18.060000    
-9904.600000   -18.060000     -9904.600000   -18.060000     -9904.600000   -18.060000    
-10016.100000  -18.060000     -10043.900000  -19.450000     -10155.500000  -19.450000    
-10420.900000  -19.450000     -10420.900000  -19.450000     -10420.900000  -19.450000    
-10460.600000  -19.450000     -10505.400000  -15.470000     -10554.367450  -9.826344     
-10588.800000  -5.560000     
</BasePoints>
</Item>
</Trans>
<Trans>
26             alpha_a       23             +Free+       
<Item>
<Position>
11643          586.050000    
</Position>
<BasePoints>
93             9.270000       0              0              32.938505      8.544636      
61             16.400000      101            27.460000      148.125888     40.292887     
184            50            
</BasePoints>
</Item>
</Trans>
<Trans>
27             beta_b        7              +Free+       
<Item>
<Position>
2057.200000    911.050000    
</Position>
<BasePoints>
-238.000000    -112.940000    0              0              -30.679776     -14.682464    
-71.800000     -34.800000     -148.900000    -70.750000     -217.700000    -93.060000    
-293.700000    -117.700000    -385.200000    -135.790000    -454.830351    -147.863982   
-485.400000    -152.780000   
</BasePoints>
</Item>
</Trans>
<Trans>
27             mue_b         16             +Free+       
<Item>
<Position>
2057.200000    911.050000    
</Position>
<BasePoints>
4549           -27.110000     0              0              33.630987      -5.614998     
67.500000      -11.000000     120.500000     -18.060000     166.700000     -18.060000    
166.700000     -18.060000     166.700000     -18.060000     4458.500000    -18.060000    
4617.400000    -18.060000     4657.100000    -20.830000     4816           -20.830000    
4816           -20.830000     4816           -20.830000     9052.800000    -20.830000    
9095.800000    -20.830000     9145.800000    -20.830000     9198.118136    -20.830000    
9232.800000    -20.830000    
</BasePoints>
</Item>
</Trans>
<Trans>
27             alpha_a       28             +Free+       
<Item>
<Position>
2057.200000    911.050000    
</Position>
<BasePoints>
82.500000      142.150000     0              0              16.225476      29.972880     
22.400000      43.200000      29             58.240000      34             72.220000     
89.900000      227.550000     135.300000     417.950000     159.310740     523.616376    
168.100000     559.750000    
</BasePoints>
</Item>
</Trans>
<Trans>
28             mue_b         18             +Free+       
<Item>
<Position>
2225.300000    1470.800000   
</Position>
<BasePoints>
82.500000      -311.800000    0              0              12.958953      -34.919925    
41.500000      -120.900000    114.400000     -340.200000    152.760323     -454.676369   
165.600000     -490.310000   
</BasePoints>
</Item>
</Trans>
<Trans>
28             beta_b        21             +Free+       
<Item>
<Position>
2225.300000    1470.800000   
</Position>
<BasePoints>
-250.600000    252.700000     0              0              -15.515107     33.832943     
-53.900000     121.100000     -164.700000    341.500000     -274           261.100000    
-377.700000    184.800000     -452.700000    -220.300000    -479.297675    -378.993963   
-485.500000    -412.500000   
</BasePoints>
</Item>
</Trans>
<Trans>
28             beta_a        29             +Free+       
<Item>
<Position>
2225.300000    1470.800000   
</Position>
<BasePoints>
498            -114.100000    0              0              36.485136      -6.959018     
187.100000     -36.900000     774.200000     -153.600000    962.112032     -190.840006   
995.500000     -197.300000   
</BasePoints>
</Item>
</Trans>
<Trans>
28             mue_a         30             +Free+       
<Item>
<Position>
2225.300000    1470.800000   
</Position>
<BasePoints>
4289           1843.900000    0              0              16.537740      33.272359     
27.600000      55.100000      43.300000      82.300000      62.200000      102.700000    
114.300000     159.300000     156.400000     141.800000     203.400000     202.700000    
689.800000     834.000000     114.700000     1850.000000    911.600000     1850.000000   
911.600000     1850.000000    911.600000     1850.000000    4107.700000    1850.000000   
4347.900000    1850.000000    4407.700000    1863.900000    4647.900000    1863.900000   
4647.900000    1863.900000    4647.900000    1863.900000    8547.700000    1863.900000   
8658.700000    1863.900000    8705.700000    69.100000      8714.308782    -284.528426   
8715.700000    -322.300000   
</BasePoints>
</Item>
</Trans>
<Trans>
29             mue_b         19             +Free+       
<Item>
<Position>
3220.800000    1273.500000   
</Position>
<BasePoints>
-317.400000    -11.100000     0              0              -34.064939     -0.893832     
-66.400000     -1.700000      -116.800000    -2.700000      -160.400000    -2.700000     
-407.000000    -2.700000      -407.000000    -2.700000      -407.000000    -2.700000     
-480.100000    -2.700000      -564.500000    -11.100000     -632.459329    -19.235242    
-666.900000    -23.600000    
</BasePoints>
</Item>
</Trans>
<Trans>
29             beta_b        22             +Free+       
<Item>
<Position>
3220.800000    1273.500000   
</Position>
<BasePoints>
-666.900000    -116.600000    0              0              -31.822994     -12.057159    
-40.800000     -15.400000     -50.200000     -18.500000     -59            -20.800000    
-287.200000    -80.600000     -346.500000    -108.300000    -582.400000    -108.300000   
-1165.000000   -108.300000    -1165.000000   -108.300000    -1165.000000   -108.300000   
-1204.100000   -108.300000    -1247.800000   -116.100000    -1295.354029   -127.237602   
-1325.400000   -134.700000   
</BasePoints>
</Item>
</Trans>
<Trans>
29             alpha_a       31             +Free+       
<Item>
<Position>
3220.800000    1273.500000   
</Position>
<BasePoints>
82.500000      55.800000      0              0              23.600693      24.584055     
51.800000      55.600000      99.300000      107.800000     142.566073     154.988904    
168.100000     182           
</BasePoints>
</Item>
</Trans>
<Trans>
30             mue_b         20             +Free+       
<Item>
<Position>
10941          1148.500000   
</Position>
<BasePoints>
83             -62.400000     0              0              33.838992      -16.822813    
59             -30.300000     92             -47.900000     132.949249     -69.623356    
167            -87.500000    
</BasePoints>
</Item>
</Trans>
<Trans>
30             beta_b        24             +Free+       
<Item>
<Position>
10941          1148.500000   
</Position>
<BasePoints>
167            -8.300000      0              0              37.782403      0             
101            0              228            0              314.318136     0             
349            0             
</BasePoints>
</Item>
</Trans>
<Trans>
30             lambda_a      27             +Free+       
<Item>
<Position>
10941          1148.500000   
</Position>
<BasePoints>
-4518.100000   -102.400000    0              0              -28.660460     -24.608464    
-60            -50.300000     -114           -86.100000     -168           -86.100000    
-4244.200000   -86.100000     -4244.200000   -86.100000     -4244.200000   -86.100000    
-4405.900000   -86.100000     -4446.300000   -94.400000     -4608          -94.400000    
-6311.800000   -94.400000     -6311.800000   -94.400000     -6311.800000   -94.400000    
-6423.300000   -94.400000     -6451.200000   -93            -6562.700000   -93           
-7553.500000   -93            -7553.500000   -93            -7553.500000   -93           
-7663.600000   -93            -7691.200000   -91.600000     -7801.300000   -91.600000    
-8305.300000   -91.600000     -8305.300000   -91.600000     -8305.300000   -91.600000    
-8460.300000   -91.600000     -8504.700000   -65.300000     -8653.500000   -108.300000   
-8725.900000   -129.100000    -8800          -176.740000    -8856.305193   -217.280302   
-8883.800000   -237.450000   
</BasePoints>
</Item>
</Trans>
<Trans>
31             beta_a        32             +Free+       
<Item>
<Position>
3388.900000    1455.500000   
</Position>
<BasePoints>
82.500000      179.200000     0              0              13.453569      34.722079     
41.900000      116.500000     112.100000     318.100000     149.763353     425.006286    
161.800000     456.900000    
</BasePoints>
</Item>
</Trans>
<Trans>
31             mue_a         33             +Free+       
<Item>
<Position>
3388.900000    1455.500000   
</Position>
<BasePoints>
3485.700000    -127.400000    0              0              23.222612      -29.028265    
51             -62.300000     102.600000     -112.500000    160.400000     -112.500000   
160.400000     -112.500000    160.400000     -112.500000    3218.700000    -112.500000   
3490.800000    -112.500000    3558.700000    -126.400000    3830.800000    -126.400000   
3830.800000    -126.400000    3830.800000    -126.400000    6867.100000    -126.400000   
6906.100000    -126.400000    6949.100000    -132.700000    6998.129304    -142.187325   
7035.100000    -150          
</BasePoints>
</Item>
</Trans>
<Trans>
31             beta_b        34             +Free+       
<Item>
<Position>
3388.900000    1455.500000   
</Position>
<BasePoints>
-250.600000    61.100000      0              0              -35.733332     10.237649     
-76.300000     22.500000      -144.100000    43             -202.100000    61.100000     
-285.100000    87             -381.600000    118.100000     -452.978500    141.122935    
-485.500000    151.400000    
</BasePoints>
</Item>
</Trans>
<Trans>
31             mue_b         35             +Free+       
<Item>
<Position>
3388.900000    1455.500000   
</Position>
<BasePoints>
-329.900000    -16.500000     0              0              -37.136160     -0.785950     
-148.400000    -3.400000      -481.200000    -11.100000     -627.828426    -14.465269    
-665.600000    -15.300000    
</BasePoints>
</Item>
</Trans>
<Trans>
32             mue_b         36             +Free+       
<Item>
<Position>
3550.700000    1912.400000   
</Position>
<BasePoints>
79.400000      190.200000     0              0              11.079410      32.248996     
37.900000      121.400000     111.900000     367.800000     148.456986     487.961788    
159.300000     520.900000    
</BasePoints>
</Item>
</Trans>
<Trans>
32             beta_b        40             +Free+       
<Item>
<Position>
3550.700000    1912.400000   
</Position>
<BasePoints>
-247.400000    -153.900000    0              0              -30.198996     -15.687790    
-114.500000    -61.700000     -354.400000    -192.500000    -464.305975    -252.178626   
-491.700000    -266.600000   
</BasePoints>
</Item>
</Trans>
<Trans>
32             alpha_a       46             +Free+       
<Item>
<Position>
3550.700000    1912.400000   
</Position>
<BasePoints>
508.800000     -319.400000    0              0              19.564994      -27.907428    
72.100000      -104.700000    230.700000     -311.100000    419.200000     -311.100000   
419.200000     -311.100000    419.200000     -311.100000    827.600000     -311.100000   
883.800000     -311.100000    932.800000     -264.400000    972.176992     -214.614759   
994.300000     -184.700000   
</BasePoints>
</Item>
</Trans>
<Trans>
33             lambda_a      29             +Free+       
<Item>
<Position>
10424          1305.500000   
</Position>
<BasePoints>
-3637.600000   -90.300000     0              0              -36.140762     -11.243793    
-109           -33.700000     -283           -82            -433.300000    -82           
-3727.200000   -82            -3727.200000   -82            -3727.200000   -82           
-3928.100000   -82            -3978.300000   -79.200000     -4179.200000   -79.200000    
-7036.500000   -79.200000     -7036.500000   -79.200000     -7036.500000   -79.200000    
-7078.800000   -79.200000     -7124.800000   -64.700000     -7171.922624   -45.580966    
-7203.200000   -32           
</BasePoints>
</Item>
</Trans>
<Trans>
33             mue_b         37             +Free+       
<Item>
<Position>
10424          1305.500000   
</Position>
<BasePoints>
83             -55.600000     0              0              34.795089      -14.713352    
55             -23.700000     81             -35.600000     103            -47.200000    
109            -50.100000     114            -53.100000     133.658640     -64.146453    
167            -83.300000    
</BasePoints>
</Item>
</Trans>
<Trans>
33             beta_b        38             +Free+       
<Item>
<Position>
10424          1305.500000   
</Position>
<BasePoints>
167            -23.600000     0              0              37.813946      1.293635      
79             1.800000       148            -0.100000      205            -15.300000    
240            -24.700000     277            -42.700000     317.994175     -65.910260    
348            -83.300000    
</BasePoints>
</Item>
</Trans>
<Trans>
34             alpha_b       28             +Free+       
<Item>
<Position>
2903.400000    1606.900000   
</Position>
<BasePoints>
-349.500000    -27.800000     0              0              -33.601340     -5.649783     
-69.400000     -11.500000     -127.900000    -19.500000     -178.700000    -19.500000    
-513.900000    -19.500000     -513.900000    -19.500000     -513.900000    -19.500000    
-567.200000    -19.500000     -615           -61.200000     -654.737956    -107.125453   
-678.100000    -136.100000   
</BasePoints>
</Item>
</Trans>
<Trans>
34             mue_a         38             +Free+       
<Item>
<Position>
2903.400000    1606.900000   
</Position>
<BasePoints>
3883.000000    1662.000000    0              0              2.668388       33.898407     
11.900000      271.700000     69.500000      1661.100000    154.200000     1661.100000   
154.200000     1661.100000    154.200000     1661.100000    3429.600000    1661.100000   
3745.400000    1661.100000    3824.200000    1675.000000    4139.900000    1675.000000   
4139.900000    1675.000000    4139.900000    1675.000000    7688.600000    1675.000000   
7792.600000    1675.000000    7854.600000    -18.100000     7866.542278    -350.061678   
7868.600000    -384.700000   
</BasePoints>
</Item>
</Trans>
<Trans>
34             beta_a        40             +Free+       
<Item>
<Position>
2903.400000    1606.900000   
</Position>
<BasePoints>
79.400000      6.500000       0              0              33.139306      8.012787      
55.700000      13.800000      85.600000      21.400000      125.548745     31.502768     
155.600000     38.900000     
</BasePoints>
</Item>
</Trans>
<Trans>
35             lambda_b      34             +Free+       
<Item>
<Position>
2723.300000    1440.200000   
</Position>
<BasePoints>
91.900000      91.700000      0              0              16.618234      34.032551     
27.300000      55.100000      43.100000      81.300000      62.800000      100           
84.200000      120.400000     95.500000      117.200000     121.100000     132.000000    
126.400000     135.000000     132            138.300000     150.799540     149.367334    
180.100000     166.700000    
</BasePoints>
</Item>
</Trans>
<Trans>
35             beta_a        36             +Free+       
<Item>
<Position>
2723.300000    1440.200000   
</Position>
<BasePoints>
497.500000     126.700000     0              0              37.417763      5.824929      
172.800000     29.800000      646.100000     132.200000     861.400000     425.000000    
922.500000     508            964.900000     819.800000     981.926346     958.797886    
986.700000     993.100000    
</BasePoints>
</Item>
</Trans>
<Trans>
35             mue_a         37             +Free+       
<Item>
<Position>
2723.300000    1440.200000   
</Position>
<BasePoints>
3882.900000    -169.600000    0              0              36.430487      -10.267671    
45.300000      -12.600000     54.300000      -14.900000     62.800000      -16.700000    
280            -62.800000     336.100000     -66.300000     556.500000     -93.000000    
669.400000     -106.700000    1182.500000    -152.800000    1246.600000    -152.800000   
1246.600000    -152.800000    1246.600000    -152.800000    1655           -152.800000   
1838.400000    -152.800000    1884.200000    -159.700000    2067.700000    -159.700000   
2067.700000    -159.700000    2067.700000    -159.700000    2319.800000    -159.700000   
2428           -159.700000    2455           -161.100000    2563.200000    -161.100000   
2563.200000    -161.100000    2563.200000    -161.100000    3792.400000    -161.100000   
4105.300000    -161.100000    4183.500000    -163.900000    4496.400000    -163.900000   
4496.400000    -163.900000    4496.400000    -163.900000    7267.400000    -163.900000   
7469.700000    -163.900000    7709.700000    -195.000000    7829.715646    -212.443030   
7867.700000    -218.000000   
</BasePoints>
</Item>
</Trans>
<Trans>
36             alpha_a       39             +Free+       
<Item>
<Position>
3710           2433.300000   
</Position>
<BasePoints>
83.100000      -8.400000      0              0              34.722079      0             
58.300000      0              89.400000      0              131.592426     0             
169.400000     0             
</BasePoints>
</Item>
</Trans>
<Trans>
36             lambda_b      40             +Free+       
<Item>
<Position>
3710           2433.300000   
</Position>
<BasePoints>
-321.100000    762.500000     0              0              -0.887706      34.620552     
0.100000       185.900000     -5.600000      770.800000     -157.900000    770.800000    
-490.600000    770.800000     -490.600000    770.800000     -490.600000    770.800000    
-646.500000    770.800000     -650.700000    -479.900000    -650.279903    -756.601298   
-651           -787.500000   
</BasePoints>
</Item>
</Trans>
<Trans>
37             lambda_a      19             +Free+       
<Item>
<Position>
10591          1222.200000   
</Position>
<BasePoints>
-4076.700000   -59.500000     0              0              -34.248748     -17.417935    
-67            -33.600000     -118           -54.200000     -166           -54.200000    
-3717.800000   -54.200000     -3717.800000   -54.200000     -3717.800000   -54.200000    
-3997.100000   -54.200000     -4066.900000   -48.700000     -4346.200000   -48.700000    
-5304.500000   -48.700000     -5304.500000   -48.700000     -5304.500000   -48.700000    
-5412.700000   -48.700000     -5439.700000   -51.400000     -5547.900000   -51.400000    
-7121          -51.400000     -7121          -51.400000     -7121          -51.400000    
-7502.900000   -51.400000     -7598.500000   -29.400000     -7977.400000   18.000000     
-7980.400000   18.400000      -7983.600000   18.800000      -8002.926374   22.004396     
-8037.100000   27.700000     
</BasePoints>
</Item>
</Trans>
<Trans>
37             lambda_b      38             +Free+       
<Item>
<Position>
10591          1222.200000   
</Position>
<BasePoints>
92             -8.400000      0              0              38.446037      0             
65             0              101            0              146.318136     0             
181            0             
</BasePoints>
</Item>
</Trans>
<Trans>
38             lambda_a      22             +Free+       
<Item>
<Position>
10772          1222.200000   
</Position>
<BasePoints>
-4528.600000   -120.800000    0              0              -24.117050     -24.920952    
-56            -56.400000     -116           -107.000000    -180           -107.000000   
-3898.800000   -107.000000    -3898.800000   -107.000000    -3898.800000   -107.000000   
-4217.300000   -107.000000    -4296.900000   -112.500000    -4615.400000   -112.500000   
-8136.300000   -112.500000    -8136.300000   -112.500000    -8136.300000   -112.500000   
-8281.500000   -112.500000    -8317.700000   -109.800000    -8462.800000   -109.800000   
-8716.200000   -109.800000    -8716.200000   -109.800000    -8716.200000   -109.800000   
-8755.300000   -109.800000    -8799          -101.900000    -8846.554029   -90.862398    
-8876.600000   -83.400000    
</BasePoints>
</Item>
</Trans>
<Trans>
38             alpha_b       30             +Free+       
<Item>
<Position>
10772          1222.200000   
</Position>
<BasePoints>
83             -53.900000     0              0              31.905945      -13.659733    
57             -24.600000     92             -39.900000     134.341496     -58.634161    
169            -73.700000    
</BasePoints>
</Item>
</Trans>
<Trans>
39             lambda_b      41             +Free+       
<Item>
<Position>
3879.400000    2433.300000   
</Position>
<BasePoints>
91.900000      -741.800000    0              0              2.465851       -37.678208    
7              -175.600000    25             -639.200000    62.700000      -693.100000   
78.500000      -715.600000    106.200000     -729.000000    146.728797     -740.288676   
180.100000     -747.300000   
</BasePoints>
</Item>
</Trans>
<Trans>
39             mue_a         49             +Free+       
<Item>
<Position>
3879.400000    2433.300000   
</Position>
<BasePoints>
3080.300000    673.500000     0              0              2.165656       37.702110     
7.800000       181.400000     47.600000      676.400000     334.300000     676.400000    
334.300000     676.400000     334.300000     676.400000     2820.200000    676.400000    
3051.400000    676.400000     3109.100000    690.200000     3340.300000    690.200000    
3340.300000    690.200000     3340.300000    690.200000     6028.100000    690.200000    
6077.300000    690.200000     6124.600000    657.100000     6166.721977    617.643876    
6193.600000    590.200000    
</BasePoints>
</Item>
</Trans>
<Trans>
39             beta_a        52             +Free+       
<Item>
<Position>
3879.400000    2433.300000   
</Position>
<BasePoints>
497.500000     201.400000     0              0              12.921061      35.508259     
35.100000      96             88.800000      209.700000     178.700000     209.700000    
178.700000     209.700000     178.700000     209.700000     666.900000     209.700000    
768.900000     209.700000     883.800000     247.600000     960.811933     277.379329    
993            290.200000    
</BasePoints>
</Item>
</Trans>
<Trans>
40             alpha_b       29             +Free+       
<Item>
<Position>
3059           1645.800000   
</Position>
<BasePoints>
79.300000      -280.900000    0              0              8.252480       -29.767874    
17.300000      -67.000000     34.200000      -130.300000    55.900000      -182.000000   
78.200000      -235.300000    111.300000     -293.000000    142.992701     -343.918076   
161.800000     -372.300000   
</BasePoints>
</Item>
</Trans>
<Trans>
40             alpha_a       41             +Free+       
<Item>
<Position>
3059           1645.800000   
</Position>
<BasePoints>
491.700000     0              0              0              30.925127      0.991190      
98.700000      3.200000       268.700000     8.300000       411.000000     8.300000      
411.000000     8.300000       411.000000     8.300000       821.700000     8.300000      
866.500000     8.300000       916.700000     18.300000      967.656031     31.292008     
1000.500000    40.200000     
</BasePoints>
</Item>
</Trans>
<Trans>
41             alpha_b       31             +Free+       
<Item>
<Position>
4059.500000    1686          
</Position>
<BasePoints>
-349.500000    -213.800000    0              0              -18.444568     -28.603875    
-53.500000     -85.600000     -132.700000    -205.500000    -178.800000    -205.500000   
-510.200000    -205.500000    -510.200000    -205.500000    -510.200000    -205.500000   
-546.800000    -205.500000    -587.700000    -212.100000    -634.360412    -222.104729   
-670.600000    -230.500000   
</BasePoints>
</Item>
</Trans>
<Trans>
41             beta_a        42             +Free+       
<Item>
<Position>
4059.500000    1686          
</Position>
<BasePoints>
79.400000      400.300000     0              0              6.133245       33.534999     
28.600000      190.600000     121.900000     845.600000     150.331712     1041.875639   
155.600000     1072.300000   
</BasePoints>
</Item>
</Trans>
<Trans>
41             mue_a         43             +Free+       
<Item>
<Position>
4059.500000    1686          
</Position>
<BasePoints>
3073.400000    -255.800000    0              0              30.270237      -15.684578    
126.700000     -66.600000     447.100000     -223.600000    731.500000     -223.600000   
731.500000     -223.600000    731.500000     -223.600000    2456.200000    -223.600000   
2848.800000    -223.600000    2946.500000    -251.300000    3339.100000    -251.300000   
3339.100000    -251.300000    3339.100000    -251.300000    6014.500000    -251.300000   
6058.500000    -251.300000    6108.500000    -251.300000    6159.813244    -251.300000   
6194.500000    -251.300000   
</BasePoints>
</Item>
</Trans>
<Trans>
42             alpha_b       32             +Free+       
<Item>
<Position>
4215.100000    2758.300000   
</Position>
<BasePoints>
-335.700000    343.000000     0              0              -6.924631      30.171607     
-24.700000     116            -87.400000     351.400000     -242.400000    351.400000    
-506.500000    351.400000     -506.500000    351.400000     -506.500000    351.400000    
-624.100000    351.400000     -655.800000    -568.400000    -662.642081    -811.891030   
-664.400000    -845.900000   
</BasePoints>
</Item>
</Trans>
<Trans>
42             alpha_a       44             +Free+       
<Item>
<Position>
4215.100000    2758.300000   
</Position>
<BasePoints>
79.300000      -145.900000    0              0              18.869791      -24.530728    
46.200000      -62.700000     98.800000      -136.200000    141.381873     -195.053294   
161.800000     -222.300000   
</BasePoints>
</Item>
</Trans>
<Trans>
43             alpha_b       33             +Free+       
<Item>
<Position>
10254          1434.700000   
</Position>
<BasePoints>
84             -77.800000     0              0              30.362898      -16.846511    
53             -30.500000     83             -49.900000     107            -69.500000    
115            -76.200000     124            -84            143.117519     -102.600493   
170            -129.200000   
</BasePoints>
</Item>
</Trans>
<Trans>
43             lambda_a      40             +Free+       
<Item>
<Position>
10254          1434.700000   
</Position>
<BasePoints>
-3647.800000   -45.800000     0              0              -31.363873     -14.872546    
-66            -30.400000     -126           -52.800000     -180           -52.800000    
-3034.300000   -52.800000     -3034.300000   -52.800000     -3034.300000   -52.800000    
-3387.900000   -52.800000     -3476.100000   -34.800000     -3829.700000   -34.800000    
-4282.900000   -34.800000     -4282.900000   -34.800000     -4282.900000   -34.800000    
-4622.900000   -34.800000     -4707.800000   -26.400000     -5047.900000   -26.400000    
-5796          -26.400000     -5796          -26.400000     -5796          -26.400000    
-5947.300000   -26.400000     -6991.800000   160.000000     -7139.100000   194.400000    
-7142.500000   195.200000     -7146.100000   196.100000     -7165.456809   201.989765    
-7195          211.100000    
</BasePoints>
</Item>
</Trans>
<Trans>
44             beta_a        45             +Free+       
<Item>
<Position>
4376.900000    2536          
</Position>
<BasePoints>
82.500000      -29.800000     0              0              33.435489      -6.667196     
58.800000      -12            94.000000      -19.400000     137.792190     -28.546795    
168.100000     -34.700000    
</BasePoints>
</Item>
</Trans>
<Trans>
44             alpha_b       46             +Free+       
<Item>
<Position>
4376.900000    2536          
</Position>
<BasePoints>
82.500000      -748.600000    0              0              2.353168       -33.924846    
6.800000       -168.700000    24.900000      -649.600000    59.000000      -708.300000   
71.700000      -730.100000    86.900000      -723.600000    105.900000     -740.200000   
115.400000     -748.600000    125            -758.400000    143.966852     -780.039734   
168.100000     -808.300000   
</BasePoints>
</Item>
</Trans>
<Trans>
44             mue_a         47             +Free+       
<Item>
<Position>
4376.900000    2536          
</Position>
<BasePoints>
2667.800000    448.800000     0              0              15.401507      30.408103     
22.300000      46.600000      29.800000      66.300000      34.000000      84.800000     
48.900000      149.400000     25.700000      324.700000     59.000000      382           
88.200000      432.100000     108.700000     455.600000     166.700000     455.600000    
166.700000     455.600000     166.700000     455.600000     1081.700000    455.600000    
1193.300000    455.600000     1221.200000    454.200000     1332.800000    454.200000    
1332.800000    454.200000     1332.800000    454.200000     2499.100000    454.200000    
2770.900000    454.200000     2838.200000    482            3109.900000    482           
3109.900000    482            3109.900000    482            5179.900000    482           
5227.300000    482            5278.800000    464.300000     5328.464601    442.520296    
5359.900000    427.800000    
</BasePoints>
</Item>
</Trans>
<Trans>
45             alpha_b       50             +Free+       
<Item>
<Position>
4545           2501.300000   
</Position>
<BasePoints>
85.600000      120.900000     0              0              13.281945      27.951557     
25.100000      54.700000      43.600000      95.300000      62.100000      129.200000    
86.200000      173.300000     117.100000     221.700000     148.336604     268.100027    
168            295.900000    
</BasePoints>
</Item>
</Trans>
<Trans>
45             alpha_a       59             +Free+       
<Item>
<Position>
4545           2501.300000   
</Position>
<BasePoints>
829.100000     95.900000      0              0              30.484228      5.310156      
134.900000     23.800000      492.800000     84.600000      791.300000     104.200000    
1118.200000    125.700000     1512.800000    99.300000      1664.468032    87.487997     
1698.400000    84.700000     
</BasePoints>
</Item>
</Trans>
<Trans>
46             mue_b         39             +Free+       
<Item>
<Position>
4545           1727.700000   
</Position>
<BasePoints>
-329.900000    23.600000      0              0              -35.619771     10.616478     
-69.100000     19.900000      -120.800000    32             -166.700000    32            
-486.900000    32             -486.900000    32             -486.900000    32            
-614.800000    32             -652.400000    491.800000     -662.809759    667.931743    
-665.600000    705.600000    
</BasePoints>
</Item>
</Trans>
<Trans>
46             beta_b        41             +Free+       
<Item>
<Position>
4545           1727.700000   
</Position>
<BasePoints>
-250.600000    -31.500000     0              0              -37.035087     -3.069753     
-122.900000    -10.500000     -338.300000    -29.100000     -451.558642    -38.792673    
-485.500000    -41.700000    
</BasePoints>
</Item>
</Trans>
<Trans>
46             mue_a         48             +Free+       
<Item>
<Position>
4545           1727.700000   
</Position>
<BasePoints>
2676.100000    -247.100000    0              0              11.057492      -35.541939    
30.300000      -96.700000     78.300000      -212.500000    166.600000     -212.500000   
166.600000     -212.500000    166.600000     -212.500000    1970.700000    -212.500000   
2363.300000    -212.500000    2461           -240.300000    2853.600000    -240.300000   
2853.600000    -240.300000    2853.600000    -240.300000    5193.200000    -240.300000   
5339.300000    -240.300000    5357.300000    915.600000     5360.013997    1198.287424   
5361.200000    1236.100000   
</BasePoints>
</Item>
</Trans>
<Trans>
46             beta_a        50             +Free+       
<Item>
<Position>
4545           1727.700000   
</Position>
<BasePoints>
85.600000      399.200000     0              0              6.945359       36.512746     
31.900000      197.400000     130.700000     837.000000     161.879671     1035.974198   
168            1069.500000   
</BasePoints>
</Item>
</Trans>
<Trans>
47             lambda_a      42             +Free+       
<Item>
<Position>
9736.800000    2963.800000   
</Position>
<BasePoints>
-2777.100000   74.300000      0              0              -24.829749     24.236209     
-35            33.600000      -47.200000     43.300000      -59.600000     50            
-142.600000    94.600000      -169.500000    107.000000     -263.700000    107.000000    
-2427.600000   107.000000     -2427.600000   107.000000     -2427.600000   107.000000    
-2620.500000   107.000000     -2668.000000   82.000000      -2860.800000   82.000000     
-5361.300000   82.000000      -5361.300000   82.000000      -5361.300000   82.000000     
-5469.900000   82.000000      -5504.900000   -77.000000     -5517.849174   -174.823932   
-5521.700000   -205.500000   
</BasePoints>
</Item>
</Trans>
<Trans>
47             alpha_b       48             +Free+       
<Item>
<Position>
9736.800000    2963.800000   
</Position>
<BasePoints>
83.100000      -8.300000      0              0              34.722079      0             
58.300000      0              89.400000      0              131.592426     0             
169.400000     0             
</BasePoints>
</Item>
</Trans>
<Trans>
48             lambda_a      32             +Free+       
<Item>
<Position>
9906.200000    2963.800000   
</Position>
<BasePoints>
-3208.000000   243.100000     0              0              -25.225931     28.205372     
-86.100000     96.900000      -253.700000    265.300000     -433.100000    265.300000    
-2862.900000   265.300000     -2862.900000   265.300000     -2862.900000   265.300000    
-3015.800000   265.300000     -3053.700000   251.400000     -3206.600000   251.400000    
-5768.700000   251.400000     -5768.700000   251.400000     -5768.700000   251.400000    
-6020.000000   251.400000     -6219.700000   287.900000     -6296.500000   48.600000     
-6328.700000   -52.000000     -6348.200000   -798.900000    -6353.814636   -1017.423057  
-6355.500000   -1051.400000  
</BasePoints>
</Item>
</Trans>
<Trans>
48             beta_b        43             +Free+       
<Item>
<Position>
9906.200000    2963.800000   
</Position>
<BasePoints>
166.800000     -899.800000    0              0              9.595560       -36.601622    
56.200000      -242.800000    282.800000     -1244.600000   339.616593     -1495.411642  
347.800000     -1529.100000  
</BasePoints>
</Item>
</Trans>
<Trans>
48             mue_b         49             +Free+       
<Item>
<Position>
9906.200000    2963.800000   
</Position>
<BasePoints>
83.100000      14.400000      0              0              35.711312      12.563259     
59.100000      21.100000      89.700000      32.200000      130.526864     47.004402     
166.800000     59.700000     
</BasePoints>
</Item>
</Trans>
<Trans>
49             lambda_a      36             +Free+       
<Item>
<Position>
10073          3023.500000   
</Position>
<BasePoints>
-3198.400000   135.700000     0              0              -18.646700     33.662200     
-44            79.400000      -96.400000     152.800000     -165.500000    152.800000    
-3029.700000   152.800000     -3029.700000   152.800000     -3029.700000   152.800000    
-3182.600000   152.800000     -3220.500000   138.900000     -3373.400000   138.900000    
-5935.500000   138.900000     -5935.500000   138.900000     -5935.500000   138.900000    
-6250.600000   138.900000     -6336.900000   -374.800000    -6358.567321   -555.829691   
-6363          -590.200000   
</BasePoints>
</Item>
</Trans>
<Trans>
49             lambda_b      43             +Free+       
<Item>
<Position>
10073          3023.500000   
</Position>
<BasePoints>
93             -90.200000     0              0              36.140762      -13.151222    
65             -26            103            -48.500000     122            -81.900000    
158            -146.900000    176            -1281.700000   179.639927     -1554.118136  
181            -1588.800000  
</BasePoints>
</Item>
</Trans>
<Trans>
50             beta_b        42             +Free+       
<Item>
<Position>
4713           2797.200000   
</Position>
<BasePoints>
-253.600000    -29.600000     0              0              -33.993510     -2.561830     
-120.700000    -9.400000      -352.200000    -27.600000     -467.041996    -36.536408    
-497.900000    -38.900000    
</BasePoints>
</Item>
</Trans>
<Trans>
50             alpha_a       51             +Free+       
<Item>
<Position>
4713           2797.200000   
</Position>
<BasePoints>
824.200000     1.300000       0              0              33.862992      3.150046      
66             6.000000       115.200000     9.700000       158            9.700000      
158            9.700000       158            9.700000       1084.500000    9.700000      
1298.500000    9.700000       1551.500000    -29.600000     1673.315547    -50.564494    
1709.900000    -57           
</BasePoints>
</Item>
</Trans>
<Trans>
50             mue_b         52             +Free+       
<Item>
<Position>
4713           2797.200000   
</Position>
<BasePoints>
79.400000      -45.900000     0              0              32.454115      -10.197063    
52.600000      -17.200000     78.100000      -26.800000     99.700000      -37.500000    
105.300000     -40.300000     111            -43.500000     130.114077     -55.181969    
159.400000     -73.700000    
</BasePoints>
</Item>
</Trans>
<Trans>
51             beta_b        44             +Free+       
<Item>
<Position>
6422.900000    2740.200000   
</Position>
<BasePoints>
-1048.800000   179.200000     0              0              -30.231294     21.707060     
-99.400000     71.400000      -279.200000    187.500000     -449           187.500000    
-1879.300000   187.500000     -1879.300000   187.500000     -1879.300000   187.500000    
-2027.900000   187.500000     -1973.800000   24.200000      -2012.000000   -119.400000   
-2015.400000   -132.400000    -2020.200000   -146.200000    -2031.719233   -173.258337   
-2046          -204.200000   
</BasePoints>
</Item>
</Trans>
<Trans>
51             mue_b         53             +Free+       
<Item>
<Position>
6422.900000    2740.200000   
</Position>
<BasePoints>
-711.800000    -114.600000    0              0              -36.882794     -4.374240     
-232.100000    -28.800000     -1161.100000   -148.800000    -1252.800000   -236.100000   
-1314.400000   -294.800000    -1356.800000   -549.100000    -1375.273995   -676.509732   
-1381.200000   -713.900000   
</BasePoints>
</Item>
</Trans>
<Trans>
51             mue_a         62             +Free+       
<Item>
<Position>
6422.900000    2740.200000   
</Position>
<BasePoints>
1494.800000    111.100000     0              0              28.459970      23.982002     
62.200000      51.300000      122.200000     91.700000      181.900000     91.700000     
181.900000     91.700000      181.900000     91.700000      453.100000     91.700000     
764            91.700000      841.200000     119.500000     1152.100000    119.500000    
1152.100000    119.500000     1152.100000    119.500000     2797.700000    119.500000    
2835.800000    119.500000     2878.800000    119.500000     2927.851319    119.500000    
2965.700000    119.500000    
</BasePoints>
</Item>
</Trans>
<Trans>
51             beta_a        63             +Free+       
<Item>
<Position>
6422.900000    2740.200000   
</Position>
<BasePoints>
-267.700000    -101.400000    0              0              -29.113392     -23.190322    
-38.900000     -30.500000     -50.500000     -38.000000     -62.100000     -43           
-159.800000    -85.900000     -200.800000    -46.800000     -296.900000    -93           
-380.800000    -133.400000    -460.800000    -209           -515.139535    -265.686853   
-538.600000    -290.300000   
</BasePoints>
</Item>
</Trans>
<Trans>
52             lambda_b      42             +Free+       
<Item>
<Position>
4872.400000    2723.500000   
</Position>
<BasePoints>
-327.400000    -8.500000      0              0              -34.697715     -0.897355     
-126           -3.100000      -387           -6             -601.400000    22.300000     
-604.900000    22.700000      -608.400000    23.300000      -627.203539    27.558247     
-657.300000    34.800000     
</BasePoints>
</Item>
</Trans>
<Trans>
52             alpha_a       53             +Free+       
<Item>
<Position>
4872.400000    2723.500000   
</Position>
<BasePoints>
83.100000      -439.800000    0              0              9.353976       -33.435489    
36.200000      -145.800000    122.800000     -508.300000    159.631034     -660.680523   
169.300000     -697.200000   
</BasePoints>
</Item>
</Trans>
<Trans>
53             lambda_b      44             +Free+       
<Item>
<Position>
5041.700000    2026.300000   
</Position>
<BasePoints>
-328.700000    -89            0              0              -36.914599     -7.973553     
-131.700000    -29.400000     -378.900000    -85.100000     -387.700000    -86.100000    
-408.400000    -88.400000     -417.400000    -97.900000     -434.600000    -86.100000    
-619.500000    41.000000      -655.100000    339.900000     -662.850636    475.754179    
-664.800000    509.700000    
</BasePoints>
</Item>
</Trans>
<Trans>
53             beta_a        54             +Free+       
<Item>
<Position>
5041.700000    2026.300000   
</Position>
<BasePoints>
83.100000      -48.600000     0              0              35.859478      -11.853550    
56.100000      -19.200000     81.600000      -29.300000     103.400000     -40.300000    
109            -43.100000     114.700000     -46.200000     133.745491     -57.950554    
163.100000     -76.400000    
</BasePoints>
</Item>
</Trans>
<Trans>
53             mue_a         55             +Free+       
<Item>
<Position>
5041.700000    2026.300000   
</Position>
<BasePoints>
2268.900000    -439.100000    0              0              7.807505       -36.962111    
26.300000      -137.800000    82.900000      -405.500000    161.700000     -405.500000   
161.700000     -405.500000    161.700000     -405.500000    1474           -405.500000   
1945.000000    -405.500000    2062.300000    -433.300000    2533.300000    -433.300000   
2533.300000    -433.300000    2533.300000    -433.300000    3572.500000    -433.300000   
3724.800000    -433.300000    3758.800000    -486.100000    3911.000000    -486.100000   
3911.000000    -486.100000    3911.000000    -486.100000    4348.300000    -486.100000   
4476.900000    -486.100000    4506.100000    520.900000     4512.016489    785.229988    
4513.700000    823.600000    
</BasePoints>
</Item>
</Trans>
<Trans>
54             lambda_b      45             +Free+       
<Item>
<Position>
5204.800000    1949.900000   
</Position>
<BasePoints>
-332.400000    85.300000      0              0              -34.623156     -2.473083     
-76.500000     -4.100000      -148.100000    -1.900000      -200.900000    26.400000     
-418.700000    143.400000     -580.400000    408.400000     -644.654265    524.401081    
-659.800000    551.400000    
</BasePoints>
</Item>
</Trans>
<Trans>
54             alpha_a       56             +Free+       
<Item>
<Position>
5204.800000    1949.900000   
</Position>
<BasePoints>
83.100000      -28.900000     0              0              34.022894      -6.471213     
58             -11.300000     89.800000      -17.700000     132.192621     -26.074934    
169.300000     -33.300000    
</BasePoints>
</Item>
</Trans>
<Trans>
55             lambda_b      47             +Free+       
<Item>
<Position>
9555.400000    2849.900000   
</Position>
<BasePoints>
92.600000      19.700000      0              0              35.578503      14.429059     
60.800000      25.800000      94.600000      42.400000      121.800000     61.100000     
129.600000     66.500000      137.400000     72.800000      156.229195     90.100901     
181.400000     113.900000    
</BasePoints>
</Item>
</Trans>
<Trans>
55             lambda_a      52             +Free+       
<Item>
<Position>
9555.400000    2849.900000   
</Position>
<BasePoints>
-2334.300000   38.100000      0              0              -28.942747     25.374463     
-67.200000     59.600000      -134.400000    115.300000     -165.400000    115.300000    
-426.400000    115.300000     -426.400000    115.300000     -426.400000    115.300000    
-580.500000    115.300000     -615.100000    62.500000      -769.200000    62.500000     
-1980.400000   62.500000      -1980.400000   62.500000      -1980.400000   62.500000     
-2291.300000   62.500000      -2368.500000   34.800000      -2679.400000   34.800000     
-3133.900000   34.800000      -3133.900000   34.800000      -3133.900000   34.800000     
-3402.400000   34.800000      -3463.900000   -27.700000     -3730.100000   -62.500000    
-3892.500000   -83.700000     -3933          -98.600000     -4096.800000   -98.600000    
-4515.100000   -98.600000     -4515.100000   -98.600000     -4515.100000   -98.600000    
-4555.700000   -98.600000     -4601          -106.700000    -4649.336723   -117.915199   
-4683          -126.400000   
</BasePoints>
</Item>
</Trans>
<Trans>
56             beta_a        57             +Free+       
<Item>
<Position>
5374.100000    1916.600000   
</Position>
<BasePoints>
83.100000      -8.300000      0              0              37.863456      0             
60.100000      0              88.200000      0              128.418136     0             
163.100000     0             
</BasePoints>
</Item>
</Trans>
<Trans>
56             mue_a         58             +Free+       
<Item>
<Position>
5374.100000    1916.600000   
</Position>
<BasePoints>
1847.000000    -204.600000    0              0              13.010224      -35.554659    
33.600000      -90.900000     81.800000      -190.300000    161.700000     -190.300000   
161.700000     -190.300000    161.700000     -190.300000    1672.000000    -190.300000   
1948           -190.300000    2016.300000    -218.100000    2292.300000    -218.100000   
2292.300000    -218.100000    2292.300000    -218.100000    3498.300000    -218.100000   
3586           -218.100000    3630.900000    -106.300000    3654.149645    -21.981756    
3663.700000    15.300000     
</BasePoints>
</Item>
</Trans>
<Trans>
56             lambda_b      59             +Free+       
<Item>
<Position>
5374.100000    1916.600000   
</Position>
<BasePoints>
422.000000     616.700000     0              0              7.079132       37.190367     
19.500000      109.600000     53.900000      271.700000     128.400000     386.100000    
214.800000     518.900000     247.900000     561.300000     392.900000     625.000000    
468.400000     658.200000     714.300000     666.700000     835.239269     668.989630    
869.300000     669.400000    
</BasePoints>
</Item>
</Trans>
<Trans>
57             lambda_b      60             +Free+       
<Item>
<Position>
5537.200000    1916.600000   
</Position>
<BasePoints>
88.800000      141.700000     0              0              11.210329      32.844297     
21.400000      64.600000      38.400000      111.900000     59.600000      150.000000    
83.200000      192.400000     117.600000     236.300000     152.963191     277.213883    
173.900000     300.000000    
</BasePoints>
</Item>
</Trans>
<Trans>
57             alpha_a       73             +Free+       
<Item>
<Position>
5537.200000    1916.600000   
</Position>
<BasePoints>
526.700000     347.200000     0              0              34.293723      4.941459      
121.100000     19.800000      353            71.700000      464.500000     216.700000    
502.700000     266.400000     441.400000     315.300000     489.500000     355.600000    
568.100000     421.200000     888.700000     378.700000     1031.641043    356.086572    
1069           350.000000    
</BasePoints>
</Item>
</Trans>
<Trans>
58             lambda_a      54             +Free+       
<Item>
<Position>
9037.800000    1931.900000   
</Position>
<BasePoints>
-1904.900000   -284.300000    0              0              -5.430018      -38.108857    
-16.300000     -116.700000    -52.600000     -286.100000    -165.400000    -286.100000   
-1462.800000   -286.100000    -1462.800000   -286.100000    -1462.800000   -286.100000   
-1892.900000   -286.100000    -2000.000000   -258.400000    -2430.200000   -258.400000   
-3665.100000   -258.400000    -3665.100000   -258.400000    -3665.100000   -258.400000   
-3769.700000   -258.400000    -3810.300000   -111.400000    -3827.238835   -16.155480    
-3833.000000   18            
</BasePoints>
</Item>
</Trans>
<Trans>
58             lambda_b      61             +Free+       
<Item>
<Position>
9037.800000    1931.900000   
</Position>
<BasePoints>
92.600000      254.700000     0              0              10.288023      37.096238     
40.100000      161.700000     135            558.600000     172.498252     713.716227    
181.500000     747.200000    
</BasePoints>
</Item>
</Trans>
<Trans>
59             alpha_b       51             +Free+       
<Item>
<Position>
6243.400000    2586          
</Position>
<BasePoints>
88.200000      33.400000      0              0              27.518901      20.022713     
37.500000      27.300000      48.600000      35.100000      59             41.700000     
84             57.500000      95             54.300000      117.400000     73.700000     
129.400000     84             140.500000     97.100000      158.840410     123.314956    
179.500000     154.200000    
</BasePoints>
</Item>
</Trans>
<Trans>
59             beta_a        60             +Free+       
<Item>
<Position>
6243.400000    2586          
</Position>
<BasePoints>
-270.900000    -219.500000    0              0              -24.395015     -23.792669    
-64.600000     -64.100000     -152.200000    -146.200000    -241.700000    -191.600000   
-338.100000    -240.500000    -393.400000    -186.300000    -476.400000    -255.500000   
-497.600000    -273.100000    -511.100000    -300.800000    -523.754729    -339.657158   
-532.300000    -369.400000   
</BasePoints>
</Item>
</Trans>
<Trans>
59             mue_a         61             +Free+       
<Item>
<Position>
6243.400000    2586          
</Position>
<BasePoints>
1506.800000    212.500000     0              0              33.402319      6.798702      
57.200000      11.900000      89.200000      18.700000      117.400000     25            
650.800000     144.500000     785.000000     220.900000     1331.600000    220.900000    
1331.600000    220.900000     1331.600000    220.900000     2795.800000    220.900000    
2857.200000    220.900000     2911.900000    170.500000     2954.344021    120.231974    
2975.900000    93.100000     
</BasePoints>
</Item>
</Trans>
<Trans>
60             alpha_b       63             +Free+       
<Item>
<Position>
5711.100000    2216.600000   
</Position>
<BasePoints>
85             170.800000     0              0              3.181265       30.719093     
7.100000       69.800000      19.000000      136.700000     55.900000      179.200000    
61.100000      185.200000     96.500000      201.300000     141.646304     220.447309    
173.200000     233.300000    
</BasePoints>
</Item>
</Trans>
<Trans>
60             alpha_a       64             +Free+       
<Item>
<Position>
5711.100000    2216.600000   
</Position>
<BasePoints>
532.300000     125            0              0              29.223372      10.168944     
84.200000      29.900000      208.300000     72.900000      315.600000     98.600000     
550.600000     154.900000     615.800000     139.300000     857.300000     144.400000    
890.900000     145.200000     901.700000     157            932.900000     144.400000    
979.900000     125.600000     1020.000000    82.900000      1055.133736    37.193339     
1075.300000    9.700000      
</BasePoints>
</Item>
</Trans>
<Trans>
61             lambda_a      45             +Free+       
<Item>
<Position>
9219.300000    2679.100000   
</Position>
<BasePoints>
-2344.700000   -1130.200000   0              0              -3.482863      -34.530103    
-8.700000      -117.300000    -24.800000     -331.400000    -59.700000     -506.900000   
-106.200000    -740.500000    -87.900000     -830.700000    -244.900000    -1009.700000  
-357.000000    -1137.600000   -435.000000    -1138.900000   -605.100000    -1138.900000  
-1820.700000   -1138.900000   -1820.700000   -1138.900000   -1820.700000   -1138.900000  
-2213.300000   -1138.900000   -2311.000000   -1111.100000   -2703.600000   -1111.100000  
-3932.800000   -1111.100000   -3932.800000   -1111.100000   -3932.800000   -1111.100000  
-4392.000000   -1111.100000   -4611.400000   -409           -4665.887032   -207.543484   
-4674.300000   -177.800000   
</BasePoints>
</Item>
</Trans>
<Trans>
61             alpha_b       62             +Free+       
<Item>
<Position>
9219.300000    2679.100000   
</Position>
<BasePoints>
83.100000      55.200000      0              0              24.236209      24.829749     
52.400000      55.400000      99.700000      106.700000     143.124953     153.293059    
169.300000     180.600000    
</BasePoints>
</Item>
</Trans>
<Trans>
62             beta_b        47             +Free+       
<Item>
<Position>
9388.600000    2859.700000   
</Position>
<BasePoints>
166.800000     50             0              0              33.700459      17.246705     
59.200000      30.300000      95.200000      47.300000      128.400000     58.300000     
185.300000     77.100000      253.100000     89.900000      313.897886     99.326346     
348.200000     104.100000    
</BasePoints>
</Item>
</Trans>
<Trans>
62             lambda_a      50             +Free+       
<Item>
<Position>
9388.600000    2859.700000   
</Position>
<BasePoints>
-2343.900000   71.600000      0              0              -36.358276     10.542915     
-129.200000    37.500000      -384.700000    105.500000     -602.400000    105.500000    
-1813.600000   105.500000     -1813.600000   105.500000     -1813.600000   105.500000    
-2124.500000   105.500000     -2201.700000   77.700000      -2512.600000   77.700000     
-2967.100000   77.700000      -2967.100000   77.700000      -2967.100000   77.700000     
-3206.900000   77.700000      -3263          13.800000      -3502.900000   13.800000     
-3852.800000   13.800000      -3852.800000   13.800000      -3852.800000   13.800000     
-3962.400000   13.800000      -3989.800000   12.500000      -4099.400000   12.500000     
-4517.600000   12.500000      -4517.600000   12.500000      -4517.600000   12.500000     
-4561          12.500000      -4605.100000   -11.300000     -4648.499343   -41.938556    
-4675.600000   -62.500000    
</BasePoints>
</Item>
</Trans>
<Trans>
62             mue_b         55             +Free+       
<Item>
<Position>
9388.600000    2859.700000   
</Position>
<BasePoints>
83.100000      -14.400000     0              0              37.788701      -2.176313     
60.200000      -3.500000      88.500000      -5.200000      128.465305     -7.524100     
166.800000     -9.800000     
</BasePoints>
</Item>
</Trans>
<Trans>
63             beta_b        45             +Free+       
<Item>
<Position>
5884.300000    2449.900000   
</Position>
<BasePoints>
-679.500000    37.900000      0              0              -30.241727     15.615009     
-63.800000     32.200000      -120.200000    55.600000      -171.800000    55.600000     
-428.500000    55.600000      -428.500000    55.600000      -428.500000    55.600000     
-575.100000    55.600000      -611.600000    45.900000      -758.100000    45.900000     
-1172.700000   45.900000      -1172.700000   45.900000      -1172.700000   45.900000     
-1213.200000   45.900000      -1259.300000   47.600000      -1308.390137   49.880926     
-1339.300000   51.400000     
</BasePoints>
</Item>
</Trans>
<Trans>
63             mue_b         54             +Free+       
<Item>
<Position>
5884.300000    2449.900000   
</Position>
<BasePoints>
-347.100000    -212.300000    0              0              -33.930692     -3.165546     
-58.300000     -6.600000      -91.100000     -13.300000     -117.300000    -26.400000    
-348.800000    -141.800000    -565.700000    -371.800000    -656.382476    -474.146674   
-679.500000    -500.000000   
</BasePoints>
</Item>
</Trans>
<Trans>
63             alpha_a       66             +Free+       
<Item>
<Position>
5884.300000    2449.900000   
</Position>
<BasePoints>
88.200000      -47.200000     0              0              33.336554      -6.863408     
64.300000      -14.100000     106.400000     -26            117.400000     -38.900000    
160.900000     -89.800000     118.600000     -124.900000    142.400000     -187.500000   
144.100000     -192           146.200000     -196.600000    157.975630     -214.195639   
179.600000     -244.400000   
</BasePoints>
</Item>
</Trans>
<Trans>
64             beta_a        65             +Free+       
<Item>
<Position>
6786.400000    2226.300000   
</Position>
<BasePoints>
88.200000      10.300000      0              0              32.613627      9.685259      
59.800000      18.100000      98.400000      30.100000      143.688028     43.936106     
173.300000     52.800000     
</BasePoints>
</Item>
</Trans>
<Trans>
64             alpha_b       66             +Free+       
<Item>
<Position>
6786.400000    2226.300000   
</Position>
<BasePoints>
-363.500000    -27.900000     0              0              -33.630700     -5.196580     
-42.300000     -6.400000      -51.000000     -7.500000      -59.100000     -8.300000     
-140.500000    -16            -161.200000    -14.400000     -243.000000    -16.600000    
-398.100000    -20.800000     -581.700000    -21.100000     -685.355938    -20.939902    
-722.500000    -20.800000    
</BasePoints>
</Item>
</Trans>
<Trans>
64             mue_a         67             +Free+       
<Item>
<Position>
6786.400000    2226.300000   
</Position>
<BasePoints>
963.800000     -168.400000    0              0              33.107773      -7.807505     
121.400000     -29.600000     373.400000     -91            584.500000     -134.700000   
730.500000     -164.900000    771.800000     -192.000000    918.500000     -165.300000   
1098.300000    -132.500000    1124.700000    -31.900000     1307.500000    -31.900000    
1307.500000    -31.900000     1307.500000    -31.900000     1735.300000    -31.900000    
1828.200000    -31.900000     1879.000000    -149.800000    1905.468302    -234.775641   
1915.300000    -268.000000   
</BasePoints>
</Item>
</Trans>
<Trans>
65             alpha_b       69             +Free+       
<Item>
<Position>
6959.700000    2279.100000   
</Position>
<BasePoints>
-353.500000    45.800000      0              0              -27.759778     13.584572     
-93.900000     45.400000      -266.900000    116.400000     -391.300000    54.200000     
-446.500000    26.600000      -438.900000    -6.500000      -474.600000    -56.900000    
-486.200000    -73.300000     -483.900000    -82            -499.600000    -94.400000    
-549.300000    -133.800000    -620.100000    -155.300000    -682.833203    -168.915128   
-716.300000    -175          
</BasePoints>
</Item>
</Trans>
<Trans>
65             alpha_a       79             +Free+       
<Item>
<Position>
6959.700000    2279.100000   
</Position>
<BasePoints>
85.000000      -1.600000      0              0              30.697532      3.564875      
56.500000      6.700000       93.600000      11.300000      139.363828     16.799330     
173.200000     20.800000     
</BasePoints>
</Item>
</Trans>
<Trans>
66             mue_b         56             +Free+       
<Item>
<Position>
6063.900000    2205.500000   
</Position>
<BasePoints>
-352.800000    -323.200000    0              0              -7.992142      -36.364245    
-15.700000     -69.800000     -31.600000     -118.600000    -62.200000     -150          
-207.700000    -298.900000    -288.200000    -293.900000    -492.100000    -336.100000   
-543.500000    -346.800000    -602.000000    -328.800000    -655.678310    -305.286924   
-689.800000    -288.900000   
</BasePoints>
</Item>
</Trans>
<Trans>
66             beta_b        59             +Free+       
<Item>
<Position>
6063.900000    2205.500000   
</Position>
<BasePoints>
91.300000      100.100000     0              0              21.578489      30.347829     
27.100000      39.200000      32.600000      48.300000      37.100000      56.900000     
87.600000      152.600000     135.500000     270.100000     166.586549     348.993884    
179.500000     380.500000    
</BasePoints>
</Item>
</Trans>
<Trans>
66             mue_a         68             +Free+       
<Item>
<Position>
6063.900000    2205.500000   
</Position>
<BasePoints>
1424.300000    468            0              0              32.746505      17.556861     
163.600000     89.600000      671.600000     358.200000     1128.100000    447.200000    
1243.200000    469.700000     1273.300000    468.400000     1390.300000    476.400000    
1558.300000    487.900000     1600.300000    495.800000     1768.700000    495.800000    
1768.700000    495.800000     1768.700000    495.800000     2639.200000    495.800000    
2677.800000    495.800000     2721.100000    489.900000     2769.985073    480.925315    
2807.100000    473.600000    
</BasePoints>
</Item>
</Trans>
<Trans>
66             beta_a        69             +Free+       
<Item>
<Position>
6063.900000    2205.500000   
</Position>
<BasePoints>
91.300000      -57            0              0              35.662503      -10.413844    
60.900000      -18.900000     94.000000      -31.900000     120.500000     -48.600000    
128.500000     -53.700000     136.500000     -60            155.151365     -77.530130    
179.500000     -101.400000   
</BasePoints>
</Item>
</Trans>
<Trans>
67             lambda_a      60             +Free+       
<Item>
<Position>
8701.700000    1958.300000   
</Position>
<BasePoints>
-1480.600000   -139.400000    0              0              -20.101932     -28.221924    
-30.900000     -43.300000     -44.900000     -61.100000     -59.700000     -75           
-92.400000     -105.800000    -100.700000    -117.000000    -143.000000    -132.000000   
-336.800000    -200.600000    -399.500000    -154.200000    -605.000000    -154.200000   
-952.800000    -154.200000    -952.800000    -154.200000    -952.800000    -154.200000   
-1265.400000   -154.200000    -1343.000000   -126.400000    -1655.600000   -126.400000   
-2371.500000   -126.400000    -2371.500000   -126.400000    -2371.500000   -126.400000   
-2634.500000   -126.400000    -2878.200000   127.900000     -2970.395629   234.915925    
-2990.600000   258.300000    
</BasePoints>
</Item>
</Trans>
<Trans>
67             alpha_b       68             +Free+       
<Item>
<Position>
8701.700000    1958.300000   
</Position>
<BasePoints>
83.100000      245.400000     0              0              9.118948       33.502221     
35.800000      149.200000     123.400000     528.200000     159.909277     684.210962    
169.300000     720.800000    
</BasePoints>
</Item>
</Trans>
<Trans>
68             mue_b         58             +Free+       
<Item>
<Position>
8871           2679.100000   
</Position>
<BasePoints>
83.100000      -470.800000    0              0              9.416305       -36.674028    
36.400000      -159.400000    122.300000     -550.800000    157.654242     -709.843097   
166.800000     -747.200000   
</BasePoints>
</Item>
</Trans>
<Trans>
68             beta_b        61             +Free+       
<Item>
<Position>
8871           2679.100000   
</Position>
<BasePoints>
166.800000     -8.300000      0              0              37.836255      0             
100.900000     0              227.500000     0              313.656911     0             
348.300000     0             
</BasePoints>
</Item>
</Trans>
<Trans>
68             lambda_a      63             +Free+       
<Item>
<Position>
8871           2679.100000   
</Position>
<BasePoints>
-1471          59.400000      0              0              -30.538215     22.236564     
-62.900000     44.600000      -116.200000    75             -167.900000    75            
-1296          75             -1296          75             -1296          75            
-1926.100000   75             -2063          -110.700000    -2686.600000   -201.400000   
-2774.100000   -214.100000    -2876.800000   -222.200000    -2952.686235   -227.183374   
-2986.700000   -229.200000   
</BasePoints>
</Item>
</Trans>
<Trans>
69             mue_b         57             +Free+       
<Item>
<Position>
6243.400000    2104.100000   
</Position>
<BasePoints>
-359.100000    -213.900000    0              0              -12.005550     -31.849433    
-33.500000     -89.900000     -87.800000     -205.600000    -178.100000    -205.600000   
-533.700000    -205.600000    -533.700000    -205.600000    -533.700000    -205.600000   
-575.100000    -205.600000    -621.700000    -200.300000    -671.926158    -192.872289   
-706.200000    -187.500000   
</BasePoints>
</Item>
</Trans>
<Trans>
69             beta_b        60             +Free+       
<Item>
<Position>
6243.400000    2104.100000   
</Position>
<BasePoints>
-270.900000    42.700000      0              0              -33.402319     6.798702      
-124.800000    26.200000      -382.200000    80.900000      -501.984558    106.225562    
-532.300000    112.500000    
</BasePoints>
</Item>
</Trans>
<Trans>
69             alpha_a       70             +Free+       
<Item>
<Position>
6243.400000    2104.100000   
</Position>
<BasePoints>
88.200000      -33.500000     0              0              33.369931      -7.009660     
60             -12.900000     97.300000      -21.100000     143.120491     -31.064413    
179.500000     -38.900000    
</BasePoints>
</Item>
</Trans>
<Trans>
70             beta_b        64             +Free+       
<Item>
<Position>
6422.900000    2065.200000   
</Position>
<BasePoints>
183.300000     29.200000      0              0              36.474112      7.059505      
96.200000      20.200000      216.200000     51.300000      304.400000     105.600000    
313.200000     110.900000     321.600000     117.800000     340.107623     136.343637    
363.500000     161.100000    
</BasePoints>
</Item>
</Trans>
<Trans>
70             beta_a        71             +Free+       
<Item>
<Position>
6422.900000    2065.200000   
</Position>
<BasePoints>
536.800000     -65.200000     0              0              32.967585      -17.283006    
68.200000      -34.900000     127.500000     -59.700000     181.900000     -59.700000    
181.900000     -59.700000     181.900000     -59.700000     453.100000     -59.700000    
680            -59.700000     927.400000     77.400000      1036.368897    144.512104    
1065.300000    162.500000    
</BasePoints>
</Item>
</Trans>
<Trans>
70             mue_a         72             +Free+       
<Item>
<Position>
6422.900000    2065.200000   
</Position>
<BasePoints>
977.100000     -144.700000    0              0              23.155000      -29.165446    
54.400000      -67.400000     114.400000     -127.800000    181.900000     -127.800000   
181.900000     -127.800000    181.900000     -127.800000    799.600000     -127.800000   
1033.900000    -127.800000    1091.700000    -155.500000    1326.000000    -155.500000   
1326.000000    -155.500000    1326.000000    -155.500000    1762.600000    -155.500000   
1801           -155.500000    1844.300000    -153.700000    1892.723040    -150.934531   
1930.500000    -148.600000   
</BasePoints>
</Item>
</Trans>
<Trans>
70             mue_b         73             +Free+       
<Item>
<Position>
6422.900000    2065.200000   
</Position>
<BasePoints>
91.400000      88.900000      0              0              18.399734      32.347920     
29.700000      52.400000      45.300000      77.400000      62.200000      97.200000     
85.400000      124.400000     115.700000     150.700000     152.654324     179.196073    
183.300000     201.400000    
</BasePoints>
</Item>
</Trans>
<Trans>
71             beta_b        65             +Free+       
<Item>
<Position>
7488.200000    2227.700000   
</Position>
<BasePoints>
-267.100000    4.600000       0              0              -33.992358     1.375413      
-101.800000    4.300000       -258.300000    12.100000      -389.300000    25            
-426.500000    28.700000      -436           28.600000      -472.600000    36.100000     
-476.100000    36.800000      -479.600000    37.600000      -498.758137    42.930463     
-528.500000    51.400000     
</BasePoints>
</Item>
</Trans>
<Trans>
71             mue_b         74             +Free+       
<Item>
<Position>
7488.200000    2227.700000   
</Position>
<BasePoints>
345.800000     42.900000      0              0              33.894978      3.448617      
109.800000     12.300000      300            38.500000      449.800000     93.100000     
498.700000     110.900000     510.600000     118.300000     552.900000     148.600000    
592.800000     177.200000     633.300000     216.200000     671.756061     255.701563    
695.900000     280.600000    
</BasePoints>
</Item>
</Trans>
<Trans>
71             alpha_a       84             +Free+       
<Item>
<Position>
7488.200000    2227.700000   
</Position>
<BasePoints>
88.200000      43.100000      0              0              24.459001      23.666807     
34.700000      33.300000      46.900000      43.600000      59.100000      51.400000     
80.800000      65.300000      107.000000     77             144.339861     90.906699     
179.600000     102.800000    
</BasePoints>
</Item>
</Trans>
<Trans>
72             beta_b        67             +Free+       
<Item>
<Position>
8353.400000    1916.600000   
</Position>
<BasePoints>
166.900000     20.800000      0              0              36.592130      9.771196      
62.000000      16.400000      97.100000      24.700000      128.400000     29.200000     
186            37.400000      252.700000     40.200000      313.651740     41.360976     
348.300000     41.700000     
</BasePoints>
</Item>
</Trans>
<Trans>
72             lambda_a      69             +Free+       
<Item>
<Position>
8353.400000    1916.600000   
</Position>
<BasePoints>
-1042.800000   -50.500000     0              0              -32.845139     -18.641836    
-66.000000     -36.400000     -118.800000    -59.700000     -167.900000    -59.700000    
-604.500000    -59.700000     -604.500000    -59.700000     -604.500000    -59.700000    
-917.100000    -59.700000     -994.700000    -31.900000     -1307.300000   -31.900000    
-1931.900000   -31.900000     -1931.900000   -31.900000     -1931.900000   -31.900000    
-2019.300000   -31.900000     -2070.800000   75.100000      -2099.145932   155.207462    
-2110.000000   187.500000    
</BasePoints>
</Item>
</Trans>
<Trans>
72             mue_b         75             +Free+       
<Item>
<Position>
8353.400000    1916.600000   
</Position>
<BasePoints>
83.100000      -32.400000     0              0              36.924125      -8.391847     
59.700000      -13.800000     88.700000      -20.700000     129.476133     -30.296008    
166.900000     -38.900000    
</BasePoints>
</Item>
</Trans>
<Trans>
73             lambda_b      64             +Free+       
<Item>
<Position>
6606.200000    2266.600000   
</Position>
<BasePoints>
92             -34.400000     0              0              36.936062      -8.020968     
64.300000      -14.300000     101.500000     -22.700000     146.906291     -32.908932    
180.200000     -40.300000    
</BasePoints>
</Item>
</Trans>
<Trans>
73             beta_a        74             +Free+       
<Item>
<Position>
6606.200000    2266.600000   
</Position>
<BasePoints>
793.800000     386.500000     0              0              27.935486      25.450122     
90.000000      83.500000      249.800000     225            409.400000     300           
821.900000     494.000000     983.600000     343.400000     1434.900000    279.200000    
1472.100000    273.900000     1482.100000    275.500000     1518.200000    265.300000    
1522.300000    264.100000     1526.500000    262.800000     1545.896128    254.989743    
1577.900000    241.700000    
</BasePoints>
</Item>
</Trans>
<Trans>
73             mue_a         75             +Free+       
<Item>
<Position>
6606.200000    2266.600000   
</Position>
<BasePoints>
970.200000     -265           0              0              17.672242      -33.468659    
40.500000      -75.900000     85.100000      -145.900000    146.100000     -177.800000   
469.900000     -346.700000    1440.900000    -177.700000    1785.000000    -300.000000   
1817.700000    -311.600000    1849.800000    -334.000000    1885.216613    -363.582463   
1914.100000    -388.900000   
</BasePoints>
</Item>
</Trans>
<Trans>
74             lambda_b      65             +Free+       
<Item>
<Position>
8184.100000    2508.300000   
</Position>
<BasePoints>
-607.700000    58.300000      0              0              -34.289106     5.320723      
-142.700000    22.400000      -491.800000    73.600000      -782.700000    73.600000     
-1052.600000   73.600000      -1052.600000   73.600000      -1052.600000   73.600000     
-1168.500000   73.600000      -1206.500000   -97.100000     -1220.365467   -198.550566   
-1224.400000   -229.200000   
</BasePoints>
</Item>
</Trans>
<Trans>
74             alpha_a       76             +Free+       
<Item>
<Position>
8184.100000    2508.300000   
</Position>
<BasePoints>
-182.000000    -20.900000     0              0              -34.722079     -0.197847     
-78.300000     -0.800000      -155.600000    -3.300000      -221.100000    -12.500000    
-246.700000    -16.200000     -274.700000    -22.300000     -313.553791    -32.089960    
-350.100000    -41.700000    
</BasePoints>
</Item>
</Trans>
<Trans>
75             lambda_a      57             +Free+       
<Item>
<Position>
8520.300000    1877.700000   
</Position>
<BasePoints>
-1475.600000   -106.900000    0              0              -34.423284     -17.063691    
-105           -51.900000     -273.300000    -126.400000    -423.600000    -126.400000   
-771.400000    -126.400000    -771.400000    -126.400000    -771.400000    -126.400000   
-1084.000000   -126.400000    -1161.600000   -98.600000     -1474.200000   -98.600000    
-2725.600000   -98.600000     -2725.600000   -98.600000     -2725.600000   -98.600000    
-2812.700000   -98.600000     -2898.800000   -36.100000     -2957.526854   15.509095     
-2983.100000   38.900000     
</BasePoints>
</Item>
</Trans>
<Trans>
75             lambda_b      67             +Free+       
<Item>
<Position>
8520.300000    1877.700000   
</Position>
<BasePoints>
92.600000      20             0              0              35.241137      15.258034     
64             28.300000      104.200000     46.400000      149.666957     66.716794     
181.400000     80.600000     
</BasePoints>
</Item>
</Trans>
<Trans>
76             beta_a        77             +Free+       
<Item>
<Position>
7834           2466.600000   
</Position>
<BasePoints>
83.700000      -32.400000     0              0              36.837038      -8.318041     
59.800000      -13.700000     89.200000      -20.700000     130.005723     -30.174495    
168.100000     -38.900000    
</BasePoints>
</Item>
</Trans>
<Trans>
76             mue_a         78             +Free+       
<Item>
<Position>
7834           2466.600000   
</Position>
<BasePoints>
83.700000      -147.700000    0              0              23.971489      -29.178411    
29.200000      -36.200000     34.100000      -43.300000     38.400000      -50           
50.900000      -69.600000     49.300000      -77.400000     63.400000      -95.800000    
81.400000      -119.300000    105            -142.300000    138.021004     -170.476706   
168.100000     -194.400000   
</BasePoints>
</Item>
</Trans>
<Trans>
76             lambda_b      79             +Free+       
<Item>
<Position>
7834           2466.600000   
</Position>
<BasePoints>
-345.800000    6.800000       0              0              -37.442127     5.616319      
-129.100000    18.400000      -372.200000    43             -558.700000    -22.200000    
-609.500000    -40            -650           -88.300000     -682.996115    -137.882954   
-701.100000    -166.700000   
</BasePoints>
</Item>
</Trans>
<Trans>
77             lambda_b      80             +Free+       
<Item>
<Position>
8002.100000    2427.700000   
</Position>
<BasePoints>
-334.300000    82.100000      0              0              -28.771319     26.505085     
-53.500000     48.300000      -90.900000     76.800000      -129.700000    88.900000     
-162.300000    99.100000      -172.400000    89.900000      -206.500000    88.900000     
-358.500000    84.300000      -404.300000    117.800000     -547.900000    68.100000     
-587.600000    54.300000      -626.400000    26.200000      -665.145976    -7.051144     
-691.500000    -30.500000    
</BasePoints>
</Item>
</Trans>
<Trans>
78             lambda_a      74             +Free+       
<Item>
<Position>
8002.100000    2272.200000   
</Position>
<BasePoints>
93.200000      11.400000      0              0              37.308355      9.056382      
64.700000      17.700000      100.200000     33.000000      122.300000     58.300000     
153.600000     94.000000      168.200000     146.900000     177.157846     201.727528    
182.000000     236.100000    
</BasePoints>
</Item>
</Trans>
<Trans>
78             lambda_b      81             +Free+       
<Item>
<Position>
8002.100000    2272.200000   
</Position>
<BasePoints>
93.200000      -113.900000    0              0              31.339775      -22.203101    
57.700000      -42.700000     94.900000      -73.700000     122.300000     -105.600000   
134.900000     -120.200000    146.700000     -137.700000    164.490869     -167.342971   
182.000000     -197.300000   
</BasePoints>
</Item>
</Trans>
<Trans>
79             alpha_b       70             +Free+       
<Item>
<Position>
7132.900000    2299.900000   
</Position>
<BasePoints>
-346.500000    -197.600000    0              0              -28.744509     -18.337014    
-38.300000     -24.400000     -49            -30.800000     -59.000000     -36.100000    
-243.100000    -132.200000    -287.000000    -170.800000    -488.900000    -219.400000   
-545.200000    -233           -611.700000    -235.800000    -672.815308    -235.537179   
-710           -234.700000   
</BasePoints>
</Item>
</Trans>
<Trans>
79             beta_a        80             +Free+       
<Item>
<Position>
7132.900000    2299.900000   
</Position>
<BasePoints>
88.200000      43.100000      0              0              24.335132      23.840516     
34.500000      33.500000      46.700000      43.900000      59.100000      51.400000     
80.300000      64.500000      106            75             143.766176     87.371466     
177.700000     97.300000     
</BasePoints>
</Item>
</Trans>
<Trans>
79             mue_a         81             +Free+       
<Item>
<Position>
7132.900000    2299.900000   
</Position>
<BasePoints>
534.900000     -175           0              0              31.230019      -13.539597    
87.600000      -38.500000     211.700000     -91.000000     321.300000     -119.400000   
542.700000     -176.700000    603.700000     -163.800000    830.100000     -195.800000   
888.800000     -204.100000    956.400000     -213           1016.767450    -220.678784   
1051.200000    -225          
</BasePoints>
</Item>
</Trans>
<Trans>
80             alpha_b       71             +Free+       
<Item>
<Position>
7310.600000    2397.200000   
</Position>
<BasePoints>
89.400000      -43.100000     0              0              35.192747      -2.385949     
61             -5.900000      95.600000      -14.300000     118.600000     -34.800000    
143.600000     -57            158.100000     -92.000000     169.984007     -136.316032   
177.600000     -169.500000   
</BasePoints>
</Item>
</Trans>
<Trans>
81             lambda_a      65             +Free+       
<Item>
<Position>
8184.100000    2074.900000   
</Position>
<BasePoints>
-607.700000    1              0              0              -34.295173     -5.451545     
-42.800000     -6.700000      -51.500000     -7.700000      -59.700000     -8.300000     
-85.500000     -10.100000     -92.100000     -9.600000      -118.000000    -8.300000     
-590.600000    15.800000      -735.200000    -24.800000     -1168.500000   165.300000    
-1174.800000   168.000000     -1181.000000   171.600000     -1199.852638   185.347626    
-1224.400000   204.200000    
</BasePoints>
</Item>
</Trans>
<Trans>
81             alpha_b       72             +Free+       
<Item>
<Position>
8184.100000    2074.900000   
</Position>
<BasePoints>
83.100000      -106.300000    0              0              25.797049      -23.118124    
53.200000      -49.300000     97.600000      -91.400000     141.459441     -132.767829   
169.300000     -158.300000   
</BasePoints>
</Item>
</Trans>
<Trans>
84             mue_b         76             +Free+       
<Item>
<Position>
7667.800000    2330.500000   
</Position>
<BasePoints>
82.400000      43.500000      0              0              29.055777      23.126027     
55.600000      45.200000      95.000000      78             136.700015     112.400971    
166.200000     136.100000    
</BasePoints>
</Item>
</Trans>
<Trans>
84             beta_b        79             +Free+       
<Item>
<Position>
7667.800000    2330.500000   
</Position>
<BasePoints>
-267.800000    -25            0              0              -37.171091     -2.065061     
-131.100000    -7.500000      -378.700000    -21.700000     -500.923057    -28.644977    
-534.900000    -30.600000    
</BasePoints>
</Item>
</Trans>
<Trans>
84             beta_a        85             +Free+       
<Item>
<Position>
7667.800000    2330.500000   
</Position>
<BasePoints>
82.400000      -0.400000      0              0              36.936062      3.960972      
56.800000      6.600000       81.200000      10.300000      102.800000     15.300000     
106.600000     16.200000      110.600000     17.200000      129.524504     22.995054     
166.200000     34.700000     
</BasePoints>
</Item>
</Trans>
<Trans>
84             mue_a         86             +Free+       
<Item>
<Position>
7667.800000    2330.500000   
</Position>
<BasePoints>
82.400000      -90.900000     0              0              29.362510      -22.859404    
55.800000      -44.400000     94.500000      -76            136.453734     -109.867800   
166.200000     -133.300000   
</BasePoints>
</Item>
</Trans>
<Trans>
85             mue_b         77             +Free+       
<Item>
<Position>
7834           2365.200000   
</Position>
<BasePoints>
83.700000      15.500000      0              0              36.150547      13.208854     
59.600000      22.000000      90.400000      33.700000      131.384191     48.988016     
168.100000     62.500000     
</BasePoints>
</Item>
</Trans>
<Trans>
85             beta_b        80             +Free+       
<Item>
<Position>
7834           2365.200000   
</Position>
<BasePoints>
-257.600000    35.300000      0              0              -34.876552     16.111985     
-44.400000     19.900000      -54.100000     23.100000      -63.400000     25            
-209.800000    54.500000      -387.800000    44.500000      -488.291448    35.517753     
-523.400000    32            
</BasePoints>
</Item>
</Trans>
<Trans>
86             lambda_a      71             +Free+       
<Item>
<Position>
7834           2197.200000   
</Position>
<BasePoints>
-166.200000    3.400000       0              0              -37.627379     3.143802      
-100.600000    8.800000       -226.700000    20             -311.836724    27.567428     
-345.800000    30.500000     
</BasePoints>
</Item>
</Trans>
<Trans>
86             mue_b         78             +Free+       
<Item>
<Position>
7834           2197.200000   
</Position>
<BasePoints>
83.700000      20.200000      0              0              34.650504      15.061156     
59.000000      26.100000      91.200000      40.700000      132.909821     59.468748     
168.100000     75            
</BasePoints>
</Item>
</Trans>
<Trans>
86             beta_b        81             +Free+       
<Item>
<Position>
7834           2197.200000   
</Position>
<BasePoints>
168.100000     -79.600000     0              0              35.759868      -12.152379    
98.600000      -34.300000     231.100000     -80.900000     317.324031     -111.080011   
350.100000     -122.300000   
</BasePoints>
</Item>
</Trans>
</TransRel>
</GraphData>
</VioModels>
<VioLayout>
0             =BAAAAAAAAADgCVeABwAAgKAAV4AHAACAYAJXgAcAAIBgBg===  1              150            338            0.100000       0             
300           
</VioLayout>
</VioSystem>
</Value>
</Variable>
</VariablePool>

<Functions>
<WspLuaFunction>
BufferModel  
<VioLuaFunctionDefinition>
<LuaFunctionDefinition name="CoreFaudes::BufferModel">
<VariantSignatures>
<Signature name="BigBuffer">
<Parameter name="Size" ftype="Integer" access="In"/>
<Parameter name="Buffer" ftype="Generator" access="Out"/>
</Signature>
</VariantSignatures>

<LuaCode>
<![CDATA[
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
end
]]>
</LuaCode>
</LuaFunctionDefinition>
<VioLayout>
1              178            342            4294967295    
</VioLayout>
</VioLuaFunctionDefinition>
</WspLuaFunction>
</Functions>

<Script>
<BufferModel>
AnonymousOperation_1458777923  0             
<Parameters>
BufferSize    BufferAB     
</Parameters>
<Options>
"Clear Arguments"  0              "Minimal Realisation"  0              "Clear State Names"  0             
</Options>
</BufferModel>
<Parallel>
AnonymousOperation_16807  0             
<Parameters>
MachineA      MachineB      PlantAB      
</Parameters>
<Options>
"Clear Arguments"  0              "Minimal Realisation"  0              "Clear State Names"  0             
</Options>
</Parallel>
<InvProject>
AnonymousOperation_282475249  1             
<Parameters>
BufferAB      Sigma         FullBufferAB 
</Parameters>
<Options>
"Clear Arguments"  0              "Minimal Realisation"  0              "Clear State Names"  0             
</Options>
</InvProject>
<SupCon>
SupCon_4      0             
<Parameters>
PlantAB       FullBufferAB  SuperAB      
</Parameters>
<Options>
"Clear Arguments"  0              "Minimal Realisation"  0              "Clear State Names"  0             
</Options>
</SupCon>
</Script>

<Simulator>

 +Supervisor+  +Plant+      
<DevFile>
""           
</DevFile>
<SimEvents>
beta_a       
<Stochastic>
+Trigger+     +Gauss+      
<Parameter>
0              inf            10             5             
</Parameter>
</Stochastic>
alpha_b      
<Priority>
0             
</Priority>
alpha_a      
<Priority>
0             
</Priority>
mue_a        
<Stochastic>
+Delay+       +Exponential+ 
<Parameter>
0              inf            30            
</Parameter>
</Stochastic>
lambda_a     
<Stochastic>
+Extern+      +Gauss+      
<Parameter>
0              20             10             5             
</Parameter>
</Stochastic>
beta_b       
<Stochastic>
+Trigger+     +Gauss+      
<Parameter>
0              inf            20             5             
</Parameter>
</Stochastic>
mue_b        
<Stochastic>
+Delay+       +Exponential+ 
<Parameter>
0              inf            50            
</Parameter>
</Stochastic>
lambda_b     
<Stochastic>
+Trigger+     +Gauss+      
<Parameter>
0              inf            10             5             
</Parameter>
</Stochastic>
</SimEvents>
<Conditions>
downA        
<EventCondition>
+Enabled+    
<StartEvents>
mue_a        
</StartEvents>
<StopEvents>
lambda_a     
</StopEvents>
</EventCondition>
downB        
<EventCondition>
+Enabled+    
<StartEvents>
mue_b        
</StartEvents>
<StopEvents>
lambda_b     
</StopEvents>
</EventCondition>
perfB        
<EventCondition>
+Enabled+    
<StartEvents>
alpha_b      
</StartEvents>
<StopEvents>
beta_b       
</StopEvents>
</EventCondition>
</Conditions>
</Simulator>
<GuiState/>
</Project>
