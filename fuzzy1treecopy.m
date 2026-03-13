%% CONTENTMENT

% Roots

load('V2_F1_SATISFACTION.mat')
% Input names
Input1_V2_F1_SATISFACTION = V2_F1_SATISFACTION.Inputs(1,1).Name;
Input2_V2_F1_SATISFACTION = V2_F1_SATISFACTION.Inputs(1,2).Name;
% Output name
Output_V2_F1_SATISFACTION = V2_F1_SATISFACTION.Outputs.Name;

% Branch

load('V2_F2_CONTENTMENT.mat') % With the defined rules for the tree

% Connections
Con_1_V2_F2_CONTENTMENT = ["V2_F1_SATISFACTION/Satisfaction" "V2_F2_CONTENTMENT/Satisfaction"];

% Tree
V2_TREE_CONTENTMENT = fistree([V2_F1_SATISFACTION V2_F2_CONTENTMENT],Con_1_V2_F2_CONTENTMENT);

% >> plotfis(TREE_CONTENTMENT)
% 
% FIS Names:
% 	F1_SATISFACTION
% 	F2_CONTENTMENT
% 
% Connections:
% 	From                    	    To
% 	------------------------	   ---------------------
% 	F1_SATISFACTION/Satisfaction    F2_CONTENTMENT/Satisfaction
% 
% Inputs:
% 	F1_SATISFACTION/NetIncome
% 	F1_SATISFACTION/FinancialSatisfaction
% 
% Outputs:
% 	F2_CONTENTMENT/Contentment

% InputsContentment:  NetIncome || FinancialSatisfaction 

OutputsContentment = evalfis(V2_TREE_CONTENTMENT,contentment);

save('V2_TREE_CONTENTMENT.mat','V2_TREE_CONTENTMENT')



%% PLANNING

% Roots

load('V2_F1_BUDGETING.mat')
% Input names
Input1_V2_F1_BUDGETING = V2_F1_BUDGETING.Inputs(1,1).Name;
Input2_V2_F1_BUDGETING = V2_F1_BUDGETING.Inputs(1,2).Name;
% Output name
Output_V2_F1_BUDGETING = V2_F1_BUDGETING.Outputs.Name;


load('V2_F1_MANAGEMENT.mat')
% Input names   
Input1_V2_F1_MANAGEMENT = V2_F1_MANAGEMENT.Inputs(1,1).Name;
Input2_V2_F1_MANAGEMENT = V2_F1_MANAGEMENT.Inputs(1,2).Name;
% Output name
Output_V2_F1_MANAGEMENT = V2_F1_MANAGEMENT.Outputs.Name;

% Branch

load('V2_F2_PLANNING.mat') % With the defined rules for the tree

% Connections
Con_1_V2_F2_PLANNING = ["V2_F1_BUDGETING/Budgeting" "V2_F2_PLANNING/Budgeting"];
Con_2_V2_F2_PLANNING= ["V2_F1_MANAGEMENT/Management" "V2_F2_PLANNING/Management"];

% Tree
V2_TREE_PLANNING = fistree([V2_F1_BUDGETING V2_F1_MANAGEMENT V2_F2_PLANNING],[Con_1_V2_F2_PLANNING; Con_2_V2_F2_PLANNING]);

% >> plotfis(TREE_PLANNING)
% 
% FIS Names:
% 	F1_BUDGETING
% 	F1_MANAGEMENT
% 	F2_PLANNING
% 
% Connections:
% 	From                    	    To
% 	------------------------	   ---------------------
% 	F1_BUDGETING/Budgeting          F2_PLANNING/Budgeting
% 	F1_MANAGEMENT/Management        F2_PLANNING/Management
% 
% Inputs:
% 	F1_BUDGETING/FinancialDeficit
% 	F1_BUDGETING/FinancialDebtCommitment
% 	F1_MANAGEMENT/PersonalFinancialManagement
% 	F1_MANAGEMENT/SecurityNet
% 
% Outputs:
% 	F2_PLANNING/Planning

% InputsPlanning:  FinancialDeficit || FinancialDebtCommitment || PersonalFinancialManagement || SecurityNet

OutputsBudgeting = evalfis(V2_F1_BUDGETING,budgeting);

OutputsManagement = evalfis(V2_F1_MANAGEMENT,management);

OutputsPLANNING = evalfis(V2_TREE_PLANNING,planning);

save('V2_TREE_PLANNING.mat','V2_TREE_PLANNING')

%% SHELTER STABILITY

