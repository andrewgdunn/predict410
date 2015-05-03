title 'Assignment 5';
libname mydata '/scs/crb519/PREDICT_410/SAS_Data/' access=readonly;

* create a temporary variable (data source is read only);
data ames;
  set mydata.ames_housing_data;

ods graphics on;

proc sort data=ames;
  by OverallQual;

proc means data=ames;
  var SalePrice;
  by OverallQual;

proc reg data=ames;
  model SalePrice = OverallQual;

data ames_indicator_oq_hs;
  set ames;
    keep SalePrice GrLivArea GarageArea TotalBsmtSF FirstFlrSF MasVnrArea BsmtFinSF1 BsmtUnfSF OverallQual oc_1 oc_2 oc_3 oc_4 oc_5 oc_6 oc_7 oc_8 oc_9 oc_10 HouseStyle hs_1 hs_2 hs_3 hs_4 hs_5 hs_6 hs_7 hs_8;
    if OverallQual in (1 2 3 4 5 6 7 8 9 10) then do;
      oc_1 = (OverallQual eq 1);
      oc_2 = (OverallQual eq 2);
      oc_3 = (OverallQual eq 3);
      oc_4 = (OverallQual eq 4);
      oc_5 = (OverallQual eq 5);
      oc_6 = (OverallQual eq 6);
      oc_7 = (OverallQual eq 7);
      oc_8 = (OverallQual eq 8);
      oc_9 = (OverallQual eq 9);
      oc_10 = (OverallQual eq 10);
    end;
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

proc freq data=ames_indicator_oq_hs;
  tables OverallQual oc_1 oc_2 oc_3 oc_4 oc_5 oc_6 oc_7 oc_8 oc_9 oc_10;

proc reg data=ames_indicator_oq_hs;
  model saleprice = oc_1 oc_2 oc_3 oc_4 oc_5 oc_6 oc_7 oc_8 oc_9;

proc freq data=ames_indicator_oq_hs;
  tables HouseStyle hs_1 hs_2 hs_3 hs_4 hs_5 hs_6 hs_7 hs_8;

proc reg data=ames_indicator_oq_hs outest=reg_rsq_out;
  model SalePrice = GrLivArea GarageArea TotalBsmtSF FirstFlrSF MasVnrArea BsmtFinSF1 BsmtUnfSF oc_1 oc_2 oc_3 oc_4 oc_5 oc_6 oc_7 oc_8 oc_9 oc_10 hs_1 hs_2 hs_3 hs_4 hs_5 hs_6 hs_7 hs_8/
  selection=adjrsq aic bic cp  best=5;

proc print data=reg_rsq_out;

proc reg data=ames_indicator_oq_hs outest=reg_cp_out;
  model SalePrice = GrLivArea GarageArea TotalBsmtSF FirstFlrSF MasVnrArea BsmtFinSF1 BsmtUnfSF oc_1 oc_2 oc_3 oc_4 oc_5 oc_6 oc_7 oc_8 oc_9 oc_10 hs_1 hs_2 hs_3 hs_4 hs_5 hs_6 hs_7 hs_8/
  selection=cp adjrsq aic bic cp best=5;

proc print data=reg_cp_out;

proc reg data=ames_indicator_oq_hs outest=reg_forward_out;
  model SalePrice = GrLivArea GarageArea TotalBsmtSF FirstFlrSF MasVnrArea BsmtFinSF1 BsmtUnfSF oc_1 oc_2 oc_3 oc_4 oc_5 oc_6 oc_7 oc_8 oc_9 oc_10 hs_1 hs_2 hs_3 hs_4 hs_5 hs_6 hs_7 hs_8/
  selection=forward adjrsq aic bic cp best=5;

proc print data=reg_forward_out;

proc reg data=ames_indicator_oq_hs outest=reg_backward_out;
  model SalePrice = GrLivArea GarageArea TotalBsmtSF FirstFlrSF MasVnrArea BsmtFinSF1 BsmtUnfSF oc_1 oc_2 oc_3 oc_4 oc_5 oc_6 oc_7 oc_8 oc_9 oc_10 hs_1 hs_2 hs_3 hs_4 hs_5 hs_6 hs_7 hs_8/
  selection=backward adjrsq aic bic cp best=5;

proc print data=reg_backward_out;

proc reg data=ames_indicator_oq_hs outest=reg_stepwise_out;
  model SalePrice = GrLivArea GarageArea TotalBsmtSF FirstFlrSF MasVnrArea BsmtFinSF1 BsmtUnfSF oc_1 oc_2 oc_3 oc_4 oc_5 oc_6 oc_7 oc_8 oc_9 oc_10 hs_1 hs_2 hs_3 hs_4 hs_5 hs_6 hs_7 hs_8/
  selection=stepwise adjrsq aic bic cp best=5;

proc print data=reg_stepwise_out;

run;
