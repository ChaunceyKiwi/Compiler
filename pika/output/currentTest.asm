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
        DLabel       $global-memory-block      
        DataZ        28                        
        DLabel       register1                 
        DataI        0                         
        DLabel       register2                 
        DataI        0                         
        DLabel       register3                 
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
        Jump         basicBlock-8              
        Label        basicBlock-2              
        PushD        $errors-general-message   
        Printf                                 
        Halt                                   
        Jump         basicBlock-3              
        Label        basicBlock-3              
        PushD        $errors-int-divide-by-zero 
        Jump         basicBlock-2              
        Label        basicBlock-4              
        PushD        $$errors-array-size-negative 
        Jump         basicBlock-2              
        Label        basicBlock-5              
        PushD        $$errors-array-index-negative 
        Jump         basicBlock-2              
        Label        basicBlock-6              
        PushD        $$errors-index-exceed-bound 
        Jump         basicBlock-2              
        Label        basicBlock-7              
        Label        $function-nice            
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
        PushI        4                         
        Add                                    %% a
        LoadI                                  
        PushD        $frame-pointer            
        LoadI                                  
        PushI        0                         
        Add                                    %% b
        LoadI                                  
        Add                                    
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
        PushI        16                        
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
        StoreI                                 
        Return                                 
        Jump         basicBlock-8              
        Label        basicBlock-8              
        Jump         basicBlock-12             
        Label        basicBlock-9              
        Label        $function-giveNice        
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
        PushI        8                         
        Subtract                               
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-6-function-body-process 
        Jump         basicBlock-11             
        Label        basicBlock-10             
        Label        $function--lambda-definition-5-Lambda 
        Label        -lambda-definition-5-dynamic-link 
        PushD        $frame-pointer            
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-5-return-address 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-5-move-fp-to-sp 
        PushD        $stack-pointer            
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-5-subtract-frame-size 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        8                         
        Subtract                               
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-5-function-body-process 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        4                         
        Add                                    %% a
        LoadI                                  
        PushD        $frame-pointer            
        LoadI                                  
        PushI        0                         
        Add                                    %% b
        LoadI                                  
        Add                                    
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        LoadI                                  
        Label        -lambda-definition-5-replace-frame-pointer 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-5-increment-stack-pointer 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        16                        
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        Label        -lambda-definition-5-decrement-stack-pointer 
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
        Jump         basicBlock-11             
        Label        basicBlock-11             
        PushD        $function--lambda-definition-5-Lambda 
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
        PushI        8                         
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
        Jump         basicBlock-12             
        Label        basicBlock-12             
        Jump         basicBlock-24             
        Label        basicBlock-13             
        Label        $function-giveNiceArray   
        Label        -lambda-definition-18-dynamic-link 
        PushD        $frame-pointer            
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-18-return-address 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-18-move-fp-to-sp 
        PushD        $stack-pointer            
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-18-subtract-frame-size 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        28                        
        Subtract                               
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-18-function-body-process 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -12                       
        Add                                    %% plus
        Jump         basicBlock-15             
        Label        basicBlock-14             
        Label        $function--lambda-definition-9-Lambda 
        Label        -lambda-definition-9-dynamic-link 
        PushD        $frame-pointer            
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-9-return-address 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-9-move-fp-to-sp 
        PushD        $stack-pointer            
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-9-subtract-frame-size 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        8                         
        Subtract                               
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-9-function-body-process 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        4                         
        Add                                    %% a
        LoadI                                  
        PushD        $frame-pointer            
        LoadI                                  
        PushI        0                         
        Add                                    %% b
        LoadI                                  
        Add                                    
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        LoadI                                  
        Label        -lambda-definition-9-replace-frame-pointer 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-9-increment-stack-pointer 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        16                        
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        Label        -lambda-definition-9-decrement-stack-pointer 
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
        Jump         basicBlock-15             
        Label        basicBlock-15             
        PushD        $function--lambda-definition-9-Lambda 
        StoreI                                 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -16                       
        Add                                    %% minus
        Jump         basicBlock-17             
        Label        basicBlock-16             
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
        PushD        $frame-pointer            
        LoadI                                  
        PushI        4                         
        Add                                    %% a
        LoadI                                  
        PushD        $frame-pointer            
        LoadI                                  
        PushI        0                         
        Add                                    %% b
        LoadI                                  
        Subtract                               
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
        Jump         basicBlock-17             
        Label        basicBlock-17             
        PushD        $function--lambda-definition-11-Lambda 
        StoreI                                 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -20                       
        Add                                    %% multiply
        Jump         basicBlock-19             
        Label        basicBlock-18             
        Label        $function--lambda-definition-13-Lambda 
        Label        -lambda-definition-13-dynamic-link 
        PushD        $frame-pointer            
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-13-return-address 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-13-move-fp-to-sp 
        PushD        $stack-pointer            
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-13-subtract-frame-size 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        8                         
        Subtract                               
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-13-function-body-process 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        4                         
        Add                                    %% a
        LoadI                                  
        PushD        $frame-pointer            
        LoadI                                  
        PushI        0                         
        Add                                    %% b
        LoadI                                  
        Multiply                               
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        LoadI                                  
        Label        -lambda-definition-13-replace-frame-pointer 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-13-increment-stack-pointer 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        16                        
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        Label        -lambda-definition-13-decrement-stack-pointer 
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
        Jump         basicBlock-19             
        Label        basicBlock-19             
        PushD        $function--lambda-definition-13-Lambda 
        StoreI                                 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -24                       
        Add                                    %% divide
        Jump         basicBlock-22             
        Label        basicBlock-20             
        Label        $function--lambda-definition-15-Lambda 
        Label        -lambda-definition-15-dynamic-link 
        PushD        $frame-pointer            
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-15-return-address 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-15-move-fp-to-sp 
        PushD        $stack-pointer            
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-15-subtract-frame-size 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        8                         
        Subtract                               
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-15-function-body-process 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        4                         
        Add                                    %% a
        LoadI                                  
        PushD        $frame-pointer            
        LoadI                                  
        PushI        0                         
        Add                                    %% b
        LoadI                                  
        Duplicate                              
        JumpFalse    basicBlock-3              
        Jump         basicBlock-21             
        Label        basicBlock-21             
        Divide                                 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        LoadI                                  
        Label        -lambda-definition-15-replace-frame-pointer 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-15-increment-stack-pointer 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        16                        
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        Label        -lambda-definition-15-decrement-stack-pointer 
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
        Jump         basicBlock-22             
        Label        basicBlock-22             
        PushD        $function--lambda-definition-15-Lambda 
        StoreI                                 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -28                       
        Add                                    %% lambdaArray
        Label        --array-creation--16--begin 
        Label        --array-creation--16-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--16-backup-reg-end 
        Label        --array-creation--16--get-length 
        PushI        4                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      basicBlock-4              
        Jump         basicBlock-23             
        Label        basicBlock-23             
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
        Label        --array-creation--16-set-status 
        Duplicate                              
        PushI        2                         
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
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -12                       
        Add                                    %% plus
        LoadI                                  
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -16                       
        Add                                    %% minus
        LoadI                                  
        Exchange                               
        PushI        20                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -20                       
        Add                                    %% multiply
        LoadI                                  
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -24                       
        Add                                    %% divide
        LoadI                                  
        Exchange                               
        PushI        28                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-initialization--17-array-initialization-end 
        StoreI                                 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -28                       
        Add                                    %% lambdaArray
        LoadI                                  
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        LoadI                                  
        Label        -lambda-definition-18-replace-frame-pointer 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-18-increment-stack-pointer 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        28                        
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        Label        -lambda-definition-18-decrement-stack-pointer 
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
        Jump         basicBlock-24             
        Label        basicBlock-24             
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% plus
        Jump         basicBlock-26             
        Label        basicBlock-25             
        Label        $function--lambda-definition-20-Lambda 
        Label        -lambda-definition-20-dynamic-link 
        PushD        $frame-pointer            
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-20-return-address 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-20-move-fp-to-sp 
        PushD        $stack-pointer            
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-20-subtract-frame-size 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        8                         
        Subtract                               
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-20-function-body-process 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        4                         
        Add                                    %% a
        LoadI                                  
        PushD        $frame-pointer            
        LoadI                                  
        PushI        0                         
        Add                                    %% b
        LoadI                                  
        Add                                    
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        LoadI                                  
        Label        -lambda-definition-20-replace-frame-pointer 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-20-increment-stack-pointer 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        16                        
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        Label        -lambda-definition-20-decrement-stack-pointer 
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
        Jump         basicBlock-26             
        Label        basicBlock-26             
        PushD        $function--lambda-definition-20-Lambda 
        StoreI                                 
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% minus
        Jump         basicBlock-28             
        Label        basicBlock-27             
        Label        $function--lambda-definition-22-Lambda 
        Label        -lambda-definition-22-dynamic-link 
        PushD        $frame-pointer            
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-22-return-address 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-22-move-fp-to-sp 
        PushD        $stack-pointer            
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-22-subtract-frame-size 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        8                         
        Subtract                               
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-22-function-body-process 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        4                         
        Add                                    %% a
        LoadI                                  
        PushD        $frame-pointer            
        LoadI                                  
        PushI        0                         
        Add                                    %% b
        LoadI                                  
        Subtract                               
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        LoadI                                  
        Label        -lambda-definition-22-replace-frame-pointer 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-22-increment-stack-pointer 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        16                        
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        Label        -lambda-definition-22-decrement-stack-pointer 
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
        Jump         basicBlock-28             
        Label        basicBlock-28             
        PushD        $function--lambda-definition-22-Lambda 
        StoreI                                 
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% multiply
        Jump         basicBlock-30             
        Label        basicBlock-29             
        Label        $function--lambda-definition-24-Lambda 
        Label        -lambda-definition-24-dynamic-link 
        PushD        $frame-pointer            
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-24-return-address 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-24-move-fp-to-sp 
        PushD        $stack-pointer            
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-24-subtract-frame-size 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        8                         
        Subtract                               
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-24-function-body-process 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        4                         
        Add                                    %% a
        LoadI                                  
        PushD        $frame-pointer            
        LoadI                                  
        PushI        0                         
        Add                                    %% b
        LoadI                                  
        Multiply                               
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        LoadI                                  
        Label        -lambda-definition-24-replace-frame-pointer 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-24-increment-stack-pointer 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        16                        
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        Label        -lambda-definition-24-decrement-stack-pointer 
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
        Jump         basicBlock-30             
        Label        basicBlock-30             
        PushD        $function--lambda-definition-24-Lambda 
        StoreI                                 
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% divide
        Jump         basicBlock-33             
        Label        basicBlock-31             
        Label        $function--lambda-definition-26-Lambda 
        Label        -lambda-definition-26-dynamic-link 
        PushD        $frame-pointer            
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-26-return-address 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-26-move-fp-to-sp 
        PushD        $stack-pointer            
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-26-subtract-frame-size 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        8                         
        Subtract                               
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-26-function-body-process 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        4                         
        Add                                    %% a
        LoadI                                  
        PushD        $frame-pointer            
        LoadI                                  
        PushI        0                         
        Add                                    %% b
        LoadI                                  
        Duplicate                              
        JumpFalse    basicBlock-3              
        Jump         basicBlock-32             
        Label        basicBlock-32             
        Divide                                 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        LoadI                                  
        Label        -lambda-definition-26-replace-frame-pointer 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-26-increment-stack-pointer 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        16                        
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        Label        -lambda-definition-26-decrement-stack-pointer 
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
        Jump         basicBlock-33             
        Label        basicBlock-33             
        PushD        $function--lambda-definition-26-Lambda 
        StoreI                                 
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% lambdaArray
        Label        --array-creation--27--begin 
        Label        --array-creation--27-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--27-backup-reg-end 
        Label        --array-creation--27--get-length 
        PushI        4                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      basicBlock-4              
        Jump         basicBlock-34             
        Label        basicBlock-34             
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
        Label        --array-creation--27-set-status 
        Duplicate                              
        PushI        2                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--27-set-subtype-size 
        Duplicate                              
        PushI        4                         
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
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% plus
        LoadI                                  
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% minus
        LoadI                                  
        Exchange                               
        PushI        20                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% multiply
        LoadI                                  
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushD        $global-memory-block      
        PushI        12                        
        Add                                    %% divide
        LoadI                                  
        Exchange                               
        PushI        28                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-initialization--28-array-initialization-end 
        StoreI                                 
        PushD        $global-memory-block      
        PushI        20                        
        Add                                    %% plusVarCopy
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% plus
        LoadI                                  
        StoreI                                 
        PushD        $global-memory-block      
        PushI        24                        
        Add                                    %% plusConstCopy
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% plus
        LoadI                                  
        StoreI                                 
        Label        -function-invocation-29-begin 
        PushI        3                         
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
        PushI        4                         
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
        Call         $function-nice            
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
        Label        -function-invocation-29-end 
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -function-invocation-30-begin 
        PushI        3                         
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
        PushI        4                         
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
        Add                                    %% plusVarCopy
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
        Label        -function-invocation-30-end 
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -function-invocation-31-begin 
        PushI        3                         
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
        PushI        4                         
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
        PushI        24                        
        Add                                    %% plusConstCopy
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
        Label        -function-invocation-31-end 
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -function-invocation-32-begin 
        PushI        3                         
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
        PushI        4                         
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
        Jump         basicBlock-36             
        Label        basicBlock-35             
        Label        $function--lambda-definition-34-Lambda 
        Label        -lambda-definition-34-dynamic-link 
        PushD        $frame-pointer            
        LoadI                                  
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-34-return-address 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-34-move-fp-to-sp 
        PushD        $stack-pointer            
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-34-subtract-frame-size 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        8                         
        Subtract                               
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-34-function-body-process 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        4                         
        Add                                    %% a
        LoadI                                  
        PushD        $frame-pointer            
        LoadI                                  
        PushI        0                         
        Add                                    %% b
        LoadI                                  
        Add                                    
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -8                        
        Add                                    
        LoadI                                  
        Label        -lambda-definition-34-replace-frame-pointer 
        PushD        $frame-pointer            
        LoadI                                  
        PushI        -4                        
        Add                                    
        LoadI                                  
        PushD        $frame-pointer            
        Exchange                               
        StoreI                                 
        Label        -lambda-definition-34-increment-stack-pointer 
        PushD        $stack-pointer            
        LoadI                                  
        PushI        16                        
        Add                                    
        PushD        $stack-pointer            
        Exchange                               
        StoreI                                 
        Exchange                               
        Label        -lambda-definition-34-decrement-stack-pointer 
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
        Jump         basicBlock-36             
        Label        basicBlock-36             
        PushD        $function--lambda-definition-34-Lambda 
        Call         $function--lambda-definition-34-Lambda 
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
        Label        -function-invocation-32-end 
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -function-invocation-35-begin 
        PushI        3                         
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
        PushI        4                         
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
        Label        --array-element-index--36-array-index-begin 
        Label        --array-element-index--36-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-element-index--36-backup-reg-end 
        PushD        $global-memory-block      
        PushI        16                        
        Add                                    %% lambdaArray
        LoadI                                  
        Duplicate                              
        PushI        0                         
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpNeg      basicBlock-5              
        Jump         basicBlock-37             
        Label        basicBlock-37             
        Exchange                               
        PushI        12                        
        Add                                    
        LoadI                                  
        Exchange                               
        Subtract                               
        JumpPos      basicBlock-38             
        Jump         basicBlock-6              
        Label        basicBlock-38             
        PushI        16                        
        Add                                    
        PushD        register1                 
        LoadI                                  
        PushI        4                         
        Multiply                               
        Add                                    
        Label        --array-element-index--36-array-index-fetching-end 
        Label        --array-element-index--36-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-element-index--36-restore-reg-end 
        Label        --array-element-index--36-array-index-end 
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
        Label        -function-invocation-35-end 
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -function-invocation-37-begin 
        PushI        3                         
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
        PushI        4                         
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
        Label        -function-invocation-38-begin 
        Call         $function-giveNice        
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
        Label        -function-invocation-38-end 
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
        Label        -function-invocation-37-end 
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Label        -function-invocation-39-begin 
        PushI        3                         
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
        PushI        4                         
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
        Label        --array-element-index--41-array-index-begin 
        Label        --array-element-index--41-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-element-index--41-backup-reg-end 
        Label        -function-invocation-40-begin 
        Call         $function-giveNiceArray   
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
        Label        -function-invocation-40-end 
        Duplicate                              
        PushI        3                         
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpNeg      basicBlock-5              
        Jump         basicBlock-39             
        Label        basicBlock-39             
        Exchange                               
        PushI        12                        
        Add                                    
        LoadI                                  
        Exchange                               
        Subtract                               
        JumpPos      basicBlock-40             
        Jump         basicBlock-6              
        Label        basicBlock-40             
        PushI        16                        
        Add                                    
        PushD        register1                 
        LoadI                                  
        PushI        4                         
        Multiply                               
        Add                                    
        Label        --array-element-index--41-array-index-fetching-end 
        Label        --array-element-index--41-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-element-index--41-restore-reg-end 
        Label        --array-element-index--41-array-index-end 
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
        Label        -function-invocation-39-end 
        PushD        $print-format-integer     
        Printf                                 
        PushD        $print-format-space       
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
        Jump         basicBlockHeader-41       
        Label        basicBlockHeader-41       
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        JumpFalse    basicBlock-46             
        Jump         basicBlock-42             
        Label        basicBlock-42             
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
        JumpPos      basicBlock-44             
        Jump         basicBlock-43             
        Label        basicBlock-43             
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
        Jump         basicBlockHeader-41       
        Label        basicBlock-44             
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
        JumpNeg      basicBlock-47             
        Jump         basicBlock-45             
        Label        basicBlock-45             
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
        Jump         basicBlock-47             
        Label        basicBlock-46             
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
        Jump         basicBlock-47             
        Label        basicBlock-47             
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
        JumpFalse    basicBlock-49             
        Jump         basicBlock-48             
        Label        basicBlock-48             
        PushD        $mmgr-dealloc-block       
        LoadI                                  
        PushD        $heap-first-free          
        LoadI                                  
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Jump         basicBlock-49             
        Label        basicBlock-49             
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
        JumpFalse    basicBlock-51             
        Jump         basicBlock-50             
        Label        basicBlock-50             
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
        Jump         basicBlock-52             
        Label        basicBlock-51             
        PushD        $mmgr-remove-next         
        LoadI                                  
        PushD        $heap-first-free          
        Exchange                               
        StoreI                                 
        Jump         basicBlock-52             
        Label        basicBlock-52             
        PushD        $mmgr-remove-next         
        LoadI                                  
        JumpFalse    basicBlock-54             
        Jump         basicBlock-53             
        Label        basicBlock-53             
        PushD        $mmgr-remove-prev         
        LoadI                                  
        PushD        $mmgr-remove-next         
        LoadI                                  
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Jump         basicBlock-54             
        Label        basicBlock-54             
        PushD        $mmgr-remove-return       
        LoadI                                  
        Return                                 
        PushD        register3                 
        Exchange                               
        StoreI                                 
        PushD        register1                 
        LoadI                                  
        PushD        register2                 
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
        PushD        register1                 
        LoadI                                  
        Duplicate                              
        JumpFalse    basicBlock-63             
        Jump         basicBlock-58             
        Label        basicBlock-58             
        PushD        register2                 
        LoadI                                  
        Duplicate                              
        JumpFalse    basicBlock-63             
        Jump         basicBlock-59             
        Label        basicBlock-59             
        Subtract                               
        JumpPos      basicBlock-61             
        Jump         basicBlock-60             
        Label        basicBlock-60             
        PushD        register2                 
        LoadI                                  
        PushD        register1                 
        LoadI                                  
        Subtract                               
        PushD        register2                 
        Exchange                               
        StoreI                                 
        Jump         basicBlock-62             
        Label        basicBlock-61             
        PushD        register1                 
        LoadI                                  
        PushD        register2                 
        LoadI                                  
        Subtract                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Jump         basicBlock-62             
        Label        basicBlock-62             
        Jump         basicBlockHeader-57       
        Label        basicBlock-63             
        Add                                    
        Jump         basicBlock-64             
        Label        basicBlock-64             
        PushD        register3                 
        LoadI                                  
        Return                                 
