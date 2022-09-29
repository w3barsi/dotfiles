require('code_runner').setup({
	-- put here the commands by filetype
	filetype = {
		java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
		python = "python3 -u",
		typescript = "deno run",
		rust = "cd $dir && rustc $fileName && clear && $dir/$fileNameWithoutExt",
		c = "cd $dir && gcc.exe $fileName -o output/$fileNameWithoutExt && clear && $dir/output/$fileNameWithoutExt.exe"
	},
})

vim.keymap.set('n', '<F11>', ':RunFile float<CR>', { noremap = true, silent = false })
