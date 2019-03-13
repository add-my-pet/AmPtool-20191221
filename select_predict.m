%% select_predict
% gets list of species that belongs to a taxon and has a specified string in its predict-file

%%
function species = select_predict(varargin)
% created 2019/03/05 by  Bas Kooijman

%% Syntax
% species = <../select_predict.m *select_predict*> (varargin) 

%% Description
% gets all species in the add_my_pet collection with predict files that contain a character string.
%
% Input:
%
% * taxon: optional character string with name of taxon (default: 'Animalia')
% * str: character string
%
% Output:
% 
% * cell string with all species in the add_my_pet collection that belong to that taxon and have a predict-file that contains str

%% Remarks
% This function can take a few minutes if 'Animalia' is specified (so all entries are searched), since all predict-files are read from the web

%% Example of use
% nm = select_predict('get_tx_old')

  if nargin == 1
    species = select('Animalia');
    str = varargin{1};
  else
    species = select(varargin{1});
    str = varargin{2};
  end
  
  path = 'https://www.bio.vu.nl/thb/deb/deblab/add_my_pet/entries/';
  n_spec = length(species); sel = false(n_spec,1);
  for i = 1:n_spec
    predict = urlread([path, species{i}, '/predict_', species{i}, '.m']);
    if ~isempty(strfind(predict, str))
      sel(i) = true;
    end
  end

  species = species(sel);

  
