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
MachineC      System        +Visual+      +Shown+       +Plant+      
<File>
MachineC.vio 
</File>
</Variable>
<Variable>
BufferAB      System        +Visual+      +Shown+       +Plant+      
<File>
BufferAB.vio 
</File>
</Variable>
<Variable>
BufferBC      Generator     +Visual+      +Shown+       +Plant+      
<File>
BufferBC.vio 
</File>
</Variable>
<Variable>
SigmaABC      EventSet      +Visual+     
<File>
SigmaABC.vio 
</File>
</Variable>
<Variable>
PlantABC      System        +Visual+     
<Value>
<VioSystem>
<Generator name="PlantABC" ftype="System">

<Alphabet>
<Event name="alpha_a">
<Controllable/>
</Event>
<Event name="beta_a"/>
<Event name="mue_a"/>
<Event name="lambda_a">
<Controllable/>
</Event>
<Event name="alpha_b">
<Controllable/>
</Event>
<Event name="beta_b"/>
<Event name="mue_b"/>
<Event name="lambda_b">
<Controllable/>
</Event>
<Event name="alpha_c">
<Controllable/>
</Event>
<Event name="beta_c"/>
<Event name="mue_c"/>
<Event name="lambda_c">
<Controllable/>
</Event>
</Alphabet>

<StateSet>
<State id="1" name="I|I|I">
<Initial/>
<Marked/>
</State>
<State id="2" name="B|I|I"/>
<State id="3" name="I|I|B"/>
<State id="4" name="I|B|I"/>
<State id="5" name="B|B|I"/>
<State id="6" name="I|B|B"/>
<State id="7" name="I|D|I"/>
<State id="8" name="B|D|I"/>
<State id="9" name="I|D|B"/>
<State id="10" name="B|D|B"/>
<State id="11" name="I|D|D"/>
<State id="12" name="B|D|D"/>
<State id="13" name="I|I|D"/>
<State id="14" name="B|I|D"/>
<State id="15" name="I|B|D"/>
<State id="16" name="B|B|D"/>
<State id="17" name="D|B|D"/>
<State id="18" name="D|B|I"/>
<State id="19" name="D|I|D"/>
<State id="20" name="D|D|D"/>
<State id="21" name="D|D|I"/>
<State id="22" name="D|D|B"/>
<State id="23" name="D|I|I"/>
<State id="24" name="D|I|B"/>
<State id="25" name="D|B|B"/>
<State id="26" name="B|I|B"/>
<State id="27" name="B|B|B"/>
</StateSet>

<TransitionRelation>
<Transition x1="1" event="alpha_a" x2="3"/>
<Transition x1="1" event="alpha_b" x2="4"/>
<Transition x1="1" event="alpha_c" x2="2"/>
<Transition x1="2" event="alpha_a" x2="26"/>
<Transition x1="2" event="alpha_b" x2="5"/>
<Transition x1="2" event="beta_c" x2="1"/>
<Transition x1="2" event="mue_c" x2="23"/>
<Transition x1="3" event="beta_a" x2="1"/>
<Transition x1="3" event="mue_a" x2="13"/>
<Transition x1="3" event="alpha_b" x2="6"/>
<Transition x1="3" event="alpha_c" x2="26"/>
<Transition x1="4" event="alpha_a" x2="6"/>
<Transition x1="4" event="beta_b" x2="1"/>
<Transition x1="4" event="mue_b" x2="7"/>
<Transition x1="4" event="alpha_c" x2="5"/>
<Transition x1="5" event="alpha_a" x2="27"/>
<Transition x1="5" event="beta_b" x2="2"/>
<Transition x1="5" event="mue_b" x2="8"/>
<Transition x1="5" event="beta_c" x2="4"/>
<Transition x1="5" event="mue_c" x2="18"/>
<Transition x1="6" event="beta_a" x2="4"/>
<Transition x1="6" event="mue_a" x2="15"/>
<Transition x1="6" event="beta_b" x2="3"/>
<Transition x1="6" event="mue_b" x2="9"/>
<Transition x1="6" event="alpha_c" x2="27"/>
<Transition x1="7" event="alpha_a" x2="9"/>
<Transition x1="7" event="lambda_b" x2="1"/>
<Transition x1="7" event="alpha_c" x2="8"/>
<Transition x1="8" event="alpha_a" x2="10"/>
<Transition x1="8" event="lambda_b" x2="2"/>
<Transition x1="8" event="beta_c" x2="7"/>
<Transition x1="8" event="mue_c" x2="21"/>
<Transition x1="9" event="beta_a" x2="7"/>
<Transition x1="9" event="mue_a" x2="11"/>
<Transition x1="9" event="lambda_b" x2="3"/>
<Transition x1="9" event="alpha_c" x2="10"/>
<Transition x1="10" event="beta_a" x2="8"/>
<Transition x1="10" event="mue_a" x2="12"/>
<Transition x1="10" event="lambda_b" x2="26"/>
<Transition x1="10" event="beta_c" x2="9"/>
<Transition x1="10" event="mue_c" x2="22"/>
<Transition x1="11" event="lambda_a" x2="7"/>
<Transition x1="11" event="lambda_b" x2="13"/>
<Transition x1="11" event="alpha_c" x2="12"/>
<Transition x1="12" event="lambda_a" x2="8"/>
<Transition x1="12" event="lambda_b" x2="14"/>
<Transition x1="12" event="beta_c" x2="11"/>
<Transition x1="12" event="mue_c" x2="20"/>
<Transition x1="13" event="lambda_a" x2="1"/>
<Transition x1="13" event="alpha_b" x2="15"/>
<Transition x1="13" event="alpha_c" x2="14"/>
<Transition x1="14" event="lambda_a" x2="2"/>
<Transition x1="14" event="alpha_b" x2="16"/>
<Transition x1="14" event="beta_c" x2="13"/>
<Transition x1="14" event="mue_c" x2="19"/>
<Transition x1="15" event="lambda_a" x2="4"/>
<Transition x1="15" event="beta_b" x2="13"/>
<Transition x1="15" event="mue_b" x2="11"/>
<Transition x1="15" event="alpha_c" x2="16"/>
<Transition x1="16" event="lambda_a" x2="5"/>
<Transition x1="16" event="beta_b" x2="14"/>
<Transition x1="16" event="mue_b" x2="12"/>
<Transition x1="16" event="beta_c" x2="15"/>
<Transition x1="16" event="mue_c" x2="17"/>
<Transition x1="17" event="lambda_a" x2="18"/>
<Transition x1="17" event="beta_b" x2="19"/>
<Transition x1="17" event="mue_b" x2="20"/>
<Transition x1="17" event="lambda_c" x2="15"/>
<Transition x1="18" event="alpha_a" x2="25"/>
<Transition x1="18" event="beta_b" x2="23"/>
<Transition x1="18" event="mue_b" x2="21"/>
<Transition x1="18" event="lambda_c" x2="4"/>
<Transition x1="19" event="lambda_a" x2="23"/>
<Transition x1="19" event="alpha_b" x2="17"/>
<Transition x1="19" event="lambda_c" x2="13"/>
<Transition x1="20" event="lambda_a" x2="21"/>
<Transition x1="20" event="lambda_b" x2="19"/>
<Transition x1="20" event="lambda_c" x2="11"/>
<Transition x1="21" event="alpha_a" x2="22"/>
<Transition x1="21" event="lambda_b" x2="23"/>
<Transition x1="21" event="lambda_c" x2="7"/>
<Transition x1="22" event="beta_a" x2="21"/>
<Transition x1="22" event="mue_a" x2="20"/>
<Transition x1="22" event="lambda_b" x2="24"/>
<Transition x1="22" event="lambda_c" x2="9"/>
<Transition x1="23" event="alpha_a" x2="24"/>
<Transition x1="23" event="alpha_b" x2="18"/>
<Transition x1="23" event="lambda_c" x2="1"/>
<Transition x1="24" event="beta_a" x2="23"/>
<Transition x1="24" event="mue_a" x2="19"/>
<Transition x1="24" event="alpha_b" x2="25"/>
<Transition x1="24" event="lambda_c" x2="3"/>
<Transition x1="25" event="beta_a" x2="18"/>
<Transition x1="25" event="mue_a" x2="17"/>
<Transition x1="25" event="beta_b" x2="24"/>
<Transition x1="25" event="mue_b" x2="22"/>
<Transition x1="25" event="lambda_c" x2="6"/>
<Transition x1="26" event="beta_a" x2="2"/>
<Transition x1="26" event="mue_a" x2="14"/>
<Transition x1="26" event="alpha_b" x2="27"/>
<Transition x1="26" event="beta_c" x2="3"/>
<Transition x1="26" event="mue_c" x2="24"/>
<Transition x1="27" event="beta_a" x2="5"/>
<Transition x1="27" event="mue_a" x2="16"/>
<Transition x1="27" event="beta_b" x2="26"/>
<Transition x1="27" event="mue_b" x2="10"/>
<Transition x1="27" event="beta_c" x2="6"/>
<Transition x1="27" event="mue_c" x2="25"/>
</TransitionRelation>

</Generator>
<VioModels>
<TransitionList>
<Transition x1="1" event="alpha_a" x2="3"/>
<Transition x1="1" event="alpha_b" x2="4"/>
<Transition x1="1" event="alpha_c" x2="2"/>
<Transition x1="2" event="alpha_a" x2="26"/>
<Transition x1="2" event="alpha_b" x2="5"/>
<Transition x1="2" event="beta_c" x2="1"/>
<Transition x1="2" event="mue_c" x2="23"/>
<Transition x1="3" event="beta_a" x2="1"/>
<Transition x1="3" event="mue_a" x2="13"/>
<Transition x1="3" event="alpha_b" x2="6"/>
<Transition x1="3" event="alpha_c" x2="26"/>
<Transition x1="4" event="alpha_a" x2="6"/>
<Transition x1="4" event="beta_b" x2="1"/>
<Transition x1="4" event="mue_b" x2="7"/>
<Transition x1="4" event="alpha_c" x2="5"/>
<Transition x1="5" event="alpha_a" x2="27"/>
<Transition x1="5" event="beta_b" x2="2"/>
<Transition x1="5" event="mue_b" x2="8"/>
<Transition x1="5" event="beta_c" x2="4"/>
<Transition x1="5" event="mue_c" x2="18"/>
<Transition x1="6" event="beta_a" x2="4"/>
<Transition x1="6" event="mue_a" x2="15"/>
<Transition x1="6" event="beta_b" x2="3"/>
<Transition x1="6" event="mue_b" x2="9"/>
<Transition x1="6" event="alpha_c" x2="27"/>
<Transition x1="7" event="alpha_a" x2="9"/>
<Transition x1="7" event="lambda_b" x2="1"/>
<Transition x1="7" event="alpha_c" x2="8"/>
<Transition x1="8" event="alpha_a" x2="10"/>
<Transition x1="8" event="lambda_b" x2="2"/>
<Transition x1="8" event="beta_c" x2="7"/>
<Transition x1="8" event="mue_c" x2="21"/>
<Transition x1="9" event="beta_a" x2="7"/>
<Transition x1="9" event="mue_a" x2="11"/>
<Transition x1="9" event="lambda_b" x2="3"/>
<Transition x1="9" event="alpha_c" x2="10"/>
<Transition x1="10" event="beta_a" x2="8"/>
<Transition x1="10" event="mue_a" x2="12"/>
<Transition x1="10" event="lambda_b" x2="26"/>
<Transition x1="10" event="beta_c" x2="9"/>
<Transition x1="10" event="mue_c" x2="22"/>
<Transition x1="11" event="lambda_a" x2="7"/>
<Transition x1="11" event="lambda_b" x2="13"/>
<Transition x1="11" event="alpha_c" x2="12"/>
<Transition x1="12" event="lambda_a" x2="8"/>
<Transition x1="12" event="lambda_b" x2="14"/>
<Transition x1="12" event="beta_c" x2="11"/>
<Transition x1="12" event="mue_c" x2="20"/>
<Transition x1="13" event="lambda_a" x2="1"/>
<Transition x1="13" event="alpha_b" x2="15"/>
<Transition x1="13" event="alpha_c" x2="14"/>
<Transition x1="14" event="lambda_a" x2="2"/>
<Transition x1="14" event="alpha_b" x2="16"/>
<Transition x1="14" event="beta_c" x2="13"/>
<Transition x1="14" event="mue_c" x2="19"/>
<Transition x1="15" event="lambda_a" x2="4"/>
<Transition x1="15" event="beta_b" x2="13"/>
<Transition x1="15" event="mue_b" x2="11"/>
<Transition x1="15" event="alpha_c" x2="16"/>
<Transition x1="16" event="lambda_a" x2="5"/>
<Transition x1="16" event="beta_b" x2="14"/>
<Transition x1="16" event="mue_b" x2="12"/>
<Transition x1="16" event="beta_c" x2="15"/>
<Transition x1="16" event="mue_c" x2="17"/>
<Transition x1="17" event="lambda_a" x2="18"/>
<Transition x1="17" event="beta_b" x2="19"/>
<Transition x1="17" event="mue_b" x2="20"/>
<Transition x1="17" event="lambda_c" x2="15"/>
<Transition x1="18" event="alpha_a" x2="25"/>
<Transition x1="18" event="beta_b" x2="23"/>
<Transition x1="18" event="mue_b" x2="21"/>
<Transition x1="18" event="lambda_c" x2="4"/>
<Transition x1="19" event="lambda_a" x2="23"/>
<Transition x1="19" event="alpha_b" x2="17"/>
<Transition x1="19" event="lambda_c" x2="13"/>
<Transition x1="20" event="lambda_a" x2="21"/>
<Transition x1="20" event="lambda_b" x2="19"/>
<Transition x1="20" event="lambda_c" x2="11"/>
<Transition x1="21" event="alpha_a" x2="22"/>
<Transition x1="21" event="lambda_b" x2="23"/>
<Transition x1="21" event="lambda_c" x2="7"/>
<Transition x1="22" event="beta_a" x2="21"/>
<Transition x1="22" event="mue_a" x2="20"/>
<Transition x1="22" event="lambda_b" x2="24"/>
<Transition x1="22" event="lambda_c" x2="9"/>
<Transition x1="23" event="alpha_a" x2="24"/>
<Transition x1="23" event="alpha_b" x2="18"/>
<Transition x1="23" event="lambda_c" x2="1"/>
<Transition x1="24" event="beta_a" x2="23"/>
<Transition x1="24" event="mue_a" x2="19"/>
<Transition x1="24" event="alpha_b" x2="25"/>
<Transition x1="24" event="lambda_c" x2="3"/>
<Transition x1="25" event="beta_a" x2="18"/>
<Transition x1="25" event="mue_a" x2="17"/>
<Transition x1="25" event="beta_b" x2="24"/>
<Transition x1="25" event="mue_b" x2="22"/>
<Transition x1="25" event="lambda_c" x2="6"/>
<Transition x1="26" event="beta_a" x2="2"/>
<Transition x1="26" event="mue_a" x2="14"/>
<Transition x1="26" event="alpha_b" x2="27"/>
<Transition x1="26" event="beta_c" x2="3"/>
<Transition x1="26" event="mue_c" x2="24"/>
<Transition x1="27" event="beta_a" x2="5"/>
<Transition x1="27" event="mue_a" x2="16"/>
<Transition x1="27" event="beta_b" x2="26"/>
<Transition x1="27" event="mue_b" x2="10"/>
<Transition x1="27" event="beta_c" x2="6"/>
<Transition x1="27" event="mue_c" x2="25"/>
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
</StateList>
<EventList>
<Event name="alpha_a"/>
<Event name="beta_a"/>
<Event name="mue_a"/>
<Event name="lambda_a"/>
<Event name="alpha_b"/>
<Event name="beta_b"/>
<Event name="mue_b"/>
<Event name="lambda_b"/>
<Event name="alpha_c"/>
<Event name="beta_c"/>
<Event name="mue_c"/>
<Event name="lambda_c"/>
</EventList>
<GraphData>
<States/>
<TransRel/>
</GraphData>
</VioModels>
<VioLayout>
0             =AAAAAAAAAAAAAAAAAAAAAPCwZwEAYAAAAQAAAAEAAAABAA===  1              150            100            1              0             
300           
</VioLayout>
</VioSystem>
</Value>
</Variable>
<Variable>
BufferABC     System        +Visual+     
<Value>
<VioSystem>
<Generator name="BufferABC" ftype="System">

