function ColorMyPencils(color)
	-- Set default color to rose-pine
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)
end

ColorMyPencils()
