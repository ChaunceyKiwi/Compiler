        Label        -mem-manager-initialize   
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
        DLabel       $frame-pointer            
        DataZ        4                         
        DLabel       $stack-pointer            
        DataZ        4                         
        Memtop                                 
        Duplicate                              
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Jump         $$main                    
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
        Label        $$general-runtime-error   
        PushD        $errors-general-message   
        Printf                                 
        Halt                                   
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
        Label        $$i-divide-by-zero        
        PushD        $errors-int-divide-by-zero 
        Jump         $$general-runtime-error   
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
        Label        $$f-divide-by-zero        
        PushD        $errors-float-divide-by-zero 
        Jump         $$general-runtime-error   
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
        Label        $$array-size-negative     
        PushD        $$errors-array-size-negative 
        Jump         $$general-runtime-error   
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
        Label        $$array-index-negative    
        PushD        $$errors-array-index-negative 
        Jump         $$general-runtime-error   
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
        Label        $$array-index-exceed-bound 
        PushD        $$errors-index-exceed-bound 
        Jump         $$general-runtime-error   
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
        Label        $$rational-denominator-zero 
        PushD        $errors-rational-denominator-zero 
        Jump         $$general-runtime-error   
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
        Label        $$fold-operator-array-zero-length 
        PushD        $errors-fold-operator-array-zero-length 
        Jump         $$general-runtime-error   
        DLabel       $usable-memory-start      
        DLabel       $global-memory-block      
        DataZ        12                        
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
        Label        $$main                    
        Label        --for-statement--1-begin  
        PushD        register1                 
        LoadI                                  
        PushD        register2                 
        LoadI                                  
        PushD        register3                 
        LoadI                                  
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% i
        PushD        register1                 
        Exchange                               
        StoreI                                 
        PushI        0                         
        PushD        register2                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--2--begin 
        Label        --array-creation--2-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--2-backup-reg-end 
        Label        --array-creation--2--get-length 
        PushI        7                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--2-set-size 
        PushI        4                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--2-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--2-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--2-set-subtype-size 
        Duplicate                              
        PushI        4                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--2-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--2-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--2-restore-reg-end 
        Label        --array-creation--2--end  
        Label        --array-initialization--3-array-initialization-begin 
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
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        40                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-initialization--3-array-initialization-end 
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        register3                 
        Exchange                               
        StoreI                                 
        Label        --for-statement--1--loop-begin- 
        PushD        register3                 
        LoadI                                  
        JumpFalse    --for-statement--1--loop-end- 
        PushD        register1                 
        LoadI                                  
        PushD        register2                 
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% a
        Label        --array-creation--10--begin 
        Label        --array-creation--10-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--10-backup-reg-end 
        Label        --array-creation--10--get-length 
        PushI        3                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--10-set-size 
        PushI        4                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--10-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--10-set-status 
        Duplicate                              
        PushI        2                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--10-set-subtype-size 
        Duplicate                              
        PushI        4                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--10-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--10-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--10-restore-reg-end 
        Label        --array-creation--10--end 
        Label        --array-initialization--11-array-initialization-begin 
        Duplicate                              
        Label        --array-creation--4--begin 
        Label        --array-creation--4-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--4-backup-reg-end 
        Label        --array-creation--4--get-length 
        PushI        6                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--4-set-size 
        PushI        4                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--4-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--4-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--4-set-subtype-size 
        Duplicate                              
        PushI        4                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--4-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--4-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--4-restore-reg-end 
        Label        --array-creation--4--end  
        Label        --array-initialization--5-array-initialization-begin 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        3                         
        Exchange                               
        PushI        20                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        5                         
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        28                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        9                         
        Exchange                               
        PushI        32                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        11                        
        Exchange                               
        PushI        36                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-initialization--5-array-initialization-end 
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        Label        --array-creation--6--begin 
        Label        --array-creation--6-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--6-backup-reg-end 
        Label        --array-creation--6--get-length 
        PushI        6                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--6-set-size 
        PushI        4                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--6-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--6-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--6-set-subtype-size 
        Duplicate                              
        PushI        4                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--6-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--6-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--6-restore-reg-end 
        Label        --array-creation--6--end  
        Label        --array-initialization--7-array-initialization-begin 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        3                         
        Exchange                               
        PushI        20                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        5                         
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        28                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        9                         
        Exchange                               
        PushI        32                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        11                        
        Exchange                               
        PushI        36                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-initialization--7-array-initialization-end 
        Exchange                               
        PushI        20                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        Label        --array-creation--8--begin 
        Label        --array-creation--8-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--8-backup-reg-end 
        Label        --array-creation--8--get-length 
        PushI        6                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--8-set-size 
        PushI        4                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--8-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--8-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--8-set-subtype-size 
        Duplicate                              
        PushI        4                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--8-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--8-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--8-restore-reg-end 
        Label        --array-creation--8--end  
        Label        --array-initialization--9-array-initialization-begin 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        3                         
        Exchange                               
        PushI        20                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        5                         
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        28                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        9                         
        Exchange                               
        PushI        32                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        11                        
        Exchange                               
        PushI        36                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-initialization--9-array-initialization-end 
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-initialization--11-array-initialization-end 
        StoreI                                 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% a
        LoadI                                  
        Label        --release-array--12--begin- 
        Label        --release-array--12-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Exchange                               
        Label        --release-array--12-backup-reg-end 
        Duplicate                              
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        register1                 
        Exchange                               
        StoreI                                 
        PushI        16                        
        Add                                    
        Label        --release-array--12--loop-begin- 
        PushD        register1                 
        LoadI                                  
        JumpFalse    --release-array--12--loop-end- 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        LoadI                                  
        Label        --release-array--13--begin- 
        Label        --release-array--13-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Exchange                               
        Label        --release-array--13-backup-reg-end 
        Duplicate                              
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        register1                 
        Exchange                               
        StoreI                                 
        PushI        16                        
        Add                                    
        Label        --release-array--13--loop-begin- 
        PushD        register1                 
        LoadI                                  
        JumpFalse    --release-array--13--loop-end- 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        LoadI                                  
        Pop                                    
        PushI        -1                        
        PushD        register1                 
        LoadI                                  
        Add                                    
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Jump         --release-array--13--loop-begin- 
        Label        --release-array--13--loop-end- 
        Pop                                    
        Call         -mem-manager-deallocate   
        Label        --release-array--13-restore-reg-begin 
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --release-array--13-restore-reg-end 
        Label        --release-array--13--end- 
        PushI        -1                        
        PushD        register1                 
        LoadI                                  
        Add                                    
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Jump         --release-array--12--loop-begin- 
        Label        --release-array--12--loop-end- 
        Pop                                    
        Call         -mem-manager-deallocate   
        Label        --release-array--12-restore-reg-begin 
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --release-array--12-restore-reg-end 
        Label        --release-array--12--end- 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% b
        Label        --array-creation--20--begin 
        Label        --array-creation--20-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--20-backup-reg-end 
        Label        --array-creation--20--get-length 
        PushI        3                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--20-set-size 
        PushI        4                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--20-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--20-set-status 
        Duplicate                              
        PushI        2                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--20-set-subtype-size 
        Duplicate                              
        PushI        4                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--20-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--20-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--20-restore-reg-end 
        Label        --array-creation--20--end 
        Label        --array-initialization--21-array-initialization-begin 
        Duplicate                              
        Label        --array-creation--14--begin 
        Label        --array-creation--14-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--14-backup-reg-end 
        Label        --array-creation--14--get-length 
        PushI        6                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--14-set-size 
        PushI        4                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--14-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--14-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--14-set-subtype-size 
        Duplicate                              
        PushI        4                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--14-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--14-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--14-restore-reg-end 
        Label        --array-creation--14--end 
        Label        --array-initialization--15-array-initialization-begin 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        20                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        28                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        32                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        36                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-initialization--15-array-initialization-end 
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        Label        --array-creation--16--begin 
        Label        --array-creation--16-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--16-backup-reg-end 
        Label        --array-creation--16--get-length 
        PushI        6                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--16-set-size 
        PushI        4                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--16-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--16-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--16-set-subtype-size 
        Duplicate                              
        PushI        4                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--16-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--16-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--16-restore-reg-end 
        Label        --array-creation--16--end 
        Label        --array-initialization--17-array-initialization-begin 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        20                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        28                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        32                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        36                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-initialization--17-array-initialization-end 
        Exchange                               
        PushI        20                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        Label        --array-creation--18--begin 
        Label        --array-creation--18-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--18-backup-reg-end 
        Label        --array-creation--18--get-length 
        PushI        6                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--18-set-size 
        PushI        4                         
        Multiply                               
        PushI        16                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --array-creation--18-set-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--18-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--18-set-subtype-size 
        Duplicate                              
        PushI        4                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--18-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--18-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--18-restore-reg-end 
        Label        --array-creation--18--end 
        Label        --array-initialization--19-array-initialization-begin 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        20                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        28                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        32                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        1                         
        Exchange                               
        PushI        36                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-initialization--19-array-initialization-end 
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-initialization--21-array-initialization-end 
        StoreI                                 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% a
        LoadI                                  
        Label        --print-array--22--begin- 
        Label        --print-array--22-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Exchange                               
        Label        --print-array--22-backup-reg-end 
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        register1                 
        Exchange                               
        StoreI                                 
        PushI        16                        
        Add                                    
        PushD        $print-format-open-square-bracket 
        Printf                                 
        Label        --print-array--22--loop-begin- 
        PushD        register1                 
        LoadI                                  
        JumpFalse    --print-array--22--loop-end- 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        LoadI                                  
        Label        --print-array--23--begin- 
        Label        --print-array--23-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Exchange                               
        Label        --print-array--23-backup-reg-end 
        Duplicate                              
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        register1                 
        Exchange                               
        StoreI                                 
        PushI        16                        
        Add                                    
        PushD        $print-format-open-square-bracket 
        Printf                                 
        Label        --print-array--23--loop-begin- 
        PushD        register1                 
        LoadI                                  
        JumpFalse    --print-array--23--loop-end- 
        Duplicate                              
        PushI        4                         
        Add                                    
        Exchange                               
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushI        -1                        
        PushD        register1                 
        LoadI                                  
        Add                                    
        PushD        register1                 
        Exchange                               
        StoreI                                 
        PushD        register1                 
        LoadI                                  
        JumpFalse    --print-array--23--loop-end- 
        PushD        $print-format-separator   
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        Jump         --print-array--23--loop-begin- 
        Label        --print-array--23--loop-end- 
        Pop                                    
        PushD        $print-format-close-square-bracket 
        Printf                                 
        Label        --print-array--23-restore-reg-begin 
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --print-array--23-restore-reg-end 
        Label        --print-array--23--end-   
        PushI        -1                        
        PushD        register1                 
        LoadI                                  
        Add                                    
        PushD        register1                 
        Exchange                               
        StoreI                                 
        PushD        register1                 
        LoadI                                  
        JumpFalse    --print-array--22--loop-end- 
        PushD        $print-format-separator   
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        Jump         --print-array--22--loop-begin- 
        Label        --print-array--22--loop-end- 
        Pop                                    
        PushD        $print-format-close-square-bracket 
        Printf                                 
        Label        --print-array--22-restore-reg-begin 
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --print-array--22-restore-reg-end 
        Label        --print-array--22--end-   
        Label        --for-statement--1-continue 
        PushD        register2                 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushI        -1                        
        PushD        register3                 
        LoadI                                  
        Add                                    
        PushD        register3                 
        Exchange                               
        StoreI                                 
        Jump         --for-statement--1--loop-begin- 
        Label        --for-statement--1-break  
        Label        --for-statement--1--loop-end- 
        PushD        register3                 
        Exchange                               
        StoreI                                 
        PushD        register2                 
        Exchange                               
        StoreI                                 
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --for-statement--1-end    
        Halt                                   
        Label        -mem-manager-make-tags    
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
        DLabel       $mmgr-dealloc-return      
        DataZ        4                         
        DLabel       $mmgr-dealloc-block       
        DataZ        4                         
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
        DLabel       $mmgr-remove-return       
        DataZ        4                         
        DLabel       $mmgr-remove-block        
        DataZ        4                         
        DLabel       $mmgr-remove-prev         
        DataZ        4                         
        DLabel       $mmgr-remove-next         
        DataZ        4                         
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
        DLabel       $heap-memory              
        Label        GCDCalculation            
        Label        --GCD-Calculation--24--function-begin- 
        PushD        register1                 
        LoadI                                  
        PushD        register2                 
        LoadI                                  
        Multiply                               
        JumpTrue     --GCD-Calculation--24--check-initial-zero 
        PushI        1                         
        Jump         --GCD-Calculation--24--function-end- 
        Label        --GCD-Calculation--24--check-initial-zero 
        Label        --GCD-Calculation--24--loop-begin- 
        PushD        register1                 
        LoadI                                  
        Duplicate                              
        JumpFalse    --GCD-Calculation--24--loop-end- 
        PushD        register2                 
        LoadI                                  
        Duplicate                              
        JumpFalse    --GCD-Calculation--24--loop-end- 
        Subtract                               
        JumpPos      --GCD-Calculation--24--positive-case- 
        Label        --GCD-Calculation--24--not-positive-case- 
        PushD        register2                 
        LoadI                                  
        PushD        register1                 
        LoadI                                  
        Subtract                               
        PushD        register2                 
        Exchange                               
        StoreI                                 
        Jump         --GCD-Calculation--24--join- 
        Label        --GCD-Calculation--24--positive-case- 
        PushD        register1                 
        LoadI                                  
        PushD        register2                 
        LoadI                                  
        Subtract                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Jump         --GCD-Calculation--24--join- 
        Label        --GCD-Calculation--24--join- 
        Jump         --GCD-Calculation--24--loop-begin- 
        Label        --GCD-Calculation--24--loop-end- 
        Add                                    
        Label        --GCD-Calculation--24--function-end- 
        Exchange                               
        Return                                 
