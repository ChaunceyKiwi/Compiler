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
        PushD        reg1-func                 
        PushI        1                         
        Duplicate                              
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      basicBlock-4              
        Jump         basicBlock-3              
        Label        basicBlock-2              
        PushD        $errors-rational-denominator-zero 
        PushD        $errors-general-message   
        Printf                                 
        Halt                                   
        Label        basicBlock-3              
        Negate                                 
        Jump         basicBlock-4              
        Label        basicBlock-4              
        StoreI                                 
        PushD        reg2-func                 
        PushI        4                         
        Duplicate                              
        JumpFalse    basicBlock-2              
        Jump         basicBlock-5              
        Label        basicBlock-5              
        Duplicate                              
        PushD        reg2-system               
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
        Label        -rational-number-2-rational-creation-begin 
        PushD        reg1-func                 
        PushI        4                         
        Duplicate                              
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      basicBlock-9              
        Jump         basicBlock-8              
        Label        basicBlock-8              
        Negate                                 
        Jump         basicBlock-9              
        Label        basicBlock-9              
        StoreI                                 
        PushD        reg2-func                 
        PushI        16                        
        Duplicate                              
        JumpFalse    basicBlock-2              
        Jump         basicBlock-10             
        Label        basicBlock-10             
        Duplicate                              
        PushD        reg2-system               
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
        JumpPos      basicBlock-14             
        Jump         basicBlock-13             
        Label        basicBlock-13             
        Negate                                 
        Jump         basicBlock-14             
        Label        basicBlock-14             
        StoreI                                 
        PushD        reg2-func                 
        PushD        reg2-system               
        LoadI                                  
        Duplicate                              
        PushD        reg2-system               
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      basicBlock-16             
        Jump         basicBlock-15             
        Label        basicBlock-15             
        Negate                                 
        Jump         basicBlock-16             
        Label        basicBlock-16             
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
        JumpPos      basicBlock-18             
        Jump         basicBlock-17             
        Label        basicBlock-17             
        PushD        $boolean-true-string      
        Jump         basicBlock-19             
        Label        basicBlock-18             
        PushD        $boolean-false-string     
        Jump         basicBlock-19             
        Label        basicBlock-19             
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $boolean-true-string      
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        --rational-comparasion--8--begin- 
        Label        -rational-number-6-rational-creation-begin 
        PushD        reg1-func                 
        PushI        7                         
        Duplicate                              
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      basicBlock-21             
        Jump         basicBlock-20             
        Label        basicBlock-20             
        Negate                                 
        Jump         basicBlock-21             
        Label        basicBlock-21             
        StoreI                                 
        PushD        reg2-func                 
        PushI        32                        
        Duplicate                              
        JumpFalse    basicBlock-2              
        Jump         basicBlock-22             
        Label        basicBlock-22             
        Duplicate                              
        PushD        reg2-system               
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      basicBlock-24             
        Jump         basicBlock-23             
        Label        basicBlock-23             
        Negate                                 
        Jump         basicBlock-24             
        Label        basicBlock-24             
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
        Label        -rational-number-7-rational-creation-begin 
        PushD        reg1-func                 
        PushI        4                         
        Duplicate                              
        PushD        reg1-system               
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      basicBlock-26             
        Jump         basicBlock-25             
        Label        basicBlock-25             
        Negate                                 
        Jump         basicBlock-26             
        Label        basicBlock-26             
        StoreI                                 
        PushD        reg2-func                 
        PushI        16                        
        Duplicate                              
        JumpFalse    basicBlock-2              
        Jump         basicBlock-27             
        Label        basicBlock-27             
        Duplicate                              
        PushD        reg2-system               
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      basicBlock-29             
        Jump         basicBlock-28             
        Label        basicBlock-28             
        Negate                                 
        Jump         basicBlock-29             
        Label        basicBlock-29             
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
        Label        -rational-number-7-rational-creation-end 
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
        JumpPos      basicBlock-31             
        Jump         basicBlock-30             
        Label        basicBlock-30             
        Negate                                 
        Jump         basicBlock-31             
        Label        basicBlock-31             
        StoreI                                 
        PushD        reg2-func                 
        PushD        reg2-system               
        LoadI                                  
        Duplicate                              
        PushD        reg2-system               
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpPos      basicBlock-33             
        Jump         basicBlock-32             
        Label        basicBlock-32             
        Negate                                 
        Jump         basicBlock-33             
        Label        basicBlock-33             
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
        JumpPos      basicBlock-35             
        Jump         basicBlock-34             
        Label        basicBlock-34             
        PushD        $boolean-true-string      
        Jump         basicBlock-36             
        Label        basicBlock-35             
        PushD        $boolean-false-string     
        Jump         basicBlock-36             
        Label        basicBlock-36             
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $boolean-true-string      
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Halt                                   
        Label        basicBlock-37             
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
        Label        basicBlock-38             
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
        Label        basicBlock-39             
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
        Jump         basicBlockHeader-40       
        Label        basicBlockHeader-40       
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        JumpFalse    basicBlock-45             
        Jump         basicBlock-41             
        Label        basicBlock-41             
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
        JumpPos      basicBlock-43             
        Jump         basicBlock-42             
        Label        basicBlock-42             
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
        Jump         basicBlockHeader-40       
        Label        basicBlock-43             
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
        JumpNeg      basicBlock-46             
        Jump         basicBlock-44             
        Label        basicBlock-44             
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
        Jump         basicBlock-46             
        Label        basicBlock-45             
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
        Jump         basicBlock-46             
        Label        basicBlock-46             
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        PushI        9                         
        Add                                    
        PushD        $mmgr-alloc-return        
        LoadI                                  
        Return                                 
        Label        basicBlock-47             
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
        Label        basicBlock-48             
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
        JumpFalse    basicBlock-50             
        Jump         basicBlock-49             
        Label        basicBlock-49             
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
        Jump         basicBlock-51             
        Label        basicBlock-50             
        PushD        $mmgr-remove-next         
        LoadI                                  
        PushD        $heap-first-free          
        Exchange                               
        StoreI                                 
        Jump         basicBlock-51             
        Label        basicBlock-51             
        PushD        $mmgr-remove-next         
        LoadI                                  
        JumpFalse    basicBlock-53             
        Jump         basicBlock-52             
        Label        basicBlock-52             
        PushD        $mmgr-remove-prev         
        LoadI                                  
        PushD        $mmgr-remove-next         
        LoadI                                  
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Jump         basicBlock-53             
        Label        basicBlock-53             
        PushD        $mmgr-remove-return       
        LoadI                                  
        Return                                 
        Label        basicBlock-54             
        Label        GCDCalculation            
        Label        --GCD-Calculation--11--function-begin- 
        PushD        reg1-func                 
        LoadI                                  
        PushD        reg2-func                 
        LoadI                                  
        Multiply                               
        JumpTrue     basicBlock-56             
        Jump         basicBlock-55             
        Label        basicBlock-55             
        PushI        1                         
        Jump         basicBlock-64             
        Label        basicBlock-56             
        Jump         basicBlockHeader-57       
        Label        basicBlockHeader-57       
        PushD        reg1-func                 
        LoadI                                  
        Duplicate                              
        JumpFalse    basicBlock-63             
        Jump         basicBlock-58             
        Label        basicBlock-58             
        PushD        reg2-func                 
        LoadI                                  
        Duplicate                              
        JumpFalse    basicBlock-63             
        Jump         basicBlock-59             
        Label        basicBlock-59             
        Subtract                               
        JumpPos      basicBlock-61             
        Jump         basicBlock-60             
        Label        basicBlock-60             
        PushD        reg2-func                 
        LoadI                                  
        PushD        reg1-func                 
        LoadI                                  
        Subtract                               
        PushD        reg2-func                 
        Exchange                               
        StoreI                                 
        Jump         basicBlock-62             
        Label        basicBlock-61             
        PushD        reg1-func                 
        LoadI                                  
        PushD        reg2-func                 
        LoadI                                  
        Subtract                               
        PushD        reg1-func                 
        Exchange                               
        StoreI                                 
        Jump         basicBlock-62             
        Label        basicBlock-62             
        Jump         basicBlockHeader-57       
        Label        basicBlock-63             
        Add                                    
        Jump         basicBlock-64             
        Label        basicBlock-64             
        Exchange                               
        Return                                 
