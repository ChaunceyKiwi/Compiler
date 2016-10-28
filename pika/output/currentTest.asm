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
        DataZ        16                        
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
        Label        $$rational-denominator-zero 
        PushD        $errors-rational-denominator-zero 
        Jump         $$general-runtime-error   
        PushD        reg1-func                 
        Exchange                               
        StoreI                                 
        PushD        reg2-func                 
        Exchange                               
        StoreI                                 
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        PushD        reg2-system               
        Exchange                               
        StoreI                                 
        PushD        reg3-system               
        Exchange                               
        StoreI                                 
        PushD        reg4-system               
        Exchange                               
        StoreI                                 
        Label        $$main                    
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        Label        -rational-number-1-rational-creation-begin 
        PushD        reg1-func                 
        PushI        4                         
        Duplicate                              
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      -rational-number-1-get-abs-for-arg1 
        Negate                                 
        Label        -rational-number-1-get-abs-for-arg1 
        StoreI                                 
        PushD        reg2-func                 
        PushI        8                         
        Duplicate                              
        JumpFalse    $$rational-denominator-zero 
        Duplicate                              
        PushD        reg2-system               
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      -rational-number-1-get-abs-for-arg2 
        Negate                                 
        Label        -rational-number-1-get-abs-for-arg2 
        StoreI                                 
        Call         GCDCalculation            
        PushD        reg1-func                 
        Exchange                               
        StoreI                                 
        PushI        8                         
        Call         -mem-manager-allocate     
        Duplicate                              
        PushD        reg1-system               
        LoadI                                  
        PushD        reg1-func                 
        LoadI                                  
        Divide                                 
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        reg2-system               
        LoadI                                  
        PushD        reg1-func                 
        LoadI                                  
        Divide                                 
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -rational-number-1-rational-creation-end 
        StoreI                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% b
        Label        -rational-number-2-rational-creation-begin 
        PushD        reg1-func                 
        PushI        20                        
        Duplicate                              
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      -rational-number-2-get-abs-for-arg1 
        Negate                                 
        Label        -rational-number-2-get-abs-for-arg1 
        StoreI                                 
        PushD        reg2-func                 
        PushI        40                        
        Duplicate                              
        JumpFalse    $$rational-denominator-zero 
        Duplicate                              
        PushD        reg2-system               
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      -rational-number-2-get-abs-for-arg2 
        Negate                                 
        Label        -rational-number-2-get-abs-for-arg2 
        StoreI                                 
        Call         GCDCalculation            
        PushD        reg1-func                 
        Exchange                               
        StoreI                                 
        PushI        8                         
        Call         -mem-manager-allocate     
        Duplicate                              
        PushD        reg1-system               
        LoadI                                  
        PushD        reg1-func                 
        LoadI                                  
        Divide                                 
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        reg2-system               
        LoadI                                  
        PushD        reg1-func                 
        LoadI                                  
        Divide                                 
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -rational-number-2-rational-creation-end 
        StoreI                                 
        Label        --rational-comparasion--3--begin- 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% b
        LoadI                                  
        PushD        reg2-system               
        Exchange                               
        StoreI                                 
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        PushD        reg1-system               
        LoadI                                  
        PushI        0                         
        Add                                    
        LoadI                                  
        PushD        reg2-system               
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        Multiply                               
        PushD        reg1-system               
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        PushD        reg2-system               
        LoadI                                  
        PushI        0                         
        Add                                    
        LoadI                                  
        Multiply                               
        Subtract                               
        PushD        reg1-system               
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        PushD        reg2-system               
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        Multiply                               
        PushD        reg2-system               
        Exchange                               
        StoreI                                 
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        PushD        reg1-func                 
        PushD        reg1-system               
        LoadI                                  
        Duplicate                              
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      --rational-comparasion--3-get-abs-for-arg1 
        Negate                                 
        Label        --rational-comparasion--3-get-abs-for-arg1 
        StoreI                                 
        PushD        reg2-func                 
        PushD        reg2-system               
        LoadI                                  
        Duplicate                              
        PushD        reg2-system               
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      --rational-comparasion--3-get-abs-for-arg2 
        Negate                                 
        Label        --rational-comparasion--3-get-abs-for-arg2 
        StoreI                                 
        Call         GCDCalculation            
        PushD        reg1-func                 
        Exchange                               
        StoreI                                 
        PushI        8                         
        Call         -mem-manager-allocate     
        Duplicate                              
        PushD        reg1-system               
        LoadI                                  
        PushD        reg1-func                 
        LoadI                                  
        Divide                                 
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        reg2-system               
        LoadI                                  
        PushD        reg1-func                 
        LoadI                                  
        Divide                                 
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        Multiply                               
        JumpPos      --rational-comparasion--3-true 
        Jump         --rational-comparasion--3-false 
        Label        --rational-comparasion--3-true 
        PushI        1                         
        Jump         --rational-comparasion--3-join 
        Label        --rational-comparasion--3-false 
        PushI        0                         
        Label        --rational-comparasion--3-join 
        Label        --rational-comparasion--3--end- 
        JumpTrue     -print-boolean-4-true     
        PushD        $boolean-false-string     
        Jump         -print-boolean-4-join     
        Label        -print-boolean-4-true     
        PushD        $boolean-true-string      
        Label        -print-boolean-4-join     
        PushD        $print-format-boolean     
        Printf                                 
        Label        --rational-comparasion--5--begin- 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% b
        LoadI                                  
        PushD        reg2-system               
        Exchange                               
        StoreI                                 
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        PushD        reg1-system               
        LoadI                                  
        PushI        0                         
        Add                                    
        LoadI                                  
        PushD        reg2-system               
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        Multiply                               
        PushD        reg1-system               
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        PushD        reg2-system               
        LoadI                                  
        PushI        0                         
        Add                                    
        LoadI                                  
        Multiply                               
        Subtract                               
        PushD        reg1-system               
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        PushD        reg2-system               
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        Multiply                               
        PushD        reg2-system               
        Exchange                               
        StoreI                                 
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        PushD        reg1-func                 
        PushD        reg1-system               
        LoadI                                  
        Duplicate                              
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      --rational-comparasion--5-get-abs-for-arg1 
        Negate                                 
        Label        --rational-comparasion--5-get-abs-for-arg1 
        StoreI                                 
        PushD        reg2-func                 
        PushD        reg2-system               
        LoadI                                  
        Duplicate                              
        PushD        reg2-system               
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      --rational-comparasion--5-get-abs-for-arg2 
        Negate                                 
        Label        --rational-comparasion--5-get-abs-for-arg2 
        StoreI                                 
        Call         GCDCalculation            
        PushD        reg1-func                 
        Exchange                               
        StoreI                                 
        PushI        8                         
        Call         -mem-manager-allocate     
        Duplicate                              
        PushD        reg1-system               
        LoadI                                  
        PushD        reg1-func                 
        LoadI                                  
        Divide                                 
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        reg2-system               
        LoadI                                  
        PushD        reg1-func                 
        LoadI                                  
        Divide                                 
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        Multiply                               
        JumpNeg      --rational-comparasion--5-false 
        Label        --rational-comparasion--5-true 
        PushI        1                         
        Jump         --rational-comparasion--5-join 
        Label        --rational-comparasion--5-false 
        PushI        0                         
        Label        --rational-comparasion--5-join 
        Label        --rational-comparasion--5--end- 
        JumpTrue     -print-boolean-6-true     
        PushD        $boolean-false-string     
        Jump         -print-boolean-6-join     
        Label        -print-boolean-6-true     
        PushD        $boolean-true-string      
        Label        -print-boolean-6-join     
        PushD        $print-format-boolean     
        Printf                                 
        Label        --rational-comparasion--7--begin- 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% b
        LoadI                                  
        PushD        reg2-system               
        Exchange                               
        StoreI                                 
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        PushD        reg1-system               
        LoadI                                  
        PushI        0                         
        Add                                    
        LoadI                                  
        PushD        reg2-system               
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        Multiply                               
        PushD        reg1-system               
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        PushD        reg2-system               
        LoadI                                  
        PushI        0                         
        Add                                    
        LoadI                                  
        Multiply                               
        Subtract                               
        PushD        reg1-system               
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        PushD        reg2-system               
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        Multiply                               
        PushD        reg2-system               
        Exchange                               
        StoreI                                 
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        PushD        reg1-func                 
        PushD        reg1-system               
        LoadI                                  
        Duplicate                              
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      --rational-comparasion--7-get-abs-for-arg1 
        Negate                                 
        Label        --rational-comparasion--7-get-abs-for-arg1 
        StoreI                                 
        PushD        reg2-func                 
        PushD        reg2-system               
        LoadI                                  
        Duplicate                              
        PushD        reg2-system               
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      --rational-comparasion--7-get-abs-for-arg2 
        Negate                                 
        Label        --rational-comparasion--7-get-abs-for-arg2 
        StoreI                                 
        Call         GCDCalculation            
        PushD        reg1-func                 
        Exchange                               
        StoreI                                 
        PushI        8                         
        Call         -mem-manager-allocate     
        Duplicate                              
        PushD        reg1-system               
        LoadI                                  
        PushD        reg1-func                 
        LoadI                                  
        Divide                                 
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        reg2-system               
        LoadI                                  
        PushD        reg1-func                 
        LoadI                                  
        Divide                                 
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        Multiply                               
        JumpFalse    --rational-comparasion--7-true 
        Jump         --rational-comparasion--7-false 
        Label        --rational-comparasion--7-true 
        PushI        1                         
        Jump         --rational-comparasion--7-join 
        Label        --rational-comparasion--7-false 
        PushI        0                         
        Label        --rational-comparasion--7-join 
        Label        --rational-comparasion--7--end- 
        JumpTrue     -print-boolean-8-true     
        PushD        $boolean-false-string     
        Jump         -print-boolean-8-join     
        Label        -print-boolean-8-true     
        PushD        $boolean-true-string      
        Label        -print-boolean-8-join     
        PushD        $print-format-boolean     
        Printf                                 
        Label        --rational-comparasion--9--begin- 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% b
        LoadI                                  
        PushD        reg2-system               
        Exchange                               
        StoreI                                 
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        PushD        reg1-system               
        LoadI                                  
        PushI        0                         
        Add                                    
        LoadI                                  
        PushD        reg2-system               
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        Multiply                               
        PushD        reg1-system               
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        PushD        reg2-system               
        LoadI                                  
        PushI        0                         
        Add                                    
        LoadI                                  
        Multiply                               
        Subtract                               
        PushD        reg1-system               
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        PushD        reg2-system               
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        Multiply                               
        PushD        reg2-system               
        Exchange                               
        StoreI                                 
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        PushD        reg1-func                 
        PushD        reg1-system               
        LoadI                                  
        Duplicate                              
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      --rational-comparasion--9-get-abs-for-arg1 
        Negate                                 
        Label        --rational-comparasion--9-get-abs-for-arg1 
        StoreI                                 
        PushD        reg2-func                 
        PushD        reg2-system               
        LoadI                                  
        Duplicate                              
        PushD        reg2-system               
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      --rational-comparasion--9-get-abs-for-arg2 
        Negate                                 
        Label        --rational-comparasion--9-get-abs-for-arg2 
        StoreI                                 
        Call         GCDCalculation            
        PushD        reg1-func                 
        Exchange                               
        StoreI                                 
        PushI        8                         
        Call         -mem-manager-allocate     
        Duplicate                              
        PushD        reg1-system               
        LoadI                                  
        PushD        reg1-func                 
        LoadI                                  
        Divide                                 
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        reg2-system               
        LoadI                                  
        PushD        reg1-func                 
        LoadI                                  
        Divide                                 
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        Multiply                               
        JumpFalse    --rational-comparasion--9-false 
        Label        --rational-comparasion--9-true 
        PushI        1                         
        Jump         --rational-comparasion--9-join 
        Label        --rational-comparasion--9-false 
        PushI        0                         
        Label        --rational-comparasion--9-join 
        Label        --rational-comparasion--9--end- 
        JumpTrue     -print-boolean-10-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-10-join    
        Label        -print-boolean-10-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-10-join    
        PushD        $print-format-boolean     
        Printf                                 
        Label        --rational-comparasion--11--begin- 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% b
        LoadI                                  
        PushD        reg2-system               
        Exchange                               
        StoreI                                 
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        PushD        reg1-system               
        LoadI                                  
        PushI        0                         
        Add                                    
        LoadI                                  
        PushD        reg2-system               
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        Multiply                               
        PushD        reg1-system               
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        PushD        reg2-system               
        LoadI                                  
        PushI        0                         
        Add                                    
        LoadI                                  
        Multiply                               
        Subtract                               
        PushD        reg1-system               
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        PushD        reg2-system               
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        Multiply                               
        PushD        reg2-system               
        Exchange                               
        StoreI                                 
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        PushD        reg1-func                 
        PushD        reg1-system               
        LoadI                                  
        Duplicate                              
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      --rational-comparasion--11-get-abs-for-arg1 
        Negate                                 
        Label        --rational-comparasion--11-get-abs-for-arg1 
        StoreI                                 
        PushD        reg2-func                 
        PushD        reg2-system               
        LoadI                                  
        Duplicate                              
        PushD        reg2-system               
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      --rational-comparasion--11-get-abs-for-arg2 
        Negate                                 
        Label        --rational-comparasion--11-get-abs-for-arg2 
        StoreI                                 
        Call         GCDCalculation            
        PushD        reg1-func                 
        Exchange                               
        StoreI                                 
        PushI        8                         
        Call         -mem-manager-allocate     
        Duplicate                              
        PushD        reg1-system               
        LoadI                                  
        PushD        reg1-func                 
        LoadI                                  
        Divide                                 
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        reg2-system               
        LoadI                                  
        PushD        reg1-func                 
        LoadI                                  
        Divide                                 
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        Multiply                               
        JumpPos      --rational-comparasion--11-false 
        Label        --rational-comparasion--11-true 
        PushI        1                         
        Jump         --rational-comparasion--11-join 
        Label        --rational-comparasion--11-false 
        PushI        0                         
        Label        --rational-comparasion--11-join 
        Label        --rational-comparasion--11--end- 
        JumpTrue     -print-boolean-12-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-12-join    
        Label        -print-boolean-12-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-12-join    
        PushD        $print-format-boolean     
        Printf                                 
        Label        --rational-comparasion--13--begin- 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% a
        LoadI                                  
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% b
        LoadI                                  
        PushD        reg2-system               
        Exchange                               
        StoreI                                 
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        PushD        reg1-system               
        LoadI                                  
        PushI        0                         
        Add                                    
        LoadI                                  
        PushD        reg2-system               
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        Multiply                               
        PushD        reg1-system               
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        PushD        reg2-system               
        LoadI                                  
        PushI        0                         
        Add                                    
        LoadI                                  
        Multiply                               
        Subtract                               
        PushD        reg1-system               
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        PushD        reg2-system               
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        Multiply                               
        PushD        reg2-system               
        Exchange                               
        StoreI                                 
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        PushD        reg1-func                 
        PushD        reg1-system               
        LoadI                                  
        Duplicate                              
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      --rational-comparasion--13-get-abs-for-arg1 
        Negate                                 
        Label        --rational-comparasion--13-get-abs-for-arg1 
        StoreI                                 
        PushD        reg2-func                 
        PushD        reg2-system               
        LoadI                                  
        Duplicate                              
        PushD        reg2-system               
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      --rational-comparasion--13-get-abs-for-arg2 
        Negate                                 
        Label        --rational-comparasion--13-get-abs-for-arg2 
        StoreI                                 
        Call         GCDCalculation            
        PushD        reg1-func                 
        Exchange                               
        StoreI                                 
        PushI        8                         
        Call         -mem-manager-allocate     
        Duplicate                              
        PushD        reg1-system               
        LoadI                                  
        PushD        reg1-func                 
        LoadI                                  
        Divide                                 
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        reg2-system               
        LoadI                                  
        PushD        reg1-func                 
        LoadI                                  
        Divide                                 
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        LoadI                                  
        Exchange                               
        PushI        4                         
        Add                                    
        LoadI                                  
        Multiply                               
        JumpNeg      --rational-comparasion--13-true 
        Jump         --rational-comparasion--13-false 
        Label        --rational-comparasion--13-true 
        PushI        1                         
        Jump         --rational-comparasion--13-join 
        Label        --rational-comparasion--13-false 
        PushI        0                         
        Label        --rational-comparasion--13-join 
        Label        --rational-comparasion--13--end- 
        JumpTrue     -print-boolean-14-true    
        PushD        $boolean-false-string     
        Jump         -print-boolean-14-join    
        Label        -print-boolean-14-true    
        PushD        $boolean-true-string      
        Label        -print-boolean-14-join    
        PushD        $print-format-boolean     
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
        Label        GCDCalculation            
        Label        --GCD-Calculation--15--function-begin- 
        PushD        reg1-func                 
        LoadI                                  
        PushD        reg2-func                 
        LoadI                                  
        Multiply                               
        JumpTrue     --GCD-Calculation--15--check-initial-zero 
        PushI        1                         
        Jump         --GCD-Calculation--15--function-end- 
        Label        --GCD-Calculation--15--check-initial-zero 
        Label        --GCD-Calculation--15--loop-begin- 
        PushD        reg1-func                 
        LoadI                                  
        Duplicate                              
        JumpFalse    --GCD-Calculation--15--loop-end- 
        PushD        reg2-func                 
        LoadI                                  
        Duplicate                              
        JumpFalse    --GCD-Calculation--15--loop-end- 
        Subtract                               
        JumpPos      --GCD-Calculation--15--positive-case- 
        Label        --GCD-Calculation--15--not-positive-case- 
        PushD        reg2-func                 
        LoadI                                  
        PushD        reg1-func                 
        LoadI                                  
        Subtract                               
        PushD        reg2-func                 
        Exchange                               
        StoreI                                 
        Jump         --GCD-Calculation--15--join- 
        Label        --GCD-Calculation--15--positive-case- 
        PushD        reg1-func                 
        LoadI                                  
        PushD        reg2-func                 
        LoadI                                  
        Subtract                               
        PushD        reg1-func                 
        Exchange                               
        StoreI                                 
        Label        --GCD-Calculation--15--join- 
        Jump         --GCD-Calculation--15--loop-begin- 
        Label        --GCD-Calculation--15--loop-end- 
        Add                                    
        Label        --GCD-Calculation--15--function-end- 
        Exchange                               
        Return                                 
