<Project application="DESTool" version="0.85">

<VariablePool>
<Variable>
MachineA      System        +Visual+      +Shown+       +Plant+      
<File>
MachineA.vio 
</File>
</Variable>
<Variable>
MachineB      System        +Visual+      +Shown+       +Plant+      
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
-30.028781     0             
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
-30.028781     0             
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
-30.028781     0             
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
-30.028781     0             
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
-30.028781     0             
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
-30.028781     0             
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
-30.028781     0             
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
-30.028781     0             
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
-30.028781     0             
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
-30.028781     0             
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
62.500000      11.100000      0              0              30.055092      0             
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
-62.500000     -16.700000     0              0              -24.000831     -18.054678    
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
62.500012      11.100000      0              0              30.055092      0             
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
-62.500000     -16.700000     0              0              -24.000844     -18.054678    
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
62.500000      11.100000      0              0              30.055079      0             
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
-62.499976     -16.700000     0              0              -25.163754     -16.313800    
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
62.500000      11.100000      0              0              30.055132      0             
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
-62.500000     -16.700000     0              0              -24.000792     -18.054678    
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
62.500000      11.100000      0              0              30.055132      0             
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
-62.500000     -16.700000     0              0              -24.000792     -18.054678    
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
62.500000      11.100000      0              0              30.055132      0             
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
-62.500000     -16.700000     0              0              -24.000792     -18.054678    
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
62.500000      11.100000      0              0              30.055079      0             
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
-62.500000     -16.700000     0              0              -25.163779     -16.313800    
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
62.500000      11.100000      0              0              30.055079      0             
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
-62.500000     -16.700000     0              0              -25.163779     -16.313800    
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
62.500000      11.100000      0              0              30.055079      0             
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
-69.400024     -16.700000     0              0              -25.003487     -16.668971    
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
0             =/////7RkAADgSlornH0AALAUR1WyZAAAAO0tVbJkAAAAAA===  0              150            845            0.938037       0             
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
0              0              25.000000      25             -77.083560     0             
-24.999929     0             
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
-25.024366     0             
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
-25.024366     0             
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
-26.136560     0             
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
-25.024366     0             
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
-26.956072     0             
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
-27.775583     0             
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
-25.024366     0             
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
-26.956072     0             
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
73.612000      34.030000      0              0              20.158896      14.847546     
45.652000      35             90.932000      70.800000      132.098808     102.950449    
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
298.612000     -13.200000     0              0              24.985992      -0.424965     
119.522000     -2.120000      465.902000     -8.340000      596.984170     -10.675882    
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
-78.470000     -32.640000     0              0              -24.973957     -0.502039     
-47.430000     -2.140000      -79.990000     -7.630000      -102.080000    -25           
-119.950000    -39.050000     -131.949000    -61.500000     -144.100118    -94.338159    
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
308.230000     -39.580000     0              0              23.956123      -7.132052     
33.480000      -9.810000      44.600000      -12.500000     54.860000      -13.890000    
254.800000     -40.900000     497.430000     -30.430000     604.669875     -23.926148    
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
75.700000      32.640000      0              0              19.933045      15.164942     
30.170000      23.200000      42.880000      32.700000      54.860000      40.280000     
72.680000      51.540000      93.460000      62.550000      123.780197     77.116010     
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
-323.400000    -67.364000     0              0              -21.423833     -12.884124    
-50.870000     -30.527000     -107.550000    -59.726000     -160.310000    -59.726000    
-471.320000    -59.726000     -471.320000    -59.726000     -471.320000    -59.726000    
-516.250000    -59.726000     -562.090000    -33.211000     -602.137082    -4.060425     
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
79.870000      38.190000      0              0              17.784764      17.557008     
26.940000      26.770000      38.520000      37.570000      50             45.830000     
74.440000      63.410000      83.460000      63.060000      109.730000     77.770000     
114.940000     80.690000      120.420000     83.830000      138.106760     93.965490     
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
79.870000      -28.480000     0              0              23.282670      -9.228986     
31.490000      -12.220000     41.030000      -15.170000     50             -16.670000    
76.190000      -21.030000     84.330000      -24.390000     109.730000     -16.670000    
116.580000     -14.590000     123.350000     -11.210000     141.065443     1.432258      
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
-322.590000    20.140000      0              0              -25.294630     6.876696      
-56.030000     15.090000      -111.280000    27.780000      -159.500000    27.780000     
-485.680000    27.780000      -485.680000    27.780000      -485.680000    27.780000     
-521.620000    27.780000      -562.580000    26.020000      -605.885136    23.661725     
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
-81.020000     -107.640000    0              0              -11.238019     -23.623792    
-19.530000     -40.710000     -32.930000     -62.980000     -51.160000     -76.390000    
-71.630000     -91.440000     -99.250000     -99.080000     -136.007351    -104.427749   
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
74.770000      31.250000      0              0              18.832609      18.218071     
27.820000      26.280000      39.160000      34.670000      51.160000      38.890000     
70.420000      45.670000      93.060000      46.550000      126.470806     43.673119     
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
-160.890000    71.530000      0              0              -17.364562     19.623448     
-26.390000     29.430000      -38.300000     40.470000      -51.160000     47.220000     
-126.190000    86.620000      -226.450000    98.760000      -295.616414    103.080092    
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
-404.430000    -138.191100    0              0              -13.653294     -20.990439    
-36.960000     -57.878000     -91.510000     -130.552000    -159.500000    -130.552000   
-632.210000    -130.552000    -632.210000    -130.552000    -632.210000    -130.552000   
-689.610000    -130.552000    -736.550000    -75.556000     -769.366756    -26.554282    
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
74.770000      74.310000      0              0              10.729014      22.565861     
19.140000      40.580000      32.930000      65.380000      51.160000      81.950000     
69.140000      98.280000      93.600000      110.260000     127.486356     122.494915    
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
-393.970000    203.470000     0              0              -12.923890     23.670602     
-41.970000     79.020000      -122.710000    211.110000     -232.860000    211.110000    
-638.900000    211.110000     -638.900000    211.110000     -638.900000    211.110000    
-740.430000    211.110000     -694.490000    96.020000      -754.180000    13.890000     
-754.940000    12.840000      -755.730000    11.780000      -766.744498    0.047113      
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
-78.450000     -103.470000    0              0              -16.672482     -21.188975    
-26.890000     -34.510000     -40.660000     -51.100000     -54.840000     -63.890000    
-73.640000     -80.870000     -81.170000     -81.490000     -102.060000    -95.830000    
-107.940000    -99.870000     -114.190000    -104.200000    -132.445265    -116.611609   
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
75.700000      14.580000      0              0              25.224170      9.715247      
48.600000      19.230000      83.500000      33.450000      123.509688     49.542201     
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
-149.400000    -165.970000    0              0              -18.155997     -21.090399    
-28.100000     -32.960000     -40.500000     -47.000000     -52.800000     -58.330000    
-114.500000    -115.090000    -127.600000    -136.770000    -204.240000    -170.830000   
-222.930000    -179.150000    -245.240000    -183.930000    -277.701895    -187.972768   
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
-383.640000    90.970000      0              0              -18.050032     21.107687     
-43.300000     50.400000      -93.100000     98.610000      -148.000000    98.610000     
-626.600000    98.610000      -626.600000    98.610000      -626.600000    98.610000     
-678.180000    98.610000      -728.560000    62.510000      -768.593142    26.767880     
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
-146.530000    -42.360000     0              0              -24.951196     -1.437189     
-59.560000     -4.250000      -125.330000    -12.320000     -176.390000    -34.720000    
-212.800000    -50.690000     -224.080000    -56.220000     -248.610000    -87.500000    
-267.250000    -111.260000    -279.821000    -143.170000    -291.534472    -181.522968   
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
79.860000      -11.800000     0              0              24.982015      -0.821970     
50.630000      -1.720000      90.370000      -3.110000      134.703185     -4.639045     
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
81.840000      -149.310000    0              0              17.125737      -20.917083    
45.340000      -58.390000     104.190000     -136.550000    146.098885     -191.545495   
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
322.590000     -7.640000      0              0              26.908306      1.666886      
35.080000      2.130000       43.890000      2.550000       51.980000      2.780000      
78.520000      3.500000       85.160000      2.960000       111.700000     2.780000      
286.990000     1.590000       496.010000     -1.890000      597.372141     -3.684151     
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
-81.840000     15.970000      0              0              -23.670602     12.953714     
-32.330000     17.280000      -42.330000     21.470000      -51.980000     23.610000     
-77.890000     29.360000      -85.580000     28.300000      -111.700000    23.610000     
-116.220000    22.800000      -120.870000    21.590000      -138.509827    14.898918     
-161.700000    5.550000      
</BasePoints>
</Item>
</Trans>
</TransRel>
</GraphData>
</VioModels>
<VioLayout>
0             =AQAAAC4BAAD0AQAAAAAAABgAAAAAAAAAPABwAD4AUwB5AA===  0              150            726            0.612336       0             
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
<States/>
<TransRel/>
</GraphData>
</VioModels>
<VioLayout>
0             =AQAAAAcAAAAIAAAAAAAAABgAAAAAAAAAXwBsAGEAeQBvAA===  1              150            338            0.100000       0             
300           
</VioLayout>
</VioSystem>
</Value>
</Variable>
</VariablePool>

<Functions>
<WspLuaFunction>
BufferModel   +Shown+      
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
<WspLuaFunction>
LuaFunction_2  +Shown+      
<VioLuaFunctionDefinition>
<LuaFunctionDefinition name="LuaFunction_2">
<VariantSignatures/>
<LuaCode>
<![CDATA[

]]>
</LuaCode>
</LuaFunctionDefinition>
<VioLayout>
1              150            150            4294967295    
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
<SupConNB>
AnonymousOperation_1622650073  0             
<Parameters>
PlantAB       FullBufferAB  SuperAB      
</Parameters>
<Options>
"Clear Arguments"  0              "Minimal Realisation"  0              "Clear State Names"  0             
</Options>
</SupConNB>
<LuaFunction_2>
LuaFunction_2_5  0             
<Parameters/>
<Options/>
</LuaFunction_2>
</Script>

<Simulator>

 +Supervisor+  +Plant+      
<DevFile>
"."          
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
