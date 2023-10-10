" Support inline ACI commands
syn region sedACI2	matchgroup=sedFunction start="\s*\zs[aci]" matchgroup=NONE end=".*$" contains=sedLineCont,sedTab
hi def link sedACI2 sedACI
