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
        DLabel       $frame-pointer            
        DataZ        4                         
        DLabel       $stack-pointer            
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
        DLabel       $print-format-over        
        DataC        47                        %% "/"
        DataC        0                         
        DLabel       $print-format-and         
        DataC        95                        %% "_"
        DataC        0                         
        DLabel       $print-format-minus-sign  
        DataC        45                        %% "-"
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
        DLabel       $errors-rational-denominator-zero 
        DataC        114                       %% "rational can not have a zero denominator"
        DataC        97                        
        DataC        116                       
        DataC        105                       
        DataC        111                       
        DataC        110                       
        DataC        97                        
        DataC        108                       
        DataC        32                        
        DataC        99                        
        DataC        97                        
        DataC        110                       
        DataC        32                        
        DataC        110                       
        DataC        111                       
        DataC        116                       
        DataC        32                        
        DataC        104                       
        DataC        97                        
        DataC        118                       
        DataC        101                       
        DataC        32                        
        DataC        97                        
        DataC        32                        
        DataC        122                       
        DataC        101                       
        DataC        114                       
        DataC        111                       
        DataC        32                        
        DataC        100                       
        DataC        101                       
        DataC        110                       
        DataC        111                       
        DataC        109                       
        DataC        105                       
        DataC        110                       
        DataC        97                        
        DataC        116                       
        DataC        111                       
        DataC        114                       
        DataC        0                         
        DLabel       $usable-memory-start      
        DLabel       $global-memory-block      
        DataZ        8                         
        DLabel       reg1-func                 
        DataI        0                         
        DLabel       reg2-func                 
        DataI        0                         
        DLabel       reg1-system               
        DataI        0                         
        DLabel       reg2-system               
        DataI        0                         
        DLabel       reg3-system               
        DataI        0                         
        DLabel       reg4-system               
        DataI        0                         
        DLabel       reg-counter               
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
        Label        basicBlock-1              
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
        Memtop                                 
        Duplicate                              
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% llama
        Label        --expr-list--1-array-creation-begin 
        Label        --expr-list--1-array-creation-get-length 
        PushI        6                         
        Duplicate                              
        Duplicate                              
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        JumpNeg      basicBlock-2              
        Jump         basicBlock-3              
        Label        basicBlock-2              
        PushD        $$errors-array-size-negative 
        PushD        $errors-general-message   
        Printf                                 
        Halt                                   
        Label        basicBlock-3              
        PushI        4                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --expr-list--1-array-creation-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --expr-list--1-array-creation-subtype-size 
        Duplicate                              
        PushI        4                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --expr-list--1-array-creation-length 
        Duplicate                              
        PushD        reg1-system               
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --expr-list--1-array-creation-end 
        Label        --expr-list--1-array-initialization-begin 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        2                         
        Exchange                               
        PushI        20                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        3                         
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        4                         
        Exchange                               
        PushI        28                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        5                         
        Exchange                               
        PushI        32                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        6                         
        Exchange                               
        PushI        36                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --expr-list--1-array-initialization-end 
        StoreI                                 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% goat
        Duplicate                              
        Label        --copy-operator--6-array-copy-begin 
        Duplicate                              
        Label        --copy-operator--5-array-copy-begin 
        Duplicate                              
        Label        --copy-operator--4-array-copy-begin 
        Duplicate                              
        Label        --copy-operator--3-array-copy-begin 
        Duplicate                              
        Label        --copy-operator--2-array-copy-begin 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% llama
        LoadI                                  
        Duplicate                              
        PushD        reg2-system               
        Exchange                               
        StoreI                                 
        Label        --copy-operator--2-array-copy-size 
        Label        --copy-operator--2-push-array-length1 
        PushI        12                        
        Add                                    
        LoadI                                  
        Duplicate                              
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        PushI        4                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Duplicate                              
        PushD        reg3-system               
        Exchange                               
        StoreI                                 
        Label        --copy-operator--2-array-header-copy-begin 
        Label        --copy-operator--2-array-copy-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --copy-operator--2-array-copy-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --copy-operator--2-array-copy-subtype-size 
        Duplicate                              
        PushI        4                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --copy-operator--2-array-copy-length 
        Duplicate                              
        PushD        reg2-system               
        LoadI                                  
        Label        --copy-operator--2-push-array-length2 
        PushI        12                        
        Add                                    
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --copy-operator--2-array-header-copy-end 
        PushD        reg2-system               
        Duplicate                              
        LoadI                                  
        PushI        16                        
        Add                                    
        StoreI                                 
        PushD        reg3-system               
        Duplicate                              
        LoadI                                  
        PushI        16                        
        Add                                    
        StoreI                                 
        Jump         basicBlockHeader-4        
        Label        basicBlockHeader-4        
        PushD        reg1-system               
        LoadI                                  
        JumpFalse    basicBlock-6              
        Jump         basicBlock-5              
        Label        basicBlock-5              
        PushD        reg3-system               
        LoadI                                  
        PushD        reg2-system               
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        reg2-system               
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        reg3-system               
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushI        -1                        
        PushD        reg1-system               
        LoadI                                  
        Add                                    
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        Jump         basicBlockHeader-4        
        Label        basicBlock-6              
        Duplicate                              
        PushD        reg2-system               
        Exchange                               
        StoreI                                 
        Label        --copy-operator--3-array-copy-size 
        Label        --copy-operator--3-push-array-length1 
        PushI        12                        
        Add                                    
        LoadI                                  
        Duplicate                              
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        PushI        4                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Duplicate                              
        PushD        reg3-system               
        Exchange                               
        StoreI                                 
        Label        --copy-operator--3-array-header-copy-begin 
        Label        --copy-operator--3-array-copy-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --copy-operator--3-array-copy-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --copy-operator--3-array-copy-subtype-size 
        Duplicate                              
        PushI        4                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --copy-operator--3-array-copy-length 
        Duplicate                              
        PushD        reg2-system               
        LoadI                                  
        Label        --copy-operator--3-push-array-length2 
        PushI        12                        
        Add                                    
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --copy-operator--3-array-header-copy-end 
        PushD        reg2-system               
        Duplicate                              
        LoadI                                  
        PushI        16                        
        Add                                    
        StoreI                                 
        PushD        reg3-system               
        Duplicate                              
        LoadI                                  
        PushI        16                        
        Add                                    
        StoreI                                 
        Jump         basicBlockHeader-7        
        Label        basicBlockHeader-7        
        PushD        reg1-system               
        LoadI                                  
        JumpFalse    basicBlock-9              
        Jump         basicBlock-8              
        Label        basicBlock-8              
        PushD        reg3-system               
        LoadI                                  
        PushD        reg2-system               
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        reg2-system               
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        reg3-system               
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushI        -1                        
        PushD        reg1-system               
        LoadI                                  
        Add                                    
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        Jump         basicBlockHeader-7        
        Label        basicBlock-9              
        Duplicate                              
        PushD        reg2-system               
        Exchange                               
        StoreI                                 
        Label        --copy-operator--4-array-copy-size 
        Label        --copy-operator--4-push-array-length1 
        PushI        12                        
        Add                                    
        LoadI                                  
        Duplicate                              
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        PushI        4                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Duplicate                              
        PushD        reg3-system               
        Exchange                               
        StoreI                                 
        Label        --copy-operator--4-array-header-copy-begin 
        Label        --copy-operator--4-array-copy-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --copy-operator--4-array-copy-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --copy-operator--4-array-copy-subtype-size 
        Duplicate                              
        PushI        4                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --copy-operator--4-array-copy-length 
        Duplicate                              
        PushD        reg2-system               
        LoadI                                  
        Label        --copy-operator--4-push-array-length2 
        PushI        12                        
        Add                                    
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --copy-operator--4-array-header-copy-end 
        PushD        reg2-system               
        Duplicate                              
        LoadI                                  
        PushI        16                        
        Add                                    
        StoreI                                 
        PushD        reg3-system               
        Duplicate                              
        LoadI                                  
        PushI        16                        
        Add                                    
        StoreI                                 
        Jump         basicBlockHeader-10       
        Label        basicBlockHeader-10       
        PushD        reg1-system               
        LoadI                                  
        JumpFalse    basicBlock-12             
        Jump         basicBlock-11             
        Label        basicBlock-11             
        PushD        reg3-system               
        LoadI                                  
        PushD        reg2-system               
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        reg2-system               
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        reg3-system               
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushI        -1                        
        PushD        reg1-system               
        LoadI                                  
        Add                                    
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        Jump         basicBlockHeader-10       
        Label        basicBlock-12             
        Duplicate                              
        PushD        reg2-system               
        Exchange                               
        StoreI                                 
        Label        --copy-operator--5-array-copy-size 
        Label        --copy-operator--5-push-array-length1 
        PushI        12                        
        Add                                    
        LoadI                                  
        Duplicate                              
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        PushI        4                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Duplicate                              
        PushD        reg3-system               
        Exchange                               
        StoreI                                 
        Label        --copy-operator--5-array-header-copy-begin 
        Label        --copy-operator--5-array-copy-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --copy-operator--5-array-copy-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --copy-operator--5-array-copy-subtype-size 
        Duplicate                              
        PushI        4                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --copy-operator--5-array-copy-length 
        Duplicate                              
        PushD        reg2-system               
        LoadI                                  
        Label        --copy-operator--5-push-array-length2 
        PushI        12                        
        Add                                    
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --copy-operator--5-array-header-copy-end 
        PushD        reg2-system               
        Duplicate                              
        LoadI                                  
        PushI        16                        
        Add                                    
        StoreI                                 
        PushD        reg3-system               
        Duplicate                              
        LoadI                                  
        PushI        16                        
        Add                                    
        StoreI                                 
        Jump         basicBlockHeader-13       
        Label        basicBlockHeader-13       
        PushD        reg1-system               
        LoadI                                  
        JumpFalse    basicBlock-15             
        Jump         basicBlock-14             
        Label        basicBlock-14             
        PushD        reg3-system               
        LoadI                                  
        PushD        reg2-system               
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        reg2-system               
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        reg3-system               
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushI        -1                        
        PushD        reg1-system               
        LoadI                                  
        Add                                    
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        Jump         basicBlockHeader-13       
        Label        basicBlock-15             
        Duplicate                              
        PushD        reg2-system               
        Exchange                               
        StoreI                                 
        Label        --copy-operator--6-array-copy-size 
        Label        --copy-operator--6-push-array-length1 
        PushI        12                        
        Add                                    
        LoadI                                  
        Duplicate                              
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        PushI        4                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Duplicate                              
        PushD        reg3-system               
        Exchange                               
        StoreI                                 
        Label        --copy-operator--6-array-header-copy-begin 
        Label        --copy-operator--6-array-copy-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --copy-operator--6-array-copy-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --copy-operator--6-array-copy-subtype-size 
        Duplicate                              
        PushI        4                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --copy-operator--6-array-copy-length 
        Duplicate                              
        PushD        reg2-system               
        LoadI                                  
        Label        --copy-operator--6-push-array-length2 
        PushI        12                        
        Add                                    
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --copy-operator--6-array-header-copy-end 
        PushD        reg2-system               
        Duplicate                              
        LoadI                                  
        PushI        16                        
        Add                                    
        StoreI                                 
        PushD        reg3-system               
        Duplicate                              
        LoadI                                  
        PushI        16                        
        Add                                    
        StoreI                                 
        Jump         basicBlockHeader-16       
        Label        basicBlockHeader-16       
        PushD        reg1-system               
        LoadI                                  
        JumpFalse    basicBlock-18             
        Jump         basicBlock-17             
        Label        basicBlock-17             
        PushD        reg3-system               
        LoadI                                  
        PushD        reg2-system               
        LoadI                                  
        LoadI                                  
        StoreI                                 
        PushD        reg2-system               
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        reg3-system               
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushI        -1                        
        PushD        reg1-system               
        LoadI                                  
        Add                                    
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        Jump         basicBlockHeader-16       
        Label        basicBlock-18             
        PushI        12                        
        Add                                    
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% goat
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Halt                                   
        Label        basicBlock-19             
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
        Label        basicBlock-20             
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
        Label        basicBlock-21             
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
        Jump         basicBlockHeader-22       
        Label        basicBlockHeader-22       
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        JumpFalse    basicBlock-27             
        Jump         basicBlock-23             
        Label        basicBlock-23             
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
        JumpPos      basicBlock-25             
        Jump         basicBlock-24             
        Label        basicBlock-24             
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
        Jump         basicBlockHeader-22       
        Label        basicBlock-25             
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
        JumpNeg      basicBlock-28             
        Jump         basicBlock-26             
        Label        basicBlock-26             
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
        Jump         basicBlock-28             
        Label        basicBlock-27             
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
        Jump         basicBlock-28             
        Label        basicBlock-28             
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        PushI        9                         
        Add                                    
        PushD        $mmgr-alloc-return        
        LoadI                                  
        Return                                 
        Label        basicBlock-29             
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
        Label        basicBlock-30             
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
        JumpFalse    basicBlock-32             
        Jump         basicBlock-31             
        Label        basicBlock-31             
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
        Jump         basicBlock-33             
        Label        basicBlock-32             
        PushD        $mmgr-remove-next         
        LoadI                                  
        PushD        $heap-first-free          
        Exchange                               
        StoreI                                 
        Jump         basicBlock-33             
        Label        basicBlock-33             
        PushD        $mmgr-remove-next         
        LoadI                                  
        JumpFalse    basicBlock-35             
        Jump         basicBlock-34             
        Label        basicBlock-34             
        PushD        $mmgr-remove-prev         
        LoadI                                  
        PushD        $mmgr-remove-next         
        LoadI                                  
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Jump         basicBlock-35             
        Label        basicBlock-35             
        PushD        $mmgr-remove-return       
        LoadI                                  
        Return                                 
