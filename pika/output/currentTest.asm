        DLabel       $eat-location-zero        
        DataZ        8                         
        DLabel       $print-format-integer     
        DataC        37                        %% "%d"
        DataC        100                       
        DataC        0                         
        DLabel       $print-format-floating    
        DataC        37                        %% "%g"
        DataC        103                       
        DataC        0                         
        DLabel       $print-format-boolean     
        DataC        37                        %% "%s"
        DataC        115                       
        DataC        0                         
        DLabel       $print-format-char        
        DataC        37                        %% "%c"
        DataC        99                        
        DataC        0                         
        DLabel       $print-format-string      
        DataC        37                        %% "%s"
        DataC        115                       
        DataC        0                         
        DLabel       $print-format-newline     
        DataC        10                        %% "\n"
        DataC        0                         
        DLabel       $print-format-tab         
        DataC        9                         %% "\t"
        DataC        0                         
        DLabel       $print-format-space       
        DataC        32                        %% " "
        DataC        0                         
        DLabel       $boolean-true-string      
        DataC        116                       %% "true"
        DataC        114                       
        DataC        117                       
        DataC        101                       
        DataC        0                         
        DLabel       $boolean-false-string     
        DataC        102                       %% "false"
        DataC        97                        
        DataC        108                       
        DataC        115                       
        DataC        101                       
        DataC        0                         
        DLabel       $errors-general-message   
        DataC        82                        %% "Runtime error: %s\n"
        DataC        117                       
        DataC        110                       
        DataC        116                       
        DataC        105                       
        DataC        109                       
        DataC        101                       
        DataC        32                        
        DataC        101                       
        DataC        114                       
        DataC        114                       
        DataC        111                       
        DataC        114                       
        DataC        58                        
        DataC        32                        
        DataC        37                        
        DataC        115                       
        DataC        10                        
        DataC        0                         
        DLabel       $errors-int-divide-by-zero 
        DataC        105                       %% "integer divide by zero"
        DataC        110                       
        DataC        116                       
        DataC        101                       
        DataC        103                       
        DataC        101                       
        DataC        114                       
        DataC        32                        
        DataC        100                       
        DataC        105                       
        DataC        118                       
        DataC        105                       
        DataC        100                       
        DataC        101                       
        DataC        32                        
        DataC        98                        
        DataC        121                       
        DataC        32                        
        DataC        122                       
        DataC        101                       
        DataC        114                       
        DataC        111                       
        DataC        0                         
        DLabel       $errors-float-divide-by-zero 
        DataC        102                       %% "float divide by zero"
        DataC        108                       
        DataC        111                       
        DataC        97                        
        DataC        116                       
        DataC        32                        
        DataC        100                       
        DataC        105                       
        DataC        118                       
        DataC        105                       
        DataC        100                       
        DataC        101                       
        DataC        32                        
        DataC        98                        
        DataC        121                       
        DataC        32                        
        DataC        122                       
        DataC        101                       
        DataC        114                       
        DataC        111                       
        DataC        0                         
        DLabel       $usable-memory-start      
        DLabel       $global-memory-block      
        DataZ        28                        
        DLabel       -stringConstant-1-nicenicenice 
        DLabel       -stringConstant-7-nicenicenice 
        DLabel       -stringConstant-6-nicenicenice 
        DLabel       -stringConstant-5-nicenicenice 
        DLabel       -stringConstant-2-nicenicenice 
        DataC        110                       %% "nicenicenice"
        DataC        105                       
        DataC        99                        
        DataC        101                       
        DataC        110                       
        DataC        105                       
        DataC        99                        
        DataC        101                       
        DataC        110                       
        DataC        105                       
        DataC        99                        
        DataC        101                       
        DataC        0                         
        DLabel       -stringConstant-3-niceniceniceB 
        DLabel       -stringConstant-4-niceniceniceB 
        DataC        110                       %% "niceniceniceB"
        DataC        105                       
        DataC        99                        
        DataC        101                       
        DataC        110                       
        DataC        105                       
        DataC        99                        
        DataC        101                       
        DataC        110                       
        DataC        105                       
        DataC        99                        
        DataC        101                       
        DataC        66                        
        DataC        0                         
        Jump         $$main                    
        Label        $$general-runtime-error   
        PushD        $errors-general-message   
        Printf                                 
        Halt                                   
        Label        $$i-divide-by-zero        
        PushD        $errors-int-divide-by-zero 
        Jump         $$general-runtime-error   
        Label        $$f-divide-by-zero        
        PushD        $errors-float-divide-by-zero 
        Jump         $$general-runtime-error   
        Label        $$main                    
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% quarters
        PushD        -stringConstant-1-nicenicenice 
        StoreI                                 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% quarters1
        PushD        -stringConstant-2-nicenicenice 
        StoreI                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% quarters2
        PushD        -stringConstant-3-niceniceniceB 
        StoreI                                 
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% quarters3
        PushD        -stringConstant-4-niceniceniceB 
        StoreI                                 
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% quarters4
        PushD        -stringConstant-5-nicenicenice 
        StoreI                                 
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% quarters5
        PushD        -stringConstant-6-nicenicenice 
        StoreI                                 
        PushD        $global-memory-block      
        PushI        24                        
        Add                                    %% quarters6
        PushD        -stringConstant-7-nicenicenice 
        StoreI                                 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% quarters
        LoadI                                  
        PushD        $print-format-string      
        Printf                                 
        PushD        $print-format-tab         
        Printf                                 
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% quarters3
        LoadI                                  
        PushD        $print-format-string      
        Printf                                 
        Halt                                   