% Roots
load('V2_F1_SECURITY.mat')
% Input names
Input1_V2_F1_SECURITY = V2_F1_SECURITY.Inputs(1,1).Name;
Input2_V2_F1_SECURITY = V2_F1_SECURITY.Inputs(1,2).Name;
% Output name
Output_V2_F1_SECURITY = V2_F1_SECURITY.Outputs.Name;

load('V2_F1_HEXPENSES.mat')
% Input names
Input1_V2_F1_HEXPENSES = V2_F1_HEXPENSES.Inputs(1,1).Name;
Input2_V2_F1_HEXPENSES = V2_F1_HEXPENSES.Inputs(1,2).Name;
% Output name
Output_V2_F1_HEXPENSES = V2_F1_HEXPENSES.Outputs.Name;

% Branch

load('V2_F2_SHELTERSTABILITY.mat') % With the defined rules for the tree

% Connections
Con_1_V2_F2_SHELTERSTABILITY = ["V2_F1_SECURITY/Security" "V2_F2_SHELTERSTABILITY/Security"];
Con_2_V2_F2_SHELTERSTABILITY = ["V2_F1_HEXPENSES/Hexpenses" "V2_F2_SHELTERSTABILITY/Hexpenses"];

% Tree
V2_TREE_SHELTERSTABILITY = fistree([V2_F1_SECURITY V2_F1_HEXPENSES V2_F2_SHELTERSTABILITY],[Con_1_V2_F2_SHELTERSTABILITY; Con_2_V2_F2_SHELTERSTABILITY]);

% >> plotfis(TREE_SHELTERSTABILITY)
% 
% FIS Names:
% 	F1_SECURITY
% 	F1_HEXPENSES
% 	F2_SHELTERSTABILITY
% 
% Connections:
% 	From                    	    To
% 	------------------------	   ---------------------
% 	F1_SECURITY/Security            F2_SHELTERSTABILITY/Security
% 	F1_HEXPENSES/Hexpenses          F2_SHELTERSTABILITY/Hexpenses        
% 
% Inputs:
% 	F1_SECURITY/SalaryVariation
% 	F1_SECURITY/FinancialSecurity
% 	F1_HEXPENSES/FixedFinancialCosts
% 	F1_HEXPENSES/VariationFFC
% 
% Outputs:
% 	F2_SHELTERSTABILITY/Shelterstability 

% InputsPlanning:  SalaryVariation || FinancialSecurity || FixedFinancialCosts || VariationFFC 

OutputsSecurity = evalfis(V2_F1_SECURITY,security);

OutputsHexpenses = evalfis(V2_F1_HEXPENSES,hexpenses);

OutputsSHELTERSTABILITY = evalfis(V2_TREE_SHELTERSTABILITY,shelterstability);

save('V2_TREE_SHELTERSTABILITY.mat','V2_TREE_SHELTERSTABILITY')


%% FUTURE

% Roots

load('V2_F1_SAVINGS.mat')
% Input names
Input1_V2_F1_SAVINGS = V2_F1_SAVINGS.Inputs(1,1).Name;
Input2_V2_F1_SAVINGS = V2_F1_SAVINGS.Inputs(1,2).Name;
% Output name
Output_V2_F1_SAVINGS = V2_F1_SAVINGS.Outputs.Name;


load('V2_F1_RESILIENCE.mat')
% Input names   
Input1_V2_F1_RESILIENCE = V2_F1_RESILIENCE.Inputs(1,1).Name;
Input2_V2_F1_RESILIENCE = V2_F1_RESILIENCE.Inputs(1,2).Name;
% Output name
Output_V2_F1_RESILIENCE = V2_F1_RESILIENCE.Outputs.Name;

% Branch

load('V2_F2_FUTURE.mat') % With the defined rules for the tree

% Connections
Con_1_V2_F2_FUTURE = ["V2_F1_SAVINGS/Savings" "V2_F2_FUTURE/Savings"];
Con_2_V2_F2_FUTURE= ["V2_F1_RESILIENCE/Resilience" "V2_F2_FUTURE/Resilience"];

% Tree
V2_TREE_FUTURE = fistree([V2_F1_SAVINGS V2_F1_RESILIENCE V2_F2_FUTURE],[Con_1_V2_F2_FUTURE; Con_2_V2_F2_FUTURE]);