<Alphabet>
<Event name="beta_a"/>
<Event name="alpha_b"/>
<Event name="beta_b"/>
<Event name="alpha_c"/>
</Alphabet>

<StateSet>
<State id="1" name="E|E">
<Initial/>
<Marked/>
</State>
<State id="2" name="F|E"/>
<State id="3" name="E|F"/>
<State id="4" name="F|F"/>
</StateSet>

<TransitionRelation>
<Transition x1="1" event="beta_a" x2="2"/>
<Transition x1="1" event="beta_b" x2="3"/>
<Transition x1="2" event="alpha_b" x2="1"/>
<Transition x1="2" event="beta_b" x2="4"/>
<Transition x1="3" event="beta_a" x2="4"/>
<Transition x1="3" event="alpha_c" x2="1"/>
<Transition x1="4" event="alpha_b" x2="3"/>
<Transition x1="4" event="alpha_c" x2="2"/>
</TransitionRelation>

</Generator>
<VioModels>
<TransitionList>
<Transition x1="1" event="beta_a" x2="2"/>
<Transition x1="1" event="beta_b" x2="3"/>
<Transition x1="2" event="alpha_b" x2="1"/>
<Transition x1="2" event="beta_b" x2="4"/>
<Transition x1="3" event="beta_a" x2="4"/>
<Transition x1="3" event="alpha_c" x2="1"/>
<Transition x1="4" event="alpha_b" x2="3"/>
<Transition x1="4" event="alpha_c" x2="2"/>
</TransitionList>
<StateList>
<State id="1"/>
<State id="2"/>
<State id="3"/>
<State id="4"/>
</StateList>
<EventList>
<Event name="beta_a"/>
<Event name="alpha_b"/>
<Event name="beta_b"/>
<Event name="alpha_c"/>
</EventList>
<GraphData>
<States>
<State>
1             
<Item>
<Position>
0              40            
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999542     0             
</BasePoints>
</Item>
</State>
<State>
2             
<Item>
<Position>
100            40            
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999542     0             
</BasePoints>
</Item>
</State>
<State>
3             
<Item>
<Position>
200            40            
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999542     0             
</BasePoints>
</Item>
</State>
<State>
4             
<Item>
<Position>
0              120           
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999542     0             
</BasePoints>
</Item>
</State>
</States>
<TransRel>
<Trans>
1              beta_a        2              +Line+       
<Item>
<Position>
0              40            
</Position>
<BasePoints>
50             10             0              0              30.058221      0             
43.209961      0              56.390625      0              70.005288      0             
100            0             
</BasePoints>
</Item>
</Trans>
<Trans>
1              beta_b        3              +Line+       
<Item>
<Position>
0              40            
</Position>
<BasePoints>
100            10             0              0              30.009346      0             
76.193359      0              122.406250     0              170.010358     0             
200            0             
</BasePoints>
</Item>
</Trans>
<Trans>
2              alpha_b       1              +Line+       
<Item>
<Position>
100            40            
</Position>
<BasePoints>
-50            -10            0              0              -30.058221     0             
-43.209961     0              -56.390625     0              -70.005288     0             
-100           0             
</BasePoints>
</Item>
</Trans>
<Trans>
2              beta_b        4              +Line+       
<Item>
<Position>
100            40            
</Position>
<BasePoints>
-56.246950     32.191312      0              0              -23.411200     18.728959     
-40.952148     32.761719      -58.515625     46.812500      -76.566410     61.253128     
-100           80            
</BasePoints>
</Item>
</Trans>
<Trans>
3              beta_a        4              +Line+       
<Item>
<Position>
200            40            
</Position>
<BasePoints>
-103.713907    30.715233      0              0              -27.858838     11.143535     
-75.462891     30.185156      -123.093750    49.237500      -172.163716    68.865486     
-200           80            
</BasePoints>
</Item>
</Trans>
<Trans>
3              alpha_c       1              +Line+       
<Item>
<Position>
200            40            
</Position>
<BasePoints>
-100           -10            0              0              -30.009346     0             
-76.193359     0              -122.406250    0              -170.010358    0             
-200           0             
</BasePoints>
</Item>
</Trans>
<Trans>
4              alpha_b       3              +Line+       
<Item>
<Position>
0              120           
</Position>
<BasePoints>
103.713907     -30.715233     0              0              27.858838      -11.143535    
75.462891      -30.185156     123.093750     -49.237500     172.163716     -68.865486    
200            -80           
</BasePoints>
</Item>
</Trans>
<Trans>
4              alpha_c       2              +Line+       
<Item>
<Position>
0              120           
</Position>
<BasePoints>
56.246950      -32.191312     0              0              23.411200      -18.728959    
40.952148      -32.761719     58.515625      -46.812500     76.566410      -61.253128    
100            -80           
</BasePoints>
</Item>
</Trans>
</TransRel>
</GraphData>
</VioModels>
<VioLayout>
0             ==  0              150            150            1              0             
300           
</VioLayout>
</VioSystem>
</Value>
</Variable>
<Variable>
FullBufferABC  Generator     +Visual+     
<Value>
<VioGenerator>
<Generator name="FullBufferABC" ftype="Generator">

<Alphabet ftype="EventSet">
<Event name="alpha_a"/>
<Event name="beta_a"/>
<Event name="mue_a"/>
<Event name="lambda_a"/>
<Event name="alpha_b"/>
<Event name="beta_b"/>
<Event name="mue_b"/>
<Event name="lambda_b"/>
<Event name="alpha_c"/>
<Event name="beta_c"/>
<Event name="mue_c"/>
<Event name="lambda_c"/>
</Alphabet>

<StateSet>
<State id="1" name="E|E">
<Initial/>
<Marked/>
</State>
<State id="2" name="F|E"/>
<State id="3" name="E|F"/>
<State id="4" name="F|F"/>
</StateSet>

<TransitionRelation>
<Transition x1="1" event="alpha_a" x2="1"/>
<Transition x1="1" event="beta_a" x2="2"/>
<Transition x1="1" event="mue_a" x2="1"/>
<Transition x1="1" event="lambda_a" x2="1"/>
<Transition x1="1" event="beta_b" x2="3"/>
<Transition x1="1" event="mue_b" x2="1"/>
<Transition x1="1" event="lambda_b" x2="1"/>
<Transition x1="1" event="beta_c" x2="1"/>
<Transition x1="1" event="mue_c" x2="1"/>
<Transition x1="1" event="lambda_c" x2="1"/>
<Transition x1="2" event="alpha_a" x2="2"/>
<Transition x1="2" event="mue_a" x2="2"/>
<Transition x1="2" event="lambda_a" x2="2"/>
<Transition x1="2" event="alpha_b" x2="1"/>
<Transition x1="2" event="beta_b" x2="4"/>
<Transition x1="2" event="mue_b" x2="2"/>
<Transition x1="2" event="lambda_b" x2="2"/>
<Transition x1="2" event="beta_c" x2="2"/>
<Transition x1="2" event="mue_c" x2="2"/>
<Transition x1="2" event="lambda_c" x2="2"/>
<Transition x1="3" event="alpha_a" x2="3"/>
<Transition x1="3" event="beta_a" x2="4"/>
<Transition x1="3" event="mue_a" x2="3"/>
<Transition x1="3" event="lambda_a" x2="3"/>
<Transition x1="3" event="mue_b" x2="3"/>
<Transition x1="3" event="lambda_b" x2="3"/>
<Transition x1="3" event="alpha_c" x2="1"/>
<Transition x1="3" event="beta_c" x2="3"/>
<Transition x1="3" event="mue_c" x2="3"/>
<Transition x1="3" event="lambda_c" x2="3"/>
<Transition x1="4" event="alpha_a" x2="4"/>
<Transition x1="4" event="mue_a" x2="4"/>
<Transition x1="4" event="lambda_a" x2="4"/>
<Transition x1="4" event="alpha_b" x2="3"/>
<Transition x1="4" event="mue_b" x2="4"/>
<Transition x1="4" event="lambda_b" x2="4"/>
<Transition x1="4" event="alpha_c" x2="2"/>
<Transition x1="4" event="beta_c" x2="4"/>
<Transition x1="4" event="mue_c" x2="4"/>
<Transition x1="4" event="lambda_c" x2="4"/>
</TransitionRelation>

</Generator>
<VioModels>
<TransitionList>
<Transition x1="1" event="alpha_a" x2="1"/>
<Transition x1="1" event="beta_a" x2="2"/>
<Transition x1="1" event="mue_a" x2="1"/>
<Transition x1="1" event="lambda_a" x2="1"/>
<Transition x1="1" event="beta_b" x2="3"/>
<Transition x1="1" event="mue_b" x2="1"/>
<Transition x1="1" event="lambda_b" x2="1"/>
<Transition x1="1" event="beta_c" x2="1"/>
<Transition x1="1" event="mue_c" x2="1"/>
<Transition x1="1" event="lambda_c" x2="1"/>
<Transition x1="2" event="alpha_a" x2="2"/>
<Transition x1="2" event="mue_a" x2="2"/>
<Transition x1="2" event="lambda_a" x2="2"/>
<Transition x1="2" event="alpha_b" x2="1"/>
<Transition x1="2" event="beta_b" x2="4"/>
<Transition x1="2" event="mue_b" x2="2"/>
<Transition x1="2" event="lambda_b" x2="2"/>
<Transition x1="2" event="beta_c" x2="2"/>
<Transition x1="2" event="mue_c" x2="2"/>
<Transition x1="2" event="lambda_c" x2="2"/>
<Transition x1="3" event="alpha_a" x2="3"/>
<Transition x1="3" event="beta_a" x2="4"/>
<Transition x1="3" event="mue_a" x2="3"/>
<Transition x1="3" event="lambda_a" x2="3"/>
<Transition x1="3" event="mue_b" x2="3"/>
<Transition x1="3" event="lambda_b" x2="3"/>
<Transition x1="3" event="alpha_c" x2="1"/>
<Transition x1="3" event="beta_c" x2="3"/>
<Transition x1="3" event="mue_c" x2="3"/>
<Transition x1="3" event="lambda_c" x2="3"/>
<Transition x1="4" event="alpha_a" x2="4"/>
<Transition x1="4" event="mue_a" x2="4"/>
<Transition x1="4" event="lambda_a" x2="4"/>
<Transition x1="4" event="alpha_b" x2="3"/>
<Transition x1="4" event="mue_b" x2="4"/>
<Transition x1="4" event="lambda_b" x2="4"/>
<Transition x1="4" event="alpha_c" x2="2"/>
<Transition x1="4" event="beta_c" x2="4"/>
<Transition x1="4" event="mue_c" x2="4"/>
<Transition x1="4" event="lambda_c" x2="4"/>
</TransitionList>
<StateList>
<State id="1"/>
<State id="2"/>
<State id="3"/>
<State id="4"/>
</StateList>
<EventList>
<Event name="alpha_a"/>
<Event name="beta_a"/>
<Event name="mue_a"/>
<Event name="lambda_a"/>
<Event name="alpha_b"/>
<Event name="beta_b"/>
<Event name="mue_b"/>
<Event name="lambda_b"/>
<Event name="alpha_c"/>
<Event name="beta_c"/>
<Event name="mue_c"/>
<Event name="lambda_c"/>
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
SuperABC      Generator     +Visual+      +Shown+       +Supervisor+ 
<Value>
<VioGenerator>
<Generator name="SuperABC [minstate]" ftype="Generator">

<Alphabet ftype="EventSet">
<Event name="alpha_a"/>
<Event name="beta_a"/>
<Event name="mue_a"/>
<Event name="lambda_a"/>
<Event name="alpha_b"/>
<Event name="beta_b"/>
<Event name="mue_b"/>
<Event name="lambda_b"/>
<Event name="alpha_c"/>
<Event name="beta_c"/>
<Event name="mue_c"/>
<Event name="lambda_c"/>
</Alphabet>

<StateSet>
<State id="1">
<Initial/>
<Marked/>
</State>
<Consecutive from="2" to="48"/>
</StateSet>

