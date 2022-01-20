require('helpers/augroup')
require('helpers/is_buffer_modified')
require('helpers/save_buffer')

function _G.autosave()
  if is_buffer_modified() then
    save_buffer()
  end
end

augroup('autosave', {'CursorHold * silent! call v:lua.autosave()'})
