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
BufferAB      System        +Visual+      +Shown+       +Plant+      
<File>
BufferAB.vio 
</File>
</Variable>
<Variable>
Sigma         EventSet      +Visual+     
<File>
SigmaAB.vio  
</File>
</Variable>
<Variable>
PlantAB       System        +Visual+      +Shown+      
<Value>
<VioSystem>
<Generator name="PlantAB" ftype="System">

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
<Transition x1="1" event="alpha_a" x2="2"/>
<Transition x1="1" event="alpha_b" x2="3"/>
<Transition x1="2" event="beta_a" x2="1"/>
<Transition x1="2" event="mue_a" x2="8"/>
<Transition x1="2" event="alpha_b" x2="4"/>
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
<Transition x1="8" event="lambda_a" x2="1"/>
<Transition x1="8" event="alpha_b" x2="9"/>
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
<Event name="alpha_a"/>
<Event name="beta_a"/>
<Event name="mue_a"/>
<Event name="lambda_a"/>
<Event name="alpha_b"/>
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
0             =AAAA/wAAAAEAAAADAAAB0wAAAOoAAAAAAf////8BAAAAAQA==  0              150            234            1              0             
467           
</VioLayout>
</VioSystem>
</Value>
</Variable>
<Variable>
FullBufferAB  System        +Visual+     
<Value>
<VioSystem>
<Generator name="FullBufferAB" ftype="System">

<Alphabet>
<Event name="alpha_a"/>
<Event name="beta_a"/>
<Event name="mue_a"/>
<Event name="lambda_a"/>
<Event name="alpha_b"/>
<Event name="beta_b"/>
<Event name="mue_b"/>
<Event name="lambda_b"/>
</Alphabet>

<StateSet>
<State id="1" name="E">
<Initial/>
<Marked/>
</State>
<State id="2" name="F"/>
</StateSet>

<TransitionRelation>
<Transition x1="1" event="alpha_a" x2="1"/>
<Transition x1="1" event="beta_a" x2="2"/>
<Transition x1="1" event="mue_a" x2="1"/>
<Transition x1="1" event="lambda_a" x2="1"/>
<Transition x1="1" event="beta_b" x2="1"/>
<Transition x1="1" event="mue_b" x2="1"/>
<Transition x1="1" event="lambda_b" x2="1"/>
<Transition x1="2" event="alpha_a" x2="2"/>
<Transition x1="2" event="mue_a" x2="2"/>
<Transition x1="2" event="lambda_a" x2="2"/>
<Transition x1="2" event="alpha_b" x2="1"/>
<Transition x1="2" event="beta_b" x2="2"/>
<Transition x1="2" event="mue_b" x2="2"/>
<Transition x1="2" event="lambda_b" x2="2"/>
</TransitionRelation>

