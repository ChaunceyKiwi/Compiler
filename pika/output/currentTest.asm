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
        DLabel       $usable-memory-start      
        DLabel       $global-memory-block      
        DataZ        36                        
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
        Add                                    %% ug
        PushI        21                        
        StoreI                                 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% dug
        PushI        29                        
        StoreI                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% lug
        PushI        32                        
        StoreI                                 
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% bug
        PushI        44                        
        StoreI                                 
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% rug
        PushI        16                        
        StoreI                                 
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% jug
        PushI        19                        
        StoreI                                 
        PushD        $global-memory-block      
        PushI        24                        
        Add                                    %% jugALugLugBug
        Label        -function-invocation-13-begin 
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% jug
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
        Label        -function-invocation-14-begin 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% lug
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
        Label        -function-invocation-15-begin 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% lug
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
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% bug
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
        Call         $function-max             
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
        Label        -function-invocation-15-end 
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
        Call         $function-max             
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
        Label        -function-invocation-14-end 
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
        Call         $function-max             
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
        Label        -function-invocation-13-end 
        StoreI                                 
        PushD        $global-memory-block      
        PushI        28                        
        Add                                    %% jigALigLigBig
        Label        -function-invocation-16-begin 
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% jug
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
        Label        -function-invocation-17-begin 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% lug
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
        Label        -function-invocation-18-begin 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% lug
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
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% bug
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
        Call         $function-min             
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
        Label        -function-invocation-18-end 
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
        Call         $function-min             
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
        Label        -function-invocation-17-end 
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
        Call         $function-min             
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
        Label        -function-invocation-16-end 
        StoreI                                 
        PushD        $global-memory-block      
        PushI        32                        
        Add                                    %% lugDugARug
        Label        -function-invocation-19-begin 
        Label        -function-invocation-20-begin 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% lug
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
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% dug
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
        Call         $function-min             
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
        Label        -function-invocation-20-end 
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
        Label        -function-invocation-21-begin 
        Label        -function-invocation-22-begin 
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% rug
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
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% jug
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
        Call         $function-max             
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
        Label        -function-invocation-22-end 
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
        Label        -function-invocation-23-begin 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% ug
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
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% dug
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
        Call         $function-max             
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
        Label        -function-invocation-23-end 
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
        Call         $function-min             
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
        Label        -function-invocation-21-end 
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
        Call         $function-max             
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
        Label        -function-invocation-19-end 
        StoreI                                 
        PushD        $global-memory-block      
        PushI        24                        
        Add                                    %% jugALugLugBug
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        28                        
        Add                                    %% jigALigLigBig
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $global-memory-block      
        PushI        32                        
        Add                                    %% lugDugARug
        LoadI                                  
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Halt                                   
        Label        basicBlock-2              
        Label        $function-min             
        Label        -lambda-definition-6-dynamic-link 
        PushD        $frame-pointer            
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-6-return-address 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-6-move-fp-to-sp 
        PushD        $stack-pointer            
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-6-subtract-frame-size 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        12                        
        Subtract                               
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-6-function-body-process 
        Label        -compare-2-arg1           
        PushD        $frame-pointer            
        LoadI                                  
        PushI        4                         
        Add                                    %% x
        LoadI                                  
        Label        -compare-2-arg2           
        PushD        $frame-pointer            
        LoadI                                  
        PushI        0                         
        Add                                    %% y
        LoadI                                  
        Label        -compare-2-sub            
        Subtract                               
        JumpPos      basicBlock-4              
        Jump         basicBlock-3              
        Label        basicBlock-3              
        PushD        $frame-pointer            
        LoadI                                  
        PushI        4                         
        Add                                    %% x
        LoadI                                  
        Jump         basicBlock-8              
        Label        basicBlock-4              
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -12                       
        Add                                    %% a
        PushI        5                         
        StoreI                                 
        Jump         basicBlockHeader-5        
        Label        basicBlockHeader-5        
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -12                       
        Add                                    %% a
        LoadI                                  
        Label        -compare-5-arg2           
        PushI        1                         
        Label        -compare-5-sub            
        Subtract                               
        JumpPos      basicBlock-6              
        Jump         basicBlock-7              
        Label        basicBlock-6              
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -12                       
        Add                                    %% a
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -12                       
        Add                                    %% a
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         basicBlockHeader-5        
        Label        basicBlock-7              
        PushD        $frame-pointer            
        LoadI                                  
        PushI        0                         
        Add                                    %% y
        LoadI                                  
        Jump         basicBlock-8              
        Label        basicBlock-8              
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        LoadI                                  
        Label        -lambda-definition-6-replace-frame-pointer 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-6-increment-stack-pointer 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        20                        
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        Label        -lambda-definition-6-decrement-stack-pointer 
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
        Label        basicBlock-9              
        Label        $function-max             
        Label        -lambda-definition-12-dynamic-link 
        PushD        $frame-pointer            
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-12-return-address 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-12-move-fp-to-sp 
        PushD        $stack-pointer            
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-12-subtract-frame-size 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        12                        
        Subtract                               
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-12-function-body-process 
        Label        -compare-8-arg1           
        PushD        $frame-pointer            
        LoadI                                  
        PushI        4                         
        Add                                    %% x
        LoadI                                  
        Label        -compare-8-arg2           
        PushD        $frame-pointer            
        LoadI                                  
        PushI        0                         
        Add                                    %% y
        LoadI                                  
        Label        -compare-8-sub            
        Subtract                               
        JumpNeg      basicBlock-11             
        Jump         basicBlock-10             
        Label        basicBlock-10             
        PushD        $frame-pointer            
        LoadI                                  
        PushI        4                         
        Add                                    %% x
        LoadI                                  
        Jump         basicBlock-15             
        Label        basicBlock-11             
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -12                       
        Add                                    %% b
        PushI        5                         
        StoreI                                 
        Jump         basicBlockHeader-12       
        Label        basicBlockHeader-12       
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -12                       
        Add                                    %% b
        LoadI                                  
        Label        -compare-11-arg2          
        PushI        1                         
        Label        -compare-11-sub           
        Subtract                               
        JumpPos      basicBlock-13             
        Jump         basicBlock-14             
        Label        basicBlock-13             
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -12                       
        Add                                    %% b
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -12                       
        Add                                    %% b
        LoadI                                  
        PushI        1                         
        Subtract                               
        StoreI                                 
        Jump         basicBlockHeader-12       
        Label        basicBlock-14             
        PushD        $frame-pointer            
        LoadI                                  
        PushI        0                         
        Add                                    %% y
        LoadI                                  
        Jump         basicBlock-15             
        Label        basicBlock-15             
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        LoadI                                  
        Label        -lambda-definition-12-replace-frame-pointer 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-12-increment-stack-pointer 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        20                        
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        Label        -lambda-definition-12-decrement-stack-pointer 
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
        Label        basicBlock-16             
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
        Label        basicBlock-17             
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
        Label        basicBlock-18             
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
        Label        basicBlock-19             
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
        JumpFalse    basicBlock-21             
        Jump         basicBlock-20             
        Label        basicBlock-20             
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
        Jump         basicBlock-22             
        Label        basicBlock-21             
        PushD        $mmgr-remove-next         
        LoadI                                  
        PushD        $heap-first-free          
        Exchange                               
        StoreI                                 
        Jump         basicBlock-22             
        Label        basicBlock-22             
        PushD        $mmgr-remove-next         
        LoadI                                  
        JumpFalse    basicBlock-24             
        Jump         basicBlock-23             
        Label        basicBlock-23             
        PushD        $mmgr-remove-prev         
        LoadI                                  
        PushD        $mmgr-remove-next         
        LoadI                                  
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Jump         basicBlock-24             
        Label        basicBlock-24             
        PushD        $mmgr-remove-return       
        LoadI                                  
        Return                                 
