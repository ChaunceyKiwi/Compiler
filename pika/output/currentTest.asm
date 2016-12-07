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
        DLabel       $lambda-type-string       
        DataC        60                        %% "<lambda>"
        DataC        108                       
        DataC        97                        
        DataC        109                       
        DataC        98                        
        DataC        100                       
        DataC        97                        
        DataC        62                        
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
        DLabel       $errors-fold-operator-array-zero-length 
        DataC        102                       %% "fold operator cannot have a zero length array"
        DataC        111                       
        DataC        108                       
        DataC        100                       
        DataC        32                        
        DataC        111                       
        DataC        112                       
        DataC        101                       
        DataC        114                       
        DataC        97                        
        DataC        116                       
        DataC        111                       
        DataC        114                       
        DataC        32                        
        DataC        99                        
        DataC        97                        
        DataC        110                       
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
        DataC        108                       
        DataC        101                       
        DataC        110                       
        DataC        103                       
        DataC        116                       
        DataC        104                       
        DataC        32                        
        DataC        97                        
        DataC        114                       
        DataC        114                       
        DataC        97                        
        DataC        121                       
        DataC        0                         
        DLabel       $usable-memory-start      
        DLabel       $global-memory-block      
        DataZ        8                         
        DLabel       register1                 
        DataI        0                         
        DLabel       register2                 
        DataI        0                         
        DLabel       register3                 
        DataI        0                         
        DLabel       register4                 
        DataI        0                         
        DLabel       register5                 
        DataI        0                         
        DLabel       register6                 
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
        Memtop                                 
        Duplicate                              
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
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
        Label        $$rational-denominator-zero 
        PushD        $errors-rational-denominator-zero 
        Jump         $$general-runtime-error   
        Label        $$fold-operator-array-zero-length 
        PushD        $errors-fold-operator-array-zero-length 
        Jump         $$general-runtime-error   
        Label        $$main                    
        Label        -compare-5-arg1           
        Label        --array-creation--1--begin 
        Label        --array-creation--1-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--1-backup-reg-end 
        Label        --array-creation--1--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--1-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--1-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--1-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--1-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--1-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--1-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--1-restore-reg-end 
        Label        --array-creation--1--end  
        Label        --array-initialization--2-array-initialization-begin 
        Duplicate                              
        PushF        1.00000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        9.50000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--2-array-initialization-end 
        Label        -compare-5-arg2           
        Label        --array-creation--3--begin 
        Label        --array-creation--3-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--3-backup-reg-end 
        Label        --array-creation--3--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--3-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--3-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--3-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--3-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--3-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--3-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--3-restore-reg-end 
        Label        --array-creation--3--end  
        Label        --array-initialization--4-array-initialization-begin 
        Duplicate                              
        PushF        7.90000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        8.30000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--4-array-initialization-end 
        Label        -compare-5-sub            
        Subtract                               
        JumpFalse    -compare-5-true           
        Jump         -compare-5-false          
        Label        -compare-5-true           
        PushI        1                         
        Jump         -compare-5-join           
        Label        -compare-5-false          
        PushI        0                         
        Jump         -compare-5-join           
        Label        -compare-5-join           
        JumpTrue     -print-boolean-6-true     
        PushD        $boolean-false-string     
        Jump         -print-boolean-6-join     
        Label        -print-boolean-6-true     
        PushD        $boolean-true-string      
        Label        -print-boolean-6-join     
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -compare-11-arg1          
        Label        --array-creation--7--begin 
        Label        --array-creation--7-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--7-backup-reg-end 
        Label        --array-creation--7--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--7-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--7-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--7-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--7-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--7-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--7-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--7-restore-reg-end 
        Label        --array-creation--7--end  
        Label        --array-initialization--8-array-initialization-begin 
        Duplicate                              
        PushF        9.70000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        5.40000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--8-array-initialization-end 
        Label        -compare-11-arg2          
        Label        --array-creation--9--begin 
        Label        --array-creation--9-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--9-backup-reg-end 
        Label        --array-creation--9--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--9-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--9-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--9-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--9-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--9-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--9-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--9-restore-reg-end 
        Label        --array-creation--9--end  
        Label        --array-initialization--10-array-initialization-begin 
        Duplicate                              
        PushF        6.70000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        6.80000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--10-array-initialization-end 
        Label        -compare-11-sub           
        Subtract                               
        JumpFalse    -compare-11-true          
        Jump         -compare-11-false         
        Label        -compare-11-true          
        PushI        1                         
        Jump         -compare-11-join          
        Label        -compare-11-false         
        PushI        0                         
        Jump         -compare-11-join          
        Label        -compare-11-join          
        JumpTrue     -print-boolean-12-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-12-join    
        Label        -print-boolean-12-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-12-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -compare-17-arg1          
        Label        --array-creation--13--begin 
        Label        --array-creation--13-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--13-backup-reg-end 
        Label        --array-creation--13--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--13-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--13-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--13-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--13-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--13-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--13-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--13-restore-reg-end 
        Label        --array-creation--13--end 
        Label        --array-initialization--14-array-initialization-begin 
        Duplicate                              
        PushF        6.00000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        3.50000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--14-array-initialization-end 
        Label        -compare-17-arg2          
        Label        --array-creation--15--begin 
        Label        --array-creation--15-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--15-backup-reg-end 
        Label        --array-creation--15--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--15-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--15-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--15-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--15-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--15-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--15-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--15-restore-reg-end 
        Label        --array-creation--15--end 
        Label        --array-initialization--16-array-initialization-begin 
        Duplicate                              
        PushF        9.30000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        7.50000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--16-array-initialization-end 
        Label        -compare-17-sub           
        Subtract                               
        JumpFalse    -compare-17-true          
        Jump         -compare-17-false         
        Label        -compare-17-true          
        PushI        1                         
        Jump         -compare-17-join          
        Label        -compare-17-false         
        PushI        0                         
        Jump         -compare-17-join          
        Label        -compare-17-join          
        JumpTrue     -print-boolean-18-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-18-join    
        Label        -print-boolean-18-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-18-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -compare-23-arg1          
        Label        --array-creation--19--begin 
        Label        --array-creation--19-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--19-backup-reg-end 
        Label        --array-creation--19--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--19-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--19-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--19-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--19-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--19-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--19-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--19-restore-reg-end 
        Label        --array-creation--19--end 
        Label        --array-initialization--20-array-initialization-begin 
        Duplicate                              
        PushF        2.70000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        9.70000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--20-array-initialization-end 
        Label        -compare-23-arg2          
        Label        --array-creation--21--begin 
        Label        --array-creation--21-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--21-backup-reg-end 
        Label        --array-creation--21--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--21-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--21-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--21-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--21-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--21-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--21-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--21-restore-reg-end 
        Label        --array-creation--21--end 
        Label        --array-initialization--22-array-initialization-begin 
        Duplicate                              
        PushF        1.20000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        2.10000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--22-array-initialization-end 
        Label        -compare-23-sub           
        Subtract                               
        JumpFalse    -compare-23-true          
        Jump         -compare-23-false         
        Label        -compare-23-true          
        PushI        1                         
        Jump         -compare-23-join          
        Label        -compare-23-false         
        PushI        0                         
        Jump         -compare-23-join          
        Label        -compare-23-join          
        JumpTrue     -print-boolean-24-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-24-join    
        Label        -print-boolean-24-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-24-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -compare-29-arg1          
        Label        --array-creation--25--begin 
        Label        --array-creation--25-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--25-backup-reg-end 
        Label        --array-creation--25--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--25-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--25-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--25-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--25-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--25-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--25-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--25-restore-reg-end 
        Label        --array-creation--25--end 
        Label        --array-initialization--26-array-initialization-begin 
        Duplicate                              
        PushF        5.90000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        1.00000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--26-array-initialization-end 
        Label        -compare-29-arg2          
        Label        --array-creation--27--begin 
        Label        --array-creation--27-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--27-backup-reg-end 
        Label        --array-creation--27--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--27-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--27-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--27-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--27-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--27-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--27-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--27-restore-reg-end 
        Label        --array-creation--27--end 
        Label        --array-initialization--28-array-initialization-begin 
        Duplicate                              
        PushF        5.50000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        7.00000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--28-array-initialization-end 
        Label        -compare-29-sub           
        Subtract                               
        JumpFalse    -compare-29-true          
        Jump         -compare-29-false         
        Label        -compare-29-true          
        PushI        1                         
        Jump         -compare-29-join          
        Label        -compare-29-false         
        PushI        0                         
        Jump         -compare-29-join          
        Label        -compare-29-join          
        JumpTrue     -print-boolean-30-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-30-join    
        Label        -print-boolean-30-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-30-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -compare-35-arg1          
        Label        --array-creation--31--begin 
        Label        --array-creation--31-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--31-backup-reg-end 
        Label        --array-creation--31--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--31-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--31-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--31-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--31-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--31-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--31-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--31-restore-reg-end 
        Label        --array-creation--31--end 
        Label        --array-initialization--32-array-initialization-begin 
        Duplicate                              
        PushF        7.50000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        6.00000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--32-array-initialization-end 
        Label        -compare-35-arg2          
        Label        --array-creation--33--begin 
        Label        --array-creation--33-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--33-backup-reg-end 
        Label        --array-creation--33--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--33-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--33-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--33-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--33-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--33-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--33-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--33-restore-reg-end 
        Label        --array-creation--33--end 
        Label        --array-initialization--34-array-initialization-begin 
        Duplicate                              
        PushF        4.00000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        9.10000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--34-array-initialization-end 
        Label        -compare-35-sub           
        Subtract                               
        JumpFalse    -compare-35-true          
        Jump         -compare-35-false         
        Label        -compare-35-true          
        PushI        1                         
        Jump         -compare-35-join          
        Label        -compare-35-false         
        PushI        0                         
        Jump         -compare-35-join          
        Label        -compare-35-join          
        JumpTrue     -print-boolean-36-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-36-join    
        Label        -print-boolean-36-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-36-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -compare-41-arg1          
        Label        --array-creation--37--begin 
        Label        --array-creation--37-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--37-backup-reg-end 
        Label        --array-creation--37--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--37-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--37-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--37-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--37-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--37-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--37-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--37-restore-reg-end 
        Label        --array-creation--37--end 
        Label        --array-initialization--38-array-initialization-begin 
        Duplicate                              
        PushF        5.90000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        2.80000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--38-array-initialization-end 
        Label        -compare-41-arg2          
        Label        --array-creation--39--begin 
        Label        --array-creation--39-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--39-backup-reg-end 
        Label        --array-creation--39--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--39-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--39-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--39-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--39-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--39-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--39-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--39-restore-reg-end 
        Label        --array-creation--39--end 
        Label        --array-initialization--40-array-initialization-begin 
        Duplicate                              
        PushF        3.30000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        6.50000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--40-array-initialization-end 
        Label        -compare-41-sub           
        Subtract                               
        JumpFalse    -compare-41-true          
        Jump         -compare-41-false         
        Label        -compare-41-true          
        PushI        1                         
        Jump         -compare-41-join          
        Label        -compare-41-false         
        PushI        0                         
        Jump         -compare-41-join          
        Label        -compare-41-join          
        JumpTrue     -print-boolean-42-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-42-join    
        Label        -print-boolean-42-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-42-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -compare-47-arg1          
        Label        --array-creation--43--begin 
        Label        --array-creation--43-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--43-backup-reg-end 
        Label        --array-creation--43--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--43-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--43-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--43-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--43-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--43-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--43-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--43-restore-reg-end 
        Label        --array-creation--43--end 
        Label        --array-initialization--44-array-initialization-begin 
        Duplicate                              
        PushF        5.70000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        4.50000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--44-array-initialization-end 
        Label        -compare-47-arg2          
        Label        --array-creation--45--begin 
        Label        --array-creation--45-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--45-backup-reg-end 
        Label        --array-creation--45--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--45-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--45-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--45-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--45-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--45-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--45-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--45-restore-reg-end 
        Label        --array-creation--45--end 
        Label        --array-initialization--46-array-initialization-begin 
        Duplicate                              
        PushF        9.00000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        6.50000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--46-array-initialization-end 
        Label        -compare-47-sub           
        Subtract                               
        JumpFalse    -compare-47-true          
        Jump         -compare-47-false         
        Label        -compare-47-true          
        PushI        1                         
        Jump         -compare-47-join          
        Label        -compare-47-false         
        PushI        0                         
        Jump         -compare-47-join          
        Label        -compare-47-join          
        JumpTrue     -print-boolean-48-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-48-join    
        Label        -print-boolean-48-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-48-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -compare-53-arg1          
        Label        --array-creation--49--begin 
        Label        --array-creation--49-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--49-backup-reg-end 
        Label        --array-creation--49--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--49-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--49-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--49-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--49-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--49-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--49-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--49-restore-reg-end 
        Label        --array-creation--49--end 
        Label        --array-initialization--50-array-initialization-begin 
        Duplicate                              
        PushF        3.20000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        9.30000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--50-array-initialization-end 
        Label        -compare-53-arg2          
        Label        --array-creation--51--begin 
        Label        --array-creation--51-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--51-backup-reg-end 
        Label        --array-creation--51--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--51-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--51-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--51-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--51-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--51-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--51-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--51-restore-reg-end 
        Label        --array-creation--51--end 
        Label        --array-initialization--52-array-initialization-begin 
        Duplicate                              
        PushF        6.00000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        6.80000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--52-array-initialization-end 
        Label        -compare-53-sub           
        Subtract                               
        JumpFalse    -compare-53-true          
        Jump         -compare-53-false         
        Label        -compare-53-true          
        PushI        1                         
        Jump         -compare-53-join          
        Label        -compare-53-false         
        PushI        0                         
        Jump         -compare-53-join          
        Label        -compare-53-join          
        JumpTrue     -print-boolean-54-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-54-join    
        Label        -print-boolean-54-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-54-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -compare-59-arg1          
        Label        --array-creation--55--begin 
        Label        --array-creation--55-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--55-backup-reg-end 
        Label        --array-creation--55--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--55-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--55-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--55-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--55-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--55-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--55-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--55-restore-reg-end 
        Label        --array-creation--55--end 
        Label        --array-initialization--56-array-initialization-begin 
        Duplicate                              
        PushF        4.80000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        3.90000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--56-array-initialization-end 
        Label        -compare-59-arg2          
        Label        --array-creation--57--begin 
        Label        --array-creation--57-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--57-backup-reg-end 
        Label        --array-creation--57--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--57-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--57-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--57-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--57-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--57-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--57-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--57-restore-reg-end 
        Label        --array-creation--57--end 
        Label        --array-initialization--58-array-initialization-begin 
        Duplicate                              
        PushF        8.40000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        3.80000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--58-array-initialization-end 
        Label        -compare-59-sub           
        Subtract                               
        JumpFalse    -compare-59-true          
        Jump         -compare-59-false         
        Label        -compare-59-true          
        PushI        1                         
        Jump         -compare-59-join          
        Label        -compare-59-false         
        PushI        0                         
        Jump         -compare-59-join          
        Label        -compare-59-join          
        JumpTrue     -print-boolean-60-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-60-join    
        Label        -print-boolean-60-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-60-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -compare-65-arg1          
        Label        --array-creation--61--begin 
        Label        --array-creation--61-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--61-backup-reg-end 
        Label        --array-creation--61--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--61-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--61-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--61-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--61-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--61-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--61-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--61-restore-reg-end 
        Label        --array-creation--61--end 
        Label        --array-initialization--62-array-initialization-begin 
        Duplicate                              
        PushF        9.40000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        7.30000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--62-array-initialization-end 
        Label        -compare-65-arg2          
        Label        --array-creation--63--begin 
        Label        --array-creation--63-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--63-backup-reg-end 
        Label        --array-creation--63--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--63-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--63-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--63-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--63-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--63-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--63-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--63-restore-reg-end 
        Label        --array-creation--63--end 
        Label        --array-initialization--64-array-initialization-begin 
        Duplicate                              
        PushF        7.90000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        7.70000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--64-array-initialization-end 
        Label        -compare-65-sub           
        Subtract                               
        JumpFalse    -compare-65-true          
        Jump         -compare-65-false         
        Label        -compare-65-true          
        PushI        1                         
        Jump         -compare-65-join          
        Label        -compare-65-false         
        PushI        0                         
        Jump         -compare-65-join          
        Label        -compare-65-join          
        JumpTrue     -print-boolean-66-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-66-join    
        Label        -print-boolean-66-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-66-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -compare-71-arg1          
        Label        --array-creation--67--begin 
        Label        --array-creation--67-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--67-backup-reg-end 
        Label        --array-creation--67--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--67-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--67-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--67-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--67-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--67-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--67-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--67-restore-reg-end 
        Label        --array-creation--67--end 
        Label        --array-initialization--68-array-initialization-begin 
        Duplicate                              
        PushF        7.70000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        3.80000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--68-array-initialization-end 
        Label        -compare-71-arg2          
        Label        --array-creation--69--begin 
        Label        --array-creation--69-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--69-backup-reg-end 
        Label        --array-creation--69--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--69-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--69-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--69-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--69-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--69-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--69-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--69-restore-reg-end 
        Label        --array-creation--69--end 
        Label        --array-initialization--70-array-initialization-begin 
        Duplicate                              
        PushF        1.70000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        4.40000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--70-array-initialization-end 
        Label        -compare-71-sub           
        Subtract                               
        JumpFalse    -compare-71-true          
        Jump         -compare-71-false         
        Label        -compare-71-true          
        PushI        1                         
        Jump         -compare-71-join          
        Label        -compare-71-false         
        PushI        0                         
        Jump         -compare-71-join          
        Label        -compare-71-join          
        JumpTrue     -print-boolean-72-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-72-join    
        Label        -print-boolean-72-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-72-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -compare-77-arg1          
        Label        --array-creation--73--begin 
        Label        --array-creation--73-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--73-backup-reg-end 
        Label        --array-creation--73--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--73-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--73-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--73-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--73-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--73-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--73-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--73-restore-reg-end 
        Label        --array-creation--73--end 
        Label        --array-initialization--74-array-initialization-begin 
        Duplicate                              
        PushF        5.10000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        7.90000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--74-array-initialization-end 
        Label        -compare-77-arg2          
        Label        --array-creation--75--begin 
        Label        --array-creation--75-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--75-backup-reg-end 
        Label        --array-creation--75--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--75-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--75-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--75-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--75-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--75-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--75-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--75-restore-reg-end 
        Label        --array-creation--75--end 
        Label        --array-initialization--76-array-initialization-begin 
        Duplicate                              
        PushF        4.60000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        1.70000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--76-array-initialization-end 
        Label        -compare-77-sub           
        Subtract                               
        JumpFalse    -compare-77-true          
        Jump         -compare-77-false         
        Label        -compare-77-true          
        PushI        1                         
        Jump         -compare-77-join          
        Label        -compare-77-false         
        PushI        0                         
        Jump         -compare-77-join          
        Label        -compare-77-join          
        JumpTrue     -print-boolean-78-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-78-join    
        Label        -print-boolean-78-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-78-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -compare-83-arg1          
        Label        --array-creation--79--begin 
        Label        --array-creation--79-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--79-backup-reg-end 
        Label        --array-creation--79--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--79-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--79-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--79-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--79-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--79-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--79-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--79-restore-reg-end 
        Label        --array-creation--79--end 
        Label        --array-initialization--80-array-initialization-begin 
        Duplicate                              
        PushF        3.10000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        7.30000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--80-array-initialization-end 
        Label        -compare-83-arg2          
        Label        --array-creation--81--begin 
        Label        --array-creation--81-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--81-backup-reg-end 
        Label        --array-creation--81--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--81-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--81-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--81-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--81-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--81-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--81-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--81-restore-reg-end 
        Label        --array-creation--81--end 
        Label        --array-initialization--82-array-initialization-begin 
        Duplicate                              
        PushF        1.80000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        4.00000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--82-array-initialization-end 
        Label        -compare-83-sub           
        Subtract                               
        JumpFalse    -compare-83-true          
        Jump         -compare-83-false         
        Label        -compare-83-true          
        PushI        1                         
        Jump         -compare-83-join          
        Label        -compare-83-false         
        PushI        0                         
        Jump         -compare-83-join          
        Label        -compare-83-join          
        JumpTrue     -print-boolean-84-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-84-join    
        Label        -print-boolean-84-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-84-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -compare-89-arg1          
        Label        --array-creation--85--begin 
        Label        --array-creation--85-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--85-backup-reg-end 
        Label        --array-creation--85--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--85-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--85-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--85-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--85-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--85-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--85-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--85-restore-reg-end 
        Label        --array-creation--85--end 
        Label        --array-initialization--86-array-initialization-begin 
        Duplicate                              
        PushF        6.10000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        8.20000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--86-array-initialization-end 
        Label        -compare-89-arg2          
        Label        --array-creation--87--begin 
        Label        --array-creation--87-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--87-backup-reg-end 
        Label        --array-creation--87--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--87-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--87-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--87-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--87-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--87-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--87-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--87-restore-reg-end 
        Label        --array-creation--87--end 
        Label        --array-initialization--88-array-initialization-begin 
        Duplicate                              
        PushF        4.20000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        5.50000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--88-array-initialization-end 
        Label        -compare-89-sub           
        Subtract                               
        JumpFalse    -compare-89-true          
        Jump         -compare-89-false         
        Label        -compare-89-true          
        PushI        1                         
        Jump         -compare-89-join          
        Label        -compare-89-false         
        PushI        0                         
        Jump         -compare-89-join          
        Label        -compare-89-join          
        JumpTrue     -print-boolean-90-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-90-join    
        Label        -print-boolean-90-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-90-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -compare-95-arg1          
        Label        --array-creation--91--begin 
        Label        --array-creation--91-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--91-backup-reg-end 
        Label        --array-creation--91--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--91-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--91-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--91-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--91-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--91-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--91-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--91-restore-reg-end 
        Label        --array-creation--91--end 
        Label        --array-initialization--92-array-initialization-begin 
        Duplicate                              
        PushF        2.30000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        7.60000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--92-array-initialization-end 
        Label        -compare-95-arg2          
        Label        --array-creation--93--begin 
        Label        --array-creation--93-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--93-backup-reg-end 
        Label        --array-creation--93--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--93-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--93-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--93-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--93-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--93-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--93-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--93-restore-reg-end 
        Label        --array-creation--93--end 
        Label        --array-initialization--94-array-initialization-begin 
        Duplicate                              
        PushF        3.60000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        7.50000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--94-array-initialization-end 
        Label        -compare-95-sub           
        Subtract                               
        JumpFalse    -compare-95-true          
        Jump         -compare-95-false         
        Label        -compare-95-true          
        PushI        1                         
        Jump         -compare-95-join          
        Label        -compare-95-false         
        PushI        0                         
        Jump         -compare-95-join          
        Label        -compare-95-join          
        JumpTrue     -print-boolean-96-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-96-join    
        Label        -print-boolean-96-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-96-join    
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -compare-101-arg1         
        Label        --array-creation--97--begin 
        Label        --array-creation--97-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--97-backup-reg-end 
        Label        --array-creation--97--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--97-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--97-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--97-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--97-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--97-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--97-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--97-restore-reg-end 
        Label        --array-creation--97--end 
        Label        --array-initialization--98-array-initialization-begin 
        Duplicate                              
        PushF        1.60000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        1.50000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--98-array-initialization-end 
        Label        -compare-101-arg2         
        Label        --array-creation--99--begin 
        Label        --array-creation--99-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--99-backup-reg-end 
        Label        --array-creation--99--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--99-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--99-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--99-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--99-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--99-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--99-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--99-restore-reg-end 
        Label        --array-creation--99--end 
        Label        --array-initialization--100-array-initialization-begin 
        Duplicate                              
        PushF        2.40000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        7.10000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--100-array-initialization-end 
        Label        -compare-101-sub          
        Subtract                               
        JumpFalse    -compare-101-true         
        Jump         -compare-101-false        
        Label        -compare-101-true         
        PushI        1                         
        Jump         -compare-101-join         
        Label        -compare-101-false        
        PushI        0                         
        Jump         -compare-101-join         
        Label        -compare-101-join         
        JumpTrue     -print-boolean-102-true   
        PushD        $boolean-false-string     
        Jump         -print-boolean-102-join   
        Label        -print-boolean-102-true   
        PushD        $boolean-true-string      
        Label        -print-boolean-102-join   
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -compare-107-arg1         
        Label        --array-creation--103--begin 
        Label        --array-creation--103-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--103-backup-reg-end 
        Label        --array-creation--103--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--103-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--103-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--103-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--103-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--103-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--103-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--103-restore-reg-end 
        Label        --array-creation--103--end 
        Label        --array-initialization--104-array-initialization-begin 
        Duplicate                              
        PushF        2.10000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        8.50000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--104-array-initialization-end 
        Label        -compare-107-arg2         
        Label        --array-creation--105--begin 
        Label        --array-creation--105-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--105-backup-reg-end 
        Label        --array-creation--105--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--105-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--105-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--105-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--105-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--105-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--105-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--105-restore-reg-end 
        Label        --array-creation--105--end 
        Label        --array-initialization--106-array-initialization-begin 
        Duplicate                              
        PushF        1.10000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        8.10000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--106-array-initialization-end 
        Label        -compare-107-sub          
        Subtract                               
        JumpFalse    -compare-107-true         
        Jump         -compare-107-false        
        Label        -compare-107-true         
        PushI        1                         
        Jump         -compare-107-join         
        Label        -compare-107-false        
        PushI        0                         
        Jump         -compare-107-join         
        Label        -compare-107-join         
        JumpTrue     -print-boolean-108-true   
        PushD        $boolean-false-string     
        Jump         -print-boolean-108-join   
        Label        -print-boolean-108-true   
        PushD        $boolean-true-string      
        Label        -print-boolean-108-join   
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -compare-113-arg1         
        Label        --array-creation--109--begin 
        Label        --array-creation--109-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--109-backup-reg-end 
        Label        --array-creation--109--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--109-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--109-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--109-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--109-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--109-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--109-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--109-restore-reg-end 
        Label        --array-creation--109--end 
        Label        --array-initialization--110-array-initialization-begin 
        Duplicate                              
        PushF        7.90000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        8.00000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--110-array-initialization-end 
        Label        -compare-113-arg2         
        Label        --array-creation--111--begin 
        Label        --array-creation--111-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--111-backup-reg-end 
        Label        --array-creation--111--get-length 
        PushI        2                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--111-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--111-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--111-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--111-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--111-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--111-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--111-restore-reg-end 
        Label        --array-creation--111--end 
        Label        --array-initialization--112-array-initialization-begin 
        Duplicate                              
        PushF        6.30000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        4.90000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--112-array-initialization-end 
        Label        -compare-113-sub          
        Subtract                               
        JumpFalse    -compare-113-true         
        Jump         -compare-113-false        
        Label        -compare-113-true         
        PushI        1                         
        Jump         -compare-113-join         
        Label        -compare-113-false        
        PushI        0                         
        Jump         -compare-113-join         
        Label        -compare-113-join         
        JumpTrue     -print-boolean-114-true   
        PushD        $boolean-false-string     
        Jump         -print-boolean-114-join   
        Label        -print-boolean-114-true   
        PushD        $boolean-true-string      
        Label        -print-boolean-114-join   
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% xx
        Label        --array-creation--115--begin 
        Label        --array-creation--115-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--115-backup-reg-end 
        Label        --array-creation--115--get-length 
        PushI        3                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--115-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--115-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--115-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--115-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--115-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--115-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--115-restore-reg-end 
        Label        --array-creation--115--end 
        Label        --array-initialization--116-array-initialization-begin 
        Duplicate                              
        PushF        0.100000                  
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        1.10000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        2.20000                   
        Exchange                               
        PushI        32                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--116-array-initialization-end 
        StoreI                                 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% yy
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% xx
        LoadI                                  
        StoreI                                 
        Label        -compare-117-arg1         
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% xx
        LoadI                                  
        Label        -compare-117-arg2         
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% yy
        LoadI                                  
        Label        -compare-117-sub          
        Subtract                               
        JumpFalse    -compare-117-true         
        Jump         -compare-117-false        
        Label        -compare-117-true         
        PushI        1                         
        Jump         -compare-117-join         
        Label        -compare-117-false        
        PushI        0                         
        Jump         -compare-117-join         
        Label        -compare-117-join         
        JumpTrue     -print-boolean-118-true   
        PushD        $boolean-false-string     
        Jump         -print-boolean-118-join   
        Label        -print-boolean-118-true   
        PushD        $boolean-true-string      
        Label        -print-boolean-118-join   
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% yy
        Label        --array-creation--119--begin 
        Label        --array-creation--119-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--119-backup-reg-end 
        Label        --array-creation--119--get-length 
        PushI        7                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--119-set-size 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--119-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--119-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--119-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--119-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--119-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--119-restore-reg-end 
        Label        --array-creation--119--end 
        Label        --array-initialization--120-array-initialization-begin 
        Duplicate                              
        PushF        1.10000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        1.10000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        2.20000                   
        Exchange                               
        PushI        32                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        3.30000                   
        Exchange                               
        PushI        40                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        5.50000                   
        Exchange                               
        PushI        48                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        8.80000                   
        Exchange                               
        PushI        56                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        14.3000                   
        Exchange                               
        PushI        64                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--120-array-initialization-end 
        StoreI                                 
        Label        -compare-121-arg1         
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% xx
        LoadI                                  
        Label        -compare-121-arg2         
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% yy
        LoadI                                  
        Label        -compare-121-sub          
        Subtract                               
        JumpFalse    -compare-121-true         
        Jump         -compare-121-false        
        Label        -compare-121-true         
        PushI        1                         
        Jump         -compare-121-join         
        Label        -compare-121-false        
        PushI        0                         
        Jump         -compare-121-join         
        Label        -compare-121-join         
        JumpTrue     -print-boolean-122-true   
        PushD        $boolean-false-string     
        Jump         -print-boolean-122-join   
        Label        -print-boolean-122-true   
        PushD        $boolean-true-string      
        Label        -print-boolean-122-join   
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
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
        PushD        $heap-first-free          
        LoadI                                  
        JumpFalse    -mmgr-bypass-firstFree    
        PushD        $mmgr-dealloc-block       
        LoadI                                  
        PushD        $heap-first-free          
        LoadI                                  
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -mmgr-bypass-firstFree    
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
        Label        GCDCalculation            
        Label        --GCD-Calculation--123--function-begin- 
        PushD        register3                 
        Exchange                               
        StoreI                                 
        PushD        register1                 
        LoadI                                  
        PushD        register2                 
        LoadI                                  
        Multiply                               
        JumpTrue     --GCD-Calculation--123--check-initial-zero 
        PushI        1                         
        Jump         --GCD-Calculation--123--function-end- 
        Label        --GCD-Calculation--123--check-initial-zero 
        Label        --GCD-Calculation--123--loop-begin- 
        PushD        register1                 
        LoadI                                  
        Duplicate                              
        JumpFalse    --GCD-Calculation--123--loop-end- 
        PushD        register2                 
        LoadI                                  
        Duplicate                              
        JumpFalse    --GCD-Calculation--123--loop-end- 
        Subtract                               
        JumpPos      --GCD-Calculation--123--positive-case- 
        Label        --GCD-Calculation--123--not-positive-case- 
        PushD        register2                 
        LoadI                                  
        PushD        register1                 
        LoadI                                  
        Subtract                               
        PushD        register2                 
        Exchange                               
        StoreI                                 
        Jump         --GCD-Calculation--123--join- 
        Label        --GCD-Calculation--123--positive-case- 
        PushD        register1                 
        LoadI                                  
        PushD        register2                 
        LoadI                                  
        Subtract                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Jump         --GCD-Calculation--123--join- 
        Label        --GCD-Calculation--123--join- 
        Jump         --GCD-Calculation--123--loop-begin- 
        Label        --GCD-Calculation--123--loop-end- 
        Add                                    
        Label        --GCD-Calculation--123--function-end- 
        PushD        register3                 
        LoadI                                  
        Return                                 
