title 'Assignment 5';
libname mydata '/scs/crb519/PREDICT_410/SAS_Data/' access=readonly;

* create a temporary variable (data source is read only);
data ames;
  set mydata.ames_housing_data;

ods graphics off;

proc contents data=ames;

data ames_cleaned;
  set ames;
    if (SaleCondition ne 'Normal')
      then delete;
    else if (Functional ne 'Typ')
      then delete;

proc contents data=ames_cleaned;

data ames_indicator;
  set ames_cleaned;
    keep SalePrice GrLivArea GarageArea TotalBsmtSF FirstFlrSF MasVnrArea OverallQual HouseStyle hs_1 hs_2 hs_3 hs_4 hs_5 hs_6 hs_7 hs_8 GarageType gt_1 gt_2 gt_3 gt_4 gt_5 gt_6 gt_7;
    * Create Indicator Variables from Categorical Variable;
    if HouseStyle in ('1Story' '1.5Fin' '1.5Unf' '2Story' '2.5Fin' '2.5Unf' 'SFoyer' 'SLvl') then do;
      hs_1 = (HouseStyle eq '1Story');
      hs_2 = (HouseStyle eq '1.5Fin');
      hs_3 = (HouseStyle eq '1.5Unf');
      hs_4 = (HouseStyle eq '2Story');
      hs_5 = (HouseStyle eq '2.5Fin');
      hs_6 = (HouseStyle eq '2.5Unf');
      hs_7 = (HouseStyle eq 'SFoyer');
      hs_8 = (HouseStyle eq 'SLvl');
    end;
    * Recode Categorical Variable so we can use in strait reg;
    if HouseStyle='1Story' then HouseStyle=1;
    if HouseStyle='1.5Fin' then HouseStyle=2;
    if HouseStyle='1.5Unf' then HouseStyle=3;
    if HouseStyle='2Story' then HouseStyle=4;
    if HouseStyle='2.5Fin' then HouseStyle=5;
    if HouseStyle='2.5Unf' then HouseStyle=6;
    if HouseStyle='SFoyer' then HouseStyle=7;
    if HouseStyle='SLvl' then HouseStyle=8;
    * Create Indicator Variables from Categorical Variable;
    if GarageType in ('2Types' 'Attchd' 'Basment' 'BuiltIn' 'CarPort' 'Detchd' 'NA') then do;
      gt_1 = (GarageType eq '2Types');
      gt_2 = (GarageType eq 'Attchd');
      gt_3 = (GarageType eq 'Basment');
      gt_4 = (GarageType eq 'BuiltIn');
      gt_5 = (GarageType eq 'CarPort');
      gt_6 = (GarageType eq 'Detchd');
      gt_7 = (GarageType eq 'NA');
    end;
    * Recode Categorical Variable so we can use in strait reg;
    if GarageType='2Types' then GarageType=1;
    if GarageType='Attchd' then GarageType=2;
    if GarageType='Basment' then GarageType=3;
    if GarageType='BuiltIn' then GarageType=4;
    if GarageType='CarPort' then GarageType=5;
    if GarageType='Detchd' then GarageType=6;
    if GarageType='NA' then GarageType=7;

proc means data=ames_indicator;
  class HouseStyle;
  var SalePrice;

proc freq data=ames_indicator;
  tables HouseStyle hs_1 hs_2 hs_3 hs_4 hs_5 hs_6 hs_7 hs_8;

proc means data=ames_indicator;
  class GarageType;
  var SalePrice;

proc freq data=ames_indicator;
  tables GarageType gt_1 gt_2 gt_3 gt_4 gt_5 gt_6 gt_7;

proc reg data=ames_indicator;
  model SalePrice = HouseStyle;

proc reg data=ames_indicator;
  model SalePrice = hs_1 hs_2 hs_3 hs_4 hs_5 hs_6 hs_7;

proc reg data=ames_indicator outest=reg_rsq_out;
model SalePrice = GrLivArea GarageArea TotalBsmtSF FirstFlrSF MasVnrArea gt_1 gt_2 gt_3 gt_4 gt_5 gt_6 gt_7 hs_1 hs_2 hs_3 hs_4 hs_5 hs_6 hs_7 hs_8/
selection=adjrsq aic bic cp best=5;

proc print data=reg_rsq_out;

proc reg data=ames_indicator outest=reg_cp_out;
  model SalePrice = GrLivArea GarageArea TotalBsmtSF FirstFlrSF MasVnrArea gt_1 gt_2 gt_3 gt_4 gt_5 gt_6 gt_7 hs_1 hs_2 hs_3 hs_4 hs_5 hs_6 hs_7 hs_8/
  selection=cp adjrsq aic bic cp best=5;

proc print data=reg_cp_out;

proc reg data=ames_indicator outest=reg_forward_out;
  model SalePrice = GrLivArea GarageArea TotalBsmtSF FirstFlrSF MasVnrArea gt_1 gt_2 gt_3 gt_4 gt_5 gt_6 gt_7 hs_1 hs_2 hs_3 hs_4 hs_5 hs_6 hs_7 hs_8/
  selection=forward adjrsq aic bic cp best=5;

proc print data=reg_forward_out;

proc reg data=ames_indicator outest=reg_backward_out;
  model SalePrice = GrLivArea GarageArea TotalBsmtSF FirstFlrSF MasVnrArea gt_1 gt_2 gt_3 gt_4 gt_5 gt_6 gt_7 hs_1 hs_2 hs_3 hs_4 hs_5 hs_6 hs_7 hs_8/
  selection=backward adjrsq aic bic cp best=5;

