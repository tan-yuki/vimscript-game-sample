syntax match PlayerBlock '#'
silent! hi PlayerBlock ctermfg=darkblue ctermbg=darkblue guifg=darkblue guibg=darkblue

let s:window = {"w": 20, "h": 20}
let s:cursor = {"x": 0, "y":0, "w": 2, "h": 2}

function! s:cursor.draw() dict
  let s:x = self.x
  let s:y = self.y
  let s:width  = self.w
  let s:height = self.h

  let lines = repeat([repeat(' ', 10)], 10)
  let lines[s:y]     = repeat(' ', s:x).repeat('#', s:width * 2)
  let lines[s:y + 1] = repeat(' ', s:x).repeat('#', s:height * 2)
  call setline(1, lines)
  redraw
endfunction

function! s:cursor.nextStep() dict
  let s:x = self.x
  let s:y = self.y
  let s:windowWidth  = s:window.w
  let s:windowHeight = s:window.h

  if s:x < s:windowWidth
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
