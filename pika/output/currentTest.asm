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
        DataZ        27                        
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
        Add                                    %% quarters
        PushI        5                         
        StoreI                                 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% dimes
        PushI        3                         
        StoreI                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% nickels
        PushI        7                         
        StoreI                                 
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% pennies
        PushI        17                        
        StoreI                                 
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% value
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% quarters
        LoadI                                  
        PushI        25                        
        Multiply                               
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% dimes
        LoadI                                  
        PushI        10                        
        Multiply                               
        Add                                    
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% nickels
        LoadI                                  
        PushI        5                         
        Multiply                               
        Add                                    
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% pennies
        LoadI                                  
        Add                                    
        StoreI                                 
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% value
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% ncoins
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% quarters
        LoadI                                  
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% dimes
        LoadI                                  
        Add                                    
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% nickels
        LoadI                                  
        Add                                    
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% pennies
        LoadI                                  
        Add                                    
        StoreI                                 
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% ncoins
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        24                        
        Add                                    %% moredimes
        Label        -compare-1-arg1           
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% dimes
        LoadI                                  
        Label        -compare-1-arg2           
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% nickels
        LoadI                                  
        Label        -compare-1-sub            
        Subtract                               
        JumpPos      basicBlock-2              
        Jump         basicBlock-3              
        Label        basicBlock-2              
        PushI        1                         
        Jump         basicBlock-4              
        Label        basicBlock-3              
        PushI        0                         
        Jump         basicBlock-4              
        Label        basicBlock-4              
        StoreC                                 
        PushD        $global-memory-block      
        PushI        24                        
        Add                                    %% moredimes
        LoadC                                  
        JumpTrue     basicBlock-6              
        Jump         basicBlock-5              
        Label        basicBlock-5              
        PushD        $boolean-false-string     
        Jump         basicBlock-7              
        Label        basicBlock-6              
        PushD        $boolean-true-string      
        Jump         basicBlock-7              
        Label        basicBlock-7              
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        25                        
        Add                                    %% boot
        PushI        1                         
        StoreC                                 
        PushD        $global-memory-block      
        PushI        26                        
        Add                                    %% boof
        PushI        0                         
        StoreC                                 
        PushD        $global-memory-block      
        PushI        25                        
        Add                                    %% boot
        LoadC                                  
        JumpTrue     basicBlock-9              
        Jump         basicBlock-8              
        Label        basicBlock-8              
        PushD        $boolean-false-string     
        Jump         basicBlock-10             
        Label        basicBlock-9              
        PushD        $boolean-true-string      
        Jump         basicBlock-10             
        Label        basicBlock-10             
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        26                        
        Add                                    %% boof
        LoadC                                  
        JumpTrue     basicBlock-12             
        Jump         basicBlock-11             
        Label        basicBlock-11             
        PushD        $boolean-false-string     
        Jump         basicBlock-13             
        Label        basicBlock-12             
        PushD        $boolean-true-string      
        Jump         basicBlock-13             
        Label        basicBlock-13             
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        25                        
        Add                                    %% boot
        LoadC                                  
        JumpTrue     basicBlock-15             
        Jump         basicBlock-14             
        Label        basicBlock-14             
        PushD        $boolean-false-string     
        Jump         basicBlock-16             
        Label        basicBlock-15             
        PushD        $boolean-true-string      
        Jump         basicBlock-16             
        Label        basicBlock-16             
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $global-memory-block      
        PushI        26                        
        Add                                    %% boof
        LoadC                                  
        JumpTrue     basicBlock-18             
        Jump         basicBlock-17             
        Label        basicBlock-17             
        PushD        $boolean-false-string     
        Jump         basicBlock-19             
        Label        basicBlock-18             
        PushD        $boolean-true-string      
        Jump         basicBlock-19             
        Label        basicBlock-19             
        PushD        $print-format-boolean     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Halt                                   
        Label        basicBlock-20             
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
        Label        basicBlock-21             
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
        Label        basicBlock-22             
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
        Label        basicBlock-23             
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
        JumpFalse    basicBlock-25             
        Jump         basicBlock-24             
        Label        basicBlock-24             
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
        Jump         basicBlock-26             
        Label        basicBlock-25             
        PushD        $mmgr-remove-next         
        LoadI                                  
        PushD        $heap-first-free          
        Exchange                               
        StoreI                                 
        Jump         basicBlock-26             
        Label        basicBlock-26             
        PushD        $mmgr-remove-next         
        LoadI                                  
        JumpFalse    basicBlock-28             
        Jump         basicBlock-27             
        Label        basicBlock-27             
        PushD        $mmgr-remove-prev         
        LoadI                                  
        PushD        $mmgr-remove-next         
        LoadI                                  
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Jump         basicBlock-28             
        Label        basicBlock-28             
        PushD        $mmgr-remove-return       
        LoadI                                  
        Return                                 
