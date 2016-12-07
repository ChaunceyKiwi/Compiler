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
        DLabel       $print-format-newline     
        DataC        10                        %% "\n"
        DataC        0                         
        DLabel       $print-format-space       
        DataC        32                        %% " "
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
        DLabel       $errors-zip-operator-array-diff-length 
        DataC        122                       %% "zip operator cannot have two different length array"
        DataC        105                       
        DataC        112                       
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
        DataC        116                       
        DataC        119                       
        DataC        111                       
        DataC        32                        
        DataC        100                       
        DataC        105                       
        DataC        102                       
        DataC        102                       
        DataC        101                       
        DataC        114                       
        DataC        101                       
        DataC        110                       
        DataC        116                       
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
        DLabel       $global-memory-block      
        DataZ        16                        
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
        Add                                    %% nn
        Label        --array-creation--1--begin 
        Label        --array-creation--1-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--1-backup-reg-end 
        Label        --array-creation--1--get-length 
        PushI        6                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      basicBlock-3              
        Jump         basicBlock-6              
        Label        basicBlockHeader-2        
        PushD        $errors-general-message   
        Printf                                 
        Halt                                   
        PushD        $errors-int-divide-by-zero 
        Jump         basicBlockHeader-2        
        Label        basicBlock-3              
        PushD        $$errors-array-size-negative 
        Jump         basicBlockHeader-2        
        Label        basicBlock-4              
        PushD        $errors-rational-denominator-zero 
        Jump         basicBlockHeader-2        
        Label        basicBlock-5              
        PushD        $errors-zip-operator-array-diff-length 
        Jump         basicBlockHeader-2        
        Label        basicBlock-6              
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
        PushI        4                         
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
        PushI        1                         
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        5                         
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
        PushI        9                         
        Exchange                               
        PushI        28                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        2                         
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
        Label        --array-initialization--2-array-initialization-end 
        StoreI                                 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% ff
        Label        --array-creation--3--begin 
        Label        --array-creation--3-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--3-backup-reg-end 
        Label        --array-creation--3--get-length 
        PushI        6                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      basicBlock-3              
        Jump         basicBlock-7              
        Label        basicBlock-7              
        PushI        8                         
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
        PushF        2.10000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        -3.30000                  
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        4.20000                   
        Exchange                               
        PushI        32                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        5.00000                   
        Exchange                               
        PushI        40                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        17.7900                   
        Exchange                               
        PushI        48                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        4.00000                   
        Exchange                               
        PushI        56                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--4-array-initialization-end 
        StoreI                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% ratIt
        Jump         basicBlock-14             
        Label        basicBlock-8              
        Label        $function--lambda-definition-7-Lambda 
        Label        -lambda-definition-7-dynamic-link 
        PushD        $frame-pointer            
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-7-return-address 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-7-move-fp-to-sp 
        PushD        $stack-pointer            
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-7-subtract-frame-size 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        8                         
        Subtract                               
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-7-function-body-process 
        Label        -rational-number-6-rational-creation-begin 
        Label        -rational-number-6-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        PushD        register2                 
        LoadI                                  
        PushD        register3                 
        LoadI                                  
        PushD        register4                 
        LoadI                                  
        Label        -rational-number-6-backup-reg-end 
        PushD        register1                 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        8                         
        Add                                    %% n
        LoadI                                  
        Duplicate                              
        PushD        register3                 
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      basicBlock-10             
        Jump         basicBlock-9              
        Label        basicBlock-9              
        Negate                                 
        Jump         basicBlock-10             
        Label        basicBlock-10             
        StoreI                                 
        PushD        register2                 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        0                         
        Add                                    %% f
        LoadF                                  
        ConvertI                               
        Duplicate                              
        JumpFalse    basicBlock-4              
        Jump         basicBlock-11             
        Label        basicBlock-11             
        Duplicate                              
        PushD        register4                 
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      basicBlock-13             
        Jump         basicBlock-12             
        Label        basicBlock-12             
        Negate                                 
        Jump         basicBlock-13             
        Label        basicBlock-13             
        StoreI                                 
        PushD        register1                 
        LoadI                                  
        PushD        register2                 
        LoadI                                  
        PushD        register3                 
        LoadI                                  
        Call         GCDCalculation            
        Exchange                               
        PushD        register3                 
        Exchange                               
        StoreI                                 
        Exchange                               
        PushD        register2                 
        Exchange                               
        StoreI                                 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        PushD        register1                 
        Exchange                               
        StoreI                                 
        PushI        8                         
        Call         -mem-manager-allocate     
        Duplicate                              
        PushD        register3                 
        LoadI                                  
        PushD        register1                 
        LoadI                                  
        Divide                                 
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        register4                 
        LoadI                                  
        PushD        register1                 
        LoadI                                  
        Divide                                 
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -rational-number-6-restore-reg-begin 
        Exchange                               
        PushD        register4                 
        Exchange                               
        StoreI                                 
        Exchange                               
        PushD        register3                 
        Exchange                               
        StoreI                                 
        Exchange                               
        PushD        register2                 
        Exchange                               
        StoreI                                 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        -rational-number-6-restore-reg-end 
        Label        -rational-number-6-rational-creation-end 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        LoadI                                  
        Label        -lambda-definition-7-replace-frame-pointer 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-7-increment-stack-pointer 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        20                        
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        Label        -lambda-definition-7-decrement-stack-pointer 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        4                         
        Subtract                               
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        Return                                 
        Jump         basicBlock-14             
        Label        basicBlock-14             
        PushD        $function--lambda-definition-7-Lambda 
        StoreI                                 
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% numList
        Label        --array-zip-with-lambda--8-array-zip-begin 
        Label        --array-zip-with-lambda--8-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        PushD        register2                 
        LoadI                                  
        PushD        register3                 
        LoadI                                  
        PushD        register4                 
        LoadI                                  
        PushD        register5                 
        LoadI                                  
        Label        --array-zip-with-lambda--8-backup-reg-end 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% ff
        LoadI                                  
        Duplicate                              
        PushD        register4                 
        Exchange                               
        StoreI                                 
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        register2                 
        Exchange                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% nn
        LoadI                                  
        Duplicate                              
        PushD        register3                 
        Exchange                               
        StoreI                                 
        PushI        12                        
        Add                                    
        LoadI                                  
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        PushI        8                         
        Multiply                               
        PushI        16                        
        Add                                    
        PushD        register1                 
        LoadI                                  
        PushD        register2                 
        LoadI                                  
        Subtract                               
        JumpTrue     basicBlock-5              
        Jump         basicBlock-15             
        Label        basicBlock-15             
        Call         -mem-manager-allocate     
        Duplicate                              
        PushD        register5                 
        Exchange                               
        StoreI                                 
        Label        --array-zip-with-lambda--8-array-header-creation-begin 
        Label        --array-zip-with-lambda--8-array-zip-type 
        Duplicate                              
        PushI        7                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-zip-with-lambda--8-array-zip-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-zip-with-lambda--8-array-zip-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-zip-with-lambda--8-array-zip-length 
        Duplicate                              
        PushD        register3                 
        LoadI                                  
        PushI        12                        
        Add                                    
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-zip-with-lambda--8-array-header-creation-end 
        PushD        register3                 
        Duplicate                              
        LoadI                                  
        PushI        16                        
        Add                                    
        StoreI                                 
        PushD        register4                 
        Duplicate                              
        LoadI                                  
        PushI        16                        
        Add                                    
        StoreI                                 
        PushD        register5                 
        Duplicate                              
        LoadI                                  
        PushI        16                        
        Add                                    
        StoreI                                 
        Jump         basicBlockHeader-16       
        Label        basicBlockHeader-16       
        PushD        register1                 
        LoadI                                  
        JumpFalse    basicBlock-18             
        Jump         basicBlock-17             
        Label        basicBlock-17             
        PushD        register5                 
        LoadI                                  
        PushD        register3                 
        LoadI                                  
        LoadI                                  
        PushD        register4                 
        LoadI                                  
        LoadF                                  
        Exchange                               
        PushD        $stack-pointer            
        LoadI                                  
        PushI        4                         
        Subtract                               
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        8                         
        Subtract                               
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreF                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% ratIt
        LoadI                                  
        CallV                                  
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        8                         
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        StoreI                                 
        PushD        register5                 
        Duplicate                              
        LoadI                                  
        PushI        8                         
        Add                                    
        StoreI                                 
        PushD        register3                 
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushD        register4                 
        Duplicate                              
        LoadI                                  
        PushI        8                         
        Add                                    
        StoreI                                 
        PushI        -1                        
        PushD        register1                 
        LoadI                                  
        Add                                    
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Jump         basicBlockHeader-16       
        Label        basicBlock-18             
        Exchange                               
        PushD        register5                 
        Exchange                               
        StoreI                                 
        Exchange                               
        PushD        register4                 
        Exchange                               
        StoreI                                 
        Exchange                               
        PushD        register3                 
        Exchange                               
        StoreI                                 
        Exchange                               
        PushD        register2                 
        Exchange                               
        StoreI                                 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-zip-with-lambda--8-restore-reg-end 
        Label        --array-zip-with-lambda--8-array-zip-end 
        StoreI                                 
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% numList
        LoadI                                  
        Label        --print-array--9--begin-  
        Label        --print-array--9-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Exchange                               
        Label        --print-array--9-backup-reg-end 
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
        Jump         basicBlockHeader-19       
        Label        basicBlockHeader-19       
        PushD        register1                 
        LoadI                                  
        JumpFalse    basicBlock-36             
        Jump         basicBlock-20             
        Label        basicBlock-20             
        Duplicate                              
        PushI        8                         
        Add                                    
        Exchange                               
        LoadI                                  
        Label        --print-rational--10--begin- 
        Label        --print-rational--10-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Exchange                               
        Label        --print-rational--10-backup-reg-end 
        PushD        register1                 
        Exchange                               
        StoreI                                 
        PushD        register1                 
        LoadI                                  
        LoadI                                  
        PushD        register1                 
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        Divide                                 
        Duplicate                              
        Duplicate                              
        JumpFalse    basicBlock-22             
        Jump         basicBlock-21             
        Label        basicBlock-21             
        PushD        $print-format-integer     
        Printf                                 
        Jump         basicBlock-26             
        Label        basicBlock-22             
        Pop                                    
        PushD        register1                 
        LoadI                                  
        LoadI                                  
        PushD        register1                 
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        Multiply                               
        Duplicate                              
        JumpTrue     basicBlock-24             
        Jump         basicBlock-23             
        Label        basicBlock-23             
        Pop                                    
        Pop                                    
        PushI        0                         
        PushD        $print-format-integer     
        Printf                                 
        Jump         basicBlock-34             
        Label        basicBlock-24             
        JumpPos      basicBlock-26             
        Jump         basicBlock-25             
        Label        basicBlock-25             
        PushD        $print-format-minus-sign  
        Printf                                 
        Jump         basicBlock-26             
        Label        basicBlock-26             
        PushD        register1                 
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        Multiply                               
        PushD        register1                 
        LoadI                                  
        LoadI                                  
        Exchange                               
        Subtract                               
        Duplicate                              
        JumpFalse    basicBlock-28             
        Jump         basicBlock-27             
        Label        basicBlock-27             
        Duplicate                              
        Jump         basicBlock-28             
        Label        basicBlock-28             
        JumpFalse    basicBlock-34             
        Jump         basicBlock-29             
        Label        basicBlock-29             
        PushD        register1                 
        LoadI                                  
        LoadI                                  
        JumpPos      basicBlock-31             
        Jump         basicBlock-30             
        Label        basicBlock-30             
        Negate                                 
        Jump         basicBlock-31             
        Label        basicBlock-31             
        PushD        $print-format-and         
        Printf                                 
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-over        
        Printf                                 
        PushD        register1                 
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        Duplicate                              
        JumpPos      basicBlock-33             
        Jump         basicBlock-32             
        Label        basicBlock-32             
        Negate                                 
        Jump         basicBlock-33             
        Label        basicBlock-33             
        PushD        $print-format-integer     
        Printf                                 
        Jump         basicBlock-34             
        Label        basicBlock-34             
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --print-rational--10-restore-reg-end 
        PushI        -1                        
        PushD        register1                 
        LoadI                                  
        Add                                    
        PushD        register1                 
        Exchange                               
        StoreI                                 
        PushD        register1                 
        LoadI                                  
        JumpFalse    basicBlock-36             
        Jump         basicBlock-35             
        Label        basicBlock-35             
        PushD        $print-format-separator   
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        Jump         basicBlockHeader-19       
        Label        basicBlock-36             
        Pop                                    
        PushD        $print-format-close-square-bracket 
        Printf                                 
        Label        --print-array--9-restore-reg-begin 
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --print-array--9-restore-reg-end 
        Label        --print-array--9--end-    
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
        Jump         basicBlockHeader-37       
        Label        basicBlockHeader-37       
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        JumpFalse    basicBlock-42             
        Jump         basicBlock-38             
        Label        basicBlock-38             
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
        JumpPos      basicBlock-40             
        Jump         basicBlock-39             
        Label        basicBlock-39             
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
        Jump         basicBlockHeader-37       
        Label        basicBlock-40             
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
        JumpNeg      basicBlock-43             
        Jump         basicBlock-41             
        Label        basicBlock-41             
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
        Jump         basicBlock-43             
        Label        basicBlock-42             
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
        Jump         basicBlock-43             
        Label        basicBlock-43             
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
        JumpFalse    basicBlock-45             
        Jump         basicBlock-44             
        Label        basicBlock-44             
        PushD        $mmgr-dealloc-block       
        LoadI                                  
        PushD        $heap-first-free          
        LoadI                                  
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Jump         basicBlock-45             
        Label        basicBlock-45             
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
        JumpFalse    basicBlock-47             
        Jump         basicBlock-46             
        Label        basicBlock-46             
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
        Jump         basicBlock-48             
        Label        basicBlock-47             
        PushD        $mmgr-remove-next         
        LoadI                                  
        PushD        $heap-first-free          
        Exchange                               
        StoreI                                 
        Jump         basicBlock-48             
        Label        basicBlock-48             
        PushD        $mmgr-remove-next         
        LoadI                                  
        JumpFalse    basicBlock-50             
        Jump         basicBlock-49             
        Label        basicBlock-49             
        PushD        $mmgr-remove-prev         
        LoadI                                  
        PushD        $mmgr-remove-next         
        LoadI                                  
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Jump         basicBlock-50             
        Label        basicBlock-50             
        PushD        $mmgr-remove-return       
        LoadI                                  
        Return                                 
        Label        GCDCalculation            
        Label        --GCD-Calculation--11--function-begin- 
        PushD        register3                 
        Exchange                               
        StoreI                                 
        PushD        register1                 
        LoadI                                  
        PushD        register2                 
        LoadI                                  
        Multiply                               
        JumpTrue     basicBlock-52             
        Jump         basicBlock-51             
        Label        basicBlock-51             
        PushI        1                         
        Jump         basicBlock-60             
        Label        basicBlock-52             
        Jump         basicBlockHeader-53       
        Label        basicBlockHeader-53       
        PushD        register1                 
        LoadI                                  
        Duplicate                              
        JumpFalse    basicBlock-59             
        Jump         basicBlock-54             
        Label        basicBlock-54             
        PushD        register2                 
        LoadI                                  
        Duplicate                              
        JumpFalse    basicBlock-59             
        Jump         basicBlock-55             
        Label        basicBlock-55             
        Subtract                               
        JumpPos      basicBlock-57             
        Jump         basicBlock-56             
        Label        basicBlock-56             
        PushD        register2                 
        LoadI                                  
        PushD        register1                 
        LoadI                                  
        Subtract                               
        PushD        register2                 
        Exchange                               
        StoreI                                 
        Jump         basicBlock-58             
        Label        basicBlock-57             
        PushD        register1                 
        LoadI                                  
        PushD        register2                 
        LoadI                                  
        Subtract                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Jump         basicBlock-58             
        Label        basicBlock-58             
        Jump         basicBlockHeader-53       
        Label        basicBlock-59             
        Add                                    
        Jump         basicBlock-60             
        Label        basicBlock-60             
        PushD        register3                 
        LoadI                                  
        Return                                 
