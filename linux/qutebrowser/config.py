c.colors.completion.category.bg = '#193549'
c.colors.completion.category.border.bottom = '#073642'
c.colors.completion.category.border.top = '#073642'
c.colors.completion.even.bg = '#214561'
c.colors.completion.item.selected.bg = '#0050a4'
c.colors.completion.item.selected.fg = 'white'
c.colors.completion.odd.bg = '#193549'
c.colors.completion.scrollbar.bg = '#193549'
c.colors.downloads.bar.bg = '#193549'
c.colors.hints.bg = '#193549'
c.colors.hints.fg = 'white'
c.colors.hints.match.fg = '#555555'
c.colors.keyhint.bg = 'rgba(25,53,73, 80%)'
c.colors.messages.error.bg = '#ff0900'
c.colors.messages.error.border = '#bb0000'
c.colors.messages.info.bg = '#193549'
c.colors.messages.info.border = '#073642'
c.colors.messages.warning.border = '#ff9d00'
c.colors.prompts.bg = '#193549'
c.colors.statusbar.insert.bg = 'darkgreen'
c.colors.statusbar.insert.fg = 'white'
c.colors.statusbar.normal.bg = '#193549'
c.colors.tabs.bar.bg = '#193549'
c.colors.tabs.even.bg = '#193549'
c.colors.tabs.indicator.start = '#0000aa'
c.colors.tabs.odd.bg = '#193549'
c.colors.tabs.selected.even.bg = '#214561'
c.colors.tabs.selected.even.fg = 'white'
c.colors.tabs.selected.odd.bg = '#214561'
c.colors.tabs.selected.odd.fg = 'white'
c.editor.command = ['neovim', '{file}']
c.fonts.completion.category = 'bold 12pt default_family'
c.fonts.completion.entry = '12pt default_family'
c.fonts.debug_console = '12pt default_family'
c.fonts.default_family = ['DejaVu Sans Mono']
c.fonts.default_size = '12pt'
c.fonts.downloads = 'default_size default_family'
c.fonts.hints = 'bold 10pt default_family'
c.fonts.web.family.fixed = 'DejaVu Sans Mono'
c.fonts.web.family.sans_serif = 'DejaVu Serif'
c.fonts.web.family.serif = 'DejaVu Serif'
c.fonts.web.family.standard = 'DejaVu Sans'
c.fonts.web.size.default = 16
c.fonts.web.size.minimum = 14
c.fonts.web.size.minimum_logical = 6
c.hints.chars = 'asdfghjklerui'
c.qt.highdpi = True
c.tabs.background = True
c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}',
      'aur': 'https://aur.archlinux.org/packages/?O=0&K={}',
      'g': 'https://www.google.com/search?q={}',
      'p': 'https://pinboard.in/search/u:couchllama?query={}',
      'r': 'http://www.reddit.com/r/{}',
      'wa': 'https://wiki.archlinux.org/index.php?title=Special%3ASearch&search={}&go=Go' }

config.bind('e', 'scroll-page 0 -1')
config.bind('sp', 'set-cmd-text -s :spawn --userscript pinboard qute-add')
config.bind('st', 'set-cmd-text -s :spawn --userscript taskadd project:www')
config.load_autoconfig()
