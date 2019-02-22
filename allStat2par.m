%% allStat2par
% obtain a structure with all core pars for an entry with context

%%
function [par, metaPar, txtPar, metaData] = allStat2par(my_pet)
% created 2019/02/20 by Bas Kooijman

%% Syntax
% [par, txtPar, metaPar, metaData] = <allStat2par *allStat2par*> (my_pet)

%% Description
% Read par, metaPar and metaData from allStat for entry my_pet
% Parameters are always expressed at T_ref
%
% Input:
%
% * my_pet: string with name of entry
%
% Output:
% 
% * par: structure with all core parameters
% * metaPar: structure with model, MRE, SMSE
% * txtPar: structure with units and labels for all core parameters
% * metaData: structure with taxonomy, T_typical, COMPLETE


%% Remarks
% used in prt_report_my_pet

%% Example of use
% [par, txtPar, metaPar, metaData] = allStat2par('Daphnia_magna');

  persistent allStat

  if ~exist('allStat','var') || isempty(allStat)
    load(which('allStat.mat'))        % get all parameters and statistics in structure allStat
  end

  % par, txtPar
  parFields = get_parfields(allStat.(my_pet).model); 
  chem = { ...
    'd_X'; 'd_V'; 'd_E'; 'd_P';
    'mu_X'; 'mu_V'; 'mu_E'; 'mu_P'; 
    'mu_C'; 'mu_H'; 'mu_O'; 'mu_N';
    'n_CX'; 'n_HX'; 'n_OX'; 'n_NX';
    'n_CV'; 'n_HV'; 'n_OV'; 'n_NV';
    'n_CE'; 'n_HE'; 'n_OE'; 'n_NE';
    'n_CP'; 'n_HP'; 'n_OP'; 'n_NP';
    'n_CC'; 'n_HC'; 'n_OC'; 'n_NC';
    'n_CH'; 'n_HH'; 'n_OH'; 'n_NH';
    'n_CO'; 'n_HO'; 'n_OO'; 'n_NO';
    'n_CN'; 'n_HN'; 'n_ON'; 'n_NN'};
  parFields = [parFields'; chem];
  n_parFields = length(parFields);
  for i = 1:n_parFields
    par.(parFields{i}) = allStat.(my_pet).(parFields{i});
    txtPar.units.(parFields{i}) = allStat.(my_pet).units.(parFields{i});
    txtPar.label.(parFields{i}) = allStat.(my_pet).label.(parFields{i});
  end

  % metaPar
  metaPar.model = allStat.(my_pet).model;
  metaPar.MRE = allStat.(my_pet).MRE;
  metaPar.SMSE = allStat.(my_pet).SMSE;

  % metaData
  metaData.phylum = allStat.(my_pet).phylum;
  metaData.class = allStat.(my_pet).class;
  metaData.order = allStat.(my_pet).order;
  metaData.family = allStat.(my_pet).family;
  metaData.species = allStat.(my_pet).species;
  metaData.species_en = allStat.(my_pet).species_en;
  metaData.T_typical = allStat.(my_pet).T_typical;
  metaData.COMPLETE = allStat.(my_pet).COMPLETE;

