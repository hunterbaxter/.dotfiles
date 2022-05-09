local json = {}

function json.setup(config, on_attach)
	config.on_attach = function(client, bufnr)
		client.client_capabilities.document_formatting = false
		on_attach(client, bufnr)
	end

	return config
end

return json
