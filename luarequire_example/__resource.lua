resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'LUARequire Example'

server_scripts {
  '@luarequire/shared.lua',
  'example.lua',
}

client_scripts {
  '@luarequire/shared.lua',
  'example.lua',
}