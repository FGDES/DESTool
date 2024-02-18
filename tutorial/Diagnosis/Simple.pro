<Project>

<VariablePool>
<Variable>
"MFailureModel" "System"      +Visual+      +Shown+       +Plant+       
<Value>
<VioSystem>
<Generator>
"Generator"   

% 
%  Statistics for Generator
% 
%  States:        3
%  Init/Marked:   1/1
%  Events:        3
%  Transitions:   4
%  StateSymbols:  0
%  Attrib. E/S/T: 2/0/0
% 

<Alphabet>
"alpha"       +C+           "beta"        "f"           +o+           
</Alphabet>

<States>
1             2             3             
</States>

<TransRel>
1             "alpha"       2             
2             "beta"        1             
2             "f"           3             
3             "beta"        2             
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
=AAAABAEAAAABAAAACgBhAGwAcABoAGEAAAACAQAAAAIAAAAIAGIAZQB0AGEAAAABAQAAAAIAAAACAGYAAAADAQAAAAMAAAAIAGIAZQB0AGEAAAAC= </TransitionList>
<StateList>
=AAAAAwIAAAABAgAAAAICAAAAAw=== </StateList>
<EventList>
=AAAAAwMAAAAKAGEAbABwAGgAYQMAAAAIAGIAZQB0AGEDAAAAAgBm= </EventList>
<GraphData>
<States>
<State>
1             
<Item>
<Position>
-310          -50           
</Position>
<BasePoints>
0             0             30            30            -60           0             
-30.028524    0             
</BasePoints>
</Item>
</State>
<State>
2             
<Item>
<Position>
-200          -50           
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.028695    0             
</BasePoints>
</Item>
</State>
<State>
3             
<Item>
<Position>
-88           -50           
</Position>
<BasePoints>
0             0             30            30            -50           0             
-30.058307    0             
</BasePoints>
</Item>
</State>
</States>
<TransRel>
<Trans>
1             "alpha"       2             +Spline+      
<Item>
<Position>
-310          -50           
</Position>
<BasePoints>
40            20            0             0             29.988833     0             
46.508301     0             62.992188     0             80.011167     0             
110           0             
</BasePoints>
</Item>
</Trans>
<Trans>
2             "beta"        1             +Spline+      
<Item>
<Position>
-200          -50           
</Position>
<BasePoints>
-70           -40           0             0             -25.752568    -15.451541    
-50           -30           -60           -30           -84.280597    -15.431641    
-110          0             
</BasePoints>
</Item>
</Trans>
<Trans>
2             "f"           3             +Spline+      
<Item>
<Position>
-200          -50           
</Position>
<BasePoints>
50            20            0             0             30.022064     0             
47.167969     0             64.312500     0             81.977936     0             
112           0             
</BasePoints>
</Item>
</Trans>
<Trans>
3             "beta"        2             +Spline+      
<Item>
<Position>
-88           -50           
</Position>
<BasePoints>
-70           -40           0             0             -25.706484    -15.423891    
-50           -30           -60           -30           -86.002553    -14.998527    
-112          0             
</BasePoints>
</Item>
</Trans>
</TransRel>
</GraphData>
</VioModels>
<VioLayout>
0             =YHw8CGACAAAAAAAAAAAAAHBxFggAAAAACKQWCNDbMAjYsA=== 0             150           618           1             
</VioLayout>
</VioSystem>
</Value>
</Variable>
<Variable>
"MNominalModel" "System"      +Visual+      +Shown+       
<Value>
<VioSystem>
<Generator>
"Generator"   

% 
%  Statistics for Generator
% 
%  States:        2
%  Init/Marked:   1/1
%  Events:        2
%  Transitions:   2
%  StateSymbols:  0
%  Attrib. E/S/T: 1/0/0
% 

<Alphabet>
"alpha"       +C+           "beta"        
</Alphabet>

<States>
1             2             
</States>

<TransRel>
1             "alpha"       2             
2             "beta"        1             
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
=AAAAAgEAAAABAAAACgBhAGwAcABoAGEAAAACAQAAAAIAAAAIAGIAZQB0AGEAAAAB= </TransitionList>
<StateList>
=AAAAAgIAAAABAgAAAAI== </StateList>
<EventList>
=AAAAAgMAAAAIAGIAZQB0AGEDAAAACgBhAGwAcABoAGE== </EventList>
<GraphData>
<States>
<State>
1             
<Item>
<Position>
-300          -40           
</Position>
<BasePoints>
0             0             30            30            -60           0             
-30.058135    0             
</BasePoints>
</Item>
</State>
<State>
2             
<Item>
<Position>
-190          -40           
</Position>
<BasePoints>
0             0             30            30            -50           0             
-29.999713    0             
</BasePoints>
</Item>
</State>
</States>
<TransRel>
<Trans>
1             "alpha"       2             +Spline+      
<Item>
<Position>
-300          -40           
</Position>
<BasePoints>
40            30            0             0             30.051959     0             
46.508301     0             62.992188     0             79.948041     0             
110           0             
</BasePoints>
</Item>
</Trans>
<Trans>
2             "beta"        1             +Spline+      
<Item>
<Position>
-190          -40           
</Position>
<BasePoints>
-70           -40           0             0             -25.752863    -15.451717    
-50           -30           -60           -30           -84.280303    -15.431818    
-110          0             
</BasePoints>
</Item>
</Trans>
</TransRel>
</GraphData>
</VioModels>
<VioLayout>
0             =AAAAAAAAAAApAAAAAQAAAAMAAAAAAAAAAgAAAGVhbgDAzA=== 0             150           506           1             
</VioLayout>
</VioSystem>
</Value>
</Variable>
<Variable>
"BDiagnosable" "Boolean"     
<Value>
<Boolean>
"true"        
</Boolean>
</Value>
</Variable>
<Variable>
"MDiagnoser"  "Diagnoser"   +Visual+      +Shown+       +Supervisor+  
<File>
"MDiagnoser.vio" 
</File>
</Variable>
</VariablePool>

<Script>

<Operations>

<IsLanguageDiagnosable>
"AnonymousOperation_16807" 0             
<Parameters>
"MFailureModel" "MNominalModel" "BDiagnosable" 
</Parameters>
<Options>
"Clear Operands" 0             
</Options>
</IsLanguageDiagnosable>

<LanguageDiagnoser>
"AnonymousOperation_282475249" 0             
<Parameters>
"MFailureModel" "MNominalModel" "MDiagnoser"  
</Parameters>
<Options>
"Clear Operands" 0             "Minimal Realisation" 0             "Clear State Names" 0             
</Options>
</LanguageDiagnoser>

</Operations>
</Script>

<Simulator>

+Supervisor+  +Plant+       
<Files>
</Files>
<SimEvents>
"alpha"       
<Priority>
0             
</Priority>
"beta"        
<Priority>
0             
</Priority>
"f"           
<Priority>
0             
</Priority>
</SimEvents>
<Conditions>
</Conditions>
</Simulator>
<GuiState>
</GuiState>
</Project>
