local modules = {
    "options",
    "packerFile",
    "mappings",
}

for i = 1, #modules, 1 do
    pcall(require, modules[i])
end
