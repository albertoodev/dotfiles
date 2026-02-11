unmap <Space>


set clipboard=unnamed

exmap focusLeft obcommand editor:focus-left
exmap focusRight obcommand editor:focus-right
exmap focusTop obcommand editor:focus-top
exmap focusBottom obcommand editor:focus-bottom

nmap <Space>wh :focusLeft<CR>
nmap <Space>wl :focusRight<CR>
nmap <Space>wk :focusTop<CR>
nmap <Space>wj :focusBottom<CR>

exmap nextTab obcommand workspace:next-tab
exmap prevTab obcommand workspace:previous-tab
nmap gt :nextTab<CR>
nmap gT :prevTab<CR>
exmap toggleSidebar obcommand app:toggle-left-sidebar

nmap <Space>e :toggleSidebar<CR>


exmap splitVertical obcommand workspace:split-vertical

exmap splitHorizontal obcommand workspace:split-horizontal


nmap <Space>h :splitVertical<CR>

nmap <Space>v :splitHorizontal<CR>


exmap closeTab obcommand workspace:close

nmap <Space>bd :closeTab<CR>


exmap quickOpen obcommand switcher:open

nmap <Space><Space> :quickOpen<CR>


exmap searchGlobal obcommand global-search:open

nmap <Space>sg :searchGlobal<CR>


exmap followLink obcommand editor:follow-link

nmap <Space>gd :followLink<CR>


exmap renameFile obcommand workspace:edit-file-title

nmap <Space>cr :renameFile<CR>


exmap commandPalette obcommand command-palette:open

nmap <Space>ca :commandPalette<CR>


nmap j gj

nmap k gk


nmap H ^

nmap L $
