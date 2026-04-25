#!/usr/bin/env bats
#
# unicornsay.bats
# Exact-output tests for all combinations of --above / --art / --side.
# All tests run at COLUMNS=80 LINES=24 for deterministic layout.

export COLUMNS=80
export LINES=24

lorem_small='Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
lorem_medium='Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
lorem_large='Lorem ipsum odor amet, consectetuer adipiscing elit. Feugiat eleifend scelerisque porta ex dui. Nullam lacus accumsan neque himenaeos habitant pellentesque blandit aenean. Tempus tempus nam nullam varius vel hendrerit. Feugiat fusce vulputate libero nascetur lacinia consectetur. Etiam diam etiam; class eleifend placerat feugiat. Ornare ridiculus nullam habitasse ridiculus curabitur euismod aliquam. Habitant turpis dui etiam sapien aliquam proin. Turpis dictumst urna aenean pulvinar sagittis tincidunt. Amet ligula suspendisse est mus efficitur. Convallis fringilla et sodales lorem dignissim libero. Aenean lobortis rhoncus consequat, pellentesque faucibus malesuada vitae. Risus potenti gravida risus ad fermentum et conubia lobortis. Ullamcorper ligula sollicitudin viverra urna, phasellus mi facilisis. Conubia sem est egestas rutrum facilisi ac. Maximus venenatis maximus porttitor lobortis pharetra.'

