-- statusline.lua
-- Definisci un namespace globale per le funzioni della statusline
_G.statusline = {}

-- Definizione dei colori (tema Nord semplificato)
-- Nota: StatusLineGit usa lo stesso colore di StatusLineMode
-- La posizione (row:col) ora ha lo stesso sfondo del file
vim.cmd([[
  hi StatusLineMode guifg=#D8DEE9 guibg=#5E81AC 
  hi StatusLineGit guifg=#D8DEE9  guibg=#5E81AC 
  hi StatusLinePosition guifg=#D8DEE9  guibg=#3B4252
  hi StatusLineFile guifg=#D8DEE9 guibg=#3B4252
]])
-- Cache globale per il branch Git
_G.statusline.git_cache = { branch = "", last_checked = 0 }

_G.statusline.git_status = function()
  local now = vim.loop.now()
  -- Aggiorna la cache solo se sono passati più di 5 secondi
  if now - _G.statusline.git_cache.last_checked < 5000 then
    return _G.statusline.git_cache
  end

  local result = { branch = "" }
  local handle = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null")
  if not handle then
    return result
  end

  local branch = handle:read("*a") or ""
  handle:close()
  branch = branch:gsub("%s+", "")

  if branch == "" then
    return result
  end

  local text_len = #branch
  if text_len > 10 then
    branch = branch:sub(1, 10)
    text_len = 10
  end

  local total_width = 10
  local left_padding = math.floor((total_width - text_len) / 2)
  local right_padding = total_width - text_len - left_padding

  result.branch = string.format("%s%s%s",
                     string.rep(" ", left_padding),
                     branch,
                     string.rep(" ", right_padding))

  -- Aggiorna la cache
  _G.statusline.git_cache = { branch = result.branch, last_checked = now }
  return result
end
-- Funzione per ottenere la modalità corrente con formattazione
_G.statusline.mode = function()
  local mode_map = {
    n = "NORMAL",
    i = "INSERT",
    v = "VISUAL",
    V = "V-LINE",
    [""] = "V-BLOCK",
    c = "COMMAND",
    r = "REPLACE",
    R = "REPLACE",
    t = "TERMINAL",
    s = "SELECT",
    S = "S-LINE",
    [""] = "S-BLOCK",
  }
  local mode_code = vim.api.nvim_get_mode().mode
  local mode_text = mode_map[mode_code] or mode_code:upper()
  
  -- Ottieni la lunghezza del testo
  local text_len = #mode_text
  
  -- Calcola il padding necessario per centrare (assumendo larghezza totale di 10)
  local total_width = 10
  local left_padding = math.floor((total_width - text_len) / 2)
  local right_padding = total_width - text_len - left_padding
  
  -- Crea la stringa con padding centrato
  return string.format("%s%s%s", 
                      string.rep(" ", left_padding), 
                      mode_text, 
                      string.rep(" ", right_padding))
end

-- Funzione per ottenere il numero di riga e colonna corrente con larghezza fissa
_G.statusline.position = function()
  local current_line = vim.fn.line(".")
  local current_col = vim.fn.col(".")
  
  -- Formato numero:numero
  local position_text = string.format("%d:%d", current_line, current_col)
  
  -- Ottieni la lunghezza del testo
  local text_len = #position_text
  
  -- Assicuriamo che ci sia spazio sufficiente anche per numeri grandi
  local total_width = 10
  
  -- Calcola il padding necessario per centrare
  local left_padding = math.floor((total_width - text_len) / 2)
  local right_padding = total_width - text_len - left_padding
  
  -- Crea la stringa con padding centrato
  return string.format("%s%s%s", 
                      string.rep(" ", left_padding), 
                      position_text, 
                      string.rep(" ", right_padding))
end

-- Calcola lo spazio disponibile per il filename + path
_G.statusline.calculate_filename_space = function()
  local win_width = vim.api.nvim_win_get_width(0)
  -- Spazi fissi assegnati agli altri elementi
  local mode_width = 10  -- Modalità (fixed width)
  local position_width = 10  -- Posizione (fixed width)
  local git_width = 0
  local git_info = _G.statusline.git_status()
  if git_info.branch ~= "" then
    git_width = 10  
  end
  -- Calcola lo spazio disponibile
  local available_space = win_width - mode_width - position_width - git_width  - 8
  
  return available_space
end

-- Funzione per formattare il path del file con ellissi
_G.statusline.format_filename = function()
  -- Ottieni il percorso relativo e il nome file
  local filepath = vim.fn.expand("%:.")
  
  -- Se non c'è un file aperto
  if filepath == "" then
    return "[No Name]"
  end
  
  local available_space = _G.statusline.calculate_filename_space()
  
  -- Se c'è spazio sufficiente per mostrare il percorso completo
  if #filepath <= available_space then
    return filepath
  end
  
  -- Altrimenti tronca l'inizio del percorso
  return "..." .. string.sub(filepath, -(available_space))
end

-- Funzione direttamente chiamabile per l'aggiornamento della statusline
function _G.get_statusline()
  local git = _G.statusline.git_status()
  
  local parts = {}
  
  -- Modalità a sinistra
  table.insert(parts, "%#StatusLineMode#" .. _G.statusline.mode())
  
  -- Aggiungiamo il nome file con path troncato dinamicamente
  table.insert(parts, "%#StatusLineFile#" .. _G.statusline.format_filename() .. " %m%r%h%w")
  
  -- Allineamento a destra diretto
  table.insert(parts, "%#StatusLineFile#%=")
  
  -- Posizione (solo riga:colonna)
  table.insert(parts, "%#StatusLinePosition#" .. _G.statusline.position())
  
  -- Git info (solo branch) all'estrema destra
  if git.branch ~= "" then
    -- Usiamo StatusLineGit che ha lo stesso colore di StatusLineMode
    table.insert(parts, "%#StatusLineGit#" .. git.branch)
  end
  
  return table.concat(parts, "")
end

-- Ritorna il modulo statusline per consentirne l'uso altrove
return _G.statusline
