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
        DLabel       $$errors-array-index-negative 
        DataC        97                        %% "array index cannot be negative"
        DataC        114                       
        DataC        114                       
        DataC        97                        
        DataC        121                       
        DataC        32                        
        DataC        105                       
        DataC        110                       
        DataC        100                       
        DataC        101                       
        DataC        120                       
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
        DLabel       $$errors-index-exceed-bound 
        DataC        105                       %% "index exceed array length"
        DataC        110                       
        DataC        100                       
        DataC        101                       
        DataC        120                       
        DataC        32                        
        DataC        101                       
        DataC        120                       
        DataC        99                        
        DataC        101                       
        DataC        101                       
        DataC        100                       
        DataC        32                        
        DataC        97                        
        DataC        114                       
        DataC        114                       
        DataC        97                        
        DataC        121                       
        DataC        32                        
        DataC        108                       
        DataC        101                       
        DataC        110                       
        DataC        103                       
        DataC        116                       
        DataC        104                       
        DataC        0                         
        DLabel       $usable-memory-start      
        DLabel       $global-memory-block      
        DataZ        4                         
        DLabel       --array-indexing--2-memory-pointer 
        DataI        0                         
        DLabel       --array-indexing--3-memory-pointer 
        DataI        0                         
        DLabel       --array-indexing--4-memory-pointer 
        DataI        0                         
        DLabel       --array-indexing--5-memory-pointer 
        DataI        0                         
        DLabel       --array-indexing--6-memory-pointer 
        DataI        0                         
        DLabel       --array-indexing--7-memory-pointer 
        DataI        0                         
        DLabel       --array-indexing--8-memory-pointer 
        DataI        0                         
        DLabel       --array-indexing--9-memory-pointer 
        DataI        0                         
        DLabel       --array-indexing--10-memory-pointer 
        DataI        0                         
        DLabel       --array-indexing--11-memory-pointer 
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
        Label        $$array-index-negative    
        PushD        $$errors-array-index-negative 
        Jump         $$general-runtime-error   
        Label        $$array-index-exceed-bound 
        PushD        $$errors-index-exceed-bound 
        Jump         $$general-runtime-error   
        Label        $$main                    
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        Label        -empty-array-creation-1-array-creation-begin 
        Label        -empty-array-creation-1-array-creation-get-length 
        PushI        5                         
        Duplicate                              
        JumpNeg      $$array-size-negative     
        Label        -empty-array-creation-1-array-creation-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        -empty-array-creation-1-array-creation-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -empty-array-creation-1-array-creation-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -empty-array-creation-1-array-creation-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -empty-array-creation-1-array-creation-length 
        Duplicate                              
        PushI        5                         
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -empty-array-creation-1-array-creation-end 
        StoreI                                 
        Label        --array-indexing--2-array-index-begin 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        Duplicate                              
        PushI        0                         
        Duplicate                              
        PushD        --array-indexing--2-memory-pointer 
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpNeg      $$array-index-negative    
        Exchange                               
        Label        --array-indexing--2-array-length 
        PushI        12                        
        Add                                    
        LoadI                                  
        Exchange                               
        Subtract                               
        JumpPos      --array-indexing--2-array-index-fetching-begin 
        Jump         $$array-index-exceed-bound 
        Label        --array-indexing--2-array-index-fetching-begin 
        PushI        16                        
        Add                                    
        PushD        --array-indexing--2-memory-pointer 
        LoadI                                  
        PushI        8                         
        Multiply                               
        Add                                    
        Label        --array-indexing--2-array-index-fetching-end 
        Label        --array-indexing--2-array-index-end 
        PushF        0.900000                  
        StoreF                                 
        Label        --array-indexing--3-array-index-begin 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        Duplicate                              
        PushI        1                         
        Duplicate                              
        PushD        --array-indexing--3-memory-pointer 
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpNeg      $$array-index-negative    
        Exchange                               
        Label        --array-indexing--3-array-length 
        PushI        12                        
        Add                                    
        LoadI                                  
        Exchange                               
        Subtract                               
        JumpPos      --array-indexing--3-array-index-fetching-begin 
        Jump         $$array-index-exceed-bound 
        Label        --array-indexing--3-array-index-fetching-begin 
        PushI        16                        
        Add                                    
        PushD        --array-indexing--3-memory-pointer 
        LoadI                                  
        PushI        8                         
        Multiply                               
        Add                                    
        Label        --array-indexing--3-array-index-fetching-end 
        Label        --array-indexing--3-array-index-end 
        PushF        0.910000                  
        StoreF                                 
        Label        --array-indexing--4-array-index-begin 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        Duplicate                              
        PushI        2                         
        Duplicate                              
        PushD        --array-indexing--4-memory-pointer 
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpNeg      $$array-index-negative    
        Exchange                               
        Label        --array-indexing--4-array-length 
        PushI        12                        
        Add                                    
        LoadI                                  
        Exchange                               
        Subtract                               
        JumpPos      --array-indexing--4-array-index-fetching-begin 
        Jump         $$array-index-exceed-bound 
        Label        --array-indexing--4-array-index-fetching-begin 
        PushI        16                        
        Add                                    
        PushD        --array-indexing--4-memory-pointer 
        LoadI                                  
        PushI        8                         
        Multiply                               
        Add                                    
        Label        --array-indexing--4-array-index-fetching-end 
        Label        --array-indexing--4-array-index-end 
        PushF        0.920000                  
        StoreF                                 
        Label        --array-indexing--5-array-index-begin 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        Duplicate                              
        PushI        3                         
        Duplicate                              
        PushD        --array-indexing--5-memory-pointer 
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpNeg      $$array-index-negative    
        Exchange                               
        Label        --array-indexing--5-array-length 
        PushI        12                        
        Add                                    
        LoadI                                  
        Exchange                               
        Subtract                               
        JumpPos      --array-indexing--5-array-index-fetching-begin 
        Jump         $$array-index-exceed-bound 
        Label        --array-indexing--5-array-index-fetching-begin 
        PushI        16                        
        Add                                    
        PushD        --array-indexing--5-memory-pointer 
        LoadI                                  
        PushI        8                         
        Multiply                               
        Add                                    
        Label        --array-indexing--5-array-index-fetching-end 
        Label        --array-indexing--5-array-index-end 
        PushF        0.930000                  
        StoreF                                 
        Label        --array-indexing--6-array-index-begin 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        Duplicate                              
        PushI        4                         
        Duplicate                              
        PushD        --array-indexing--6-memory-pointer 
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpNeg      $$array-index-negative    
        Exchange                               
        Label        --array-indexing--6-array-length 
        PushI        12                        
        Add                                    
        LoadI                                  
        Exchange                               
        Subtract                               
        JumpPos      --array-indexing--6-array-index-fetching-begin 
        Jump         $$array-index-exceed-bound 
        Label        --array-indexing--6-array-index-fetching-begin 
        PushI        16                        
        Add                                    
        PushD        --array-indexing--6-memory-pointer 
        LoadI                                  
        PushI        8                         
        Multiply                               
        Add                                    
        Label        --array-indexing--6-array-index-fetching-end 
        Label        --array-indexing--6-array-index-end 
        PushF        0.940000                  
        StoreF                                 
        Label        --array-indexing--7-array-index-begin 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        Duplicate                              
        PushI        0                         
        Duplicate                              
        PushD        --array-indexing--7-memory-pointer 
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpNeg      $$array-index-negative    
        Exchange                               
        Label        --array-indexing--7-array-length 
        PushI        12                        
        Add                                    
        LoadI                                  
        Exchange                               
        Subtract                               
        JumpPos      --array-indexing--7-array-index-fetching-begin 
        Jump         $$array-index-exceed-bound 
        Label        --array-indexing--7-array-index-fetching-begin 
        PushI        16                        
        Add                                    
        PushD        --array-indexing--7-memory-pointer 
        LoadI                                  
        PushI        8                         
        Multiply                               
        Add                                    
        Label        --array-indexing--7-array-index-fetching-end 
        Label        --array-indexing--7-array-index-end 
        LoadF                                  
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        Label        --array-indexing--8-array-index-begin 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        Duplicate                              
        PushI        1                         
        Duplicate                              
        PushD        --array-indexing--8-memory-pointer 
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpNeg      $$array-index-negative    
        Exchange                               
        Label        --array-indexing--8-array-length 
        PushI        12                        
        Add                                    
        LoadI                                  
        Exchange                               
        Subtract                               
        JumpPos      --array-indexing--8-array-index-fetching-begin 
        Jump         $$array-index-exceed-bound 
        Label        --array-indexing--8-array-index-fetching-begin 
        PushI        16                        
        Add                                    
        PushD        --array-indexing--8-memory-pointer 
        LoadI                                  
        PushI        8                         
        Multiply                               
        Add                                    
        Label        --array-indexing--8-array-index-fetching-end 
        Label        --array-indexing--8-array-index-end 
        LoadF                                  
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        Label        --array-indexing--9-array-index-begin 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        Duplicate                              
        PushI        2                         
        Duplicate                              
        PushD        --array-indexing--9-memory-pointer 
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpNeg      $$array-index-negative    
        Exchange                               
        Label        --array-indexing--9-array-length 
        PushI        12                        
        Add                                    
        LoadI                                  
        Exchange                               
        Subtract                               
        JumpPos      --array-indexing--9-array-index-fetching-begin 
        Jump         $$array-index-exceed-bound 
        Label        --array-indexing--9-array-index-fetching-begin 
        PushI        16                        
        Add                                    
        PushD        --array-indexing--9-memory-pointer 
        LoadI                                  
        PushI        8                         
        Multiply                               
        Add                                    
        Label        --array-indexing--9-array-index-fetching-end 
        Label        --array-indexing--9-array-index-end 
        LoadF                                  
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        Label        --array-indexing--10-array-index-begin 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        Duplicate                              
        PushI        3                         
        Duplicate                              
        PushD        --array-indexing--10-memory-pointer 
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpNeg      $$array-index-negative    
        Exchange                               
        Label        --array-indexing--10-array-length 
        PushI        12                        
        Add                                    
        LoadI                                  
        Exchange                               
        Subtract                               
        JumpPos      --array-indexing--10-array-index-fetching-begin 
        Jump         $$array-index-exceed-bound 
        Label        --array-indexing--10-array-index-fetching-begin 
        PushI        16                        
        Add                                    
        PushD        --array-indexing--10-memory-pointer 
        LoadI                                  
        PushI        8                         
        Multiply                               
        Add                                    
        Label        --array-indexing--10-array-index-fetching-end 
        Label        --array-indexing--10-array-index-end 
        LoadF                                  
        PushD        $print-format-floating    
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        Label        --array-indexing--11-array-index-begin 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        Duplicate                              
        PushI        4                         
        Duplicate                              
        PushD        --array-indexing--11-memory-pointer 
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpNeg      $$array-index-negative    
        Exchange                               
        Label        --array-indexing--11-array-length 
        PushI        12                        
        Add                                    
        LoadI                                  
        Exchange                               
        Subtract                               
        JumpPos      --array-indexing--11-array-index-fetching-begin 
        Jump         $$array-index-exceed-bound 
        Label        --array-indexing--11-array-index-fetching-begin 
        PushI        16                        
        Add                                    
        PushD        --array-indexing--11-memory-pointer 
        LoadI                                  
        PushI        8                         
        Multiply                               
        Add                                    
        Label        --array-indexing--11-array-index-fetching-end 
        Label        --array-indexing--11-array-index-end 
        LoadF                                  
        PushD        $print-format-floating    
        Printf                                 
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
