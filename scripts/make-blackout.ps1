# Regenerates themes/red-devils-blackout-color-theme.json from the main theme.
# Run from anywhere:  powershell -File scripts/make-blackout.ps1
# Blackout = same code colours as Red Devils, with a near-black interface.

$dir  = Join-Path $PSScriptRoot '..\themes'
$text = [IO.File]::ReadAllText((Join-Path $dir 'red-devils-color-theme.json'))

# Darken the greys to near-black (exact 6-digit values)
$swap = [ordered]@{
  '"#141414"' = '"#000000"'
  '"#1A1A1A"' = '"#0A0A0A"'
  '"#1E1E1E"' = '"#0E0E0E"'
  '"#181818"' = '"#080808"'
  '"#202020"' = '"#121212"'
  '"#222222"' = '"#141414"'
  '"#242424"' = '"#161616"'
  '"#2A2A2A"' = '"#1C1C1C"'
  '"#2E2E2E"' = '"#1F1F1F"'
}
foreach ($k in $swap.Keys) { $text = $text.Replace($k, $swap[$k]) }

# Red used sparingly: dark red status bar and tints, neutral selections
$set = [ordered]@{
  'name'                                   = 'Red Devils Blackout'
  'statusBar.background'                   = '#3A0A06'
  'statusBar.foreground'                   = '#E8E8E8'
  'statusBar.border'                       = '#3A0A06'
  'statusBar.noFolderBackground'           = '#2A0704'
  'statusBarItem.hoverBackground'          = '#FFFFFF1A'
  'tab.activeBorderTop'                    = '#DA291C'
  'tab.unfocusedActiveBorderTop'           = '#DA291C60'
  'activityBar.activeBorder'               = '#DA291C'
  'activityBar.activeBackground'           = '#1F0D0C'
  'tab.activeBackground'                   = '#1F0D0C'
  'panelTitle.activeBorder'                = '#DA291C'
  'selection.background'                   = '#FFFFFF33'
  'editor.selectionBackground'             = '#FFFFFF26'
  'editor.inactiveSelectionBackground'     = '#FFFFFF14'
  'list.activeSelectionBackground'         = '#FFFFFF1A'
  'list.focusOutline'                      = '#FFFFFF33'
  'editorSuggestWidget.selectedBackground' = '#FFFFFF1A'
  'quickInputList.focusBackground'         = '#FFFFFF1A'
  'menu.selectionBackground'               = '#FFFFFF1A'
  'scrollbarSlider.activeBackground'       = '#FFFFFF40'
  'minimap.selectionHighlight'             = '#FFFFFF40'
}
foreach ($k in $set.Keys) {
  $pattern = '("' + [regex]::Escape($k) + '":\s*)"[^"]*"'
  if ($text -notmatch $pattern) { throw "Key not found: $k" }
  $text = ([regex]$pattern).Replace($text, ('$1"' + $set[$k] + '"'), 1)
}

$out = Join-Path $dir 'red-devils-blackout-color-theme.json'
[IO.File]::WriteAllText($out, $text, (New-Object Text.UTF8Encoding $false))
$null = $text | ConvertFrom-Json
"Wrote $out"