proc print data=reg_backward_out;

proc reg data=ames_indicator outest=reg_stepwise_out;
  model SalePrice = GrLivArea GarageArea TotalBsmtSF FirstFlrSF MasVnrArea gt_1 gt_2 gt_3 gt_4 gt_5 gt_6 gt_7 hs_1 hs_2 hs_3 hs_4 hs_5 hs_6 hs_7 hs_8/
  selection=stepwise adjrsq aic bic cp best=5;

proc print data=reg_stepwise_out;

*ods graphics on;

proc reg data=ames_indicator;
  model SalePrice = GrLivArea GarageArea TotalBsmtSF MasVnrArea gt_1 gt_2 gt_3 gt_4 gt_5 gt_6 gt_7 hs_1 hs_2 hs_3 hs_4 hs_5 hs_6 hs_7 hs_8;

proc reg data=ames_indicator;
  model SalePrice = GrLivArea GarageArea TotalBsmtSF MasVnrArea;

proc reg data=ames_indicator;
  model SalePrice = GrLivArea GarageArea TotalBsmtSF;

*ods graphics off;

data ames_training;
  set ames_indicator;
  u = uniform(123);
  if (u < 0.70) then train = 1;
    else train = 0;
      if (train=1) then train_response=SalePrice;
        else train_response=.;


proc reg data=ames_training outest=reg_rsq_out;
model train_response = GrLivArea GarageArea TotalBsmtSF FirstFlrSF MasVnrArea gt_1 gt_2 gt_3 gt_4 gt_5 gt_6 gt_7 hs_1 hs_2 hs_3 hs_4 hs_5 hs_6 hs_7 hs_8/
selection=adjrsq aic bic cp best=5;

proc print data=reg_rsq_out;

proc reg data=ames_training outest=reg_cp_out;
  model train_response = GrLivArea GarageArea TotalBsmtSF FirstFlrSF MasVnrArea gt_1 gt_2 gt_3 gt_4 gt_5 gt_6 gt_7 hs_1 hs_2 hs_3 hs_4 hs_5 hs_6 hs_7 hs_8/
  selection=cp adjrsq aic bic cp best=5;

proc print data=reg_cp_out;

proc reg data=ames_training outest=reg_forward_out;
  model train_response = GrLivArea GarageArea TotalBsmtSF FirstFlrSF MasVnrArea gt_1 gt_2 gt_3 gt_4 gt_5 gt_6 gt_7 hs_1 hs_2 hs_3 hs_4 hs_5 hs_6 hs_7 hs_8/
  selection=forward adjrsq aic bic cp best=5;

proc print data=reg_forward_out;

proc reg data=ames_training outest=reg_backward_out;
  model train_response = GrLivArea GarageArea TotalBsmtSF FirstFlrSF MasVnrArea gt_1 gt_2 gt_3 gt_4 gt_5 gt_6 gt_7 hs_1 hs_2 hs_3 hs_4 hs_5 hs_6 hs_7 hs_8/
  selection=backward adjrsq aic bic cp best=5;

proc print data=reg_backward_out;

proc reg data=ames_training outest=reg_stepwise_out;
  model train_response = GrLivArea GarageArea TotalBsmtSF FirstFlrSF MasVnrArea gt_1 gt_2 gt_3 gt_4 gt_5 gt_6 gt_7 hs_1 hs_2 hs_3 hs_4 hs_5 hs_6 hs_7 hs_8/
  selection=stepwise adjrsq aic bic cp best=5;

proc print data=reg_stepwise_out;

proc reg data=ames_training;
  model SalePrice = GrLivArea GarageArea TotalBsmtSF MasVnrArea gt_1 gt_2 gt_3 gt_4 gt_5 gt_6 gt_7 hs_1 hs_2 hs_3 hs_4 hs_5 hs_6 hs_7 hs_8;
  output out=reg_indicators_yhat predicted=yhat;

proc reg data=ames_training;
  model SalePrice = GrLivArea GarageArea TotalBsmtSF;
  output out=reg_nonindicators_yhat predicted=yhat;

data indicator_mae;
  set reg_indicators_yhat;
    mae = abs (yhat - train_response);

data non_indicator_mae;
  set reg_nonindicators_yhat;
    mae = abs (yhat - train_response);

proc means data=indicator_mae;
  var mae;

proc means data=non_indicator_mae;
  var mae;

data indicator_performance;
  set reg_indicators_yhat;
    if train_response = . then delete;
    length prediction_grade $7.;
    p_d = abs((yhat - train_response) / train_response);
    if p_d le 0.10 then p_g = 'Grade 1';
      else if p_d gt 0.10 and p_d le 0.15 then p_g = 'Grade 2';
      else p_g = 'Grade 3';

data nonindicator_performance;
  set reg_nonindicators_yhat;
    if train_response = . then delete;
    length prediction_grade $7.;
    p_d = abs((yhat - train_response) / train_response);
    if p_d le 0.10 then p_g = 'Grade 1';
      else if p_d gt 0.10 and p_d le 0.15 then p_g = 'Grade 2';
      else p_g = 'Grade 3';

proc freq data=indicator_performance;
  tables p_g;

proc freq data=nonindicator_performance;
  tables p_g;

run;