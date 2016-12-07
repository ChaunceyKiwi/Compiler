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
        Jump         -lambda-definition-2-end  
        Label        $function-asciiStringFor  
        Label        -lambda-definition-2-dynamic-link 
        PushD        $frame-pointer            
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-2-return-address 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-2-move-fp-to-sp 
        PushD        $stack-pointer            
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-2-subtract-frame-size 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        8                         
        Subtract                               
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-2-function-body-process 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        0                         
        Add                                    %% x
        LoadI                                  
        PushI        96                        
        Add                                    
        PushI        127                       
        BTAnd                                  
        Jump         --block-statement--1-end-of-block-statement 
        Label        --block-statement--1-end-of-block-statement 
        Label        -lambda-definition-2-push-return-address 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        LoadI                                  
        Label        -lambda-definition-2-replace-frame-pointer 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-2-increment-stack-pointer 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        12                        
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        Label        -lambda-definition-2-decrement-stack-pointer 
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
        StoreC                                 
        Return                                 
        Label        -lambda-definition-2-end  
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% numbers
        Label        --array-creation--3--begin 
        Label        --array-creation--3-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--3-backup-reg-end 
        Label        --array-creation--3--get-length 
        PushI        5                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --array-creation--3-set-size 
        PushI        4                         
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
        PushI        4                         
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
        Label        --array-initialization--4-array-initialization-end 
        StoreI                                 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% catNumber
        Jump         -lambda-definition-11-end 
        Label        $function--lambda-definition-11-Lambda 
        Label        -lambda-definition-11-dynamic-link 
        PushD        $frame-pointer            
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-11-return-address 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-11-move-fp-to-sp 
        PushD        $stack-pointer            
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-11-subtract-frame-size 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        8                         
        Subtract                               
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-11-function-body-process 
        Label        --string-char-concatenation--9--begin- 
        Label        --string-char-concatenation--9-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        PushD        register2                 
        LoadI                                  
        PushD        register3                 
        LoadI                                  
        PushD        register4                 
        LoadI                                  
        Label        --string-char-concatenation--9-backup-reg-end 
        Label        --string-char-concatenation--6--begin- 
        Label        --string-char-concatenation--6-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        PushD        register2                 
        LoadI                                  
        PushD        register3                 
        LoadI                                  
        PushD        register4                 
        LoadI                                  
        Label        --string-char-concatenation--6-backup-reg-end 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        4                         
        Add                                    %% s
        LoadI                                  
        PushD        register1                 
        Exchange                               
        StoreI                                 
        PushD        register1                 
        LoadI                                  
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        register2                 
        Exchange                               
        StoreI                                 
        Label        --string-creation-7-string-creation-begin 
        Label        --string-creation-7-backup-reg-begin 
        PushD        register4                 
        LoadI                                  
        Label        --string-creation-7-backup-reg-end 
        Label        --string-creation-7-string-creation-get-length 
        PushD        register2                 
        LoadI                                  
        PushI        1                         
        Add                                    
        Duplicate                              
        Duplicate                              
        PushD        register4                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --string-creation-7-string-creation-size 
        PushI        1                         
        Multiply                               
        PushI        12                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --string-creation-7-string-creation-type 
        Duplicate                              
        PushI        6                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-creation-7-string-creation-status 
        Duplicate                              
        PushI        9                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-creation-7-string-creation-length 
        Duplicate                              
        PushD        register4                 
        LoadI                                  
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-creation-7-restore-reg-begin 
        Exchange                               
        PushD        register4                 
        Exchange                               
        StoreI                                 
        Label        --string-creation-7-restore-reg-end 
        Label        --string-creation-7-string-creation-end 
        Duplicate                              
        PushD        register3                 
        Exchange                               
        StoreI                                 
        PushD        register1                 
        Duplicate                              
        LoadI                                  
        PushI        12                        
        Add                                    
        StoreI                                 
        PushD        register3                 
        Duplicate                              
        LoadI                                  
        PushI        12                        
        Add                                    
        StoreI                                 
        PushD        register2                 
        LoadI                                  
        PushD        register4                 
        Exchange                               
        StoreI                                 
        Label        --string-char-concatenation--6-string-element-copy-begin 
        PushD        register4                 
        LoadI                                  
        JumpFalse    --string-char-concatenation--6-string-element-copy-end 
        PushD        register3                 
        LoadI                                  
        PushD        register1                 
        LoadI                                  
        LoadC                                  
        StoreC                                 
        PushD        register1                 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        register3                 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushI        -1                        
        PushD        register4                 
        LoadI                                  
        Add                                    
        PushD        register4                 
        Exchange                               
        StoreI                                 
        Jump         --string-char-concatenation--6-string-element-copy-begin 
        Label        --string-char-concatenation--6-string-element-copy-end 
        PushD        register3                 
        LoadI                                  
        PushI        32                        
        StoreC                                 
        Label        --string-char-concatenation--6-restore-reg-begin 
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
        Label        --string-char-concatenation--6-restore-reg-end 
        Label        --string-char-concatenation--6--end- 
        PushD        register1                 
        Exchange                               
        StoreI                                 
        PushD        register1                 
        LoadI                                  
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        register2                 
        Exchange                               
        StoreI                                 
        Label        --string-creation-10-string-creation-begin 
        Label        --string-creation-10-backup-reg-begin 
        PushD        register4                 
        LoadI                                  
        Label        --string-creation-10-backup-reg-end 
        Label        --string-creation-10-string-creation-get-length 
        PushD        register2                 
        LoadI                                  
        PushI        1                         
        Add                                    
        Duplicate                              
        Duplicate                              
        PushD        register4                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --string-creation-10-string-creation-size 
        PushI        1                         
        Multiply                               
        PushI        12                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --string-creation-10-string-creation-type 
        Duplicate                              
        PushI        6                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-creation-10-string-creation-status 
        Duplicate                              
        PushI        9                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-creation-10-string-creation-length 
        Duplicate                              
        PushD        register4                 
        LoadI                                  
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-creation-10-restore-reg-begin 
        Exchange                               
        PushD        register4                 
        Exchange                               
        StoreI                                 
        Label        --string-creation-10-restore-reg-end 
        Label        --string-creation-10-string-creation-end 
        Duplicate                              
        PushD        register3                 
        Exchange                               
        StoreI                                 
        PushD        register1                 
        Duplicate                              
        LoadI                                  
        PushI        12                        
        Add                                    
        StoreI                                 
        PushD        register3                 
        Duplicate                              
        LoadI                                  
        PushI        12                        
        Add                                    
        StoreI                                 
        PushD        register2                 
        LoadI                                  
        PushD        register4                 
        Exchange                               
        StoreI                                 
        Label        --string-char-concatenation--9-string-element-copy-begin 
        PushD        register4                 
        LoadI                                  
        JumpFalse    --string-char-concatenation--9-string-element-copy-end 
        PushD        register3                 
        LoadI                                  
        PushD        register1                 
        LoadI                                  
        LoadC                                  
        StoreC                                 
        PushD        register1                 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushD        register3                 
        Duplicate                              
        LoadI                                  
        PushI        1                         
        Add                                    
        StoreI                                 
        PushI        -1                        
        PushD        register4                 
        LoadI                                  
        Add                                    
        PushD        register4                 
        Exchange                               
        StoreI                                 
        Jump         --string-char-concatenation--9-string-element-copy-begin 
        Label        --string-char-concatenation--9-string-element-copy-end 
        PushD        register3                 
        LoadI                                  
        Label        -function-invocation-8-begin 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        0                         
        Add                                    %% x
        LoadI                                  
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
        Call         $function-asciiStringFor  
        PushD        $stack-pointer            
        LoadI                                  
        LoadC                                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        1                         
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Label        -function-invocation-8-end 
        StoreC                                 
        Label        --string-char-concatenation--9-restore-reg-begin 
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
        Label        --string-char-concatenation--9-restore-reg-end 
        Label        --string-char-concatenation--9--end- 
        Jump         --block-statement--5-end-of-block-statement 
        Label        --block-statement--5-end-of-block-statement 
        Label        -lambda-definition-11-push-return-address 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        LoadI                                  
        Label        -lambda-definition-11-replace-frame-pointer 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-11-increment-stack-pointer 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        16                        
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        Label        -lambda-definition-11-decrement-stack-pointer 
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
        Label        -lambda-definition-11-end 
        PushD        $function--lambda-definition-11-Lambda 
        StoreI                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% numList
        Label        --array-fold-with-lambda--14--begin- 
        Label        --array-fold-with-lambda--14-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        PushD        register2                 
        LoadI                                  
        Label        --array-fold-with-lambda--14-backup-reg-end 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% numbers
        LoadI                                  
        Duplicate                              
        PushD        register2                 
        Exchange                               
        StoreI                                 
        Label        --array-fold-with-lambda--14-array-map-size 
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        register1                 
        Exchange                               
        StoreI                                 
        PushD        register2                 
        Duplicate                              
        LoadI                                  
        PushI        16                        
        Add                                    
        StoreI                                 
        Label        --string-creation-12-string-creation-begin 
        Label        --string-creation-12-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --string-creation-12-backup-reg-end 
        Label        --string-creation-12-string-creation-get-length 
        PushI        5                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      $$array-size-negative     
        Label        --string-creation-12-string-creation-size 
        PushI        1                         
        Multiply                               
        PushI        12                        
        Add                                    
        Call         -mem-manager-allocate     
        Label        --string-creation-12-string-creation-type 
        Duplicate                              
        PushI        6                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-creation-12-string-creation-status 
        Duplicate                              
        PushI        9                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-creation-12-string-creation-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-creation-12-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --string-creation-12-restore-reg-end 
        Label        --string-creation-12-string-creation-end 
        Label        --string-initialization-13-string-initialization-begin 
        Duplicate                              
        PushI        108                       
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        105                       
        Exchange                               
        PushI        13                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        115                       
        Exchange                               
        PushI        14                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        116                       
        Exchange                               
        PushI        15                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        58                        
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-initialization-13-string-initialization-end 
        PushD        register1                 
        LoadI                                  
        JumpFalse    --array-fold-with-lambda--14-array-element-fold-end 
        Label        --array-fold-with-lambda--14-array-element-fold-begin 
        PushD        register1                 
        LoadI                                  
        JumpFalse    --array-fold-with-lambda--14-array-element-fold-end 
        PushD        register2                 
        LoadI                                  
        LoadI                                  
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
        PushI        4                         
        Subtract                               
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        $stack-pointer            
        LoadI                                  
        Exchange                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% catNumber
        LoadI                                  
        CallV                                  
        PushD        $stack-pointer            
        LoadI                                  
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        4                         
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        PushD        register2                 
        Duplicate                              
        LoadI                                  
        PushI        4                         
        Add                                    
        StoreI                                 
        PushI        -1                        
        PushD        register1                 
        LoadI                                  
        Add                                    
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Jump         --array-fold-with-lambda--14-array-element-fold-begin 
        Label        --array-fold-with-lambda--14-array-element-fold-end 
        Label        --array-fold-with-lambda--14-restore-reg-begin 
        Exchange                               
        PushD        register2                 
        Exchange                               
        StoreI                                 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-fold-with-lambda--14-restore-reg-end 
        Label        --array-fold-with-lambda--14--end- 
        StoreI                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% numList
        LoadI                                  
        Label        --print-string--15--begin- 
        Label        --print-string--15-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Exchange                               
        Label        --print-string--15-backup-reg-end 
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        register1                 
        Exchange                               
        StoreI                                 
        PushI        12                        
        Add                                    
        Label        --print-string--15--loop-begin- 
        PushD        register1                 
        LoadI                                  
        JumpFalse    --print-string--15--loop-end- 
        Duplicate                              
        PushI        1                         
        Add                                    
        Exchange                               
        LoadI                                  
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushD        $print-format-char        
        Printf                                 
        PushD        register1                 
        Exchange                               
        StoreI                                 
        PushI        -1                        
        PushD        register1                 
        LoadI                                  
        Add                                    
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Jump         --print-string--15--loop-begin- 
        Label        --print-string--15--loop-end- 
        Pop                                    
        Label        --print-string--15-restore-reg-begin 
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --print-string--15-restore-reg-end 
        Label        --print-string--15--end-  
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
        Label        --GCD-Calculation--16--function-begin- 
        PushD        register3                 
        Exchange                               
        StoreI                                 
        PushD        register1                 
        LoadI                                  
        PushD        register2                 
        LoadI                                  
        Multiply                               
        JumpTrue     --GCD-Calculation--16--check-initial-zero 
        PushI        1                         
        Jump         --GCD-Calculation--16--function-end- 
        Label        --GCD-Calculation--16--check-initial-zero 
        Label        --GCD-Calculation--16--loop-begin- 
        PushD        register1                 
        LoadI                                  
        Duplicate                              
        JumpFalse    --GCD-Calculation--16--loop-end- 
        PushD        register2                 
        LoadI                                  
        Duplicate                              
        JumpFalse    --GCD-Calculation--16--loop-end- 
        Subtract                               
        JumpPos      --GCD-Calculation--16--positive-case- 
        Label        --GCD-Calculation--16--not-positive-case- 
        PushD        register2                 
        LoadI                                  
        PushD        register1                 
        LoadI                                  
        Subtract                               
        PushD        register2                 
        Exchange                               
        StoreI                                 
        Jump         --GCD-Calculation--16--join- 
        Label        --GCD-Calculation--16--positive-case- 
        PushD        register1                 
        LoadI                                  
        PushD        register2                 
        LoadI                                  
        Subtract                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Jump         --GCD-Calculation--16--join- 
        Label        --GCD-Calculation--16--join- 
        Jump         --GCD-Calculation--16--loop-begin- 
        Label        --GCD-Calculation--16--loop-end- 
        Add                                    
        Label        --GCD-Calculation--16--function-end- 
        PushD        register3                 
        LoadI                                  
        Return                                 
