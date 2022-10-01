local nnoremap = require("barsi.keymaps").nnoremap
local silent = require("barsi.keymaps").silent

-- Not Implemented Yet
-- Not Implemented Yet
-- Not Implemented Yet
-- Not Implemented Yet
-- Not Implemented Yet
-- Not Implemented Yet
-- Not Implemented Yet
-- Not Implemented Yet
-- Not Implemented Yet
-- Not Implemented Yet

nnoremap(",a", ":lua require('harpoon.mark').add_file()<CR>", { silent = true })
nnoremap(",p", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { silent = true })
nnoremap(",q", ":lua require('harpoon.ui').nav_file(1)<CR>", { silent = true })
nnoremap(",w", ":lua require('harpoon.ui').nav_file(2)<CR>", { silent = true })
nnoremap(",e", ":lua require('harpoon.ui').nav_file(3)<CR>", { silent = true })
nnoremap(",r", ":lua require('harpoon.ui').nav_file(4)<CR>", { silent = true })
