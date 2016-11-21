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
        DataZ        0                         
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
        PushI        6                         
        Duplicate                              
        Duplicate                              
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        JumpNeg      basicBlock-3              
        Jump         basicBlock-5              
        Label        basicBlock-2              
        PushD        $errors-general-message   
        Printf                                 
        Halt                                   
        Label        basicBlock-3              
        PushD        $$errors-array-size-negative 
        Jump         basicBlock-2              
        Label        basicBlock-4              
        PushD        $errors-rational-denominator-zero 
        Jump         basicBlock-2              
        Label        basicBlock-5              
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
        Label        --expr-list--7-array-creation-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --expr-list--7-array-creation-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --expr-list--7-array-creation-length 
        Duplicate                              
        PushD        reg1-system               
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --expr-list--7-array-creation-end 
        Label        --expr-list--7-array-initialization-begin 
        Duplicate                              
        Label        -rational-number-1-rational-creation-begin 
        PushD        reg1-func                 
        PushI        1                         
        Duplicate                              
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      basicBlock-7              
        Jump         basicBlock-6              
        Label        basicBlock-6              
        Negate                                 
        Jump         basicBlock-7              
        Label        basicBlock-7              
        StoreI                                 
        PushD        reg2-func                 
        PushI        1                         
        Duplicate                              
        JumpFalse    basicBlock-4              
        Jump         basicBlock-8              
        Label        basicBlock-8              
        Duplicate                              
        PushD        reg2-system               
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
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        Label        -rational-number-2-rational-creation-begin 
        PushD        reg1-func                 
        PushI        2                         
        Duplicate                              
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      basicBlock-12             
        Jump         basicBlock-11             
        Label        basicBlock-11             
        Negate                                 
        Jump         basicBlock-12             
        Label        basicBlock-12             
        StoreI                                 
        PushD        reg2-func                 
        PushI        1                         
        Duplicate                              
        JumpFalse    basicBlock-4              
        Jump         basicBlock-13             
        Label        basicBlock-13             
        Duplicate                              
        PushD        reg2-system               
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      basicBlock-15             
        Jump         basicBlock-14             
        Label        basicBlock-14             
        Negate                                 
        Jump         basicBlock-15             
        Label        basicBlock-15             
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
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        Label        -rational-number-3-rational-creation-begin 
        PushD        reg1-func                 
        PushI        4                         
        Duplicate                              
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      basicBlock-17             
        Jump         basicBlock-16             
        Label        basicBlock-16             
        Negate                                 
        Jump         basicBlock-17             
        Label        basicBlock-17             
        StoreI                                 
        PushD        reg2-func                 
        PushI        1                         
        Duplicate                              
        JumpFalse    basicBlock-4              
        Jump         basicBlock-18             
        Label        basicBlock-18             
        Duplicate                              
        PushD        reg2-system               
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      basicBlock-20             
        Jump         basicBlock-19             
        Label        basicBlock-19             
        Negate                                 
        Jump         basicBlock-20             
        Label        basicBlock-20             
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
        Label        -rational-number-3-rational-creation-end 
        Exchange                               
        PushI        32                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        Label        -rational-number-4-rational-creation-begin 
        PushD        reg1-func                 
        PushI        6                         
        Duplicate                              
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      basicBlock-22             
        Jump         basicBlock-21             
        Label        basicBlock-21             
        Negate                                 
        Jump         basicBlock-22             
        Label        basicBlock-22             
        StoreI                                 
        PushD        reg2-func                 
        PushI        7                         
        Duplicate                              
        JumpFalse    basicBlock-4              
        Jump         basicBlock-23             
        Label        basicBlock-23             
        Duplicate                              
        PushD        reg2-system               
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      basicBlock-25             
        Jump         basicBlock-24             
        Label        basicBlock-24             
        Negate                                 
        Jump         basicBlock-25             
        Label        basicBlock-25             
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
        Label        -rational-number-4-rational-creation-end 
        Exchange                               
        PushI        40                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        Label        -rational-number-5-rational-creation-begin 
        PushD        reg1-func                 
        PushI        99                        
        Duplicate                              
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      basicBlock-27             
        Jump         basicBlock-26             
        Label        basicBlock-26             
        Negate                                 
        Jump         basicBlock-27             
        Label        basicBlock-27             
        StoreI                                 
        PushD        reg2-func                 
        PushI        1                         
        Duplicate                              
        JumpFalse    basicBlock-4              
        Jump         basicBlock-28             
        Label        basicBlock-28             
        Duplicate                              
        PushD        reg2-system               
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      basicBlock-30             
        Jump         basicBlock-29             
        Label        basicBlock-29             
        Negate                                 
        Jump         basicBlock-30             
        Label        basicBlock-30             
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
        Label        -rational-number-5-rational-creation-end 
        Exchange                               
        PushI        48                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        Label        -rational-number-6-rational-creation-begin 
        PushD        reg1-func                 
        PushI        10                        
        Duplicate                              
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      basicBlock-32             
        Jump         basicBlock-31             
        Label        basicBlock-31             
        Negate                                 
        Jump         basicBlock-32             
        Label        basicBlock-32             
        StoreI                                 
        PushD        reg2-func                 
        PushI        1                         
        Duplicate                              
        JumpFalse    basicBlock-4              
        Jump         basicBlock-33             
        Label        basicBlock-33             
        Duplicate                              
        PushD        reg2-system               
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      basicBlock-35             
        Jump         basicBlock-34             
        Label        basicBlock-34             
        Negate                                 
        Jump         basicBlock-35             
        Label        basicBlock-35             
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
        Label        -rational-number-6-rational-creation-end 
        Exchange                               
        PushI        56                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --expr-list--7-array-initialization-end 
        Label        --print-array--8--begin-  
        Duplicate                              
        Label        --print-array--8--push-array-length 
        PushI        12                        
        Add                                    
        LoadI                                  
        PushD        reg-counter               
        Exchange                               
        StoreI                                 
        PushI        16                        
        Add                                    
        PushD        $print-format-open-square-bracket 
        Printf                                 
        Jump         basicBlockHeader-36       
        Label        basicBlockHeader-36       
        PushD        reg-counter               
        LoadI                                  
        JumpFalse    basicBlock-53             
        Jump         basicBlock-37             
        Label        basicBlock-37             
        Duplicate                              
        PushI        8                         
        Add                                    
        Exchange                               
        LoadI                                  
        PushD        reg-counter               
        LoadI                                  
        Exchange                               
        Label        --print-rational--9--begin- 
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        PushD        reg1-system               
        LoadI                                  
        LoadI                                  
        PushD        reg1-system               
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        Divide                                 
        Duplicate                              
        Duplicate                              
        JumpFalse    basicBlock-39             
        Jump         basicBlock-38             
        Label        basicBlock-38             
        PushD        $print-format-integer     
        Printf                                 
        Jump         basicBlock-43             
        Label        basicBlock-39             
        Pop                                    
        PushD        reg1-system               
        LoadI                                  
        LoadI                                  
        PushD        reg1-system               
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        Multiply                               
        Duplicate                              
        JumpTrue     basicBlock-41             
        Jump         basicBlock-40             
        Label        basicBlock-40             
        Pop                                    
        Pop                                    
        PushI        0                         
        PushD        $print-format-integer     
        Printf                                 
        Jump         basicBlock-51             
        Label        basicBlock-41             
        JumpPos      basicBlock-43             
        Jump         basicBlock-42             
        Label        basicBlock-42             
        PushD        $print-format-minus-sign  
        Printf                                 
        Jump         basicBlock-43             
        Label        basicBlock-43             
        PushD        reg1-system               
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        Multiply                               
        PushD        reg1-system               
        LoadI                                  
        LoadI                                  
        Exchange                               
        Subtract                               
        Duplicate                              
        JumpFalse    basicBlock-45             
        Jump         basicBlock-44             
        Label        basicBlock-44             
        Duplicate                              
        Jump         basicBlock-45             
        Label        basicBlock-45             
        JumpFalse    basicBlock-51             
        Jump         basicBlock-46             
        Label        basicBlock-46             
        PushD        reg1-system               
        LoadI                                  
        LoadI                                  
        JumpPos      basicBlock-48             
        Jump         basicBlock-47             
        Label        basicBlock-47             
        Negate                                 
        Jump         basicBlock-48             
        Label        basicBlock-48             
        PushD        $print-format-and         
        Printf                                 
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-over        
        Printf                                 
        PushD        reg1-system               
        LoadI                                  
        PushI        4                         
        Add                                    
        LoadI                                  
        Duplicate                              
        JumpPos      basicBlock-50             
        Jump         basicBlock-49             
        Label        basicBlock-49             
        Negate                                 
        Jump         basicBlock-50             
        Label        basicBlock-50             
        PushD        $print-format-integer     
        Printf                                 
        Jump         basicBlock-51             
        Label        basicBlock-51             
        PushD        reg-counter               
        Exchange                               
        StoreI                                 
        PushI        -1                        
        PushD        reg-counter               
        LoadI                                  
        Add                                    
        PushD        reg-counter               
        Exchange                               
        StoreI                                 
        PushD        reg-counter               
        LoadI                                  
        JumpFalse    basicBlock-53             
        Jump         basicBlock-52             
        Label        basicBlock-52             
        PushD        $print-format-separator   
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        Jump         basicBlockHeader-36       
        Label        basicBlock-53             
        Pop                                    
        PushD        $print-format-close-square-bracket 
        Printf                                 
        Label        --print-array--8--end-    
        Halt                                   
        Label        basicBlock-54             
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
        Label        basicBlock-55             
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
        Label        basicBlock-56             
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
        Jump         basicBlockHeader-57       
        Label        basicBlockHeader-57       
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        JumpFalse    basicBlock-62             
        Jump         basicBlock-58             
        Label        basicBlock-58             
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
        JumpPos      basicBlock-60             
        Jump         basicBlock-59             
        Label        basicBlock-59             
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
        Jump         basicBlockHeader-57       
        Label        basicBlock-60             
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
        JumpNeg      basicBlock-63             
        Jump         basicBlock-61             
        Label        basicBlock-61             
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
        Jump         basicBlock-63             
        Label        basicBlock-62             
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
        Jump         basicBlock-63             
        Label        basicBlock-63             
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        PushI        9                         
        Add                                    
        PushD        $mmgr-alloc-return        
        LoadI                                  
        Return                                 
        Label        basicBlock-64             
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
        Label        basicBlock-65             
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
        JumpFalse    basicBlock-67             
        Jump         basicBlock-66             
        Label        basicBlock-66             
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
        Jump         basicBlock-68             
        Label        basicBlock-67             
        PushD        $mmgr-remove-next         
        LoadI                                  
        PushD        $heap-first-free          
        Exchange                               
        StoreI                                 
        Jump         basicBlock-68             
        Label        basicBlock-68             
        PushD        $mmgr-remove-next         
        LoadI                                  
        JumpFalse    basicBlock-70             
        Jump         basicBlock-69             
        Label        basicBlock-69             
        PushD        $mmgr-remove-prev         
        LoadI                                  
        PushD        $mmgr-remove-next         
        LoadI                                  
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Jump         basicBlock-70             
        Label        basicBlock-70             
        PushD        $mmgr-remove-return       
        LoadI                                  
        Return                                 
        Label        basicBlock-71             
        Label        GCDCalculation            
        Label        --GCD-Calculation--10--function-begin- 
        PushD        reg1-func                 
        LoadI                                  
        PushD        reg2-func                 
        LoadI                                  
        Multiply                               
        JumpTrue     basicBlock-73             
        Jump         basicBlock-72             
        Label        basicBlock-72             
        PushI        1                         
        Jump         basicBlock-81             
        Label        basicBlock-73             
        Jump         basicBlockHeader-74       
        Label        basicBlockHeader-74       
        PushD        reg1-func                 
        LoadI                                  
        Duplicate                              
        JumpFalse    basicBlock-80             
        Jump         basicBlock-75             
        Label        basicBlock-75             
        PushD        reg2-func                 
        LoadI                                  
        Duplicate                              
        JumpFalse    basicBlock-80             
        Jump         basicBlock-76             
        Label        basicBlock-76             
        Subtract                               
        JumpPos      basicBlock-78             
        Jump         basicBlock-77             
        Label        basicBlock-77             
        PushD        reg2-func                 
        LoadI                                  
        PushD        reg1-func                 
        LoadI                                  
        Subtract                               
        PushD        reg2-func                 
        Exchange                               
        StoreI                                 
        Jump         basicBlock-79             
        Label        basicBlock-78             
        PushD        reg1-func                 
        LoadI                                  
        PushD        reg2-func                 
        LoadI                                  
        Subtract                               
        PushD        reg1-func                 
        Exchange                               
        StoreI                                 
        Jump         basicBlock-79             
        Label        basicBlock-79             
        Jump         basicBlockHeader-74       
        Label        basicBlock-80             
        Add                                    
        Jump         basicBlock-81             
        Label        basicBlock-81             
        Exchange                               
        Return                                 