% >> plotfis(TREE_FUTURE)
% 
% FIS Names:
% 	F1_SAVINGS
% 	F1_RESILIENCE
% 	F2_FUTURE
% 
% Connections:
% 	From                    	    To
% 	------------------------	   ---------------------
% 	F1_SAVINGS/Savings             F2_FUTURE/Savings
% 	F1_RESILIENCE/Resilience       F2_FUTURE/Resilience
% 
% Inputs:
% 	F1_SAVINGS/Savings
% 	F1_SAVINGS/RetirementSavings
% 	F1_RESILIENCE/LiquidityRisk
% 	F1_RESILIENCE/LiquiditySecurityNet
% 
% Outputs:
% 	F2_FUTURE/Future

% InputsPlanning:  Savings || RetirementSavings || LiquidityRisk || LiquiditySecurityNet

OutputsSavings = evalfis(V2_F1_SAVINGS,savings);

OutputsResilience = evalfis(V2_F1_RESILIENCE,resilience);

OutputsFUTURE = evalfis(V2_TREE_FUTURE,future);

save('V2_TREE_FUTURE.mat','V2_TREE_FUTURE')

%% HARMONY = CONTENTMENT + PLANNING

% Branch
load('V2_F3_HARMONY.mat')

V2_TREE_HARMONY = fistree([V2_F1_SATISFACTION V2_F1_BUDGETING V2_F1_MANAGEMENT ...
                         V2_F2_CONTENTMENT V2_F2_PLANNING ...
                         V2_F3_HARMONY],...
                         ["V2_F1_SATISFACTION/Satisfaction" "V2_F2_CONTENTMENT/Satisfaction";
                          "V2_F1_BUDGETING/Budgeting" "V2_F2_PLANNING/Budgeting";
                          "V2_F1_MANAGEMENT/Management" "V2_F2_PLANNING/Management"
                          "V2_F2_CONTENTMENT/Contentment" "V2_F3_HARMONY/Contentment";
                          "V2_F2_PLANNING/Planning" "V2_F3_HARMONY/Planning"]);         
                      
% >> plotfis(TREE_HARMONY)
% 
% FIS Names:
% 	F1_SATISFACTION
% 	F1_BUDGETING
% 	F1_MANAGEMENT
% 	F2_CONTENTMENT
% 	F2_PLANNING
% 	F3_HARMONY
% 
% Connections:
% 	From                    	    To
% 	------------------------	    ----------------------
% 	F1_SATISFACTION/Satisfaction	F2_CONTENTMENT/Satisfaction
% 	F1_BUDGETING/Budgeting          F2_PLANNING/Budgeting
% 	F1_MANAGEMENT/Management  	    F2_PLANNING/Management
% 	F2_CONTENTMENT/Contentment      F3_HARMONY/Contentment
% 	F2_PLANNING/Planning    	    F3_HARMONY/Planning
% 
% Inputs:
% 	F1_SATISFACTION/NetIncome
% 	F1_SATISFACTION/FinancialSatisfaction
% 	F1_BUDGETING/FinancialDeficit
% 	F1_BUDGETING/FinancialDebtCommitment
% 	F1_MANAGEMENT/PersonalFinancialManagement
% 	F1_MANAGEMENT/SecurityNet
% 
% Outputs:
% 	F3_HARMONY/Harmony


% InputsAptitude:  NetIncome || FinancialSatisfaction || FinancialDeficit || FinancialDebtCommitment || PersonalFinancialManagement || SecurityNet 

OutputsHARMONY = evalfis(V2_TREE_HARMONY,harmony);

save('V2_TREE_HARMONY.mat','V2_TREE_HARMONY')

%% PERSPECTIVE = SHELTERSTABILITY + FUTURE

% Branch
load('V2_F3_PERSPECTIVE.mat')

V2_TREE_PERSPECTIVE = fistree([V2_F1_SECURITY V2_F1_HEXPENSES V2_F1_SAVINGS V2_F1_RESILIENCE ...
                         V2_F2_SHELTERSTABILITY V2_F2_FUTURE ...
                         V2_F3_PERSPECTIVE],...
                         ["V2_F1_SECURITY/Security" "V2_F2_SHELTERSTABILITY/Security";
                          "V2_F1_HEXPENSES/Hexpenses" "V2_F2_SHELTERSTABILITY/Hexpenses";
                          "V2_F1_SAVINGS/Savings" "V2_F2_FUTURE/Savings"
                          "V2_F1_RESILIENCE/Resilience" "V2_F2_FUTURE/Resilience"
                          "V2_F2_SHELTERSTABILITY/Shelterstability" "V2_F3_PERSPECTIVE/Shelterstability";
                          "V2_F2_FUTURE/Future" "V2_F3_PERSPECTIVE/Future"]);         
                      