</Generator>
<VioModels>
<TransitionList>
<Transition x1="1" event="alpha_a" x2="1"/>
<Transition x1="1" event="beta_a" x2="2"/>
<Transition x1="1" event="mue_a" x2="1"/>
<Transition x1="1" event="lambda_a" x2="1"/>
<Transition x1="1" event="beta_b" x2="1"/>
<Transition x1="1" event="mue_b" x2="1"/>
<Transition x1="1" event="lambda_b" x2="1"/>
<Transition x1="2" event="alpha_a" x2="2"/>
<Transition x1="2" event="mue_a" x2="2"/>
<Transition x1="2" event="lambda_a" x2="2"/>
<Transition x1="2" event="alpha_b" x2="1"/>
<Transition x1="2" event="beta_b" x2="2"/>
<Transition x1="2" event="mue_b" x2="2"/>
<Transition x1="2" event="lambda_b" x2="2"/>
</TransitionList>
<StateList>
<State id="1"/>
<State id="2"/>
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
-30.058221     0             
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
-30.058221     0             
</BasePoints>
</Item>
</State>
</States>
<TransRel>
<Trans>
1              alpha_a       1              +Spline+     
<Item>
<Position>
0              40            
</Position>
<BasePoints>
0              -80.595703     0              0              13.432464      -26.864928    
40.297852      -80.595703     -40.297852     -80.595703     -13.406395     -26.812789    
0              0             
</BasePoints>
</Item>
</Trans>
<Trans>
1              beta_a        2              +Line+       
<Item>
<Position>
0              40            
</Position>
<BasePoints>
50             10             0              0              30.028953      0             
43.209961      0              56.390625      0              70.005288      0             
100            0             
</BasePoints>
</Item>
</Trans>
<Trans>
1              mue_a         1              +Spline+     
<Item>
<Position>
0              40            
</Position>
<BasePoints>
0              -80.595703     0              0              13.432464      -26.864928    
40.297852      -80.595703     -40.297852     -80.595703     -13.406395     -26.812789    
0              0             
</BasePoints>
</Item>
</Trans>
<Trans>
1              lambda_a      1              +Spline+     
<Item>
<Position>
0              40            
</Position>
<BasePoints>
0              -80.595703     0              0              13.432464      -26.864928    
40.297852      -80.595703     -40.297852     -80.595703     -13.406395     -26.812789    
0              0             
</BasePoints>
</Item>
</Trans>
<Trans>
1              beta_b        1              +Spline+     
<Item>
<Position>
0              40            
</Position>
<BasePoints>
0              -80.595703     0              0              13.432464      -26.864928    
40.297852      -80.595703     -40.297852     -80.595703     -13.406395     -26.812789    
0              0             
</BasePoints>
</Item>
</Trans>
<Trans>
1              mue_b         1              +Spline+     
<Item>
<Position>
0              40            
</Position>
<BasePoints>
0              -80.595703     0              0              13.432464      -26.864928    
40.297852      -80.595703     -40.297852     -80.595703     -13.406395     -26.812789    
0              0             
</BasePoints>
</Item>
</Trans>
<Trans>
1              lambda_b      1              +Spline+     
<Item>
<Position>
0              40            
</Position>
<BasePoints>
0              -80.595703     0              0              13.432464      -26.864928    
40.297852      -80.595703     -40.297852     -80.595703     -13.406395     -26.812789    
0              0             
</BasePoints>
</Item>
</Trans>
<Trans>
2              alpha_a       2              +Spline+     
<Item>
<Position>
100            40            
</Position>
<BasePoints>
0              -80.595703     0              0              13.432464      -26.864928    
40.297852      -80.595703     -40.297852     -80.595703     -13.406395     -26.812789    
0              0             
</BasePoints>
</Item>
</Trans>
<Trans>
2              mue_a         2              +Spline+     
<Item>
<Position>
100            40            
</Position>
<BasePoints>
0              -80.595703     0              0              13.432464      -26.864928    
40.297852      -80.595703     -40.297852     -80.595703     -13.406395     -26.812789    
0              0             
</BasePoints>
</Item>
</Trans>
<Trans>
2              lambda_a      2              +Spline+     
<Item>
<Position>
100            40            
</Position>
<BasePoints>
0              -80.595703     0              0              13.432464      -26.864928    
40.297852      -80.595703     -40.297852     -80.595703     -13.406395     -26.812789    
0              0             
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
-50            -10            0              0              -30.028953     0             
-43.209961     0              -56.390625     0              -70.005288     0             
-100           0             
</BasePoints>
</Item>
</Trans>
<Trans>
2              beta_b        2              +Spline+     
<Item>
<Position>
100            40            
</Position>
<BasePoints>
0              -80.595703     0              0              13.432464      -26.864928    
40.297852      -80.595703     -40.297852     -80.595703     -13.406395     -26.812789    
0              0             
</BasePoints>
</Item>
</Trans>
<Trans>
2              mue_b         2              +Spline+     
<Item>
<Position>
100            40            
</Position>
<BasePoints>
0              -80.595703     0              0              13.432464      -26.864928    
40.297852      -80.595703     -40.297852     -80.595703     -13.406395     -26.812789    
0              0             
</BasePoints>
</Item>
</Trans>
<Trans>
2              lambda_b      2              +Spline+     
<Item>
<Position>
100            40            
</Position>
<BasePoints>
0              -80.595703     0              0              13.432464      -26.864928    
40.297852      -80.595703     -40.297852     -80.595703     -13.406395     -26.812789    
0              0             
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
SuperAB       System        +Visual+      +Shown+       +Supervisor+ 
<Value>
<VioSystem>
<Generator name="SuperAB" ftype="System">

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
</Alphabet>

