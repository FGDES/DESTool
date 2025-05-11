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
-29.999628     0             
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
-29.999628     0             
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
-29.999628     0             
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
-29.999628     0             
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
-29.999628     0             
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
-29.999628     0             
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
-29.999628     0             
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
-29.999628     0             
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
-29.999628     0             
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
-29.999628     0             
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
62.500000      11.100000      0              0              29.996591      0             
44.400001      0              65.300000      0              95.004419      0             
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
-62.500000     -16.700000     0              0              -23.954114     -18.019535    
-36.099994     -25            -54.200000     -31.900001     -72.200000     -27.800000    
-77.800000     -26.400000     -83.399999     -25            -99.234149     -15.484285    
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
62.500012      11.100000      0              0              29.996591      0             
44.400001      0              65.300000      0              95.004425      0             
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
-62.500000     -16.700000     0              0              -23.954127     -18.019535    
-36.100006     -25            -54.200006     -31.900001     -72.200012     -27.800000    
-77.800012     -26.400000     -83.400011     -25            -99.234161     -15.484285    
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
62.500000      11.100000      0              0              29.996578      0             
44.399977      0              65.299988      0              95.004401      0             
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
-62.499976     -16.700000     0              0              -25.188424     -16.329794    
-31.999993     -20.800000     -43.099999     -25            -52.799988     -27.800000    
-65.299988     -30.500001     -77.799988     -27.800000     -99.166641     -15.215400    
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
62.500000      11.100000      0              0              29.996631      0             
44.400024      0              65.300035      0              95.004436      0             
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
-62.500000     -16.700000     0              0              -23.954075     -18.019535    
-36.100006     -25            -54.199982     -31.900001     -72.199965     -27.800000    
-77.799988     -26.400000     -83.400011     -25            -99.234156     -15.484285    
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
62.500000      11.100000      0              0              29.996631      0             
44.400024      0              65.300035      0              95.004436      0             
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
-62.500000     -16.700000     0              0              -23.954075     -18.019535    
-36.100006     -25            -54.199982     -31.900001     -72.199965     -27.800000    
-77.799988     -26.400000     -83.400011     -25            -99.234156     -15.484285    
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
62.500000      11.100000      0              0              29.996631      0             
44.400024      0              65.300035      0              95.004436      0             
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
-62.500000     -16.700000     0              0              -23.954075     -18.019535    
-36.100006     -25            -54.199982     -31.900001     -72.199965     -27.800000    
-77.799988     -26.400000     -83.400011     -25            -99.234156     -15.484285    
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
62.500000      11.100000      0              0              29.996578      0             
44.400024      0              65.299988      0              95.004413      0             
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
-62.500000     -16.700000     0              0              -25.188449     -16.329794    
-31.999969     -20.800000     -43.099976     -25            -52.799988     -27.800000    
-65.299988     -30.500001     -77.799988     -27.800000     -99.166652     -15.215400    
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
62.500000      11.100000      0              0              29.996578      0             
44.400024      0              65.299988      0              95.004413      0             
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
-62.500000     -16.700000     0              0              -25.188449     -16.329794    
-31.999969     -20.800000     -43.099976     -25            -52.799988     -27.800000    
-65.299988     -30.500001     -77.799988     -27.800000     -99.166652     -15.215400    
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
62.500000      11.100000      0              0              29.996578      0             
44.400024      0              63.899994      0              101.892297     0             
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
-69.400024     -16.700000     0              0              -24.954819     -16.636525    
-44.400024     -26.400000     -62.500000     -31.900001     -79.100037     -27.800000    
-84.700012     -26.400000     -90.299988     -25            -106.134151    -15.484285    
-131.900024    0             
</BasePoints>
</Item>
</Trans>
</TransRel>
</GraphData>
</VioModels>
<VioLayout>
0             =AAAAAAAAAAAAAAAAAAAAAOB97gMAYAAAAQA/AAEAAAABAA===  0              150            845            0.938037       0             
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
27.800000      422.200012    
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.998340     0             
</BasePoints>
</Item>
</State>
<State>
2             
<Item>
<Position>
152.800000     290.300012    
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.998340     0             
</BasePoints>
</Item>
</State>
<State>
3             
<Item>
<Position>
527.799988     459.700012    
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.998340     0             
</BasePoints>
</Item>
</State>
<State>
4             
<Item>
<Position>
652.799988     302.800012    
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.998340     0             
</BasePoints>
</Item>
</State>
<State>
5             
<Item>
<Position>
652.799988     491.699982    
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.998340     0             
</BasePoints>
</Item>
</State>
<State>
6             
<Item>
<Position>
777.799988     286.100006    
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.998340     0             
</BasePoints>
</Item>
</State>
<State>
7             
<Item>
<Position>
902.799988     197.200000    
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.998340     0             
</BasePoints>
</Item>
</State>
<State>
8             
<Item>
<Position>
277.800012     161.099994    
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.998340     0             
</BasePoints>
</Item>
</State>
<State>
9             
<Item>
<Position>
402.799988     198.599994    
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.998340     0             
</BasePoints>
</Item>
</State>
</States>
<TransRel>
<Trans>
1              alpha_a       2              +Free+       
<Item>
<Position>
27.800000      422.200012    
</Position>
<BasePoints>
62.500000      -44.400001     0              0              20.477989      -21.955802    
40.300000      -43.000007     72.200000      -76.400018     104.283054     -110.123672   
125            -131.900001   
</BasePoints>
</Item>
</Trans>
<Trans>
1              alpha_b       3              +Free+       
<Item>
<Position>
27.800000      422.200012    
</Position>
<BasePoints>
250.000012     43.099976      0              0              27.660916      11.630167     
51.400000      19.499969      90.300000      31.999969      125            31.999969     
125            31.999969      125            31.999969      374.999988     31.999969     
404.099977     31.999969      434.700000     33.400011      470.033669     35.618505     
499.999988     37.500000     
</BasePoints>
</Item>
</Trans>
<Trans>
2              beta_a        1              +Free+       
<Item>
<Position>
152.800000     290.300012    
</Position>
<BasePoints>
-62.500000     38.899994      0              0              -29.453233     5.827059      
-41.700006     9.699988       -59.700000     16.599989      -72.200000     27.799988     
-98.600000     50             -105.599999    63.899994      -116.766837    103.041489    
-125           131.900001    
</BasePoints>
</Item>
</Trans>
<Trans>
2              alpha_b       4              +Free+       
<Item>
<Position>
152.800000     290.300012    
</Position>
<BasePoints>
249.999988     37.500000      0              0              28.671940      9.014273      
34.700000      11.099982      44.400001      13.899994      52.800000      15.299988     
200.000012     36.099982      377.800024     23.599982      470.134430     15.212825     
499.999988     12.500000     
</BasePoints>
</Item>
</Trans>
<Trans>
2              mue_a         8              +Free+       
<Item>
<Position>
152.800000     290.300012    
</Position>
<BasePoints>
62.500012      -43.100023     0              0              20.402288      -21.979793    
40.300000      -41.700006     72.200000      -75            104.076408     -107.721619   
125.000012     -129.200017   
</BasePoints>
</Item>
</Trans>
<Trans>
3              beta_b        1              +Free+       
<Item>
<Position>
527.799988     459.700012    
</Position>
<BasePoints>
-249.999976    77.799988      0              0              -21.962452     20.491241     
-44.499969     38.899994      -83.400011     66.699982      -125           66.699982     
-374.999988    66.699982      -374.999988    66.699982      -374.999988    66.699982     
-431.999987    66.699982      -452.799988    41.699982      -484.620790    -11.694233    
-499.999988    -37.500000    
</BasePoints>
</Item>
</Trans>
<Trans>
3              alpha_a       4              +Free+       
<Item>
<Position>
527.799988     459.700012    
</Position>
<BasePoints>
62.500000      -54.099989     0              0              18.915054      -23.328539    
38.899994      -48.600006     73.600006      -93.000007     106.195142     -133.521977   
125            -156.900001   
</BasePoints>
</Item>
</Trans>
<Trans>
3              mue_b         5              +Free+       
<Item>
<Position>
527.799988     459.700012    
</Position>
<BasePoints>
62.500000      44.499969      0              0              23.260325      18.964465     
30.500031      23.600006      41.599989      30.599976      52.800035      33.400011     
62.500000      36.100006      73.600006      37.500000      95.162959      35.192667     
125            31.999969     
</BasePoints>
</Item>
</Trans>
<Trans>
4              beta_b        2              +Free+       
<Item>
<Position>
652.799988     302.800012    
</Position>
<BasePoints>
-250           -4.200006      0              0              -29.865998     -3.008099     
-69.499969     -7.000017      -151.399994    -13.900018     -222.199965    -15.300012    
-304.199982    -19.500017     -404.199982    -15.300012     -469.998259    -13.376881    
-499.999988    -12.500000    
</BasePoints>
</Item>
</Trans>
<Trans>
4              beta_a        3              +Free+       
<Item>
<Position>
652.799988     302.800012    
</Position>
<BasePoints>
-62.500000     145.799994     0              0              -3.008073      29.865998     
-2.799988      30.499983      -4.199982      31.899977      -4.199982      33.299994     
-16.699982     75             -20.900011     88.899994      -52.799988     119.400001    
-62.500000     129.099965     -73.600006     136.099982     -97.168810     145.637562    
-125           156.900001    
</BasePoints>
</Item>
</Trans>
<Trans>
4              mue_b         6              +Free+       
<Item>
<Position>
652.799988     302.800012    
</Position>
<BasePoints>
62.500000      2.799988       0              0              29.670236      -4.482554     
44.400024      -7.000017      65.300035      -8.400011      95.266961      -12.566267    
125            -16.700006    
</BasePoints>
</Item>
</Trans>
<Trans>
4              mue_a         9              +Free+       
<Item>
<Position>
652.799988     302.800012    
</Position>
<BasePoints>
-125           -59.700012     0              0              -21.254415     -21.254467    
-29.199982     -29.200006     -41.699982     -38.900018     -52.799988     -45.900011    
-100           -76.400018     -166.699982    -93.100023     -220.250107    -100.235749   
-250           -104.200017   
</BasePoints>
</Item>
</Trans>
<Trans>
5              lambda_b      1              +Free+       
<Item>
<Position>
652.799988     491.699982    
</Position>
<BasePoints>
-312.499976    118.000031     0              0              -15.214782     25.832313     
-33.400011     55.500031      -73.600006     106.900024     -125           106.900024    
-499.999988    106.900024     -499.999988    106.900024     -499.999988    106.900024    
-577.799988    106.900024     -590.299988    51.400042      -616.722065    -40.658442    
-624.999988    -69.499969    
</BasePoints>
</Item>
</Trans>
<Trans>
5              alpha_a       6              +Free+       
<Item>
<Position>
652.799988     491.699982    
</Position>
<BasePoints>
62.500000      -98.599982     0              0              10.352562      -28.176010    
19.400024      -50            34.700012      -86.099958     52.800035      -113.899970   
70.800018      -143.099976    83.300018      -155.599976    105.782176     -182.557011   
125            -205.599976   
</BasePoints>
</Item>
</Trans>
<Trans>
6              lambda_b      2              +Free+       
<Item>
<Position>
777.799988     286.100006    
</Position>
<BasePoints>
-312.500000    -250.000006    0              0              -10.352512     -28.176035    
-37.500000     -91.700006     -120.900011    -261.100006    -250           -261.100006   
-499.999976    -261.100006    -499.999976    -261.100006    -499.999976    -261.100006   
-609.699988    -261.100006    -531.999993    -122.200000    -597.199988    -33.299994    
-598.599982    -31.900001     -598.599982    -30.500007     -606.841952    -19.666809    
-624.999988    4.200006      
</BasePoints>
</Item>
</Trans>
<Trans>
6              beta_a        5              +Free+       
<Item>
<Position>
777.799988     286.100006    
</Position>
<BasePoints>
-62.500000     161.100006     0              0              -3.008073      29.865998     
-2.799988      30.599999      -4.199982      31.999993      -4.199982      33.299994     
-22.199965     88.899994      -66.699982     143.099976     -104.520913    183.645559    
-125           205.599976    
</BasePoints>
</Item>
</Trans>
<Trans>
6              mue_a         7              +Free+       
<Item>
<Position>
777.799988     286.100006    
</Position>
<BasePoints>
62.500000      -27.800012     0              0              24.522610      -17.352864    
41.600037      -29.200006     68.000031      -48.600006     100.524079     -71.595091    
125            -88.900006    
</BasePoints>
</Item>
</Trans>
<Trans>
7              lambda_a      5              +Free+       
<Item>
<Position>
902.799988     197.200000    
</Position>
<BasePoints>
-125           256.999981     0              0              -5.928482      29.430805     
-54.199982     145.899999     -73.600006     184.700000     -177.799988    266.699994    
-186.100006    273.600018     -198.600006    279.199994     -221.266177    285.946923    
-250           294.499981    
</BasePoints>
</Item>
</Trans>
<Trans>
7              lambda_b      8              +Free+       
<Item>
<Position>
902.799988     197.200000    
</Position>
<BasePoints>
-312.500000    -72.200000     0              0              -9.096175      -28.588103    
-34.700012     -56.900001     -55.599976     -52.800000     -97.200012     -65.300000    
-200           -94.400001     -240.299988    -92.999995     -322.199965    -87.500000    
-443.099976    -77.800000     -506.999993    -123.600000    -600.868956    -53.993772    
-624.999976    -36.100006    
</BasePoints>
</Item>
</Trans>
<Trans>
8              lambda_a      1              +Free+       
<Item>
<Position>
277.800012     161.099994    
</Position>
<BasePoints>
-125.000012    77.800000      0              0              -29.104411     7.328451      
-59.700012     16.700006      -115.300012    34.700000      -152.800012    66.700017     
-200.000012    107.000005     -234.700012    182.000005     -247.200012    219.500005    
-247.200012    219.500005     -247.200012    219.500005     -247.986746    231.188623    
-250.000012    261.100018    
</BasePoints>
</Item>
</Trans>
<Trans>
8              alpha_b       9              +Free+       
<Item>
<Position>
277.800012     161.099994    
</Position>
<BasePoints>
62.500000      37.500000      0              0              27.660909      11.630167     
34.699988      13.900006      44.399977      16.700006      52.799988      19.500005     
62.500000      23.600006      73.599982      26.400006      95.664398      31.164888     
124.999976     37.500000     
</BasePoints>
</Item>
</Trans>
<Trans>
9              lambda_a      3              +Free+       
<Item>
<Position>
402.799988     198.599994    
</Position>
<BasePoints>
62.500000      143.100011     0              0              16.329318      25.187644     
19.400024      32.000005      23.600006      38.900006      27.800035      47.200000     
59.700012      105.600011     90.300035      179.200017     113.286260     233.452863    
125            261.100018    
</BasePoints>
</Item>
</Trans>
<Trans>
9              mue_b         7              +Free+       
<Item>
<Position>
402.799988     198.599994    
</Position>
<BasePoints>
250            -36.099994     0              0              25.187657      -16.329281    
48.600006      -29.199994     88.899994      -47.199988     125            -47.199988    
125            -47.199988     125            -47.199988     375            -47.199988    
406.900024     -47.199988     438.899994     -34.699988     473.635029     -15.769115    
500            -1.399994     
</BasePoints>
</Item>
</Trans>
<Trans>
9              beta_b        8              +Free+       
<Item>
<Position>
402.799988     198.599994    
</Position>
<BasePoints>
-62.499976     -34.699988     0              0              -17.352839     -24.522598    
-24.999976     -33.299994     -33.399987     -38.899994     -52.799988     -45.799994    
-62.499976     -48.599994     -73.599982     -48.599994     -95.664398     -43.835112    
-124.999976    -37.500000    
</BasePoints>
</Item>
</Trans>
</TransRel>
</GraphData>
</VioModels>
<VioLayout>
0             =AwAAAAAAAAAMAAAAAAAAAEYAdQBsAGwAQgB1AGYAZgBlAA===  0              150            726            0.612336       0             
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
0             =AAAAAAAAAAAAAAAAAAAAABDa8AMAYAAAAQAAAAEAAAAPAA===  1              150            338            0.100000       0             
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
<SupConNB>
AnonymousOperation_1622650073  0             
<Parameters>
PlantAB       FullBufferAB  SuperAB      
</Parameters>
<Options>
"Clear Arguments"  0              "Minimal Realisation"  0              "Clear State Names"  0             
</Options>
</SupConNB>
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
