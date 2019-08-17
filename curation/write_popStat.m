%% write_popStat
% writes a structure with all population stats for all entries

%%
function popStat = write_popStat(varargin)
% created 2019/08/02 by Bas Kooijman

%% Syntax
% popStat = <write_popStat *write_popStat*> (varargin)

%% Description
% collects all popStat.mat files from all add_my_pet/entries_web subdirectories of the AmP site into a single structure.
% Apart from a direct output, file popStat.mat is written in the parent directory of the current one.
% Meant to be run from AmPtool/curation 
%
% Input:
%
% * varargin: optional cell array with entry names, or character string with entry or node names (default 'Animalia')
%
% Ouput:
%
% * popStatLoc: stucture with all population statistics of all entries

%% Remarks
% This function uses wget under Windows powershell, to copy .mat files from the web to local.

%% Example of use
% popStat = write_popStat;

  if isempty(varargin)
    varargin = select('Animalia');
  elseif ~iscell(varargin{1}) && isempty(strfind(varargin{1},'_'))
    varargin = select(varargin{1});
  elseif iscell(varargin{1})    
    varargin = varargin{:}; % unpack cell string  
  end

  path = 'https://www.bio.vu.nl/thb/deb/deblab/add_my_pet/entries_web/';
  n_spec = length(varargin); 
  for i = 1:n_spec
    eval(['!powershell wget ', [path, varargin{i}, '/', varargin{i}, ], '_pop.mat -O popStat.mat'])
    load popStat
    spec = fieldnames(popStat); 
    popStatLoc.(spec{1}) = popStat.(spec{1});
    fprintf('%g: %s\n', i, spec{1});
  end
  popStat = popStatLoc;
  save('../popStat.mat','popStat')