<TransitionRelation>
<Transition x1="1" event="alpha_a" x2="41"/>
<Transition x1="2" event="alpha_a" x2="3"/>
<Transition x1="2" event="beta_b" x2="15"/>
<Transition x1="2" event="mue_b" x2="7"/>
<Transition x1="2" event="beta_c" x2="33"/>
<Transition x1="2" event="mue_c" x2="19"/>
<Transition x1="3" event="beta_a" x2="6"/>
<Transition x1="3" event="mue_a" x2="4"/>
<Transition x1="3" event="beta_b" x2="45"/>
<Transition x1="3" event="mue_b" x2="8"/>
<Transition x1="3" event="beta_c" x2="34"/>
<Transition x1="3" event="mue_c" x2="20"/>
<Transition x1="4" event="lambda_a" x2="2"/>
<Transition x1="4" event="beta_b" x2="17"/>
<Transition x1="4" event="mue_b" x2="9"/>
<Transition x1="4" event="beta_c" x2="35"/>
<Transition x1="4" event="mue_c" x2="21"/>
<Transition x1="5" event="alpha_b" x2="2"/>
<Transition x1="5" event="beta_c" x2="36"/>
<Transition x1="5" event="mue_c" x2="22"/>
<Transition x1="6" event="beta_b" x2="18"/>
<Transition x1="6" event="mue_b" x2="10"/>
<Transition x1="6" event="beta_c" x2="37"/>
<Transition x1="6" event="mue_c" x2="23"/>
<Transition x1="7" event="alpha_a" x2="8"/>
<Transition x1="7" event="lambda_b" x2="28"/>
<Transition x1="7" event="beta_c" x2="43"/>
<Transition x1="7" event="mue_c" x2="24"/>
<Transition x1="8" event="beta_a" x2="10"/>
<Transition x1="8" event="mue_a" x2="9"/>
<Transition x1="8" event="lambda_b" x2="16"/>
<Transition x1="8" event="beta_c" x2="38"/>
<Transition x1="8" event="mue_c" x2="25"/>
<Transition x1="9" event="lambda_a" x2="7"/>
<Transition x1="9" event="lambda_b" x2="47"/>
<Transition x1="9" event="beta_c" x2="39"/>
<Transition x1="9" event="mue_c" x2="26"/>
<Transition x1="10" event="lambda_b" x2="5"/>
<Transition x1="10" event="beta_c" x2="40"/>
<Transition x1="10" event="mue_c" x2="27"/>
<Transition x1="11" event="alpha_a" x2="12"/>
<Transition x1="11" event="alpha_c" x2="28"/>
<Transition x1="12" event="beta_a" x2="14"/>
<Transition x1="12" event="mue_a" x2="13"/>
<Transition x1="12" event="alpha_c" x2="16"/>
<Transition x1="13" event="lambda_a" x2="11"/>
<Transition x1="13" event="alpha_c" x2="47"/>
<Transition x1="14" event="alpha_c" x2="5"/>
<Transition x1="15" event="alpha_a" x2="45"/>
<Transition x1="15" event="beta_c" x2="11"/>
<Transition x1="15" event="mue_c" x2="32"/>
<Transition x1="16" event="beta_a" x2="5"/>
<Transition x1="16" event="mue_a" x2="47"/>
<Transition x1="16" event="beta_c" x2="41"/>
<Transition x1="16" event="mue_c" x2="46"/>
<Transition x1="17" event="lambda_a" x2="15"/>
<Transition x1="17" event="beta_c" x2="13"/>
<Transition x1="17" event="mue_c" x2="30"/>
<Transition x1="18" event="beta_c" x2="14"/>
<Transition x1="18" event="mue_c" x2="31"/>
<Transition x1="19" event="alpha_a" x2="20"/>
<Transition x1="19" event="beta_b" x2="32"/>
<Transition x1="19" event="mue_b" x2="24"/>
<Transition x1="19" event="lambda_c" x2="33"/>
<Transition x1="20" event="beta_a" x2="23"/>
<Transition x1="20" event="mue_a" x2="21"/>
<Transition x1="20" event="beta_b" x2="29"/>
<Transition x1="20" event="mue_b" x2="25"/>
<Transition x1="20" event="lambda_c" x2="34"/>
<Transition x1="21" event="lambda_a" x2="19"/>
<Transition x1="21" event="beta_b" x2="30"/>
<Transition x1="21" event="mue_b" x2="26"/>
<Transition x1="21" event="lambda_c" x2="35"/>
<Transition x1="22" event="alpha_b" x2="19"/>
<Transition x1="22" event="lambda_c" x2="36"/>
<Transition x1="23" event="beta_b" x2="31"/>
<Transition x1="23" event="mue_b" x2="27"/>
<Transition x1="23" event="lambda_c" x2="37"/>
<Transition x1="24" event="alpha_a" x2="25"/>
<Transition x1="24" event="lambda_b" x2="44"/>
<Transition x1="24" event="lambda_c" x2="43"/>
<Transition x1="25" event="beta_a" x2="27"/>
<Transition x1="25" event="mue_a" x2="26"/>
<Transition x1="25" event="lambda_b" x2="46"/>
<Transition x1="25" event="lambda_c" x2="38"/>
<Transition x1="26" event="lambda_a" x2="24"/>
<Transition x1="26" event="lambda_b" x2="48"/>
<Transition x1="26" event="lambda_c" x2="39"/>
<Transition x1="27" event="lambda_b" x2="22"/>
<Transition x1="27" event="lambda_c" x2="40"/>
<Transition x1="28" event="alpha_a" x2="16"/>
<Transition x1="28" event="beta_c" x2="1"/>
<Transition x1="28" event="mue_c" x2="44"/>
<Transition x1="29" event="beta_a" x2="31"/>
<Transition x1="29" event="mue_a" x2="30"/>
<Transition x1="29" event="lambda_c" x2="12"/>
<Transition x1="30" event="lambda_a" x2="32"/>
<Transition x1="30" event="lambda_c" x2="13"/>
<Transition x1="31" event="lambda_c" x2="14"/>
<Transition x1="32" event="alpha_a" x2="29"/>
<Transition x1="32" event="lambda_c" x2="11"/>
<Transition x1="33" event="alpha_a" x2="34"/>
<Transition x1="33" event="beta_b" x2="11"/>
<Transition x1="33" event="mue_b" x2="43"/>
<Transition x1="34" event="beta_a" x2="37"/>
<Transition x1="34" event="mue_a" x2="35"/>
<Transition x1="34" event="beta_b" x2="12"/>
<Transition x1="34" event="mue_b" x2="38"/>
<Transition x1="35" event="lambda_a" x2="33"/>
<Transition x1="35" event="beta_b" x2="13"/>
<Transition x1="35" event="mue_b" x2="39"/>
<Transition x1="36" event="alpha_b" x2="33"/>
<Transition x1="37" event="beta_b" x2="14"/>
<Transition x1="37" event="mue_b" x2="40"/>
<Transition x1="38" event="beta_a" x2="40"/>
<Transition x1="38" event="mue_a" x2="39"/>
<Transition x1="38" event="lambda_b" x2="41"/>
<Transition x1="39" event="lambda_a" x2="43"/>
<Transition x1="39" event="lambda_b" x2="42"/>
<Transition x1="40" event="lambda_b" x2="36"/>
<Transition x1="41" event="beta_a" x2="36"/>
<Transition x1="41" event="mue_a" x2="42"/>
<Transition x1="42" event="lambda_a" x2="1"/>
<Transition x1="43" event="alpha_a" x2="38"/>
<Transition x1="43" event="lambda_b" x2="1"/>
<Transition x1="44" event="alpha_a" x2="46"/>
<Transition x1="44" event="lambda_c" x2="1"/>
<Transition x1="45" event="beta_a" x2="18"/>
<Transition x1="45" event="mue_a" x2="17"/>
<Transition x1="45" event="beta_c" x2="12"/>
<Transition x1="45" event="mue_c" x2="29"/>
<Transition x1="46" event="beta_a" x2="22"/>
<Transition x1="46" event="mue_a" x2="48"/>
<Transition x1="46" event="lambda_c" x2="41"/>
<Transition x1="47" event="lambda_a" x2="28"/>
<Transition x1="47" event="beta_c" x2="42"/>
<Transition x1="47" event="mue_c" x2="48"/>
<Transition x1="48" event="lambda_a" x2="44"/>
<Transition x1="48" event="lambda_c" x2="42"/>
</TransitionRelation>

