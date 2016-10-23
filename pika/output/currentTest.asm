        DLabel       $heap-start-ptr           
        DataZ        4                         
        DLabel       $heap-after-ptr           
        DataZ        4                         
        DLabel       $heap-first-free          
        DataZ        4                         
        DLabel       $mmgr-newblock-block      
        DataZ        4                         
        DLabel       $mmgr-newblock-size       
        DataZ        4                         
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
        DLabel       $print-format-separator   
        DataC        44                        %% ","
        DataC        0                         
        DLabel       $print-format-open-square-bracket 
        DataC        91                        %% "["
        DataC        0                         
        DLabel       $print-format-close-square-bracket 
        DataC        93                        %% "]"
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
        DLabel       $$errors-array-size-negative 
        DataC        97                        %% "array size cannot be negative"
        DataC        114                       
        DataC        114                       
        DataC        97                        
        DataC        121                       
        DataC        32                        
        DataC        115                       
        DataC        105                       
        DataC        122                       
        DataC        101                       
        DataC        32                        
        DataC        99                        
        DataC        97                        
        DataC        110                       
        DataC        110                       
        DataC        111                       
        DataC        116                       
        DataC        32                        
        DataC        98                        
        DataC        101                       
        DataC        32                        
        DataC        110                       
        DataC        101                       
        DataC        103                       
        DataC        97                        
        DataC        116                       
        DataC        105                       
        DataC        118                       
        DataC        101                       
        DataC        0                         
        DLabel       $usable-memory-start      
        DLabel       $global-memory-block      
        DataZ        4                         
        DLabel       --print-array-26--loop-counter- 
        DataI        0                         
        DLabel       --print-array-27--loop-counter- 
        DataI        0                         
        DLabel       --print-array-28--loop-counter- 
        DataI        0                         
        DLabel       $mmgr-tags-size           
        DataZ        4                         
        DLabel       $mmgr-tags-start          
        DataZ        4                         
        DLabel       $mmgr-tags-available      
        DataZ        4                         
        DLabel       $mmgr-tags-nextptr        
        DataZ        4                         
        DLabel       $mmgr-tags-prevptr        
        DataZ        4                         
        DLabel       $mmgr-tags-return         
        DataZ        4                         
        DLabel       $mmgr-onetag-return       
        DataZ        4                         
        DLabel       $mmgr-onetag-location     
        DataZ        4                         
        DLabel       $mmgr-onetag-available    
        DataZ        4                         
        DLabel       $mmgr-onetag-size         
        DataZ        4                         
        DLabel       $mmgr-onetag-pointer      
        DataZ        4                         
        DLabel       $mmgr-alloc-return        
        DataZ        4                         
        DLabel       $mmgr-alloc-size          
        DataZ        4                         
        DLabel       $mmgr-alloc-current-block 
        DataZ        4                         
        DLabel       $mmgr-alloc-remainder-block 
        DataZ        4                         
        DLabel       $mmgr-alloc-remainder-size 
        DataZ        4                         
        DLabel       $mmgr-dealloc-return      
        DataZ        4                         
        DLabel       $mmgr-dealloc-block       
        DataZ        4                         
        DLabel       $mmgr-remove-return       
        DataZ        4                         
        DLabel       $mmgr-remove-block        
        DataZ        4                         
        DLabel       $mmgr-remove-prev         
        DataZ        4                         
        DLabel       $mmgr-remove-next         
        DataZ        4                         
        DLabel       $heap-memory              
        Label        -mem-manager-initialize   
        PushD        $heap-memory              
        Duplicate                              
        PushD        $heap-start-ptr           
        Exchange                               
        StoreI                                 
        PushD        $heap-after-ptr           
        Exchange                               
        StoreI                                 
        PushI        0                         
        PushD        $heap-first-free          
        Exchange                               
        StoreI                                 
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
        Label        $$array-size-negative     
        PushD        $$errors-array-size-negative 
        Jump         $$general-runtime-error   
        Label        $$main                    
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        Label        -exprList-25-array-creation-begin 
        Label        -exprList-25-array-creation-get-length 
        PushI        4                         
        Duplicate                              
        JumpNeg      $$array-size-negative     
        Label        -exprList-25-array-creation-size 
        PushI        4                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -exprList-25-array-creation-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-25-array-creation-status 
        Duplicate                              
        PushI        2                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-25-array-creation-subtype-size 
        Duplicate                              
        PushI        4                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-25-array-creation-length 
        Duplicate                              
        PushI        4                         
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-25-array-creation-end 
        Label        -exprList-25-array-initialization-begin 
        Duplicate                              
        Label        -exprList-6-array-creation-begin 
        Label        -exprList-6-array-creation-get-length 
        PushI        5                         
        Duplicate                              
        JumpNeg      $$array-size-negative     
        Label        -exprList-6-array-creation-size 
        PushI        4                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -exprList-6-array-creation-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-6-array-creation-status 
        Duplicate                              
        PushI        2                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-6-array-creation-subtype-size 
        Duplicate                              
        PushI        4                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-6-array-creation-length 
        Duplicate                              
        PushI        5                         
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-6-array-creation-end 
        Label        -exprList-6-array-initialization-begin 
        Duplicate                              
        Label        -exprList-1-array-creation-begin 
        Label        -exprList-1-array-creation-get-length 
        PushI        3                         
        Duplicate                              
        JumpNeg      $$array-size-negative     
        Label        -exprList-1-array-creation-size 
        PushI        1                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -exprList-1-array-creation-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-1-array-creation-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-1-array-creation-subtype-size 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-1-array-creation-length 
        Duplicate                              
        PushI        3                         
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-1-array-creation-end 
        Label        -exprList-1-array-initialization-begin 
        Duplicate                              
        PushI        97                        
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        98                        
        Exchange                               
        PushI        17                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        99                        
        Exchange                               
        PushI        18                        
        Add                                    
        Exchange                               
        StoreC                                 
        Label        -exprList-1-array-initialization-end 
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        Label        -exprList-2-array-creation-begin 
        Label        -exprList-2-array-creation-get-length 
        PushI        3                         
        Duplicate                              
        JumpNeg      $$array-size-negative     
        Label        -exprList-2-array-creation-size 
        PushI        1                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -exprList-2-array-creation-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-2-array-creation-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-2-array-creation-subtype-size 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-2-array-creation-length 
        Duplicate                              
        PushI        3                         
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-2-array-creation-end 
        Label        -exprList-2-array-initialization-begin 
        Duplicate                              
        PushI        65                        
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        65                        
        Exchange                               
        PushI        17                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        65                        
        Exchange                               
        PushI        18                        
        Add                                    
        Exchange                               
        StoreC                                 
        Label        -exprList-2-array-initialization-end 
        Exchange                               
        PushI        20                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        Label        -exprList-3-array-creation-begin 
        Label        -exprList-3-array-creation-get-length 
        PushI        3                         
        Duplicate                              
        JumpNeg      $$array-size-negative     
        Label        -exprList-3-array-creation-size 
        PushI        1                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -exprList-3-array-creation-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-3-array-creation-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-3-array-creation-subtype-size 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-3-array-creation-length 
        Duplicate                              
        PushI        3                         
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-3-array-creation-end 
        Label        -exprList-3-array-initialization-begin 
        Duplicate                              
        PushI        82                        
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        80                        
        Exchange                               
        PushI        17                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        71                        
        Exchange                               
        PushI        18                        
        Add                                    
        Exchange                               
        StoreC                                 
        Label        -exprList-3-array-initialization-end 
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        Label        -exprList-4-array-creation-begin 
        Label        -exprList-4-array-creation-get-length 
        PushI        3                         
        Duplicate                              
        JumpNeg      $$array-size-negative     
        Label        -exprList-4-array-creation-size 
        PushI        1                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -exprList-4-array-creation-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-4-array-creation-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-4-array-creation-subtype-size 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-4-array-creation-length 
        Duplicate                              
        PushI        3                         
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-4-array-creation-end 
        Label        -exprList-4-array-initialization-begin 
        Duplicate                              
        PushI        66                        
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        66                        
        Exchange                               
        PushI        17                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        66                        
        Exchange                               
        PushI        18                        
        Add                                    
        Exchange                               
        StoreC                                 
        Label        -exprList-4-array-initialization-end 
        Exchange                               
        PushI        28                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        Label        -exprList-5-array-creation-begin 
        Label        -exprList-5-array-creation-get-length 
        PushI        3                         
        Duplicate                              
        JumpNeg      $$array-size-negative     
        Label        -exprList-5-array-creation-size 
        PushI        1                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -exprList-5-array-creation-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-5-array-creation-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-5-array-creation-subtype-size 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-5-array-creation-length 
        Duplicate                              
        PushI        3                         
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-5-array-creation-end 
        Label        -exprList-5-array-initialization-begin 
        Duplicate                              
        PushI        97                        
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        98                        
        Exchange                               
        PushI        17                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        99                        
        Exchange                               
        PushI        18                        
        Add                                    
        Exchange                               
        StoreC                                 
        Label        -exprList-5-array-initialization-end 
        Exchange                               
        PushI        32                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-6-array-initialization-end 
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        Label        -exprList-12-array-creation-begin 
        Label        -exprList-12-array-creation-get-length 
        PushI        5                         
        Duplicate                              
        JumpNeg      $$array-size-negative     
        Label        -exprList-12-array-creation-size 
        PushI        4                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -exprList-12-array-creation-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-12-array-creation-status 
        Duplicate                              
        PushI        2                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-12-array-creation-subtype-size 
        Duplicate                              
        PushI        4                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-12-array-creation-length 
        Duplicate                              
        PushI        5                         
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-12-array-creation-end 
        Label        -exprList-12-array-initialization-begin 
        Duplicate                              
        Label        -exprList-7-array-creation-begin 
        Label        -exprList-7-array-creation-get-length 
        PushI        3                         
        Duplicate                              
        JumpNeg      $$array-size-negative     
        Label        -exprList-7-array-creation-size 
        PushI        1                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -exprList-7-array-creation-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-7-array-creation-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-7-array-creation-subtype-size 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-7-array-creation-length 
        Duplicate                              
        PushI        3                         
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-7-array-creation-end 
        Label        -exprList-7-array-initialization-begin 
        Duplicate                              
        PushI        97                        
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        98                        
        Exchange                               
        PushI        17                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        99                        
        Exchange                               
        PushI        18                        
        Add                                    
        Exchange                               
        StoreC                                 
        Label        -exprList-7-array-initialization-end 
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        Label        -exprList-8-array-creation-begin 
        Label        -exprList-8-array-creation-get-length 
        PushI        3                         
        Duplicate                              
        JumpNeg      $$array-size-negative     
        Label        -exprList-8-array-creation-size 
        PushI        1                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -exprList-8-array-creation-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-8-array-creation-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-8-array-creation-subtype-size 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-8-array-creation-length 
        Duplicate                              
        PushI        3                         
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-8-array-creation-end 
        Label        -exprList-8-array-initialization-begin 
        Duplicate                              
        PushI        65                        
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        65                        
        Exchange                               
        PushI        17                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        65                        
        Exchange                               
        PushI        18                        
        Add                                    
        Exchange                               
        StoreC                                 
        Label        -exprList-8-array-initialization-end 
        Exchange                               
        PushI        20                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        Label        -exprList-9-array-creation-begin 
        Label        -exprList-9-array-creation-get-length 
        PushI        3                         
        Duplicate                              
        JumpNeg      $$array-size-negative     
        Label        -exprList-9-array-creation-size 
        PushI        1                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -exprList-9-array-creation-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-9-array-creation-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-9-array-creation-subtype-size 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-9-array-creation-length 
        Duplicate                              
        PushI        3                         
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-9-array-creation-end 
        Label        -exprList-9-array-initialization-begin 
        Duplicate                              
        PushI        82                        
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        80                        
        Exchange                               
        PushI        17                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        71                        
        Exchange                               
        PushI        18                        
        Add                                    
        Exchange                               
        StoreC                                 
        Label        -exprList-9-array-initialization-end 
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        Label        -exprList-10-array-creation-begin 
        Label        -exprList-10-array-creation-get-length 
        PushI        3                         
        Duplicate                              
        JumpNeg      $$array-size-negative     
        Label        -exprList-10-array-creation-size 
        PushI        1                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -exprList-10-array-creation-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-10-array-creation-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-10-array-creation-subtype-size 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-10-array-creation-length 
        Duplicate                              
        PushI        3                         
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-10-array-creation-end 
        Label        -exprList-10-array-initialization-begin 
        Duplicate                              
        PushI        66                        
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        66                        
        Exchange                               
        PushI        17                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        66                        
        Exchange                               
        PushI        18                        
        Add                                    
        Exchange                               
        StoreC                                 
        Label        -exprList-10-array-initialization-end 
        Exchange                               
        PushI        28                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        Label        -exprList-11-array-creation-begin 
        Label        -exprList-11-array-creation-get-length 
        PushI        3                         
        Duplicate                              
        JumpNeg      $$array-size-negative     
        Label        -exprList-11-array-creation-size 
        PushI        1                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -exprList-11-array-creation-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-11-array-creation-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-11-array-creation-subtype-size 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-11-array-creation-length 
        Duplicate                              
        PushI        3                         
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-11-array-creation-end 
        Label        -exprList-11-array-initialization-begin 
        Duplicate                              
        PushI        97                        
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        98                        
        Exchange                               
        PushI        17                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        99                        
        Exchange                               
        PushI        18                        
        Add                                    
        Exchange                               
        StoreC                                 
        Label        -exprList-11-array-initialization-end 
        Exchange                               
        PushI        32                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-12-array-initialization-end 
        Exchange                               
        PushI        20                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        Label        -exprList-18-array-creation-begin 
        Label        -exprList-18-array-creation-get-length 
        PushI        5                         
        Duplicate                              
        JumpNeg      $$array-size-negative     
        Label        -exprList-18-array-creation-size 
        PushI        4                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -exprList-18-array-creation-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-18-array-creation-status 
        Duplicate                              
        PushI        2                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-18-array-creation-subtype-size 
        Duplicate                              
        PushI        4                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-18-array-creation-length 
        Duplicate                              
        PushI        5                         
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-18-array-creation-end 
        Label        -exprList-18-array-initialization-begin 
        Duplicate                              
        Label        -exprList-13-array-creation-begin 
        Label        -exprList-13-array-creation-get-length 
        PushI        3                         
        Duplicate                              
        JumpNeg      $$array-size-negative     
        Label        -exprList-13-array-creation-size 
        PushI        1                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -exprList-13-array-creation-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-13-array-creation-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-13-array-creation-subtype-size 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-13-array-creation-length 
        Duplicate                              
        PushI        3                         
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-13-array-creation-end 
        Label        -exprList-13-array-initialization-begin 
        Duplicate                              
        PushI        97                        
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        98                        
        Exchange                               
        PushI        17                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        99                        
        Exchange                               
        PushI        18                        
        Add                                    
        Exchange                               
        StoreC                                 
        Label        -exprList-13-array-initialization-end 
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        Label        -exprList-14-array-creation-begin 
        Label        -exprList-14-array-creation-get-length 
        PushI        3                         
        Duplicate                              
        JumpNeg      $$array-size-negative     
        Label        -exprList-14-array-creation-size 
        PushI        1                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -exprList-14-array-creation-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-14-array-creation-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-14-array-creation-subtype-size 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-14-array-creation-length 
        Duplicate                              
        PushI        3                         
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-14-array-creation-end 
        Label        -exprList-14-array-initialization-begin 
        Duplicate                              
        PushI        65                        
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        65                        
        Exchange                               
        PushI        17                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        65                        
        Exchange                               
        PushI        18                        
        Add                                    
        Exchange                               
        StoreC                                 
        Label        -exprList-14-array-initialization-end 
        Exchange                               
        PushI        20                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        Label        -exprList-15-array-creation-begin 
        Label        -exprList-15-array-creation-get-length 
        PushI        3                         
        Duplicate                              
        JumpNeg      $$array-size-negative     
        Label        -exprList-15-array-creation-size 
        PushI        1                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -exprList-15-array-creation-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-15-array-creation-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-15-array-creation-subtype-size 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-15-array-creation-length 
        Duplicate                              
        PushI        3                         
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-15-array-creation-end 
        Label        -exprList-15-array-initialization-begin 
        Duplicate                              
        PushI        82                        
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        80                        
        Exchange                               
        PushI        17                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        71                        
        Exchange                               
        PushI        18                        
        Add                                    
        Exchange                               
        StoreC                                 
        Label        -exprList-15-array-initialization-end 
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        Label        -exprList-16-array-creation-begin 
        Label        -exprList-16-array-creation-get-length 
        PushI        3                         
        Duplicate                              
        JumpNeg      $$array-size-negative     
        Label        -exprList-16-array-creation-size 
        PushI        1                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -exprList-16-array-creation-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-16-array-creation-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-16-array-creation-subtype-size 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-16-array-creation-length 
        Duplicate                              
        PushI        3                         
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-16-array-creation-end 
        Label        -exprList-16-array-initialization-begin 
        Duplicate                              
        PushI        66                        
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        66                        
        Exchange                               
        PushI        17                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        66                        
        Exchange                               
        PushI        18                        
        Add                                    
        Exchange                               
        StoreC                                 
        Label        -exprList-16-array-initialization-end 
        Exchange                               
        PushI        28                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        Label        -exprList-17-array-creation-begin 
        Label        -exprList-17-array-creation-get-length 
        PushI        3                         
        Duplicate                              
        JumpNeg      $$array-size-negative     
        Label        -exprList-17-array-creation-size 
        PushI        1                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -exprList-17-array-creation-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-17-array-creation-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-17-array-creation-subtype-size 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-17-array-creation-length 
        Duplicate                              
        PushI        3                         
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-17-array-creation-end 
        Label        -exprList-17-array-initialization-begin 
        Duplicate                              
        PushI        97                        
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        98                        
        Exchange                               
        PushI        17                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        99                        
        Exchange                               
        PushI        18                        
        Add                                    
        Exchange                               
        StoreC                                 
        Label        -exprList-17-array-initialization-end 
        Exchange                               
        PushI        32                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-18-array-initialization-end 
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        Label        -exprList-24-array-creation-begin 
        Label        -exprList-24-array-creation-get-length 
        PushI        5                         
        Duplicate                              
        JumpNeg      $$array-size-negative     
        Label        -exprList-24-array-creation-size 
        PushI        4                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -exprList-24-array-creation-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-24-array-creation-status 
        Duplicate                              
        PushI        2                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-24-array-creation-subtype-size 
        Duplicate                              
        PushI        4                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-24-array-creation-length 
        Duplicate                              
        PushI        5                         
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-24-array-creation-end 
        Label        -exprList-24-array-initialization-begin 
        Duplicate                              
        Label        -exprList-19-array-creation-begin 
        Label        -exprList-19-array-creation-get-length 
        PushI        3                         
        Duplicate                              
        JumpNeg      $$array-size-negative     
        Label        -exprList-19-array-creation-size 
        PushI        1                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -exprList-19-array-creation-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-19-array-creation-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-19-array-creation-subtype-size 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-19-array-creation-length 
        Duplicate                              
        PushI        3                         
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-19-array-creation-end 
        Label        -exprList-19-array-initialization-begin 
        Duplicate                              
        PushI        97                        
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        98                        
        Exchange                               
        PushI        17                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        99                        
        Exchange                               
        PushI        18                        
        Add                                    
        Exchange                               
        StoreC                                 
        Label        -exprList-19-array-initialization-end 
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        Label        -exprList-20-array-creation-begin 
        Label        -exprList-20-array-creation-get-length 
        PushI        3                         
        Duplicate                              
        JumpNeg      $$array-size-negative     
        Label        -exprList-20-array-creation-size 
        PushI        1                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -exprList-20-array-creation-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-20-array-creation-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-20-array-creation-subtype-size 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-20-array-creation-length 
        Duplicate                              
        PushI        3                         
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-20-array-creation-end 
        Label        -exprList-20-array-initialization-begin 
        Duplicate                              
        PushI        65                        
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        65                        
        Exchange                               
        PushI        17                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        65                        
        Exchange                               
        PushI        18                        
        Add                                    
        Exchange                               
        StoreC                                 
        Label        -exprList-20-array-initialization-end 
        Exchange                               
        PushI        20                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        Label        -exprList-21-array-creation-begin 
        Label        -exprList-21-array-creation-get-length 
        PushI        3                         
        Duplicate                              
        JumpNeg      $$array-size-negative     
        Label        -exprList-21-array-creation-size 
        PushI        1                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -exprList-21-array-creation-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-21-array-creation-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-21-array-creation-subtype-size 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-21-array-creation-length 
        Duplicate                              
        PushI        3                         
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-21-array-creation-end 
        Label        -exprList-21-array-initialization-begin 
        Duplicate                              
        PushI        82                        
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        80                        
        Exchange                               
        PushI        17                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        71                        
        Exchange                               
        PushI        18                        
        Add                                    
        Exchange                               
        StoreC                                 
        Label        -exprList-21-array-initialization-end 
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        Label        -exprList-22-array-creation-begin 
        Label        -exprList-22-array-creation-get-length 
        PushI        3                         
        Duplicate                              
        JumpNeg      $$array-size-negative     
        Label        -exprList-22-array-creation-size 
        PushI        1                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -exprList-22-array-creation-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-22-array-creation-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-22-array-creation-subtype-size 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-22-array-creation-length 
        Duplicate                              
        PushI        3                         
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-22-array-creation-end 
        Label        -exprList-22-array-initialization-begin 
        Duplicate                              
        PushI        66                        
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        66                        
        Exchange                               
        PushI        17                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        66                        
        Exchange                               
        PushI        18                        
        Add                                    
        Exchange                               
        StoreC                                 
        Label        -exprList-22-array-initialization-end 
        Exchange                               
        PushI        28                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        Label        -exprList-23-array-creation-begin 
        Label        -exprList-23-array-creation-get-length 
        PushI        3                         
        Duplicate                              
        JumpNeg      $$array-size-negative     
        Label        -exprList-23-array-creation-size 
        PushI        1                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -exprList-23-array-creation-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-23-array-creation-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-23-array-creation-subtype-size 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-23-array-creation-length 
        Duplicate                              
        PushI        3                         
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-23-array-creation-end 
        Label        -exprList-23-array-initialization-begin 
        Duplicate                              
        PushI        97                        
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        98                        
        Exchange                               
        PushI        17                        
        Add                                    
        Exchange                               
        StoreC                                 
        Duplicate                              
        PushI        99                        
        Exchange                               
        PushI        18                        
        Add                                    
        Exchange                               
        StoreC                                 
        Label        -exprList-23-array-initialization-end 
        Exchange                               
        PushI        32                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-24-array-initialization-end 
        Exchange                               
        PushI        28                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -exprList-25-array-initialization-end 
        StoreI                                 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        Label        --print-array-26--begin-  
        Duplicate                              
        Label        --print-array-26-get-length 
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        --print-array-26--loop-counter- 
        Exchange                               
        StoreI                                 
        PushI        16                        
        Add                                    
        PushD        $print-format-open-square-bracket 
        Printf                                 
        Label        --print-array-26--loop-begin- 
        PushD        --print-array-26--loop-counter- 
        LoadI                                  
        JumpFalse    --print-array-26--loop-end- 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        LoadI                                  
        Label        --print-array-27--begin-  
        Duplicate                              
        Label        --print-array-27-get-length 
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        --print-array-27--loop-counter- 
        Exchange                               
        StoreI                                 
        PushI        16                        
        Add                                    
        PushD        $print-format-open-square-bracket 
        Printf                                 
        Label        --print-array-27--loop-begin- 
        PushD        --print-array-27--loop-counter- 
        LoadI                                  
        JumpFalse    --print-array-27--loop-end- 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        LoadI                                  
        Label        --print-array-28--begin-  
        Duplicate                              
        Label        --print-array-28-get-length 
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        --print-array-28--loop-counter- 
        Exchange                               
        StoreI                                 
        PushI        16                        
        Add                                    
        PushD        $print-format-open-square-bracket 
        Printf                                 
        Label        --print-array-28--loop-begin- 
        PushD        --print-array-28--loop-counter- 
        LoadI                                  
        JumpFalse    --print-array-28--loop-end- 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        LoadI                                  
        PushD        $print-format-char        
        Printf                                 
        PushI        -1                        
        PushD        --print-array-28--loop-counter- 
        LoadI                                  
        Add                                    
        PushD        --print-array-28--loop-counter- 
        Exchange                               
        StoreI                                 
        PushD        --print-array-28--loop-counter- 
        LoadI                                  
        JumpFalse    --print-array-28--loop-end- 
        PushD        $print-format-separator   
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        Jump         --print-array-28--loop-begin- 
        Label        --print-array-28--loop-end- 
        Pop                                    
        PushD        $print-format-close-square-bracket 
        Printf                                 
        Label        --print-array-28--end-    
        PushI        -1                        
        PushD        --print-array-27--loop-counter- 
        LoadI                                  
        Add                                    
        PushD        --print-array-27--loop-counter- 
        Exchange                               
        StoreI                                 
        PushD        --print-array-27--loop-counter- 
        LoadI                                  
        JumpFalse    --print-array-27--loop-end- 
        PushD        $print-format-separator   
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        Jump         --print-array-27--loop-begin- 
        Label        --print-array-27--loop-end- 
        Pop                                    
        PushD        $print-format-close-square-bracket 
        Printf                                 
        Label        --print-array-27--end-    
        PushI        -1                        
        PushD        --print-array-26--loop-counter- 
        LoadI                                  
        Add                                    
        PushD        --print-array-26--loop-counter- 
        Exchange                               
        StoreI                                 
        PushD        --print-array-26--loop-counter- 
        LoadI                                  
        JumpFalse    --print-array-26--loop-end- 
        PushD        $print-format-separator   
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        Jump         --print-array-26--loop-begin- 
        Label        --print-array-26--loop-end- 
        Pop                                    
        PushD        $print-format-close-square-bracket 
        Printf                                 
        Label        --print-array-26--end-    
        Halt                                   
        Label        -mem-manager-make-tags    
        PushD        $mmgr-tags-return         
        Exchange                               
        StoreI                                 
        PushD        $mmgr-tags-size           
        Exchange                               
        StoreI                                 
        PushD        $mmgr-tags-start          
        Exchange                               
        StoreI                                 
        PushD        $mmgr-tags-available      
        Exchange                               
        StoreI                                 
        PushD        $mmgr-tags-nextptr        
        Exchange                               
        StoreI                                 
        PushD        $mmgr-tags-prevptr        
        Exchange                               
        StoreI                                 
        PushD        $mmgr-tags-prevptr        
        LoadI                                  
        PushD        $mmgr-tags-size           
        LoadI                                  
        PushD        $mmgr-tags-available      
        LoadI                                  
        PushD        $mmgr-tags-start          
        LoadI                                  
        Call         -mem-manager-one-tag      
        PushD        $mmgr-tags-nextptr        
        LoadI                                  
        PushD        $mmgr-tags-size           
        LoadI                                  
        PushD        $mmgr-tags-available      
        LoadI                                  
        PushD        $mmgr-tags-start          
        LoadI                                  
        Duplicate                              
        PushI        4                         
        Add                                    
        LoadI                                  
        Add                                    
        PushI        9                         
        Subtract                               
        Call         -mem-manager-one-tag      
        PushD        $mmgr-tags-return         
        LoadI                                  
        Return                                 
        Label        -mem-manager-one-tag      
        PushD        $mmgr-onetag-return       
        Exchange                               
        StoreI                                 
        PushD        $mmgr-onetag-location     
        Exchange                               
        StoreI                                 
        PushD        $mmgr-onetag-available    
        Exchange                               
        StoreI                                 
        PushD        $mmgr-onetag-size         
        Exchange                               
        StoreI                                 
        PushD        $mmgr-onetag-location     
        LoadI                                  
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $mmgr-onetag-size         
        LoadI                                  
        PushD        $mmgr-onetag-location     
        LoadI                                  
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $mmgr-onetag-available    
        LoadI                                  
        PushD        $mmgr-onetag-location     
        LoadI                                  
        PushI        8                         
        Add                                    
        Exchange                               
        StoreC                                 
        PushD        $mmgr-onetag-return       
        LoadI                                  
        Return                                 
        Label        -mem-manager-allocate     
        PushD        $mmgr-alloc-return        
        Exchange                               
        StoreI                                 
        PushI        18                        
        Add                                    
        PushD        $mmgr-alloc-size          
        Exchange                               
        StoreI                                 
        PushD        $heap-first-free          
        LoadI                                  
        PushD        $mmgr-alloc-current-block 
        Exchange                               
        StoreI                                 
        Label        -mmgr-alloc-process-current 
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        JumpFalse    -mmgr-alloc-no-block-works 
        Label        -mmgr-alloc-test-block    
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        PushD        $mmgr-alloc-size          
        LoadI                                  
        Subtract                               
        PushI        1                         
        Add                                    
        JumpPos      -mmgr-alloc-found-block   
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        Duplicate                              
        PushI        4                         
        Add                                    
        LoadI                                  
        Add                                    
        PushI        9                         
        Subtract                               
        PushI        0                         
        Add                                    
        LoadI                                  
        PushD        $mmgr-alloc-current-block 
        Exchange                               
        StoreI                                 
        Jump         -mmgr-alloc-process-current 
        Label        -mmgr-alloc-found-block   
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        Call         -mem-manager-remove-block 
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        PushD        $mmgr-alloc-size          
        LoadI                                  
        Subtract                               
        PushI        26                        
        Subtract                               
        JumpNeg      -mmgr-alloc-return-userblock 
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        PushD        $mmgr-alloc-size          
        LoadI                                  
        Add                                    
        PushD        $mmgr-alloc-remainder-block 
        Exchange                               
        StoreI                                 
        PushD        $mmgr-alloc-size          
        LoadI                                  
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        Exchange                               
        Subtract                               
        PushD        $mmgr-alloc-remainder-size 
        Exchange                               
        StoreI                                 
        PushI        0                         
        PushI        0                         
        PushI        0                         
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        PushD        $mmgr-alloc-size          
        LoadI                                  
        Call         -mem-manager-make-tags    
        PushI        0                         
        PushI        0                         
        PushI        1                         
        PushD        $mmgr-alloc-remainder-block 
        LoadI                                  
        PushD        $mmgr-alloc-remainder-size 
        LoadI                                  
        Call         -mem-manager-make-tags    
        PushD        $mmgr-alloc-remainder-block 
        LoadI                                  
        PushI        9                         
        Add                                    
        Call         -mem-manager-deallocate   
        Jump         -mmgr-alloc-return-userblock 
        Label        -mmgr-alloc-no-block-works 
        PushD        $mmgr-alloc-size          
        LoadI                                  
        PushD        $mmgr-newblock-size       
        Exchange                               
        StoreI                                 
        PushD        $heap-after-ptr           
        LoadI                                  
        PushD        $mmgr-newblock-block      
        Exchange                               
        StoreI                                 
        PushD        $mmgr-newblock-size       
        LoadI                                  
        PushD        $heap-after-ptr           
        LoadI                                  
        Add                                    
        PushD        $heap-after-ptr           
        Exchange                               
        StoreI                                 
        PushI        0                         
        PushI        0                         
        PushI        0                         
        PushD        $mmgr-newblock-block      
        LoadI                                  
        PushD        $mmgr-newblock-size       
        LoadI                                  
        Call         -mem-manager-make-tags    
        PushD        $mmgr-newblock-block      
        LoadI                                  
        PushD        $mmgr-alloc-current-block 
        Exchange                               
        StoreI                                 
        Label        -mmgr-alloc-return-userblock 
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        PushI        9                         
        Add                                    
        PushD        $mmgr-alloc-return        
        LoadI                                  
        Return                                 
        Label        -mem-manager-deallocate   
        PushD        $mmgr-dealloc-return      
        Exchange                               
        StoreI                                 
        PushI        9                         
        Subtract                               
        PushD        $mmgr-dealloc-block       
        Exchange                               
        StoreI                                 
        PushD        $mmgr-dealloc-block       
        LoadI                                  
        PushD        $heap-first-free          
        LoadI                                  
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushI        0                         
        PushD        $mmgr-dealloc-block       
        LoadI                                  
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushD        $heap-first-free          
        LoadI                                  
        PushD        $mmgr-dealloc-block       
        LoadI                                  
        Duplicate                              
        PushI        4                         
        Add                                    
        LoadI                                  
        Add                                    
        PushI        9                         
        Subtract                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        PushI        1                         
        PushD        $mmgr-dealloc-block       
        LoadI                                  
        PushI        8                         
        Add                                    
        Exchange                               
        StoreC                                 
        PushI        1                         
        PushD        $mmgr-dealloc-block       
        LoadI                                  
        Duplicate                              
        PushI        4                         
        Add                                    
        LoadI                                  
        Add                                    
        PushI        9                         
        Subtract                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreC                                 
        PushD        $mmgr-dealloc-block       
        LoadI                                  
        PushD        $heap-first-free          
        Exchange                               
        StoreI                                 
        PushD        $mmgr-dealloc-return      
        LoadI                                  
        Return                                 
        Label        -mem-manager-remove-block 
        PushD        $mmgr-remove-return       
        Exchange                               
        StoreI                                 
        PushD        $mmgr-remove-block        
        Exchange                               
        StoreI                                 
        PushD        $mmgr-remove-block        
        LoadI                                  
        PushI        0                         
        Add                                    
        LoadI                                  
        PushD        $mmgr-remove-prev         
        Exchange                               
        StoreI                                 
        PushD        $mmgr-remove-block        
        LoadI                                  
        Duplicate                              
        PushI        4                         
        Add                                    
        LoadI                                  
        Add                                    
        PushI        9                         
        Subtract                               
        PushI        0                         
        Add                                    
        LoadI                                  
        PushD        $mmgr-remove-next         
        Exchange                               
        StoreI                                 
        Label        -mmgr-remove-process-prev 
        PushD        $mmgr-remove-prev         
        LoadI                                  
        JumpFalse    -mmgr-remove-no-prev      
        PushD        $mmgr-remove-next         
        LoadI                                  
        PushD        $mmgr-remove-prev         
        LoadI                                  
        Duplicate                              
        PushI        4                         
        Add                                    
        LoadI                                  
        Add                                    
        PushI        9                         
        Subtract                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Jump         -mmgr-remove-process-next 
        Label        -mmgr-remove-no-prev      
        PushD        $mmgr-remove-next         
        LoadI                                  
        PushD        $heap-first-free          
        Exchange                               
        StoreI                                 
        Label        -mmgr-remove-process-next 
        PushD        $mmgr-remove-next         
        LoadI                                  
        JumpFalse    -mmgr-remove-done         
        PushD        $mmgr-remove-prev         
        LoadI                                  
        PushD        $mmgr-remove-next         
        LoadI                                  
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -mmgr-remove-done         
        PushD        $mmgr-remove-return       
        LoadI                                  
        Return                                 