% >> plotfis(TREE_PERSPECTIVE)
% 
% FIS Names:
% 	F1_SECURITY
% 	F1_HEXPENSES
% 	F1_SAVINGS
% 	F1_RESILIENCE
% 	F2_SHELTERSTABILITY
% 	F2_FUTURE
% 	F3_PERSPECTIVE
% 
% Connections:
% 	From                    	            To
% 	------------------------	            ----------------------
% 	F1_SECURITY/Security	                F2_SHELTERSTABILITY/Security
% 	F1_HEXPENSES/Hexpenses	                F2_SHELTERSTABILITY/Hexpenses
% 	F1_SAVINGS/Savings                      F2_FUTURE/Savings
% 	F1_RESILIENCE/Resilience  	            F2_FUTURE/Resilience
% 	F2_SHELTERSTABILITY/Sheleterstability   F3_PERSPECTIVE/Shelterstability
% 	F2_FUTURE/Future    	                F3_PERSPECTIVE/Future
% 
% Inputs:
% 	F1_SECURITY/SalaryVariation
% 	F1_SECURITY/FinancialSecurity
% 	F1_HEXPENSES/FixedFinancialCost
% 	F1_HEXPENSES/VariationFFC
% 	F1_SAVINGS/Savings
% 	F1_SAVINGS/RetirementSavings
% 	F1_RESILIENCE/LiquidityRisk
% 	F1_RESILIENCE/LiquiditySecurityNet
% 
% Outputs:
% 	F3_PERSPECTIVE/Perspective


% InputsAptitude:  SalaryVariation || FinancialSecurity || FixedFinancialCost || VariationFFC || Savings || RetirementSavings || LiquidityRisk || LiquiditySecurityNet

OutputsPERSPECTIVE = evalfis(V2_TREE_PERSPECTIVE,perspective);

save('V2_TREE_PERSPECTIVE.mat','V2_TREE_PERSPECTIVE')

%% PROFILE = HARMONY + PERSPECTIVE

% This is the final connection that leads to the Client Profile

% Trunk

load('V2_F4_PROFILE.mat')

V2_TRUNK_PROFILE = fistree([V2_F1_SATISFACTION V2_F1_BUDGETING V2_F1_MANAGEMENT V2_F1_SECURITY V2_F1_HEXPENSES V2_F1_SAVINGS V2_F1_RESILIENCE ...
                         V2_F2_CONTENTMENT V2_F2_PLANNING V2_F2_SHELTERSTABILITY V2_F2_FUTURE ...
                         V2_F3_HARMONY V2_F3_PERSPECTIVE ...
                         V2_F4_PROFILE],...
                         ["V2_F1_SATISFACTION/Satisfaction" "V2_F2_CONTENTMENT/Satisfaction";
                          "V2_F1_BUDGETING/Budgeting" "V2_F2_PLANNING/Budgeting";
                          "V2_F1_MANAGEMENT/Management" "V2_F2_PLANNING/Management";
                          "V2_F1_SECURITY/Security" "V2_F2_SHELTERSTABILITY/Security";
                          "V2_F1_HEXPENSES/Hexpenses" "V2_F2_SHELTERSTABILITY/Hexpenses";
                          "V2_F1_SAVINGS/Savings" "V2_F2_FUTURE/Savings";
                          "V2_F1_RESILIENCE/Resilience" "V2_F2_FUTURE/Resilience";
                          "V2_F2_CONTENTMENT/Contentment" "V2_F3_HARMONY/Contentment";
                          "V2_F2_PLANNING/Planning" "V2_F3_HARMONY/Planning";
                          "V2_F2_SHELTERSTABILITY/Shelterstability" "V2_F3_PERSPECTIVE/Shelterstability"; ...
                          "V2_F2_FUTURE/Future" "V2_F3_PERSPECTIVE/Future";...
                          "V2_F3_HARMONY/Harmony" "V2_F4_PROFILE/Harmony"
                          "V2_F3_PERSPECTIVE/Perspective" "V2_F4_PROFILE/Perspective"]); 

plotfis(V2_TRUNK_PROFILE,Legend="on")


% InputsProfile:  NetIncome || FinancialSatisfaction || FinancialDeficit || FinancialDebtCommitment || PersonalFinancialManagement || SecurityNet || SalaryVariation || FinancialSecurity || FixedFinancialCosts || VariationFFC || Savings || RetirementSavings || LiquidityRisk || LiquiditySecurityNet 


OutputsProfile = evalfis(V2_TRUNK_PROFILE,n26index);

save('V2_TRUNK_PROFILE.mat','V2_TRUNK_PROFILE')