</Generator>
<VioModels>
<TransitionList>
<Transition x1="1" event="alpha_a" x2="41"/>
<Transition x1="2" event="alpha_a" x2="3"/>
<Transition x1="2" event="beta_b" x2="15"/>
<Transition x1="2" event="mue_b" x2="7"/>
<Transition x1="2" event="beta_c" x2="33"/>
<Transition x1="2" event="mue_c" x2="19"/>
<Transition x1="3" event="beta_a" x2="6"/>
<Transition x1="3" event="mue_a" x2="4"/>
<Transition x1="3" event="beta_b" x2="45"/>
<Transition x1="3" event="mue_b" x2="8"/>
<Transition x1="3" event="beta_c" x2="34"/>
<Transition x1="3" event="mue_c" x2="20"/>
<Transition x1="4" event="lambda_a" x2="2"/>
<Transition x1="4" event="beta_b" x2="17"/>
<Transition x1="4" event="mue_b" x2="9"/>
<Transition x1="4" event="beta_c" x2="35"/>
<Transition x1="4" event="mue_c" x2="21"/>
<Transition x1="5" event="alpha_b" x2="2"/>
<Transition x1="5" event="beta_c" x2="36"/>
<Transition x1="5" event="mue_c" x2="22"/>
<Transition x1="6" event="beta_b" x2="18"/>
<Transition x1="6" event="mue_b" x2="10"/>
<Transition x1="6" event="beta_c" x2="37"/>
<Transition x1="6" event="mue_c" x2="23"/>
<Transition x1="7" event="alpha_a" x2="8"/>
<Transition x1="7" event="lambda_b" x2="28"/>
<Transition x1="7" event="beta_c" x2="43"/>
<Transition x1="7" event="mue_c" x2="24"/>
<Transition x1="8" event="beta_a" x2="10"/>
<Transition x1="8" event="mue_a" x2="9"/>
<Transition x1="8" event="lambda_b" x2="16"/>
<Transition x1="8" event="beta_c" x2="38"/>
<Transition x1="8" event="mue_c" x2="25"/>
<Transition x1="9" event="lambda_a" x2="7"/>
<Transition x1="9" event="lambda_b" x2="47"/>
<Transition x1="9" event="beta_c" x2="39"/>
<Transition x1="9" event="mue_c" x2="26"/>
<Transition x1="10" event="lambda_b" x2="5"/>
<Transition x1="10" event="beta_c" x2="40"/>
<Transition x1="10" event="mue_c" x2="27"/>
<Transition x1="11" event="alpha_a" x2="12"/>
<Transition x1="11" event="alpha_c" x2="28"/>
<Transition x1="12" event="beta_a" x2="14"/>
<Transition x1="12" event="mue_a" x2="13"/>
<Transition x1="12" event="alpha_c" x2="16"/>
<Transition x1="13" event="lambda_a" x2="11"/>
<Transition x1="13" event="alpha_c" x2="47"/>
<Transition x1="14" event="alpha_c" x2="5"/>
<Transition x1="15" event="alpha_a" x2="45"/>
<Transition x1="15" event="beta_c" x2="11"/>
<Transition x1="15" event="mue_c" x2="32"/>
<Transition x1="16" event="beta_a" x2="5"/>
<Transition x1="16" event="mue_a" x2="47"/>
<Transition x1="16" event="beta_c" x2="41"/>
<Transition x1="16" event="mue_c" x2="46"/>
<Transition x1="17" event="lambda_a" x2="15"/>
<Transition x1="17" event="beta_c" x2="13"/>
<Transition x1="17" event="mue_c" x2="30"/>
<Transition x1="18" event="beta_c" x2="14"/>
<Transition x1="18" event="mue_c" x2="31"/>
<Transition x1="19" event="alpha_a" x2="20"/>
<Transition x1="19" event="beta_b" x2="32"/>
<Transition x1="19" event="mue_b" x2="24"/>
<Transition x1="19" event="lambda_c" x2="33"/>
<Transition x1="20" event="beta_a" x2="23"/>
<Transition x1="20" event="mue_a" x2="21"/>
<Transition x1="20" event="beta_b" x2="29"/>
<Transition x1="20" event="mue_b" x2="25"/>
<Transition x1="20" event="lambda_c" x2="34"/>
<Transition x1="21" event="lambda_a" x2="19"/>
<Transition x1="21" event="beta_b" x2="30"/>
<Transition x1="21" event="mue_b" x2="26"/>
<Transition x1="21" event="lambda_c" x2="35"/>
<Transition x1="22" event="alpha_b" x2="19"/>
<Transition x1="22" event="lambda_c" x2="36"/>
<Transition x1="23" event="beta_b" x2="31"/>
<Transition x1="23" event="mue_b" x2="27"/>
<Transition x1="23" event="lambda_c" x2="37"/>
<Transition x1="24" event="alpha_a" x2="25"/>
<Transition x1="24" event="lambda_b" x2="44"/>
<Transition x1="24" event="lambda_c" x2="43"/>
<Transition x1="25" event="beta_a" x2="27"/>
<Transition x1="25" event="mue_a" x2="26"/>
<Transition x1="25" event="lambda_b" x2="46"/>
<Transition x1="25" event="lambda_c" x2="38"/>
<Transition x1="26" event="lambda_a" x2="24"/>
<Transition x1="26" event="lambda_b" x2="48"/>
<Transition x1="26" event="lambda_c" x2="39"/>
<Transition x1="27" event="lambda_b" x2="22"/>
<Transition x1="27" event="lambda_c" x2="40"/>
<Transition x1="28" event="alpha_a" x2="16"/>
<Transition x1="28" event="beta_c" x2="1"/>
<Transition x1="28" event="mue_c" x2="44"/>
<Transition x1="29" event="beta_a" x2="31"/>
<Transition x1="29" event="mue_a" x2="30"/>
<Transition x1="29" event="lambda_c" x2="12"/>
<Transition x1="30" event="lambda_a" x2="32"/>
<Transition x1="30" event="lambda_c" x2="13"/>
<Transition x1="31" event="lambda_c" x2="14"/>
<Transition x1="32" event="alpha_a" x2="29"/>
<Transition x1="32" event="lambda_c" x2="11"/>
<Transition x1="33" event="alpha_a" x2="34"/>
<Transition x1="33" event="beta_b" x2="11"/>
<Transition x1="33" event="mue_b" x2="43"/>
<Transition x1="34" event="beta_a" x2="37"/>
<Transition x1="34" event="mue_a" x2="35"/>
<Transition x1="34" event="beta_b" x2="12"/>
<Transition x1="34" event="mue_b" x2="38"/>
<Transition x1="35" event="lambda_a" x2="33"/>
<Transition x1="35" event="beta_b" x2="13"/>
<Transition x1="35" event="mue_b" x2="39"/>
<Transition x1="36" event="alpha_b" x2="33"/>
<Transition x1="37" event="beta_b" x2="14"/>
<Transition x1="37" event="mue_b" x2="40"/>
<Transition x1="38" event="beta_a" x2="40"/>
<Transition x1="38" event="mue_a" x2="39"/>
<Transition x1="38" event="lambda_b" x2="41"/>
<Transition x1="39" event="lambda_a" x2="43"/>
<Transition x1="39" event="lambda_b" x2="42"/>
<Transition x1="40" event="lambda_b" x2="36"/>
<Transition x1="41" event="beta_a" x2="36"/>
<Transition x1="41" event="mue_a" x2="42"/>
<Transition x1="42" event="lambda_a" x2="1"/>
<Transition x1="43" event="alpha_a" x2="38"/>
<Transition x1="43" event="lambda_b" x2="1"/>
<Transition x1="44" event="alpha_a" x2="46"/>
<Transition x1="44" event="lambda_c" x2="1"/>
<Transition x1="45" event="beta_a" x2="18"/>
<Transition x1="45" event="mue_a" x2="17"/>
<Transition x1="45" event="beta_c" x2="12"/>
<Transition x1="45" event="mue_c" x2="29"/>
<Transition x1="46" event="beta_a" x2="22"/>
<Transition x1="46" event="mue_a" x2="48"/>
<Transition x1="46" event="lambda_c" x2="41"/>
<Transition x1="47" event="lambda_a" x2="28"/>
<Transition x1="47" event="beta_c" x2="42"/>
<Transition x1="47" event="mue_c" x2="48"/>
<Transition x1="48" event="lambda_a" x2="44"/>
<Transition x1="48" event="lambda_c" x2="42"/>
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
</StateList>
<EventList>
<Event name="alpha_a"/>
<Event name="beta_a"/>
<Event name="mue_a"/>
<Event name="lambda_a"/>
<Event name="alpha_b"/>
<Event name="beta_b"/>
<Event name="mue_b"/>
<Event name="lambda_b"/>
<Event name="alpha_c"/>
<Event name="beta_c"/>
<Event name="mue_c"/>
<Event name="lambda_c"/>
</EventList>
<GraphData>
<States>
<State>
1             
<Item>
<Position>
27.800000      1112.500000   
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
2             
<Item>
<Position>
2800           440.299988    
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
3             
<Item>
<Position>
152.800000     1547.200012   
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
4             
<Item>
<Position>
277.800012     1250          
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
5             
<Item>
<Position>
1195.800018    1209.700012   
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
6             
<Item>
<Position>
859.700012     1816.699982   
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
7             
<Item>
<Position>
712.500000     334.699988    
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
8             
<Item>
<Position>
859.700012     840.299988    
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
9             
<Item>
<Position>
565.299988     513.899994    
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
10            
<Item>
<Position>
1006.900024    1504.199982   
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
11            
<Item>
<Position>
712.500000     2045.800018   
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
12            
<Item>
<Position>
859.700012     1995.800018   
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
13            
<Item>
<Position>
565.299988     1995.800018   
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
14            
<Item>
<Position>
2520.800018    2062.500000   
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
15            
<Item>
<Position>
565.299988     2318.099976   
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
16            
<Item>
<Position>
1006.900024    766.699982    
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
17            
<Item>
<Position>
418.100023     2244.400024   
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
18            
<Item>
<Position>
1101.399994    2451.399994   
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
19            
<Item>
<Position>
1490.299988    1272.200012   
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
20            
<Item>
<Position>
1637.500000    1536.100006   
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
21            
<Item>
<Position>
1784.700012    1290.299988   
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
22            
<Item>
<Position>
1343.099976    1251.399994   
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
23            
<Item>
<Position>
1784.700012    1819.400024   
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
24            
<Item>
<Position>
2079.199982    426.399994    
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
25            
<Item>
<Position>
2226.399994    894.400024    
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
26            
<Item>
<Position>
1931.900024    575           
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
27            
<Item>
<Position>
2373.600006    1437.500000   
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
28            
<Item>
<Position>
1343.099976    429.199982    
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
29            
<Item>
<Position>
2226.399994    2062.500000   
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
30            
<Item>
<Position>
1931.900024    2072.200012   
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
31            
<Item>
<Position>
2373.600006    2062.500000   
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
32            
<Item>
<Position>
2079.199982    2152.799988   
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
33            
<Item>
<Position>
1637.500000    997.200012    
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
34            
<Item>
<Position>
1784.700012    1645.800018   
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
35            
<Item>
<Position>
418.100023     1369.400024   
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
36            
<Item>
<Position>
1490.299988    1125          
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
37            
<Item>
<Position>
1931.900024    1798.600006   
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
38            
<Item>
<Position>
2373.600006    895.800018    
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
39            
<Item>
<Position>
2520.800018    200           
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
40            
<Item>
<Position>
2520.800018    1311.100006   
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
41            
<Item>
<Position>
2931.900024    858.300018    
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
42            
<Item>
<Position>
3070.800018    440.299988    
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
43            
<Item>
<Position>
2226.399994    345.799994    
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
44            
<Item>
<Position>
2659.700012    518.100023    
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
45            
<Item>
<Position>
712.500000     2402.799988   
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
46            
<Item>
<Position>
2373.600006    761.100006    
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
47            
<Item>
<Position>
1195.800018    470.800018    
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
<State>
48            
<Item>
<Position>
2520.800018    662.500000    
</Position>
<BasePoints>
0              0              30             30             -50            0             
-29.999885     0             
</BasePoints>
</Item>
</State>
</States>
<TransRel>
<Trans>
1              alpha_a       3              +Free+       
<Item>
<Position>
27.800000      1112.500000   
</Position>
<BasePoints>
62.500000      252.799988     0              0              8.600711       28.807184     
29.100001      101.399994     87.500000      305.599976     116.621959     405.857202    
125            434.700012    
</BasePoints>
</Item>
</Trans>
<Trans>
1              mue_b         7              +Free+       
<Item>
<Position>
27.800000      1112.500000   
</Position>
<BasePoints>
316.600001     -1037.500000   0              0              0              -30.026073    
2.800000       -194.400024    19.400001      -1050          125            -1050         
125            -1050          125            -1050          537.499988     -1050         
641.599977     -1050          672.200000     -895.799994    681.541466     -807.616564   
684.700000     -777.800012   
</BasePoints>
</Item>
</Trans>
<Trans>
1              beta_b        15             +Free+       
<Item>
<Position>
27.800000      1112.500000   
</Position>
<BasePoints>
250.000012     1300           0              0              1.511054       30.005214     
9.700000       216.699982     59.700000      1288.899994    125            1288.899994   
125            1288.899994    125            1288.899994    390.300024     1288.899994   
433.300006     1288.899994    473.599994     1262.500000    515.053794     1225.587286   
537.499988     1205.599976   
</BasePoints>
</Item>
</Trans>
<Trans>
1              mue_c         19             +Free+       
<Item>
<Position>
27.800000      1112.500000   
</Position>
<BasePoints>
684.700000     159.700012     0              0              29.029604      7.587310      
145.799994     36.100006      631.900012     154.199982     1038.899982    191.699982    
1070.800006    194.400024     1077.799976    191.699982     1108.300006    191.699982    
1216.600025    190.299988     1243.000019    194.400024     1349.999988    186.100006    
1374.999988    183.300018     1380.500019    181.900024     1402.799976    177.799988    
1406.900012    176.399994     1411.099994    175            1433.766165    168.253070    
1462.499988    159.700012    
</BasePoints>
</Item>
</Trans>
<Trans>
1              beta_c        33             +Free+       
<Item>
<Position>
27.800000      1112.500000   
</Position>
<BasePoints>
758.300006     -154.199982    0              0              7.236894       -29.157326    
20.800000      -75            56.900001      -166.699982    125            -166.699982   
125            -166.699982    125            -166.699982    1388.899982    -166.699982   
1449.999988    -166.699982    1519.400012    -147.200012    1581.420714    -125.290132   
1609.700000    -115.299988   
</BasePoints>
</Item>
</Trans>
<Trans>
2              alpha_a       41             +Free+       
<Item>
<Position>
2800           440.299988    
</Position>
<BasePoints>
62.500000      234.700012     0              0              8.997065       28.617099     
30.599976      95.800018      88.899994      283.300018     122.769915     389.399452    
131.900024     418.000031    
</BasePoints>
</Item>
</Trans>
<Trans>
3              mue_a         4              +Free+       
<Item>
<Position>
152.800000     1547.200012   
</Position>
<BasePoints>
62.500012      -112.500000    0              0              11.641965      -27.688977    
33.299994      -77.799988     81.899989      -197.200012    113.123477     -269.644260   
125.000012     -297.200012   
</BasePoints>
</Item>
</Trans>
<Trans>
3              beta_a        6              +Free+       
<Item>
<Position>
152.800000     1547.200012   
</Position>
<BasePoints>
338.899982     261.100006     0              0              1.511061       30.005214     
5.499995       93.099976      27.800000      250            125.000012     250           
125.000012     250            125.000012     250            559.700000     250           
597.200000     250            636.099994     255.599976     677.457847     263.719661    
706.900012     269.499969    
</BasePoints>
</Item>
</Trans>
<Trans>
3              mue_b         8              +Free+       
<Item>
<Position>
152.800000     1547.200012   
</Position>
<BasePoints>
338.899982     -531.900024    0              0              3.011139       -29.896302    
19.400001      -138.899994    91.600001      -547.200012    338.899982     -548.600006   
338.899982     -548.600006    338.899982     -548.600006    559.700000     -548.600006   
601.399982     -548.600006    616.599977     -545.800018    647.200000     -572.200012   
674.999988     -595.800018    690.299976     -634.700012    700.179028     -677.667852   
706.900012     -706.900024   
</BasePoints>
</Item>
</Trans>
<Trans>
3              mue_c         20             +Free+       
<Item>
<Position>
152.800000     1547.200012   
</Position>
<BasePoints>
706.900012     13.899994      0              0              30.026086      0             
52.800000      0              91.600001      0              125.000012     0             
125.000012     0              125.000012     0              633.300006     0             
855.500019     0              909.700000     54.199982      1130.500019    38.899994     
1241.600025    29.199982      1369.400012    9.700012       1455.173577    -5.773465     
1484.700000    -11.100006    
</BasePoints>
</Item>
</Trans>
<Trans>
3              beta_c        34             +Free+       
<Item>
<Position>
152.800000     1547.200012   
</Position>
<BasePoints>
780.500019     175            0              0              20.422989      22.002047     
50.000012      50             112.500012     105.599976     177.800000     129.199982    
304.099977     173.600006     647.200000     163.899994     780.500019     163.899994    
780.500019     163.899994     780.500019     163.899994     1411.099994    168.099976    
1483.300006    168.099976     1508.300006    198.600006     1572.200000    169.499969    
1573.599994    168.099976     1586.099994    152.799988     1612.552316    121.496172    
1631.900012    98.600006     
</BasePoints>
</Item>
</Trans>
<Trans>
3              beta_b        45             +Free+       
<Item>
<Position>
152.800000     1547.200012   
</Position>
<BasePoints>
265.300024     929.199982     0              0              1.511061       30.005214     
5.499995       181.999969     33.299994      918.099976     125.000012     918.099976    
125.000012     918.099976     125.000012     918.099976     412.499988     918.099976    
451.399982     918.099976     490.300024     900            534.445204     871.757238    
559.700000     855.599976    
</BasePoints>
</Item>
</Trans>
<Trans>
4              lambda_a      1              +Free+       
<Item>
<Position>
277.800012     1250          
</Position>
<BasePoints>
-125.000012    -45.800018     0              0              -26.220628     -14.578663    
-68.100023     -37.500000     -161.100006    -87.500000     -223.817233    -122.774029   
-250.000012    -137.500000   
</BasePoints>
</Item>
</Trans>
<Trans>
4              mue_b         9              +Free+       
<Item>
<Position>
277.800012     1250          
</Position>
<BasePoints>
140.300012     -256.900024    0              0              10.363044      -28.204600    
52.799988      -136.100006    220.799994     -563.899994    276.654016     -708.098881   
287.499976     -736.100006   
</BasePoints>
</Item>
</Trans>
<Trans>
4              beta_b        17             +Free+       
<Item>
<Position>
277.800012     1250          
</Position>
<BasePoints>
66.599989      566.699982     0              0              4.380249       29.700292     
23.599982      165.299988     108.299994     769.400024     136.073020     964.679002    
140.300012     994.400024    
</BasePoints>
</Item>
</Trans>
<Trans>
4              mue_c         21             +Free+       
<Item>
<Position>
277.800012     1250          
</Position>
<BasePoints>
729.100013     -187.500000    0              0              21.242887      -21.242939    
70.799994      -70.800018     215.300012     -197.200012    361.099982     -198.600006   
361.099982     -198.600006    361.099982     -198.600006    918.000007     -198.600006   
987.499976     -197.200012    970.799994     -126.399994    1030.500007    -91.699982    
1049.999976    -81.900024     1343.000007    -4.199982      1477.957688    32.441952     
1506.900001    40.299988     
</BasePoints>
</Item>
</Trans>
<Trans>
4              beta_c        35             +Free+       
<Item>
<Position>
277.800012     1250          
</Position>
<BasePoints>
66.599989      76.399994      0              0              22.628055      19.690737     
42.999983      36.100006      77.799988      65.299988      117.611734     99.761045     
140.300012     119.400024    
</BasePoints>
</Item>
</Trans>
<Trans>
5              alpha_b       1              +Free+       
<Item>
<Position>
1195.800018    1209.700012   
</Position>
<BasePoints>
-630.500031    -91.600037     0              0              -29.463260     -5.850129     
-131.900024    -29.100037     -515.199995    -111.100006    -837.500024    -116.600037   
-959.700012    -119.400024    -993.000007    -138.899994    -1115.200019   -116.600037   
-1119.400018   -115.299988    -1123.600018   -115.299988    -1140.233801   -108.519108   
-1168.000019   -97.200012    
</BasePoints>
</Item>
</Trans>
<Trans>
5              mue_c         22             +Free+       
<Item>
<Position>
1195.800018    1209.700012   
</Position>
<BasePoints>
73.600006      33.399963      0              0              28.617099      9.105403      
47.299957      13.899994      76.399994      22.200012      118.371217     33.743567     
147.299957     41.699982     
</BasePoints>
</Item>
</Trans>
<Trans>
5              beta_c        36             +Free+       
<Item>
<Position>
1195.800018    1209.700012   
</Position>
<BasePoints>
147.299957     -22.200012     0              0              28.807184      -8.600729     
76.399994      -22.200012     184.799957     -54.100037     265.626006     -76.645842    
294.499969     -84.700012    
</BasePoints>
</Item>
</Trans>
<Trans>
6              mue_b         10             +Free+       
<Item>
<Position>
859.700012     1816.699982   
</Position>
<BasePoints>
73.600006      -33.399963     0              0              25.213215      -16.345839    
44.499969      -29.199982     72.200012      -51.399994     87.500000      -76.399994    
122.200012     -134.799957    137.500000     -213.899994    144.262643     -282.641832   
147.200012     -312.500000   
</BasePoints>
</Item>
</Trans>
<Trans>
6              beta_b        18             +Free+       
<Item>
<Position>
859.700012     1816.699982   
</Position>
<BasePoints>
73.600006      233.300018     0              0              10.363070      28.204600     
47.200012      123.600006     177.799988     463.899994     231.184883     606.593921    
241.699982     634.700012    
</BasePoints>
</Item>
</Trans>
<Trans>
6              mue_c         23             +Free+       
<Item>
<Position>
859.700012     1816.699982   
</Position>
<BasePoints>
483.399963     22.200012      0              0              30.026073      0             
58.399963      0              105.599976     0              147.200012     0             
147.200012     0              147.200012     0              409.700012     0             
593.099976     0              633.399963     101.399994     812.500000     76.399994     
837.500000     72.200012      844.499969     72.200012      865.299988     61.100006     
875            55.500031      884.700012     47.200012      904.850083     24.949943     
925            2.700043      
</BasePoints>
</Item>
</Trans>
<Trans>
6              beta_c        37             +Free+       
<Item>
<Position>
859.700012     1816.699982   
</Position>
<BasePoints>
556.999969     88.899994      0              0              24.064398      17.994129     
51.399994      34.700012      100            62.500000      147.200012     62.500000     
147.200012     62.500000      147.200012     62.500000      409.700012     62.500000     
612.500000     62.500000      670.899963     140.200043     865.299988     84.700012     
934.700012     63.899994      951.399994     56.900024      1012.500000    20.800018     
1018.099976    18.000031      1025           13.899994      1047.379737    -1.272691     
1072.200012    -18.099976    
</BasePoints>
</Item>
</Trans>
<Trans>
7              alpha_a       8              +Free+       
<Item>
<Position>
712.500000     334.699988    
</Position>
<BasePoints>
73.600006      297.199988     0              0              8.997065       28.617125     
31.899977      111.100030     106.900024     366.700006     138.841858     476.792361    
147.200012     505.599999    
</BasePoints>
</Item>
</Trans>
<Trans>
7              mue_c         24             +Free+       
<Item>
<Position>
712.500000     334.699988    
</Position>
<BasePoints>
704.199982     -11.099982     0              0              28.204600      -10.363044    
55.600023      -17.999983     104.199982     -31.899977     147.200012     -31.899977    
147.200012     -31.899977     147.200012     -31.899977     556.900024     -31.899977    
688.899994     -31.899977     720.800018     -20.799994     851.399994     -20.799994    
851.399994     -20.799994     851.399994     -20.799994     1219.400024    -20.799994    
1269.400024    -20.799994     1312.500000    19.500017      1348.703843    67.727285     
1366.699982    91.700006     
</BasePoints>
</Item>
</Trans>
<Trans>
7              lambda_b      28             +Free+       
<Item>
<Position>
712.500000     334.699988    
</Position>
<BasePoints>
294.400024     44.500017      0              0              28.204600      10.363070     
55.600023      18.100023      104.199982     32.000017      147.200012     32.000017     
147.200012     32.000017      147.200012     32.000017      483.300018     32.000017     
522.200012     32.000017      561.100006     50             605.308792     78.306352     
630.599976     94.499993     
</BasePoints>
</Item>
</Trans>
<Trans>
7              beta_c        43             +Free+       
<Item>
<Position>
712.500000     334.699988    
</Position>
<BasePoints>
777.799988     -123.599982    0              0              13.442588      -26.885175    
34.700012      -63.899994     81.899977      -136.099994    147.200012     -136.099994   
147.200012     -136.099994    147.200012     -136.099994    777.799988     -136.099994   
1044.400024    -136.099994    1352.799988    -42.999983     1485.452118    1.546749      
1513.899994    11.100006     
</BasePoints>
</Item>
</Trans>
<Trans>
8              mue_a         9              +Free+       
<Item>
<Position>
859.700012     840.299988    
</Position>
<BasePoints>
-147.200012    -94.499969     0              0              -21.896832     -20.528229    
-63.899994     -58.400011     -161.100006    -151.399994    -234.700012    -238.899994   
-248.600006    -255.599976    -261.100006    -275           -278.075909    -301.203028   
-294.400024    -326.399994   
</BasePoints>
</Item>
</Trans>
<Trans>
8              beta_a        10             +Free+       
<Item>
<Position>
859.700012     840.299988    
</Position>
<BasePoints>
73.600006      381.900024     0              0              5.934497       29.460655     
27.799988      129.100037     108.399963     486.100006     140.802742     634.584707    
147.200012     663.899994    
</BasePoints>
</Item>
</Trans>
<Trans>
8              lambda_b      16             +Free+       
<Item>
<Position>
859.700012     840.299988    
</Position>
<BasePoints>
73.600006      -26.399994     0              0              23.283931      -18.983710    
33.399963      -26.399994     47.200012      -36.100006     59.700012      -43.099976    
73.600006      -48.600006     87.500000      -54.199982     118.635242     -64.317642    
147.200012     -73.600006    
</BasePoints>
</Item>
</Trans>
<Trans>
8              mue_c         25             +Free+       
<Item>
<Position>
859.700012     840.299988    
</Position>
<BasePoints>
704.199982     30.500031      0              0              28.204600      10.363070     
36.100006      13.899994      48.600006      16.600037      59.700012      19.400024     
155.599976     40.299988      180.599976     36.100006      276.399994     33.300018     
604.199982     29.100037      686.100006     0              1012.500000    18.000031     
1122.200012    25             1250           38.899994      1336.897067    50.218240     
1366.699982    54.100037     
</BasePoints>
</Item>
</Trans>
<Trans>
8              beta_c        38             +Free+       
<Item>
<Position>
859.700012     840.299988    
</Position>
<BasePoints>
777.799988     -18.099976     0              0              30.026073      0             
77.799988      0              186.100006     -1.399994      276.399994     -2.799988     
538.899994     -6.999969      1212.500000    -98.600006     1454.199982    0             
1465.299988    4.100037       1473.600006    9.700012       1494.065535    32.958620     
1513.899994    55.500031     
</BasePoints>
</Item>
</Trans>
<Trans>
9              lambda_a      7              +Free+       
<Item>
<Position>
565.299988     513.899994    
</Position>
<BasePoints>
73.600006      -94.500017     0              0              10.363070      -28.204600    
20.800018      -50            37.500000      -84.700012     59.700012      -111.100006   
75             -129.200006    94.400024      -145.799994    121.833383     -163.153682   
147.200012     -179.200006   
</BasePoints>
</Item>
</Trans>
<Trans>
9              mue_c         26             +Free+       
<Item>
<Position>
565.299988     513.899994    
</Position>
<BasePoints>
704.100037     56.900024      0              0              23.283931      18.878834     
50             37.500000      100            67.999983      147.200012     67.999983     
147.200012     67.999983      147.200012     67.999983      441.600037     67.999983     
559.700012     67.999983      587.500000     41.700029      704.100037     41.700029     
704.100037     41.700029      704.100037     41.700029      998.600006     41.700029     
1113.899994    41.700029      1143.000031    -19.500017     1254.100037    5.499983      
1279.100037    12.500000      1304.100037    23.600006      1340.854049    45.652413     
1366.600037    61.100006     
</BasePoints>
</Item>
</Trans>
<Trans>
9              beta_c        39             +Free+       
<Item>
<Position>
565.299988     513.899994    
</Position>
<BasePoints>
998.600006     -484.699994    0              0              8.997065       -28.617099    
23.600006      -70.799971     59.700012      -159.699988    112.500000     -219.499993   
263.899994     -386.099994    311.100006     -497.199994    536.100006     -497.199994   
536.100006     -497.199994    536.100006     -497.199994    777.799988     -497.199994   
876.399994     -497.199994    901.399994     -498.599994    998.600006     -498.599994   
998.600006     -498.599994    998.600006     -498.599994    1513.899994    -498.599994   
1687.500000    -498.599994    1756.900024    -529.199994    1895.800018    -427.799994   
1918.000031    -411.099994    1933.300018    -384.699988    1946.529314    -342.509288   
1955.500031    -313.899994   
</BasePoints>
</Item>
</Trans>
<Trans>
9              lambda_b      47             +Free+       
<Item>
<Position>
565.299988     513.899994    
</Position>
<BasePoints>
294.400024     -55.599976     0              0              23.283931      -18.983710    
50             -37.500000     100            -68.099976     147.200012     -68.099976    
147.200012     -68.099976     147.200012     -68.099976     441.600037     -68.099976    
490.299988     -68.099976     544.400024     -59.700012     601.016057     -48.784471    
630.500031     -43.099976    
</BasePoints>
</Item>
</Trans>
<Trans>
10             lambda_b      5              +Free+       
<Item>
<Position>
1006.900024    1504.199982   
</Position>
<BasePoints>
94.499969      -148.600006    0              0              7.046433       -29.192459    
18.099976      -68.099976     34.799957      -119.499969    59.799957      -159.799957   
86.199951      -202.799988    127.799988     -241.699982    166.188696     -274.873846   
188.899994     -294.499969   
</BasePoints>
</Item>
</Trans>
<Trans>
10             mue_c         27             +Free+       
<Item>
<Position>
1006.900024    1504.199982   
</Position>
<BasePoints>
704.199982     86.100006      0              0              28.474692      9.463162      
41.699982      13.899994      51.399994      16.600037      59.799957      19.400024     
325            76.399994      397.299957     108.300018     665.299988     79.100037     
816.699982     61.100006      847.299957     2.700043       998.699951     2.700043      
998.699951     2.700043       998.699951     2.700043       1219.499969    2.700043      
1259.799957    2.700043       1298.699951    -18.099976     1342.281277    -49.247796    
1366.699982    -66.699982    
</BasePoints>
</Item>
</Trans>
<Trans>
10             beta_c        40             +Free+       
<Item>
<Position>
1006.900024    1504.199982   
</Position>
<BasePoints>
777.799988     -119.499969    0              0              30.008080      0             
73.699951      0              136.199951     0              188.899994     0             
188.899994     0              188.899994     0              409.799957     0             
544.499969     0              565.299988     -65.299988     690.299988     -109.799957   
779.199982     -141.699982    800            -151.399994    890.299988     -173.600006   
938.899994     -186.100006    950            -193.099976    998.699951     -193.099976   
998.699951     -193.099976    998.699951     -193.099976    1366.699982    -193.099976   
1400           -193.099976    1437.500000    -193.099976    1483.920507    -193.099976   
1513.899994    -193.099976   
</BasePoints>
</Item>
</Trans>
<Trans>
11             alpha_a       12             +Free+       
<Item>
<Position>
712.500000     2045.800018   
</Position>
<BasePoints>
73.600006      -11.100006     0              0              28.317378      -9.853395     
51.399994      -18.000031     77.799988      -26.399994     118.747469     -40.324496    
147.200012     -50           
</BasePoints>
</Item>
</Trans>
<Trans>
11             alpha_c       28             +Free+       
<Item>
<Position>
712.500000     2045.800018   
</Position>
<BasePoints>
294.400024     -1343.000031   0              0              21.801695      -20.580806    
29.199982      -29.100037     31.899977      -34.700012     34.700012      -40.200043    
61.100006      -102.700043    80.600023      -1186.100006   112.500000     -1245.800018  
223.600006     -1441.600037   411.100006     -1302.699995   570.800018     -1461.100006  
601.399994     -1488.900042   615.299988     -1534.700012   625.091986     -1587.116056  
630.599976     -1616.600037  
</BasePoints>
</Item>
</Trans>
<Trans>
12             mue_a         13             +Free+       
<Item>
<Position>
859.700012     1995.800018   
</Position>
<BasePoints>
-147.200012    -8.300018      0              0              -29.365069     -6.084672     
-55.500031     -12.500000     -86.100006     -16.600037     -112.500000    -19.400024    
-143.000031    -22.200012     -150           -22.200012     -181.900024    -19.400024    
-202.800035    -16.600037     -226.399994    -13.899994     -265.010771    -6.007504     
-294.400024    0             
</BasePoints>
</Item>
</Trans>
<Trans>
12             beta_a        14             +Free+       
<Item>
<Position>
859.700012     1995.800018   
</Position>
<BasePoints>
851.399994     195.899963     0              0              24.951085      16.662524     
95.899963      58.399963      259.700012     148.600006     409.700012     148.600006    
409.700012     148.600006     409.700012     148.600006     704.199982     148.600006    
1000           148.600006     998.600006     455.599976     1293.099976    455.599976    
1293.099976    455.599976     1293.099976    455.599976     1513.899994    455.599976    
1586.100006    455.599976     1636.100006    219.499969     1656.255841    96.307515     
1661.100006    66.699982     
</BasePoints>
</Item>
</Trans>
<Trans>
12             alpha_c       16             +Free+       
<Item>
<Position>
859.700012     1995.800018   
</Position>
<BasePoints>
73.600006      -302.700043    0              0              8.407872       -28.864117    
18.099976      -61.100006     29.199982      -102.700043    34.700012      -138.899994   
66.699982      -323.600006    91.699982      -790.200043    112.500000     -975          
120.899963     -1045.800018   131.999969     -1129.100037   142.693559     -1199.452401  
147.200012     -1229.100037  
</BasePoints>
</Item>
</Trans>
<Trans>
13             lambda_a      11             +Free+       
<Item>
<Position>
565.299988     1995.800018   
</Position>
<BasePoints>
73.600006      37.500000      0              0              28.454524      9.484842      
54.099989      18.099976      80.500031      26.399994      118.893218     39.984397     
147.200012     50            
</BasePoints>
</Item>
</Trans>
<Trans>
13             alpha_c       47             +Free+       
<Item>
<Position>
565.299988     1995.800018   
</Position>
<BasePoints>
294.400024     -1312.500000   0              0              2.414477       -29.921897    
19.400024      -222.200012    102.800035     -1113.899994   259.700012     -1333.300018  
340.299988     -1443.000031   501.399994     -1495.800018   601.210790     -1518.375329  
630.500031     -1525         
</BasePoints>
</Item>
</Trans>
<Trans>
14             alpha_c       5              +Free+       
<Item>
<Position>
2520.800018    2062.500000   
</Position>
<BasePoints>
-662.500000    -412.500000    0              0              -18.709527     -23.429024    
-44.400024     -54.199982     -79.100037     -97.200012     -112.500000    -133.300018   
-143.000031    -169.400024    -362.500000    -423.600006    -406.900024    -441.699982   
-516.600037    -488.899994    -579.100037    -495.800018    -676.399994    -423.600006   
-697.200012    -408.300018    -680.500031    -387.500000    -701.399994    -369.400024   
-716.600037    -355.599976    -784.700012    -325           -823.600006    -340.299988   
-1061.100006   -441.699982    -1244.400024   -716.699982    -1309.696338   -826.958437   
-1325          -852.799988   
</BasePoints>
</Item>
</Trans>
<Trans>
15             beta_c        11             +Free+       
<Item>
<Position>
565.299988     2318.099976   
</Position>
<BasePoints>
73.600006      -102.799988    0              0              14.314208      -26.386427    
43.000031      -79.199982     94.400024      -175           132.889307     -245.928151   
147.200012     -272.299957   
</BasePoints>
</Item>
</Trans>
<Trans>
15             mue_c         32             +Free+       
<Item>
<Position>
565.299988     2318.099976   
</Position>
<BasePoints>
777.799988     11.100006      0              0              29.989671      1.123574      
204.099989     4.100037       936.100006     16.600037      1159.700012    -25           
1297.200012    -51.399994     1327.799988    -75            1454.100037    -131.999969   
1459.700012    -134.799957    1465.299988    -137.500000    1487.869381    -150.410057   
1513.899994    -165.299988   
</BasePoints>
</Item>
</Trans>
<Trans>
15             alpha_a       45             +Free+       
<Item>
<Position>
565.299988     2318.099976   
</Position>
<BasePoints>
73.600006      52.700043      0              0              27.569767      11.926766     
48.600006      20.800018      70.800018      30.500031      87.500000      41.600037     
94.400024      45.800018      101.399994     50             123.294660     66.588316     
147.200012     84.700012     
</BasePoints>
</Item>
</Trans>
<Trans>
16             beta_a        5              +Free+       
<Item>
<Position>
1006.900024    766.699982    
</Position>
<BasePoints>
94.499969      329.100037     0              0              10.565531      28.146591     
36.199951      100            94.499969      255.500031     154.199982     380.500031    
158.399963     388.899994     163.899994     397.200012     174.534154     416.681801    
188.899994     443.000031    
</BasePoints>
</Item>
</Trans>
<Trans>
16             beta_c        41             +Free+       
<Item>
<Position>
1006.900024    766.699982    
</Position>
<BasePoints>
998.699951     245.800018     0              0              28.800863      8.364342      
205.599976     54.100037      975            255.500031     1219.499969    254.100037    
1219.499969    254.100037     1219.499969    254.100037     1793.099976    254.100037    
1854.199982    255.500031     1890.299988    187.500000     1914.780172    119.844439    
1925           91.600037     
</BasePoints>
</Item>
</Trans>
<Trans>
16             mue_c         46             +Free+       
<Item>
<Position>
1006.900024    766.699982    
</Position>
<BasePoints>
704.199982     -38.899994     0              0              28.800863      -8.450566     
41.699982      -11.099958     51.399994      -13.899994     59.799957      -15.299988    
231.999969     -44.499969     276.399994     -43.099976     448.699951     -51.399994    
780.599976     -66.699982     1181.999969    -26.399994     1336.880622    -8.958087     
1366.699982    -5.599976     
</BasePoints>
</Item>
</Trans>
<Trans>
16             mue_a         47             +Free+       
<Item>
<Position>
1006.900024    766.699982    
</Position>
<BasePoints>
94.499969      -116.699982    0              0              13.432275      -26.864550    
22.299957      -44.499969     29.199982      -59.800005     34.799957      -75           
47.299957      -101.399994    45.899963      -111.099958    59.799957      -137.500000   
87.500000      -183.399963    126.399994     -229.199982    168.391407     -274.013205   
188.899994     -295.899963   
</BasePoints>
</Item>
</Trans>
<Trans>
17             beta_c        13             +Free+       
<Item>
<Position>
418.100023     2244.400024   
</Position>
<BasePoints>
73.599958      -91.600037     0              0              15.240176      -25.823682    
42.999983      -73.600006     92.999983      -155.500031    132.085546     -222.637783   
147.199965     -248.600006   
</BasePoints>
</Item>
</Trans>
<Trans>
17             lambda_a      15             +Free+       
<Item>
<Position>
418.100023     2244.400024   
</Position>
<BasePoints>
73.599958      51.399994      0              0              26.836334      13.462158     
51.299953      26.399994      79.099989      40.299988      120.213287     60.464204     
147.199965     73.699951     
</BasePoints>
</Item>
</Trans>
<Trans>
17             mue_c         30             +Free+       
<Item>
<Position>
418.100023     2244.400024   
</Position>
<BasePoints>
777.699995     30.599976      0              0              29.786310      3.605247      
176.299953     18.099976      724.999952     62.500000      1159.699965    -27.700043    
1277.699995    -52.700043     1405.499983    -115.200043    1487.201957    -158.201051   
1513.800001    -172.200012   
</BasePoints>
</Item>
</Trans>
<Trans>
18             beta_c        14             +Free+       
<Item>
<Position>
1101.399994    2451.399994   
</Position>
<BasePoints>
683.300018     75             0              0              25.361708      16.131714     
62.500000      37.500000      116.699982     63.899994      168.000031     63.899994     
168.000031     63.899994      168.000031     63.899994      1272.200012    63.899994     
1316.699982    63.899994      1334.700012    54.199982      1359.700012    19.400024     
1400           -37.500000     1413.899994    -244.499969    1418.257092    -358.892993   
1419.400024    -388.899994   
</BasePoints>
</Item>
</Trans>
<Trans>
18             mue_c         31             +Free+       
<Item>
<Position>
1101.399994    2451.399994   
</Position>
<BasePoints>
609.700012     11.100006      0              0              29.989671      0             
69.400024      0              122.200012     0              168.000031     0             
168.000031     0              168.000031     0              756.900024     0             
900            0              950            -4.199982      1065.299988    -86.100006    
1159.700012    -154.199982    1225           -277.799988    1260.457581    -361.260507   
1272.200012    -388.899994   
</BasePoints>
</Item>
</Trans>
<Trans>
19             alpha_a       20             +Free+       
<Item>
<Position>
1490.299988    1272.200012   
</Position>
<BasePoints>
73.600006      156.999969     0              0              14.314249      26.386427     
43.000031      77.799988      93.000031      168.099976     132.403792     237.747251    
147.200012     263.899994    
</BasePoints>
</Item>
</Trans>
<Trans>
19             mue_b         24             +Free+       
<Item>
<Position>
1490.299988    1272.200012   
</Position>
<BasePoints>
294.400024     -588.899994    0              0              23.429024      -18.709527    
45.800018      -37.500000     69.400024      -58.300018     87.500000      -79.100037    
138.899994     -140.299988    148.600006     -158.300018    181.900024     -227.799988   
311.100006     -488.899994    168.000031     -677.800035    406.900024     -845.800018   
445.800018     -873.600006    502.799988     -868.000031    559.835034     -853.294123   
588.899994     -845.800018   
</BasePoints>
</Item>
</Trans>
<Trans>
19             beta_b        32             +Free+       
<Item>
<Position>
1490.299988    1272.200012   
</Position>
<BasePoints>
294.400024     793.099976     0              0              3.519455       29.786351     
22.200012      168.099976     106.900024     651.399994     406.900024     847.200012    
445.800018     873.600006     501.399994     880.599976     558.848739     880.599976    
588.899994     880.599976    
</BasePoints>
</Item>
</Trans>
<Trans>
19             lambda_c      33             +Free+       
<Item>
<Position>
1490.299988    1272.200012   
</Position>
<BasePoints>
73.600006      -104.100037    0              0              14.346670      -26.359815    
43.000031      -79.100037     94.400024      -176.399994    133.034175     -248.546365   
147.200012     -275          
</BasePoints>
</Item>
</Trans>
<Trans>
20             mue_a         21             +Free+       
<Item>
<Position>
1637.500000    1536.100006   
</Position>
<BasePoints>
73.600006      -94.400024     0              0              14.400431      -26.300244    
38.899994      -68.000031     77.799988      -136.100006    112.500000     -191.699982   
115.299988     -195.800018    118.099976     -200           131.102739     -220.464813   
147.200012     -245.800018   
</BasePoints>
</Item>
</Trans>
<Trans>
20             beta_a        23             +Free+       
<Item>
<Position>
1637.500000    1536.100006   
</Position>
<BasePoints>
73.600006      168.099976     0              0              14.367815      26.326661     
43.099976      80.599976      94.400024      181.999969     133.343248     256.714957    
147.200012     283.300018    
</BasePoints>
</Item>
</Trans>
<Trans>
20             mue_b         25             +Free+       
<Item>
<Position>
1637.500000    1536.100006   
</Position>
<BasePoints>
294.400024     -84.700012     0              0              29.447485      -5.855571     
91.699982      -18.000031     205.599976     -43.000031     234.700012     -69.400024    
351.399994     -179.199982    269.400024     -273.600006    354.199982     -406.900024   
408.300018     -491.699982    498.600006     -570.800018    565.308991     -623.177264   
588.899994     -641.699982   
</BasePoints>
</Item>
</Trans>
<Trans>
20             beta_b        29             +Free+       
<Item>
<Position>
1637.500000    1536.100006   
</Position>
<BasePoints>
294.400024     404.199982     0              0              5.855571       29.447485     
23.600006      109.700012     68.099976      288.899994     112.500000     330.599976    
254.199982     459.700012     372.200012     333.300018     529.199982     443.099976    
544.400024     452.799988     556.900024     468.099976     574.473646     500.116959    
588.899994     526.399994    
</BasePoints>
</Item>
</Trans>
<Trans>
20             lambda_c      34             +Free+       
<Item>
<Position>
1637.500000    1536.100006   
</Position>
<BasePoints>
73.600006      22.200012      0              0              29.921897      -2.414436     
51.399994      -2.799988      72.200012      0              87.500000      11.100006     
106.900024     23.600006      120.800018     44.499969      135.944611     81.902557     
147.200012     109.700012    
</BasePoints>
</Item>
</Trans>
<Trans>
21             lambda_a      19             +Free+       
<Item>
<Position>
1784.700012    1290.299988   
</Position>
<BasePoints>
-147.200012    1.399994       0              0              -29.921897     -2.414436     
-87.500000     -5.599976      -186.100006    -11.100006     -264.410994    -16.161636    
-294.400024    -18.099976    
</BasePoints>
</Item>
</Trans>
<Trans>
21             mue_b         26             +Free+       
<Item>
<Position>
1784.700012    1290.299988   
</Position>
<BasePoints>
73.600006      -645.900011    0              0              1.209952       -29.989671    
6.999969       -163.899994    26.399994      -612.500000    59.700012      -665.299988   
69.499969      -680.599976    84.700012      -691.699982    119.130158     -704.700809   
147.200012     -715.299988   
</BasePoints>
</Item>
</Trans>
<Trans>
21             beta_b        30             +Free+       
<Item>
<Position>
1784.700012    1290.299988   
</Position>
<BasePoints>
73.600006      422.200012     0              0              18.709527      23.429024     
27.799988      36.100006      31.999969      44.400024      34.700012      54.100037     
79.199982      180.500031     23.600006      225            59.700012      355.500031    
68.099976      381.900024     80.599976      383.300018     87.500000      411.100006    
120.899963     523.600006     88.899994      558.300018     112.500000     675           
116.699982     694.400024     123.600006     716.600037     137.000214     753.677715    
147.200012     781.900024    
</BasePoints>
</Item>
</Trans>
<Trans>
21             lambda_c      35             +Free+       
<Item>
<Position>
1784.700012    1290.299988   
</Position>
<BasePoints>
-683.300018    119.400024     0              0              -26.836376     13.462158     
-93.000031     45.800018      -238.899994    108.300018     -368.000031    108.300018    
-1219.400024   108.300018     -1219.400024   108.300018     -1219.400024   108.300018    
-1254.099989   108.300018     -1291.599989   101.399994     -1337.843919   87.650159     
-1366.599989   79.100037     
</BasePoints>
</Item>
</Trans>
<Trans>
22             alpha_b       19             +Free+       
<Item>
<Position>
1343.099976    1251.399994   
</Position>
<BasePoints>
73.600006      20.800018      0              0              29.650804      4.699720      
54.100037      8.300018       77.700043      11.100006      117.482428     16.652377     
147.200012     20.800018     
</BasePoints>
</Item>
</Trans>
<Trans>
22             lambda_c      36             +Free+       
<Item>
<Position>
1343.099976    1251.399994   
</Position>
<BasePoints>
73.600006      -43.099976     0              0              22.319020      -20.027682    
50             -43.099976     84.700012      -72.200012     124.511742     -106.724733   
147.200012     -126.399994   
</BasePoints>
</Item>
</Trans>
<Trans>
23             mue_b         27             +Free+       
<Item>
<Position>
1784.700012    1819.400024   
</Position>
<BasePoints>
294.499969     -197.200012    0              0              15.324838      -25.823683    
23.600006      -41.600037     29.199982      -54.100037     34.700012      -66.600037    
48.600006      -97.200012     37.500000      -112.500000    59.700012      -134.700012   
100            -173.600006    486.100006     -259.700012    529.199982     -293.000031   
544.499969     -305.500031    556.999969     -322.200012    574.760409     -355.438182   
588.899994     -381.900024   
</BasePoints>
</Item>
</Trans>
<Trans>
23             beta_b        31             +Free+       
<Item>
<Position>
1784.700012    1819.400024   
</Position>
<BasePoints>
294.499969     77.799988      0              0              28.474692      9.548368      
41.699982      12.500000      51.399994      15.299988      59.700012      18.099976     
202.799988     54.199982      254.199982     23.699951      381.999969     97.299957     
444.499969     131.999969     511.100006     180.599976     565.529637     224.325586    
588.899994     243.099976    
</BasePoints>
</Item>
</Trans>
<Trans>
23             lambda_c      37             +Free+       
<Item>
<Position>
1784.700012    1819.400024   
</Position>
<BasePoints>
73.600006      0              0              0              29.650804      -4.699720     
54.199982      -8.300018      77.799988      -11.100006     117.476518     -16.645578    
147.200012     -20.800018    
</BasePoints>
</Item>
</Trans>
<Trans>
24             alpha_a       25             +Free+       
<Item>
<Position>
2079.199982    426.399994    
</Position>
<BasePoints>
73.600006      276.399994     0              0              9.484842       28.454524     
36.100006      115.299988     102.700043     326.399994     138.186843     439.319898    
147.200012     468.000031    
</BasePoints>
</Item>
</Trans>
<Trans>
24             lambda_c      43             +Free+       
<Item>
<Position>
2079.199982    426.399994    
</Position>
<BasePoints>
73.600006      -25            0              0              23.994011      -18.017110    
37.500000      -27.799988     48.600006      -34.699988     59.700012      -41.700006    
73.600006      -48.599982     88.899994      -56.999993     119.386664     -69.341080    
147.200012     -80.599999    
</BasePoints>
</Item>
</Trans>
<Trans>
24             lambda_b      44             +Free+       
<Item>
<Position>
2079.199982    426.399994    
</Position>
<BasePoints>
294.400024     13.899994      0              0              29.989671      0             
65.200043      1.399994       108.300018     1.399994       147.200012     1.399994      
147.200012     1.399994       147.200012     1.399994       441.600037     1.399994      
483.300018     1.399994       522.200012     29.200029      560.020944     69.745612     
580.500031     91.700029     
</BasePoints>
</Item>
</Trans>
<Trans>
25             mue_a         26             +Free+       
<Item>
<Position>
2226.399994    894.400024    
</Position>
<BasePoints>
-147.200012    -112.500048    0              0              -20.027682     -22.319020    
-76.399994     -83.300018     -201.399994    -218.000031    -274.185668    -297.274670   
-294.499969    -319.400024   
</BasePoints>
</Item>
</Trans>
<Trans>
25             beta_a        27             +Free+       
<Item>
<Position>
2226.399994    894.400024    
</Position>
<BasePoints>
73.600006      313.899994     0              0              8.364342       28.800863     
34.700012      126.399994     104.199982     387.500000     139.202996     514.161962    
147.200012     543.099976    
</BasePoints>
</Item>
</Trans>
<Trans>
25             lambda_c      38             +Free+       
<Item>
<Position>
2226.399994    894.400024    
</Position>
<BasePoints>
73.600006      13.899994      0              0              29.989671      0             
54.199982      1.399994       77.799988      1.399994       117.205689     1.399994      
147.200012     1.399994      
</BasePoints>
</Item>
</Trans>
<Trans>
25             lambda_b      46             +Free+       
<Item>
<Position>
2226.399994    894.400024    
</Position>
<BasePoints>
73.600006      -40.200043     0              0              22.352274      -19.981588    
50             -45.800018     84.700012      -76.300049     125.000977     -113.054509   
147.200012     -133.300018   
</BasePoints>
</Item>
</Trans>
<Trans>
26             lambda_a      24             +Free+       
<Item>
<Position>
1931.900024    575           
</Position>
<BasePoints>
73.699951      -27.799988     0              0              25.008116      -16.614972    
47.299957      -31.899977     70.899963      -48.600006     87.500000      -68.100023    
100            -80.600023     111.199951     -94.399977     130.662934     -123.621419   
147.299957     -148.600006   
</BasePoints>
</Item>
</Trans>
<Trans>
26             lambda_c      39             +Free+       
<Item>
<Position>
1931.900024    575           
</Position>
<BasePoints>
294.499969     -283.299994    0              0              11.985996      -27.507421    
25             -56.899977     41.699982      -93.100023     59.799957      -123.600006   
120.899963     -225           152.799988     -251.399994    259.799957     -300          
354.199982     -341.700006    473.699951     -361.100006    559.116597     -371.406346   
588.899994     -375          
</BasePoints>
</Item>
</Trans>
<Trans>
26             lambda_b      48             +Free+       
<Item>
<Position>
1931.900024    575           
</Position>
<BasePoints>
294.499969     47.200012      0              0              29.959745      2.410546      
120.899963     8.300018       345.899963     27.799988      529.199982     68.100023     
533.399963     69.399977      537.500000     70.800018      560.366756     78.229482     
588.899994     87.500000     
</BasePoints>
</Item>
</Trans>
<Trans>
27             lambda_b      22             +Free+       
<Item>
<Position>
2373.600006    1437.500000   
</Position>
<BasePoints>
-515.299988    11.100006      0              0              -29.989671     0             
-63.899994     0              -108.300018    0              -147.200012    0             
-515.299988    0              -515.299988    0              -515.299988    0             
-701.399994    0              -745.800018    -47.200012     -918.000031    -118.099976   
-943.000031    -129.199982    -969.400024    -145.800018    -1005.450319   -169.577863   
-1030.500031   -186.100006   
</BasePoints>
</Item>
</Trans>
<Trans>
27             lambda_c      40             +Free+       
<Item>
<Position>
2373.600006    1437.500000   
</Position>
<BasePoints>
73.600006      -43.099976     0              0              22.352274      -19.981588    
50             -43.099976     84.700012      -72.200012     124.511742     -106.724733   
147.200012     -126.399994   
</BasePoints>
</Item>
</Trans>
<Trans>
28             beta_c        2              +Free+       
<Item>
<Position>
1343.099976    429.199982    
</Position>
<BasePoints>
736.100006     -152.799988    0              0              24.535026      -17.271896    
56.900024      -38.899970     102.700043     -62.499976     147.200012     -62.499976    
147.200012     -62.499976     147.200012     -62.499976     368.000031     -62.499976    
525            -62.499976     548.600006     -144.499993    701.300049     -169.499993   
731.900024     -173.599982    740.200043     -170.899987    770.800018     -169.499993   
920.800018     -159.799981    955.500031     -129.199982    1104.100037    -129.199982   
1104.100037    -129.199982    1104.100037    -129.199982    1316.600037    -129.199982   
1375           -129.199982    1416.600037    -69.499993     1443.492919    -15.714212    
1456.900024    11.100006     
</BasePoints>
</Item>
</Trans>
<Trans>
28             alpha_a       16             +Free+       
<Item>
<Position>
1343.099976    429.199982    
</Position>
<BasePoints>
-147.299957    266.600037     0              0              -5.944096      29.465869     
-16.699982     84.700012      -37.500000     175            -59.799957     198.600006    
-129.199982    275            -187.500000    229.100037     -276.399994    283.300018    
-284.799957    288.900042     -293.099976    295.800018     -314.628960    316.629687    
-336.199951    337.500000    
</BasePoints>
</Item>
</Trans>
<Trans>
28             mue_c         44             +Free+       
<Item>
<Position>
1343.099976    429.199982    
</Position>
<BasePoints>
662.500000     61.100006      0              0              29.447485      5.855571      
63.800049      11.100006      108.300018     18.000031      147.200012     18.000031     
147.200012     18.000031      147.200012     18.000031      368.000031     18.000031     
452.700043     18.000031      472.200012     37.500000      554.100037     44.400024     
608.300018     50             623.600006     43.000031      676.300049     48.600006     
770.800018     59.700012      790.200043     88.900042      883.300018     88.900042     
883.300018     88.900042      883.300018     88.900042      1177.700043    88.900042     
1208.300018    88.900042      1241.600037    88.900042      1286.585474    88.900042     
1316.600037    88.900042     
</BasePoints>
</Item>
</Trans>
<Trans>
29             lambda_c      12             +Free+       
<Item>
<Position>
2226.399994    2062.500000   
</Position>
<BasePoints>
-662.500000    -55.599976     0              0              -24.026288     -17.976527    
-56.999969     -38.899994     -102.799988    -63.899994     -147.200012    -63.899994    
-368.099976    -63.899994     -368.099976    -63.899994     -368.099976    -63.899994    
-731.999969    -63.899994     -1172.200012   -65.299988     -1336.704455   -66.484077    
-1366.699982   -66.699982    
</BasePoints>
</Item>
</Trans>
<Trans>
29             mue_a         30             +Free+       
<Item>
<Position>
2226.399994    2062.500000   
</Position>
<BasePoints>
-147.200012    15.299988      0              0              -29.989671     1.209952      
-87.500000     2.799988       -186.100006    6.900024       -264.483264    8.924676      
-294.499969    9.700012      
</BasePoints>
</Item>
</Trans>
<Trans>
29             beta_a        31             +Free+       
<Item>
<Position>
2226.399994    2062.500000   
</Position>
<BasePoints>
73.600006      11.100006      0              0              29.989671      0             
54.199982      0              77.799988      0              117.205689     0             
147.200012     0             
</BasePoints>
</Item>
</Trans>
<Trans>
30             lambda_c      13             +Free+       
<Item>
<Position>
1931.900024    2072.200012   
</Position>
<BasePoints>
-662.500000    136.100006     0              0              -29.447485     -5.855571     
-70.800018     -12.500000     -131.900024    -18.000031     -181.900024    -1.399994     
-276.300049    27.799988      -268.000031    125            -368.000031    125           
-662.500000    125            -662.500000    125            -662.500000    125           
-811.100006    125            -848.600006    134.700012     -998.600006    134.700012    
-1219.400024   134.700012     -1219.400024   134.700012     -1219.400024   134.700012    
-1258.300018   134.700012     -1276.300001   141.699982     -1306.900024   115.299988    
-1327.700043   94.499969      -1345.800018   22.200012      -1360.410769   -47.060508    
-1366.600037   -76.399994    
</BasePoints>
</Item>
</Trans>
<Trans>
30             lambda_a      32             +Free+       
<Item>
<Position>
1931.900024    2072.200012   
</Position>
<BasePoints>
73.699951      48.600006      0              0              28.083287      10.510224     
50             18.099976      70.899963      27.799988      87.500000      37.500000     
94.499969      41.699982      101.399994     45.899963      123.362005     62.503072     
147.299957     80.599976     
</BasePoints>
</Item>
</Trans>
<Trans>
31             lambda_c      14             +Free+       
<Item>
<Position>
2373.600006    2062.500000   
</Position>
<BasePoints>
73.600006      11.100006      0              0              29.989671      0             
54.199982      0              77.799988      0              117.205689     0             
147.200012     0             
</BasePoints>
</Item>
</Trans>
<Trans>
32             lambda_c      11             +Free+       
<Item>
<Position>
2079.199982    2152.799988   
</Position>
<BasePoints>
-662.500000    -50            0              0              -28.474692     9.463162      
-41.699982     13.899994      -51.399994     15.299988      -59.799957     16.600037     
-70.899963     18.000031      -75            16.600037      -87.500000     16.600037     
-279.199982    -1.399994      -320.899963    -61.100006     -515.299988    -61.100006    
-809.799957    -61.100006     -809.799957    -61.100006     -809.799957    -61.100006    
-998.600006    -61.100006     -1223.600006   -87.500000     -1336.963137   -102.947784   
-1366.699982   -106.999969   
</BasePoints>
</Item>
</Trans>
<Trans>
32             alpha_a       29             +Free+       
<Item>
<Position>
2079.199982    2152.799988   
</Position>
<BasePoints>
73.600006      -27.799988     0              0              25.490878      -15.855109    
50             -30.599976     80.500031      -48.600006     121.756434     -74.392986    
147.200012     -90.299988    
</BasePoints>
</Item>
</Trans>
<Trans>
33             beta_b        11             +Free+       
<Item>
<Position>
1637.500000    997.200012    
</Position>
<BasePoints>
-441.699982    159.700012     0              0              -29.104914     7.341744      
-129.199982    30.599976      -400           97.200012      -476.399994    148.600006    
-608.300018    236.100006     -752.799988    630.599976     -812.500000    779.199982    
-851.399994    877.799988     -836.100006    913.899994     -890.299988    1008.399963   
-891.699982    1009.700012    -891.699982    1012.500000    -904.635585    1026.523276   
-925           1048.600006   
</BasePoints>
</Item>
</Trans>
<Trans>
33             alpha_a       34             +Free+       
<Item>
<Position>
1637.500000    997.200012    
</Position>
<BasePoints>
73.600006      373.600006     0              0              7.238179       29.127033     
25             97.200012      59.700012      240.299988     87.500000      362.500000    
106.900024     445.899963     126.399994     543.099976     141.399638     619.179855    
147.200012     648.600006    
</BasePoints>
</Item>
</Trans>
<Trans>
33             mue_b         43             +Free+       
<Item>
<Position>
1637.500000    997.200012    
</Position>
<BasePoints>
294.400024     -476.399994    0              0              10.565531      -28.146591    
43.099976      -116.600037    134.700012     -340.300035    259.700012     -493.000031   
315.299988     -558.300018    330.599976     -580.500031    406.900024     -618.000007   
450            -637.500024    502.799988     -645.800018    558.970648     -649.453394   
588.899994     -651.400018   
</BasePoints>
</Item>
</Trans>
<Trans>
34             beta_b        12             +Free+       
<Item>
<Position>
1784.700012    1645.800018   
</Position>
<BasePoints>
-441.600037    304.199982     0              0              -9.463162      28.474692     
-20.800018     56.999969      -36.100006     88.899994      -59.700012     109.799957    
-140.299988    181.999969     -405.500031    297.299957     -515.299988    297.299957    
-777.799988    297.299957     -777.799988    297.299957     -777.799988    297.299957    
-813.899994    297.299957     -852.799988    312.500000     -898.366633    336.166883    
-925           350           
</BasePoints>
</Item>
</Trans>
<Trans>
34             mue_a         35             +Free+       
<Item>
<Position>
1784.700012    1645.800018   
</Position>
<BasePoints>
-683.300018    27.799988      0              0              -29.786351     3.605247      
-77.799988     9.799957       -154.100037    16.699982      -220.800018    16.699982     
-851.399994    16.699982      -851.399994    16.699982      -851.399994    16.699982     
-1055.500031   16.699982      -1255.500031   -162.500000    -1345.619353   -254.890586   
-1366.599989   -276.399994   
</BasePoints>
</Item>
</Trans>
<Trans>
34             beta_a        37             +Free+       
<Item>
<Position>
1784.700012    1645.800018   
</Position>
<BasePoints>
73.600006      122.299957     0              0              14.367815      26.326661     
27.799988      48.600006      43.099976      72.299957      59.700012      90.299988     
72.200012      102.799988     88.899994      116.699982     121.711713     137.017356    
147.200012     152.799988    
</BasePoints>
</Item>
</Trans>
<Trans>
34             mue_b         38             +Free+       
<Item>
<Position>
1784.700012    1645.800018   
</Position>
<BasePoints>
294.499969     -290.200043    0              0              21.215760      -21.215760    
34.700012      -36.100006     48.600006      -48.600006     59.700012      -59.700012    
113.899994     -112.500000    137.500000     -118.000031    181.999969     -176.399994   
309.700012     -344.400024    276.399994     -429.100037    406.999969     -591.600037   
450            -643.000031    509.700012     -693.000031    564.560511     -732.482953   
588.899994     -750          
</BasePoints>
</Item>
</Trans>
<Trans>
35             beta_b        13             +Free+       
<Item>
<Position>
418.100023     1369.400024   
</Position>
<BasePoints>
73.599958      359.799957     0              0              6.962553       29.192459     
31.899977      138.899994     108.299971     456.999969     140.482607     597.147530    
147.199965     626.399994    
</BasePoints>
</Item>
</Trans>
<Trans>
35             lambda_a      33             +Free+       
<Item>
<Position>
418.100023     1369.400024   
</Position>
<BasePoints>
588.800001     -130.500031    0              0              29.786310      -3.519455     
122.199965     -15.200043     352.699995     -50            529.099989     -129.100037   
588.800001     -155.500031    594.399977     -177.700043    648.599958     -211.100006   
690.199995     -237.500000    699.999952     -245.800018    742.999983     -263.800049   
806.899977     -291.600037    824.999952     -293.000031    890.199995     -311.100006   
955.499983     -329.100037    972.199965     -336.100006    1037.499952    -350          
1083.299971    -358.300018    1133.299971    -365.200043    1189.492555    -369.768525   
1219.399977    -372.200012   
</BasePoints>
</Item>
</Trans>
<Trans>
35             mue_b         39             +Free+       
<Item>
<Position>
418.100023     1369.400024   
</Position>
<BasePoints>
1072.199965    -1277.700025   0              0              9.484801       -28.454524    
30.499983      -93.000031     70.799971      -223.600006    87.500000      -337.500000   
106.899977     -459.700012    75             -776.300001    112.500000     -895.800018   
136.099958     -969.400024    165.199995     -976.300025    206.899977     -1043.000031  
279.099989     -1152.700019   237.500000     -1290.200025   367.999983     -1290.200025  
367.999983     -1290.200025   367.999983     -1290.200025   998.599958     -1290.200025  
1244.399977    -1290.200025   1305.499983    -1305.500025   1548.599958    -1280.500025  
1738.800001    -1259.700024   1959.699965    -1206.900024   2073.623384    -1177.025008  
2102.699995    -1169.400024  
</BasePoints>
</Item>
</Trans>
<Trans>
36             alpha_b       33             +Free+       
<Item>
<Position>
1490.299988    1125          
</Position>
<BasePoints>
73.600006      -65.299988     0              0              15.205060      -25.848539    
29.100037      -45.800018     43.000031      -66.699982     59.700012      -80.599976    
72.200012      -91.699982     88.899994      -100           120.103727     -114.879299   
147.200012     -127.799988   
</BasePoints>
</Item>
</Trans>
<Trans>
37             beta_b        14             +Free+       
<Item>
<Position>
1931.900024    1798.600006   
</Position>
<BasePoints>
294.499969     109.700012     0              0              29.396364      5.913043      
95.899963      19.499969      227.799988     51.399994      329.199982     98.600006     
412.500000     136.100006     500            195.800018     565.095429     245.665006    
588.899994     263.899994    
</BasePoints>
</Item>
</Trans>
<Trans>
37             mue_b         40             +Free+       
<Item>
<Position>
1931.900024    1798.600006   
</Position>
<BasePoints>
294.499969     -136.100006    0              0              27.093646      -12.954152    
112.500000     -55.500031     331.999969     -170.800018    476.399994     -313.899994   
515.299988     -352.799988    547.299957     -405.500031    575.330478     -460.752431   
588.899994     -487.500000   
</BasePoints>
</Item>
</Trans>
<Trans>
38             mue_a         39             +Free+       
<Item>
<Position>
2373.600006    895.800018    
</Position>
<BasePoints>
73.600006      -200           0              0              12.984035      -27.071331    
22.200012      -47.200012     29.199982      -68.000031     34.700012      -87.500000    
50             -138.900042    102.799988     -509.700012    112.500000     -562.500024   
119.499969     -591.600013    127.799988     -623.600030    139.398271     -666.764713   
147.200012     -695.800018   
</BasePoints>
</Item>
</Trans>
<Trans>
38             beta_a        40             +Free+       
<Item>
<Position>
2373.600006    895.800018    
</Position>
<BasePoints>
73.600006      238.899994     0              0              11.958847      27.531145     
30.599976      76.399994      63.899994      158.399963     87.500000      227.799988    
104.199982     275            122.200012     330.599976     138.711786     386.541874    
147.200012     415.299988    
</BasePoints>
</Item>
</Trans>
<Trans>
38             lambda_b      41             +Free+       
<Item>
<Position>
2373.600006    895.800018    
</Position>
<BasePoints>
286.100006     12.500000      0              0              29.989671      0             
65.299988      0              108.300018     0              147.200012     0             
147.200012     0              147.200012     0              426.399994     0             
455.599976     0              487.500000     -8.300018      530.520469     -26.042908    
558.300018     -37.500000    
</BasePoints>
</Item>
</Trans>
<Trans>
39             lambda_b      42             +Free+       
<Item>
<Position>
2520.800018    200           
</Position>
<BasePoints>
279.199982     36.100006      0              0              28.800863      8.364321      
62.500000      15.300012      102.799988     23.600006      138.899994     23.600006     
138.899994     23.600006      138.899994     23.600006      411.100006     23.600006     
491.699982     23.600006      526.399994     127.800012     543.834464     210.909206    
550            240.299988    
</BasePoints>
</Item>
</Trans>
<Trans>
39             lambda_a      43             +Free+       
<Item>
<Position>
2520.800018    200           
</Position>
<BasePoints>
-147.200012    104.200006     0              0              -27.071331     12.984055     
-83.300018     41.700006      -190.200043    94.400001      -267.513210    132.537208    
-294.400024    145.799994    
</BasePoints>
</Item>
</Trans>
<Trans>
40             lambda_b      36             +Free+       
<Item>
<Position>
2520.800018    1311.100006   
</Position>
<BasePoints>
-515.200043    -62.500000     0              0              -28.146591     -10.565531    
-41.600037     -15.299988     -51.399994     -18.000031     -59.700012     -19.400024    
-456.900024    -113.899994    -581.900024    -22.200012     -970.800018    -152.799988   
-976.399994    -155.500031    -983.300018    -158.300018    -1004.666683   -170.884612   
-1030.500031   -186.100006   
</BasePoints>
</Item>
</Trans>
<Trans>
41             beta_a        36             +Free+       
<Item>
<Position>
2931.900024    858.300018    
</Position>
<BasePoints>
-705.500031    236.100006     0              0              -2.322979      29.940112     
-8.300018      75             -22.200012     140.299988     -59.700012     181.999969    
-81.900024     208.399963     -95.800018     218.099976     -131.900024    218.099976    
-411.100006    218.099976     -411.100006    218.099976     -411.100006    218.099976    
-830.500031    218.099976     -934.700012    251.399994     -1354.100037   265.299988    
-1366.600037   265.299988     -1379.100037   265.299988     -1411.573244   266.027385    
-1441.600037   266.699982    
</BasePoints>
</Item>
</Trans>
<Trans>
41             mue_a         42             +Free+       
<Item>
<Position>
2931.900024    858.300018    
</Position>
<BasePoints>
69.499969      -54.100037     0              0              20.621676      -21.752868    
41.699982      -45.800018     65.299988      -76.400042     79.199982      -106.900024   
118.099976     -193.000031    131.999969     -305.500031    137.062233     -388.036645   
138.899994     -418.000031   
</BasePoints>
</Item>
</Trans>
<Trans>
42             lambda_a      2              +Free+       
<Item>
<Position>
3070.800018    440.299988    
</Position>
<BasePoints>
-138.899994    12.500000      0              0              -29.989671     0             
-84.700012     0              -175           0              -240.798285    0             
-270.800018    0             
</BasePoints>
</Item>
</Trans>
<Trans>
43             lambda_b      2              +Free+       
<Item>
<Position>
2226.399994    345.799994    
</Position>
<BasePoints>
294.400024     30.599999      0              0              29.465869      5.944136      
63.899994      11.100006      108.300018     18.099999      147.200012     18.099999     
147.200012     18.099999      147.200012     18.099999      433.300018     18.099999     
475            18.099999      515.299988     44.500017      550.839127     74.979529     
573.600006     94.499993     
</BasePoints>
</Item>
</Trans>
<Trans>
43             alpha_a       38             +Free+       
<Item>
<Position>
2226.399994    345.799994    
</Position>
<BasePoints>
73.600006      376.400018     0              0              5.842093       29.464373     
22.200012      111.099982     62.500000      305.599999     112.500000     462.500024    
118.000031     476.400018     122.200012     491.700006     135.370755     522.414188    
147.200012     550.000024    
</BasePoints>
</Item>
</Trans>
<Trans>
44             lambda_c      2              +Free+       
<Item>
<Position>
2659.700012    518.100023    
</Position>
<BasePoints>
73.600006      -19.500017     0              0              26.326661      -14.367856    
52.799988      -27.800035     80.599976      -44.500017     114.071805     -63.170239    
140.299988     -77.800035    
</BasePoints>
</Item>
</Trans>
<Trans>
44             alpha_a       46             +Free+       
<Item>
<Position>
2659.700012    518.100023    
</Position>
<BasePoints>
-138.899994    241.599989     0              0              -8.407872      28.864075     
-22.200012     76.299953      -52.799988     151.299953     -104.100037    191.599989    
-143.000031    222.199965     -197.200012    234.699965     -256.236097    240.211783    
-286.100006    242.999983    
</BasePoints>
</Item>
</Trans>
<Trans>
45             beta_c        12             +Free+       
<Item>
<Position>
712.500000     2402.799988   
</Position>
<BasePoints>
73.600006      -156.999969    0              0              10.510224      -28.083287    
38.899994      -105.599976    100            -276.399994    136.993395     -378.758791   
147.200012     -406.999969   
</BasePoints>
</Item>
</Trans>
<Trans>
45             mue_a         17             +Free+       
<Item>
<Position>
712.500000     2402.799988   
</Position>
<BasePoints>
-147.200012    -4.199982      0              0              -29.989671     -1.209952     
-73.600006     -4.199982      -134.700012    -13.899994     -181.899977    -37.500000    
-216.699982    -56.999969     -247.200012    -90.299988     -277.315908    -133.751118   
-294.399977    -158.399963   
</BasePoints>
</Item>
</Trans>
<Trans>
45             beta_a        18             +Free+       
<Item>
<Position>
712.500000     2402.799988   
</Position>
<BasePoints>
147.200012     47.200012      0              0              28.454524      9.484842      
41.699982      13.899994      51.399994      16.600037      59.700012      19.400024     
158.300018     38.899994      275            45.800018      358.920560     47.863026     
388.899994     48.600006     
</BasePoints>
</Item>
</Trans>
<Trans>
45             mue_c         29             +Free+       
<Item>
<Position>
712.500000     2402.799988   
</Position>
<BasePoints>
777.799988     -2.799988      0              0              29.786351      -3.605247     
77.799988      -6.999969      155.599976     -13.899994     220.800018     -13.899994    
220.800018     -13.899994     220.800018     -13.899994     998.600006     -13.899994    
1197.200012    -13.899994     1243.099976    -87.500000     1401.399994    -202.799988   
1436.100006    -229.199982    1468.099976    -268.099976    1497.811791    -314.938241   
1513.899994    -340.299988   
</BasePoints>
</Item>
</Trans>
<Trans>
46             beta_a        22             +Free+       
<Item>
<Position>
2373.600006    761.100006    
</Position>
<BasePoints>
-515.299988    87.500000      0              0              -29.921897     2.414436      
-166.699982    16.699982      -641.699982    69.499969      -770.800018    143.099976    
-915.299988    227.799988     -901.399994    305.599976     -995.800018    444.499969    
-997.200012    445.800018     -998.600006    448.600006     -1012.240302   466.430716    
-1030.500031   490.299988    
</BasePoints>
</Item>
</Trans>
<Trans>
46             lambda_c      41             +Free+       
<Item>
<Position>
2373.600006    761.100006    
</Position>
<BasePoints>
286.100006     73.600006      0              0              24.951085      16.662564     
58.300018      37.500000      104.199982     61.100006      147.200012     61.100006     
147.200012     61.100006      147.200012     61.100006      426.399994     61.100006     
455.599976     61.100006      487.500000     69.499969      530.380095     86.276525     
558.300018     97.200012     
</BasePoints>
</Item>
</Trans>
<Trans>
46             mue_a         48             +Free+       
<Item>
<Position>
2373.600006    761.100006    
</Position>
<BasePoints>
73.600006      -34.700012     0              0              22.352274      -19.981588    
36.100006      -33.300018     48.600006      -42.999983     59.700012      -51.399994    
73.600006      -61.100006     88.899994      -69.400024     120.331907     -85.142923    
147.200012     -98.600006    
</BasePoints>
</Item>
</Trans>
<Trans>
47             lambda_a      28             +Free+       
<Item>
<Position>
1195.800018    470.800018    
</Position>
<BasePoints>
73.600006      -2.699995      0              0              28.800863      -8.364342     
54.199982      -15.199995     79.199982      -22.200012     118.447534     -33.380684    
147.299957     -41.600037    
</BasePoints>
</Item>
</Trans>
<Trans>
47             beta_c        42             +Free+       
<Item>
<Position>
1195.800018    470.800018    
</Position>
<BasePoints>
956.999969     -419.400018    0              0              21.215760      -21.215760    
61.100006      -61.100006     134.799957     -126.400018    206.999969     -168.000007   
300            -218.000007    1000           -470.800018    1104.199982    -470.800018   
1104.199982    -470.800018    1104.199982    -470.800018    1736.100006    -470.800018   
1816.699982    -470.800018    1858.399963    -194.400024    1871.977429    -60.343298    
1875           -30.500031    
</BasePoints>
</Item>
</Trans>
<Trans>
47             mue_c         48             +Free+       
<Item>
<Position>
1195.800018    470.800018    
</Position>
<BasePoints>
662.500000     225            0              0              28.474692      9.463121      
62.500000      20.899963      106.999969     31.999969      147.299957     31.999969     
147.299957     31.999969      147.299957     31.999969      368.099976     31.999969     
476.399994     31.999969      452.799988     152.799988     554.199982     188.899994    
687.500000     238.899994     1127.799988    208.399963     1295.092089    194.232748    
1325           191.699982    
</BasePoints>
</Item>
</Trans>
<Trans>
48             lambda_c      42             +Free+       
<Item>
<Position>
2520.800018    662.500000    
</Position>
<BasePoints>
279.199982     81.899977      0              0              22.971023      19.316557     
54.199982      43.100023      97.299957      69.399977      138.899994     69.399977     
138.899994     69.399977      138.899994     69.399977      411.100006     69.399977     
465.299988     69.399977      515.299988     -91.699982     542.292688     -193.214304   
550            -222.200012   
</BasePoints>
</Item>
</Trans>
<Trans>
48             lambda_a      44             +Free+       
<Item>
<Position>
2520.800018    662.500000    
</Position>
<BasePoints>
69.499969      -48.600006     0              0              20.580806      -21.801695    
45.899963      -48.600006     79.199982      -83.300018     117.929130     -122.937353   
138.899994     -144.399977   
</BasePoints>
</Item>
</Trans>
<Trans>
1              alpha_a       41             +Line+       
<Item>
<Position>
27.800000      1112.500000   
</Position>
<BasePoints>
1452.921992    -117.138081    0              0              29.865611      -2.614179     
968.477654     -84.772219     1907.176938    -166.937894    2874.234413    -251.585803   
2904.100024    -254.199982   
</BasePoints>
</Item>
</Trans>
<Trans>
2              alpha_a       3              +Line+       
<Item>
<Position>
2800           440.299988    
</Position>
<BasePoints>
-1327.457732   544.224076     0              0              -27.673187     11.571265     
-882.805008    369.136025     -1738.465875   726.922000     -2619.526813   1095.328759   
-2647.200000   1106.900024   
</BasePoints>
</Item>
</Trans>
<Trans>
2              beta_b        15             +Line+       
<Item>
<Position>
2800           440.299988    
</Position>
<BasePoints>
-1123.783236   931.244046     0              0              -22.981536     19.311195     
-745.241901    626.220623     -1467.569399   1233.186461    -2211.718476   1858.488793   
-2234.700012   1877.799988   
</BasePoints>
</Item>
</Trans>
<Trans>
2              mue_b         7              +Line+       
<Item>
<Position>
2800           440.299988    
</Position>
<BasePoints>
-1043.244778   -62.787229     0              0              -29.992662     -1.517234     
-698.925171    -35.356406     -1368.291016   -69.217500     -2057.507338   -104.082766   
-2087.500000   -105.600000   
</BasePoints>
</Item>
</Trans>
<Trans>
2              beta_c        33             +Line+       
<Item>
<Position>
2800           440.299988    
</Position>
<BasePoints>
-585.570374    269.431455     0              0              -27.069569     12.967780     
-392.695679    188.122351     -758.712891    363.464281     -1135.430431   543.932244    
-1162.500000   556.900024    
</BasePoints>
</Item>
</Trans>
<Trans>
2              mue_c         19             +Line+       
<Item>
<Position>
2800           440.299988    
</Position>
<BasePoints>
-660.211670    407.508889     0              0              -25.306202     16.074085     
-440.680800    279.913236     -856.421023    543.984625     -1284.393810   815.825939    
-1309.700012   831.900024    
</BasePoints>
</Item>
</Trans>
<Trans>
4              lambda_a      2              +Line+       
<Item>
<Position>
277.800012     1250          
</Position>
<BasePoints>
1264.156640    -395.328613    0              0              28.546268      -9.164187     
841.956662     -270.292730    1655.587836    -531.492149    2493.653720    -800.535825   
2522.199988    -809.700012   
</BasePoints>
</Item>
</Trans>
<Trans>
5              alpha_b       2              +Line+       
<Item>
<Position>
1195.800018    1209.700012   
</Position>
<BasePoints>
806.424488     -375.683431    0              0              27.093860      -12.994649    
538.707273     -258.372643    1049.999019    -503.596359    1577.106122    -756.405375   
1604.199982    -769.400024   
</BasePoints>
</Item>
</Trans>
<Trans>
28             beta_c        1              +Line+       
<Item>
<Position>
1343.099976    429.199982    
</Position>
<BasePoints>
-662.260031    332.776030     0              0              -26.614749     13.826396     
-443.001766    230.139984     -859.671844    446.600621     -1288.685227   669.473622    
-1315.299976   683.300018    
</BasePoints>
</Item>
</Trans>
<Trans>
42             lambda_a      1              +Line+       
<Item>
<Position>
3070.800018    440.299988    
</Position>
<BasePoints>
-1523.657012   326.335410     0              0              -29.307127     6.473957      
-1013.788531   223.946322     -1999.346106   441.656414     -3013.692891   665.726055    
-3043.000018   672.200012    
</BasePoints>
</Item>
</Trans>
<Trans>
43             lambda_b      1              +Line+       
<Item>
<Position>
2226.399994    345.799994    
</Position>
<BasePoints>
-1102.592748   373.907663     0              0              -28.362025     9.890460      
-735.393051    256.447675     -1441.800652   502.787488     -2170.237969   756.809546    
-2198.599994   766.700006    
</BasePoints>
</Item>
</Trans>
<Trans>
44             lambda_c      1              +Line+       
<Item>
<Position>
2659.700012    518.100023    
</Position>
<BasePoints>
-1318.152967   287.445658     0              0              -29.326244     6.623169      
-878.576544    198.421625     -1727.595617   390.167860     -2602.573768   587.776808    
-2631.900012   594.399977    
</BasePoints>
</Item>
</Trans>
</TransRel>
</GraphData>
</VioModels>
<VioLayout>
0             =AAAA/wAAAAEAAAADAAABLAAAAa4AAACWAf////8BAAAAAQA==  1              150            362            0.280140       0             
252           
</VioLayout>
</VioGenerator>
</Value>
</Variable>
</VariablePool>

