#model final
set Cities;
set Link  within (Cities cross Cities);

param Profit {Link};
param CostActivation {Cities};
param Limit {Link};

var Flight {Link} >= 0;
var Activation {Cities} binary;
var Linear {Link} binary;

maximize Revenue: sum {(i,j) in Link} Profit[i,j] * Flight[i,j] - sum {i in Cities} CostActivation[i]* Activation[i]; 


subject to ActivationConstr: sum {j in Cities} Activation[j] <= 5;
subject to ActivationFlight: sum {(i,j) in Link} Flight[i,j] <= 14;
subject to LimitConstraints {(i,j) in Link}: Flight[i,j] <= Limit[i,j]*Linear[i,j];
subject to ParisConstr: sum {(j,'Parigi') in Link} Flight[j,'Parigi'] >= 6; 
subject to LinearConstr{(i,j) in Link}: Linear[i,j] >= Activation[i]+ Activation[j]-1; 	
subject to LinearConstrSec{(i,j) in Link}: 2*Linear[i,j] <= Activation[i]+ Activation[j]; 	
