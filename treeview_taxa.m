%% treeview_taxa
% shows pedigree in interactive html

%%
function treeview_taxa (taxon)
% created 2016/03/06 by Bas Kooijman, modified 2017/08/06, 2017/10/08

%% Syntax
% <../treeview_taxa.m *treeview_taxa*> (taxon) 

%% Description
% First procudes pedigree with function <pedigree.html *pedigree*> and 
% uses the result to create file /treeview/treeview_taxa.js and 
% opens AmPtool/taxa/treeview/treeview_taxa.html in the system browser.
%
% Input:
%
% * taxon: optional character string with a taxon (default 'Animalia')


%% Remarks
% taxon must be  a node in the taxonomic tree, see <list_taxa.m *list_taxa*>

%% Example of use
% treeview_taxa('Cladocera');

  if ~exist('taxon','var') || isempty(taxon)
    taxon = 'Animalia';
  end

  WD = pwd;                      % store current path
  taxa = which('treeview_taxa'); % locate taxa
  taxa = taxa(1:end - 15);       % path to taxa
  cd(taxa)                       % goto taxa

  try
    pedigree_taxa = pedigree(taxon);
    fid_tv = fopen('./taxa/treeview/treeview_taxa.js', 'w+'); % open file for writing, delete existing content

    % write header
    fprintf(fid_tv, '//\n');
    fprintf(fid_tv, '// Copyright (c) 2006 by Conor O''''Mahony.\n');
    fprintf(fid_tv, '// For enquiries, please email GubuSoft@GubuSoft.com\n');
    fprintf(fid_tv, '// Please keep all copyright notices below.\n');
    fprintf(fid_tv, '// Original author of TreeView script is Marcelino Martins.\n');
    fprintf(fid_tv, '// This document includes the TreeView script.\n');
    fprintf(fid_tv, '// The TreeView script can be found at http://www.TreeView.net.\n');
    fprintf(fid_tv, '// The script is Copyright (c) 2006 by Conor O''''Mahony.\n');
    fprintf(fid_tv, '//\n');
    fprintf(fid_tv, '// You can find general instructions for this file at www.treeview.net.\n');
    fprintf(fid_tv, '//\n\n');
  
    % write specs
    fprintf(fid_tv, 'USETEXTLINKS = 1\n'); % 0: The icon is the only link to a destination; 1: Both the icon and the text are links to the destination
    fprintf(fid_tv, 'STARTALLOPEN = 0\n'); % 0: Expand only the root node. Do not open other folders; 1: Expand all folders, showing every node in the tree. 
    fprintf(fid_tv, 'USEFRAMES = 0\n');    % 0: Use TreeView in a frame-less layout; 1: Use TreeView in a frame-based layout where the tree is in its own frame
    fprintf(fid_tv, 'USEICONS = 0\n');     % 0: Do not display the icons; 1: Display the icons
    fprintf(fid_tv, 'WRAPTEXT = 1\n');     % 0: The text portion of a node will appear on one line only; 1: The text portion of a node will wrap to always be visible 
    fprintf(fid_tv, 'PRESERVESTATE = 1\n');% 0: Do not store the state of the tree across page loads; 1: Store the state of the tree in cookies, and use that state on next visit
    fprintf(fid_tv, 'HIGHLIGHT = 1\n\n');  % 0: Do not highlight the selected node; 1: Highlight the selected node
  
    % build tree
    nl = strfind(pedigree_taxa, char(10)); root = pedigree_taxa(1:nl-1); pedigree_taxa(1:nl) = [];
    fprintf(fid_tv, ['foldersTree = gFld("<b>', root, '</b>", "treeview_taxa.html")\n']);

    while length(pedigree_taxa) > 3
      nl = strfind(pedigree_taxa, char(10)); node = pedigree_taxa(1:nl-1); pedigree_taxa(1:nl) = [];
      level = max(strfind(node, char(9))); node(1:level) = []; L = ['L', num2str(level)]; Lnew = ['L', num2str(1 + level)];
      if level == 1
        fprintf(fid_tv, ['L2 = insFld(foldersTree, gFld("', node, '", "treeview_taxa.html?pic=', '%%22', node, '%%2Ejpg', '%%22"))\n']);
        %fprintf(fid_tv, ['L2 = insFld(foldersTree, gFld("', node, '", ""))\n']);
      elseif isempty(strfind(node, '_')) && isempty(strfind(node, ' ')) 
        fprintf(fid_tv, [Lnew, ' = insFld(', L, ', gFld("', node, '", "treeview_taxa.html?pic=', '%%22', node, '%%2Ejpg', '%%22"))\n']);
        %fprintf(fid_tv, [Lnew, ' = insFld(', L, ', gFld("', node, '", ""))\n']);
      else
        fprintf(fid_tv, ['insDoc(', L, ', gLnk("S", "', node, '", "http://www.bio.vu.nl/thb/deb/deblab/add_my_pet/entries_web/', node, '/', node, '_res.html"))\n']); 
      end
    end
 
    fprintf(fid_tv, ['foldersTree.treeID = "', root, '"\n']);
    fclose(fid_tv);
  
  catch
    disp('An error occured during writing file treeview_taxa.js')
  end
  
  web('/treeview/treeview_taxa.html','-browser')
  
  cd(WD)                    % goto original path
