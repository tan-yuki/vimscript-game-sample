syntax match PlayerBlock '#'
silent! hi PlayerBlock ctermfg=darkblue ctermbg=darkblue guifg=darkblue guibg=darkblue

let s:window = {"w": 20, "h": 20}
let s:cursor = {"x": 0, "y":0, "w": 2, "h": 2}

function! s:cursor.draw() dict
  let l:winWidth  = s:window.w
  let l:winHeight = s:window.h

  let l:x = self.x
  let l:y = self.y
  let l:w = self.w
  let l:h = self.h

  let lines = repeat([repeat(' ', l:winWidth)], l:winHeight)
  for i in range(l:h)
    let lines[l.y + i] = repeat(' ', l:x).repeat('#', l:w * 2)
  endfor
  call setline(1, lines)
  redraw
endfunction

function! s:cursor.nextStep() dict
  if self.x < s:window.w
    let self.x += 1
  else
    let self.x = 0
    let self.y += 1
  endif
endfunction

function! s:main()
  while 1
    call s:cursor.draw()
    call s:cursor.nextStep();
    sleep 500ms
  endwhile
endfunction

command! GameStart :call s:main()
