# line styles
set linetype 1 lw 2 lc rgb '#268bd2' # blue
set linetype 2 lw 2 lc rgb '#d30102' # red
set linetype 3 lw 2 lc rgb '#859900' # green
set linetype 4 lw 2 lc rgb '#b58900' # yellow
set linetype 5 lw 2 lc rgb '#2aa198' # cyan
set linetype 6 lw 2 lc rgb '#d33682' # magenta
set linetype 7 lw 2 lc rgb '#cb4b16' # brred
set linetype 8 lw 2 lc rgb '#586e75' # brgreen

# set linetype 1 lc rgb '#002b36' # brblack
# set linetype 1 lc rgb '#073642' # black
# set linetype 1 lc rgb '#657b83' # bryellow
# set linetype 1 lc rgb '#839496' # brblue
# set linetype 1 lc rgb '#93a1a1' # brcyan
# set linetype 1 lc rgb '#eee8d5' # white
# set linetype 1 lc rgb '#fdf6e3' # brwhite
# set linetype 1 lc rgb '#6c71c4' # brmagenta

# palette
set palette defined ( 0 '#6c71c4',\
                      1 '#268bd2',\
                      2 '#2aa198',\
                      3 '#859900',\
                      4 '#d33682',\
                      5 '#d30102',\
                      6 '#cb4b16',\
                      7 '#b58900')

set object 1 rectangle from screen 0,0 to screen 1,1 fillcolor rgb"#073642" behind

set border lw 3 lc rgb "#839496"
set xtics textcolor rgb "#839496"
set ytics textcolor rgb "#839496"
set xlabel "X" textcolor rgb "#839496"
set ylabel "Y" textcolor rgb "#839496"
set key textcolor rgb "#839496"

set term qt font "Ubuntu Mono, 11"