<StateSet>
<State id="1" name="I|I|E">
<Initial/>
<Marked/>
</State>
<State id="2" name="B|I|E"/>
<State id="3" name="I|I|F"/>
<State id="4" name="D|I|E"/>
<State id="5" name="I|B|E"/>
<State id="6" name="B|B|E"/>
<State id="7" name="I|D|E"/>
<State id="8" name="B|D|E"/>
<State id="9" name="I|D|F"/>
<State id="10" name="D|D|E"/>
<State id="11" name="I|B|F"/>
<State id="12" name="D|B|E"/>
</StateSet>

<TransitionRelation>
<Transition x1="1" event="alpha_a" x2="2"/>
<Transition x1="2" event="beta_a" x2="3"/>
<Transition x1="2" event="mue_a" x2="4"/>
<Transition x1="3" event="alpha_b" x2="5"/>
<Transition x1="4" event="lambda_a" x2="1"/>
<Transition x1="5" event="alpha_a" x2="6"/>
<Transition x1="5" event="beta_b" x2="1"/>
<Transition x1="5" event="mue_b" x2="7"/>
<Transition x1="6" event="beta_a" x2="11"/>
<Transition x1="6" event="mue_a" x2="12"/>
<Transition x1="6" event="beta_b" x2="2"/>
<Transition x1="6" event="mue_b" x2="8"/>
<Transition x1="7" event="alpha_a" x2="8"/>
<Transition x1="7" event="lambda_b" x2="1"/>
<Transition x1="8" event="beta_a" x2="9"/>
<Transition x1="8" event="mue_a" x2="10"/>
<Transition x1="8" event="lambda_b" x2="2"/>
<Transition x1="9" event="lambda_b" x2="3"/>
<Transition x1="10" event="lambda_a" x2="7"/>
<Transition x1="10" event="lambda_b" x2="4"/>
<Transition x1="11" event="beta_b" x2="3"/>
<Transition x1="11" event="mue_b" x2="9"/>
<Transition x1="12" event="lambda_a" x2="5"/>
<Transition x1="12" event="beta_b" x2="4"/>
<Transition x1="12" event="mue_b" x2="10"/>
</TransitionRelation>

</Generator>
<VioModels>
<TransitionList>
<Transition x1="1" event="alpha_a" x2="2"/>
<Transition x1="2" event="beta_a" x2="3"/>
<Transition x1="2" event="mue_a" x2="4"/>
<Transition x1="3" event="alpha_b" x2="5"/>
<Transition x1="4" event="lambda_a" x2="1"/>
<Transition x1="5" event="alpha_a" x2="6"/>
<Transition x1="5" event="beta_b" x2="1"/>
<Transition x1="5" event="mue_b" x2="7"/>
<Transition x1="6" event="beta_a" x2="11"/>
<Transition x1="6" event="mue_a" x2="12"/>
<Transition x1="6" event="beta_b" x2="2"/>
<Transition x1="6" event="mue_b" x2="8"/>
<Transition x1="7" event="alpha_a" x2="8"/>
<Transition x1="7" event="lambda_b" x2="1"/>
<Transition x1="8" event="beta_a" x2="9"/>
<Transition x1="8" event="mue_a" x2="10"/>
<Transition x1="8" event="lambda_b" x2="2"/>
<Transition x1="9" event="lambda_b" x2="3"/>
<Transition x1="10" event="lambda_a" x2="7"/>
<Transition x1="10" event="lambda_b" x2="4"/>
<Transition x1="11" event="beta_b" x2="3"/>
<Transition x1="11" event="mue_b" x2="9"/>
<Transition x1="12" event="lambda_a" x2="5"/>
<Transition x1="12" event="beta_b" x2="4"/>
<Transition x1="12" event="mue_b" x2="10"/>
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
</EventList>
<GraphData>
<States/>
<TransRel/>
</GraphData>
</VioModels>
<VioLayout>
0             =AAAA/wAAAAEAAAADAAAA8gAAAnEAAAAAAf////8BAAAAAQA==  0              150            625            0.679379       0             
242           
</VioLayout>
</VioSystem>
</Value>
</Variable>
</VariablePool>

<Functions/>
<Script>
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
