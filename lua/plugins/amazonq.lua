return {
	url ='ssh://git.amazon.com/pkg/AmazonQNVim',
    name = 'amazonq',
	dependencies = {
		-- Completion
		'hrsh7th/nvim-cmp',
		-- Snippets
		'hrsh7th/cmp-vsnip',
		'hrsh7th/vim-vsnip',
		'hrsh7th/vim-vsnip-integ',
	},
	opts = {
		ssoStartUrl = "https://amzn.awsapps.com/start",
		root_dir = vim.fs.root(0, '.git'),
		inline_suggest = true,
	},
}