@test "0) small" {
  run ./unicornsay "$lorem_small"
  [ "$status" -eq 0 ]
  expected=$(cat <<'SNAP'
                ,.. /    
              ,'   ';    
   ,,.__    _,' /';  .   
  :','  ~~~~    '. '`    ┌──────────────────────────────────────────────────┐
  :' (   )         )::,  │                                                  │
  '. '. .=----=..-~  .;' │   Lorem ipsum dolor sit amet, consectetur        │
   '  ;'  ::   ':.  '    │   adipiscing elit, sed do eiusmod tempor         │
     (:   ':    ;)       │   incididunt ut labore et dolore magna aliqua.   │
      \   '"  ./         │                                                  │
       '"      '"        └──────────────────────────────────────────────────┘
SNAP
  )
  [ "$output" = "$expected" ]
}

@test "0) large" {
  run ./unicornsay "$lorem_large"
  [ "$status" -eq 0 ]
  expected=$(cat <<'SNAP'
                         ┌────────────────────────────────────────────────────┐
                         │                                                    │
                         │   Lorem ipsum odor amet, consectetuer adipiscing   │
                         │   elit. Feugiat eleifend scelerisque porta ex      │
                         │   dui. Nullam lacus accumsan neque himenaeos       │
                         │   habitant pellentesque blandit aenean. Tempus     │
                         │   tempus nam nullam varius vel hendrerit.          │
                         │   Feugiat fusce vulputate libero nascetur          │
                         │   lacinia consectetur. Etiam diam etiam; class     │
                         │   eleifend placerat feugiat. Ornare ridiculus      │
                         │   nullam habitasse ridiculus curabitur euismod     │
                         │   aliquam. Habitant turpis dui etiam sapien        │
                         │   aliquam proin. Turpis dictumst urna aenean       │
                         │   pulvinar sagittis tincidunt. Amet ligula         │
                         │   suspendisse est mus efficitur. Convallis         │
                ,.. /    │   fringilla et sodales lorem dignissim libero.     │
              ,'   ';    │   Aenean lobortis rhoncus consequat,               │
   ,,.__    _,' /';  .   │   pellentesque faucibus malesuada vitae. Risus     │
  :','  ~~~~    '. '`    │   potenti gravida risus ad fermentum et conubia    │
  :' (   )         )::,  │   lobortis. Ullamcorper ligula sollicitudin        │
  '. '. .=----=..-~  .;' │   viverra urna, phasellus mi facilisis. Conubia    │
   '  ;'  ::   ':.  '    │   sem est egestas rutrum facilisi ac. Maximus      │
     (:   ':    ;)       │   venenatis maximus porttitor lobortis pharetra.   │
      \   '"  ./         │                                                    │
       '"      '"        └────────────────────────────────────────────────────┘
SNAP
  )
  [ "$output" = "$expected" ]
}

@test "1) no-above, no-art, no-side" {
  run ./unicornsay "$lorem_medium"
  [ "$status" -eq 0 ]
  expected=$(cat <<'SNAP'
                         ┌────────────────────────────────────────────────────┐
                         │                                                    │
                         │   Lorem ipsum dolor sit amet, consectetur          │
                         │   adipiscing elit, sed do eiusmod tempor           │
                         │   incididunt ut labore et dolore magna aliqua.     │
                ,.. /    │   Ut enim ad minim veniam, quis nostrud            │
              ,'   ';    │   exercitation ullamco laboris nisi ut aliquip     │
   ,,.__    _,' /';  .   │   ex ea commodo consequat. Duis aute irure dolor   │
  :','  ~~~~    '. '`    │   in reprehenderit in voluptate velit esse         │
  :' (   )         )::,  │   cillum dolore eu fugiat nulla pariatur.          │
  '. '. .=----=..-~  .;' │   Excepteur sint occaecat cupidatat non            │
   '  ;'  ::   ':.  '    │   proident, sunt in culpa qui officia deserunt     │
     (:   ':    ;)       │   mollit anim id est laborum.                      │
      \   '"  ./         │                                                    │
       '"      '"        └────────────────────────────────────────────────────┘
SNAP
  )
  [ "$output" = "$expected" ]
}

@test "2) no-above, no-art, side=left" {
  run ./unicornsay --side=left "$lorem_medium"
  [ "$status" -eq 0 ]
  expected=$(cat <<'SNAP'
                         ┌────────────────────────────────────────────────────┐
                         │                                                    │
                         │   Lorem ipsum dolor sit amet, consectetur          │
                         │   adipiscing elit, sed do eiusmod tempor           │
                         │   incididunt ut labore et dolore magna aliqua.     │
                ,.. /    │   Ut enim ad minim veniam, quis nostrud            │
              ,'   ';    │   exercitation ullamco laboris nisi ut aliquip     │
   ,,.__    _,' /';  .   │   ex ea commodo consequat. Duis aute irure dolor   │
  :','  ~~~~    '. '`    │   in reprehenderit in voluptate velit esse         │
  :' (   )         )::,  │   cillum dolore eu fugiat nulla pariatur.          │
  '. '. .=----=..-~  .;' │   Excepteur sint occaecat cupidatat non            │
   '  ;'  ::   ':.  '    │   proident, sunt in culpa qui officia deserunt     │
     (:   ':    ;)       │   mollit anim id est laborum.                      │
      \   '"  ./         │                                                    │
       '"      '"        └────────────────────────────────────────────────────┘
SNAP
  )
  [ "$output" = "$expected" ]
}

@test "3) no-above, no-art, side=right" {
  run ./unicornsay --side=right "$lorem_medium"
  [ "$status" -eq 0 ]
  expected=$(cat <<'SNAP'
┌────────────────────────────────────────────────────┐
│                                                    │
│   Lorem ipsum dolor sit amet, consectetur          │
│   adipiscing elit, sed do eiusmod tempor           │
│   incididunt ut labore et dolore magna aliqua.     │
│   Ut enim ad minim veniam, quis nostrud            │   \ ..,                 
│   exercitation ullamco laboris nisi ut aliquip     │   ;'   ',               
│   ex ea commodo consequat. Duis aute irure dolor   │   .  ;'\ ',_    __.,,   
│   in reprehenderit in voluptate velit esse         │   `' .'     ~~~~  ',':  
│   cillum dolore eu fugiat nulla pariatur.          │   ,::(         (   ) ': 
│   Excepteur sint occaecat cupidatat non            │  ';.  ~-..=----=. .' .' 
│   proident, sunt in culpa qui officia deserunt     │     '  .:'   ::  ';  '  
│   mollit anim id est laborum.                      │        (;    :'   :)    
│                                                    │          \.  "'   /     
└────────────────────────────────────────────────────┘         "'      "'      
SNAP
  )
  [ "$output" = "$expected" ]
}

@test "4) no-above, art=big, no-side" {
  run ./unicornsay --art=big "$lorem_medium"
  [ "$status" -eq 0 ]
  expected=$(cat <<'SNAP'
                         ┌────────────────────────────────────────────────────┐
                         │                                                    │
                         │   Lorem ipsum dolor sit amet, consectetur          │
                         │   adipiscing elit, sed do eiusmod tempor           │
                         │   incididunt ut labore et dolore magna aliqua.     │
                ,.. /    │   Ut enim ad minim veniam, quis nostrud            │
              ,'   ';    │   exercitation ullamco laboris nisi ut aliquip     │
   ,,.__    _,' /';  .   │   ex ea commodo consequat. Duis aute irure dolor   │
  :','  ~~~~    '. '`    │   in reprehenderit in voluptate velit esse         │
  :' (   )         )::,  │   cillum dolore eu fugiat nulla pariatur.          │
  '. '. .=----=..-~  .;' │   Excepteur sint occaecat cupidatat non            │
   '  ;'  ::   ':.  '    │   proident, sunt in culpa qui officia deserunt     │
     (:   ':    ;)       │   mollit anim id est laborum.                      │
      \   '"  ./         │                                                    │
       '"      '"        └────────────────────────────────────────────────────┘
SNAP
  )
  [ "$output" = "$expected" ]
}

@test "5) no-above, art=big, side=left" {
  run ./unicornsay --art=big --side=left "$lorem_medium"
  [ "$status" -eq 0 ]
  expected=$(cat <<'SNAP'
                         ┌────────────────────────────────────────────────────┐
                         │                                                    │
                         │   Lorem ipsum dolor sit amet, consectetur          │
                         │   adipiscing elit, sed do eiusmod tempor           │
                         │   incididunt ut labore et dolore magna aliqua.     │
                ,.. /    │   Ut enim ad minim veniam, quis nostrud            │
              ,'   ';    │   exercitation ullamco laboris nisi ut aliquip     │
   ,,.__    _,' /';  .   │   ex ea commodo consequat. Duis aute irure dolor   │
  :','  ~~~~    '. '`    │   in reprehenderit in voluptate velit esse         │
  :' (   )         )::,  │   cillum dolore eu fugiat nulla pariatur.          │
  '. '. .=----=..-~  .;' │   Excepteur sint occaecat cupidatat non            │
   '  ;'  ::   ':.  '    │   proident, sunt in culpa qui officia deserunt     │
     (:   ':    ;)       │   mollit anim id est laborum.                      │
      \   '"  ./         │                                                    │
       '"      '"        └────────────────────────────────────────────────────┘
SNAP
  )
  [ "$output" = "$expected" ]
}

@test "6) no-above, art=big, side=right" {
  run ./unicornsay --art=big --side=right "$lorem_medium"
  [ "$status" -eq 0 ]
  expected=$(cat <<'SNAP'
┌────────────────────────────────────────────────────┐
│                                                    │
│   Lorem ipsum dolor sit amet, consectetur          │
│   adipiscing elit, sed do eiusmod tempor           │
│   incididunt ut labore et dolore magna aliqua.     │
│   Ut enim ad minim veniam, quis nostrud            │   \ ..,                 
│   exercitation ullamco laboris nisi ut aliquip     │   ;'   ',               
│   ex ea commodo consequat. Duis aute irure dolor   │   .  ;'\ ',_    __.,,   
│   in reprehenderit in voluptate velit esse         │   `' .'     ~~~~  ',':  
│   cillum dolore eu fugiat nulla pariatur.          │   ,::(         (   ) ': 
│   Excepteur sint occaecat cupidatat non            │  ';.  ~-..=----=. .' .' 
│   proident, sunt in culpa qui officia deserunt     │     '  .:'   ::  ';  '  
│   mollit anim id est laborum.                      │        (;    :'   :)    
│                                                    │          \.  "'   /     
└────────────────────────────────────────────────────┘         "'      "'      
SNAP
  )
  [ "$output" = "$expected" ]
}

@test "7) no-above, art=small, no-side" {
  run ./unicornsay --art=small "$lorem_medium"
  [ "$status" -eq 0 ]
  expected=$(cat <<'SNAP'
                 ┌────────────────────────────────────────────────────────────┐
                 │                                                            │
                 │   Lorem ipsum dolor sit amet, consectetur adipiscing       │
                 │   elit, sed do eiusmod tempor incididunt ut labore et      │
                 │   dolore magna aliqua. Ut enim ad minim veniam, quis       │
                 │   nostrud exercitation ullamco laboris nisi ut aliquip     │
                 │   ex ea commodo consequat. Duis aute irure dolor in        │
             /   │   reprehenderit in voluptate velit esse cillum dolore eu   │
          ,,/_   │   fugiat nulla pariatur. Excepteur sint occaecat           │
    _     ~/=-"  │   cupidatat non proident, sunt in culpa qui officia        │
   ~ )___~//     │   deserunt mollit anim id est laborum.                     │
   _//---\|_     │                                                            │
  /        /     └────────────────────────────────────────────────────────────┘
SNAP
  )
  [ "$output" = "$expected" ]
}

@test "8) no-above, art=small, side=left" {
  run ./unicornsay --art=small --side=left "$lorem_medium"
  [ "$status" -eq 0 ]
  expected=$(cat <<'SNAP'
                 ┌────────────────────────────────────────────────────────────┐
                 │                                                            │
                 │   Lorem ipsum dolor sit amet, consectetur adipiscing       │
                 │   elit, sed do eiusmod tempor incididunt ut labore et      │
                 │   dolore magna aliqua. Ut enim ad minim veniam, quis       │
                 │   nostrud exercitation ullamco laboris nisi ut aliquip     │
                 │   ex ea commodo consequat. Duis aute irure dolor in        │
             /   │   reprehenderit in voluptate velit esse cillum dolore eu   │
          ,,/_   │   fugiat nulla pariatur. Excepteur sint occaecat           │
    _     ~/=-"  │   cupidatat non proident, sunt in culpa qui officia        │
   ~ )___~//     │   deserunt mollit anim id est laborum.                     │
   _//---\|_     │                                                            │
  /        /     └────────────────────────────────────────────────────────────┘
SNAP
  )
  [ "$output" = "$expected" ]
}

@test "9) no-above, art=small, side=right" {
  run ./unicornsay --art=small --side=right "$lorem_medium"
  [ "$status" -eq 0 ]
  expected=$(cat <<'SNAP'
┌────────────────────────────────────────────────────────────┐
│                                                            │
│   Lorem ipsum dolor sit amet, consectetur adipiscing       │
│   elit, sed do eiusmod tempor incididunt ut labore et      │
│   dolore magna aliqua. Ut enim ad minim veniam, quis       │
│   nostrud exercitation ullamco laboris nisi ut aliquip     │
│   ex ea commodo consequat. Duis aute irure dolor in        │
│   reprehenderit in voluptate velit esse cillum dolore eu   │   \             
│   fugiat nulla pariatur. Excepteur sint occaecat           │   _\,,          
│   cupidatat non proident, sunt in culpa qui officia        │  "-=\~     _    
│   deserunt mollit anim id est laborum.                     │     \\~___( ~   
│                                                            │      _|/---\\_  
└────────────────────────────────────────────────────────────┘      \        \ 
SNAP
  )
  [ "$output" = "$expected" ]
}

@test "10) above, no-art, no-side" {
  run ./unicornsay --above "$lorem_medium"
  [ "$status" -eq 0 ]
  expected=$(cat <<'SNAP'
┌─────────────────────────────────────────────────────────────────────────────┐
│                                                                             │
│   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod   │
│   tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim      │
│   veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea   │
│   commodo consequat. Duis aute irure dolor in reprehenderit in voluptate    │
│   velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint         │
│   occaecat cupidatat non proident, sunt in culpa qui officia deserunt       │
│   mollit anim id est laborum.                                               │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
                ,.. /    
              ,'   ';    
   ,,.__    _,' /';  .   
  :','  ~~~~    '. '`    
  :' (   )         )::,  
  '. '. .=----=..-~  .;' 
   '  ;'  ::   ':.  '    
     (:   ':    ;)       
      \   '"  ./         
       '"      '"        
SNAP
  )
  [ "$output" = "$expected" ]
}

@test "11) above, no-art, side=left" {
  run ./unicornsay --above --side=left "$lorem_medium"
  [ "$status" -eq 0 ]
  expected=$(cat <<'SNAP'
┌─────────────────────────────────────────────────────────────────────────────┐
│                                                                             │
│   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod   │
│   tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim      │
│   veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea   │
│   commodo consequat. Duis aute irure dolor in reprehenderit in voluptate    │
│   velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint         │
│   occaecat cupidatat non proident, sunt in culpa qui officia deserunt       │
│   mollit anim id est laborum.                                               │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
                ,.. /    
              ,'   ';    
   ,,.__    _,' /';  .   
  :','  ~~~~    '. '`    
  :' (   )         )::,  
  '. '. .=----=..-~  .;' 
   '  ;'  ::   ':.  '    
     (:   ':    ;)       
      \   '"  ./         
       '"      '"        
SNAP
  )
  [ "$output" = "$expected" ]
}

@test "12) above, no-art, side=right" {
  run ./unicornsay --above --side=right "$lorem_medium"
  [ "$status" -eq 0 ]
  expected=$(cat <<'SNAP'
┌─────────────────────────────────────────────────────────────────────────────┐
│                                                                             │
│   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod   │
│   tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim      │
│   veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea   │
│   commodo consequat. Duis aute irure dolor in reprehenderit in voluptate    │
│   velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint         │
│   occaecat cupidatat non proident, sunt in culpa qui officia deserunt       │
│   mollit anim id est laborum.                                               │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
                                                          \ ..,                 
                                                          ;'   ',               
                                                          .  ;'\ ',_    __.,,   
                                                          `' .'     ~~~~  ',':  
                                                          ,::(         (   ) ': 
                                                         ';.  ~-..=----=. .' .' 
                                                            '  .:'   ::  ';  '  
                                                               (;    :'   :)    
                                                                 \.  "'   /     
                                                                "'      "'      
SNAP
  )
  [ "$output" = "$expected" ]
}

@test "13) above, art=big, no-side" {
  run ./unicornsay --above --art=big "$lorem_medium"
  [ "$status" -eq 0 ]
  expected=$(cat <<'SNAP'
┌─────────────────────────────────────────────────────────────────────────────┐
│                                                                             │
│   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod   │
│   tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim      │
│   veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea   │
│   commodo consequat. Duis aute irure dolor in reprehenderit in voluptate    │
│   velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint         │
│   occaecat cupidatat non proident, sunt in culpa qui officia deserunt       │
│   mollit anim id est laborum.                                               │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
                ,.. /    
              ,'   ';    
   ,,.__    _,' /';  .   
  :','  ~~~~    '. '`    
  :' (   )         )::,  
  '. '. .=----=..-~  .;' 
   '  ;'  ::   ':.  '    
     (:   ':    ;)       
      \   '"  ./         
       '"      '"        
SNAP
  )
  [ "$output" = "$expected" ]
}

@test "14) above, art=big, side=left" {
  run ./unicornsay --above --art=big --side=left "$lorem_medium"
  [ "$status" -eq 0 ]
  expected=$(cat <<'SNAP'
┌─────────────────────────────────────────────────────────────────────────────┐
│                                                                             │
│   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod   │
│   tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim      │
│   veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea   │
│   commodo consequat. Duis aute irure dolor in reprehenderit in voluptate    │
│   velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint         │
│   occaecat cupidatat non proident, sunt in culpa qui officia deserunt       │
│   mollit anim id est laborum.                                               │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
                ,.. /    
              ,'   ';    
   ,,.__    _,' /';  .   
  :','  ~~~~    '. '`    
  :' (   )         )::,  
  '. '. .=----=..-~  .;' 
   '  ;'  ::   ':.  '    
     (:   ':    ;)       
      \   '"  ./         
       '"      '"        
SNAP
  )
  [ "$output" = "$expected" ]
}

@test "15) above, art=big, side=right" {
  run ./unicornsay --above --art=big --side=right "$lorem_medium"
  [ "$status" -eq 0 ]
  expected=$(cat <<'SNAP'
┌─────────────────────────────────────────────────────────────────────────────┐
│                                                                             │
│   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod   │
│   tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim      │
│   veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea   │
│   commodo consequat. Duis aute irure dolor in reprehenderit in voluptate    │
│   velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint         │
│   occaecat cupidatat non proident, sunt in culpa qui officia deserunt       │
│   mollit anim id est laborum.                                               │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
                                                          \ ..,                 
                                                          ;'   ',               
                                                          .  ;'\ ',_    __.,,   
                                                          `' .'     ~~~~  ',':  
                                                          ,::(         (   ) ': 
                                                         ';.  ~-..=----=. .' .' 
                                                            '  .:'   ::  ';  '  
                                                               (;    :'   :)    
                                                                 \.  "'   /     
                                                                "'      "'      
SNAP
  )
  [ "$output" = "$expected" ]
}

@test "16) above, art=small, no-side" {
  run ./unicornsay --above --art=small "$lorem_medium"
  [ "$status" -eq 0 ]
  expected=$(cat <<'SNAP'
┌─────────────────────────────────────────────────────────────────────────────┐
│                                                                             │
│   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod   │
│   tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim      │
│   veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea   │
│   commodo consequat. Duis aute irure dolor in reprehenderit in voluptate    │
│   velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint         │
│   occaecat cupidatat non proident, sunt in culpa qui officia deserunt       │
│   mollit anim id est laborum.                                               │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
             /   
          ,,/_   
    _     ~/=-"  
   ~ )___~//     
   _//---\|_     
  /        /     
SNAP
  )
  [ "$output" = "$expected" ]
}

@test "17) above, art=small, side=left" {
  run ./unicornsay --above --art=small --side=left "$lorem_medium"
  [ "$status" -eq 0 ]
  expected=$(cat <<'SNAP'
┌─────────────────────────────────────────────────────────────────────────────┐
│                                                                             │
│   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod   │
│   tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim      │
│   veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea   │
│   commodo consequat. Duis aute irure dolor in reprehenderit in voluptate    │
│   velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint         │
│   occaecat cupidatat non proident, sunt in culpa qui officia deserunt       │
│   mollit anim id est laborum.                                               │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
             /   
          ,,/_   
    _     ~/=-"  
   ~ )___~//     
   _//---\|_     
  /        /     
SNAP
  )
  [ "$output" = "$expected" ]
}

@test "18) above, art=small, side=right" {
  run ./unicornsay --above --art=small --side=right "$lorem_medium"
  [ "$status" -eq 0 ]
  expected=$(cat <<'SNAP'
┌─────────────────────────────────────────────────────────────────────────────┐
│                                                                             │
│   Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod   │
│   tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim      │
│   veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea   │
│   commodo consequat. Duis aute irure dolor in reprehenderit in voluptate    │
│   velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint         │
│   occaecat cupidatat non proident, sunt in culpa qui officia deserunt       │
│   mollit anim id est laborum.                                               │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
                                                                  \             
                                                                  _\,,          
                                                                 "-=\~     _    
                                                                    \\~___( ~   
                                                                     _|/---\\_  
                                                                     \        \ 
SNAP
  )
  [ "$output" = "$expected" ]
}