<Functions/>
<Script>
<Parallel>
AnonymousOperation_1182112391  1             
<Parameters>
<Vector>
MachineA      MachineB      MachineC     
</Vector>
PlantABC     
</Parameters>
<Options>
"Clear Arguments"  0              "Minimal Realisation"  0              "Clear State Names"  0             
</Options>
</Parallel>
<Parallel>
AnonymousOperation_16807  0             
<Parameters>
BufferAB      BufferBC      BufferABC    
</Parameters>
<Options>
"Clear Arguments"  0              "Minimal Realisation"  0              "Clear State Names"  0             
</Options>
</Parallel>
<InvProject>
AnonymousOperation_282475249  1             
<Parameters>
BufferABC     SigmaABC      FullBufferABC 
</Parameters>
<Options>
"Clear Arguments"  0              "Minimal Realisation"  0              "Clear State Names"  0             
</Options>
</InvProject>
<SupConNB>
AnonymousOperation_1622650073  0             
<Parameters>
PlantABC      FullBufferABC  SuperABC     
</Parameters>
<Options>
"Clear Arguments"  0              "Minimal Realisation"  0              "Clear State Names"  0             
</Options>
</SupConNB>
</Script>

<Simulator>

 +Supervisor+  +Plant+      
<DevFile>
""           
</DevFile>
<SimEvents>
alpha_a      
<Priority>
0             
</Priority>
beta_a       
<Stochastic>
+Trigger+     +Gauss+      
<Parameter>
0              inf            10             5             
</Parameter>
</Stochastic>
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
alpha_b      
<Priority>
0             
</Priority>
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
alpha_c      
<Priority>
0             
</Priority>
beta_c       
<Priority>
0             
</Priority>
mue_c        
<Priority>
0             
</Priority>
lambda_c     
<Priority>
0             
</Priority>
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
