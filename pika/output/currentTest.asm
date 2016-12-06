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
        DLabel       $print-format-char        
        DataC        37                        %% "%c"
        DataC        99                        
        DataC        0                         
        DLabel       $print-format-newline     
        DataC        10                        %% "\n"
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
        DataZ        12                        
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
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% str
        Label        --string-creation-1-string-creation-begin 
        Label        --string-creation-1-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --string-creation-1-backup-reg-end 
        Label        --string-creation-1-string-creation-get-length 
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
        PushD        $$errors-array-index-negative 
        Jump         basicBlockHeader-2        
        Label        basicBlock-5              
        PushD        $$errors-index-exceed-bound 
        Jump         basicBlockHeader-2        
        Label        basicBlock-6              
        PushI        1                         
        Multiply                               
        PushI        12                        
        Add                                    
        Call         -mem-manager-allocate     
        Duplicate                              
        PushI        6                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-creation-1-string-creation-status 
        Duplicate                              
        PushI        9                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-creation-1-string-creation-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-creation-1-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --string-creation-1-restore-reg-end 
        Label        --string-creation-1-string-creation-end 
        Label        --string-initialization-2-string-initialization-begin 
        Duplicate                              
        PushI        114                       
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        97                        
        Exchange                               
        PushI        13                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        98                        
        Exchange                               
        PushI        14                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        98                        
        Exchange                               
        PushI        15                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        105                       
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        116                       
        Exchange                               
        PushI        17                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-initialization-2-string-initialization-end 
        StoreI                                 
        Label        --for-statement--3-begin  
        PushD        register1                 
        LoadI                                  
        PushD        register2                 
        LoadI                                  
        PushD        register3                 
        LoadI                                  
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% i
        PushD        register1                 
        Exchange                               
        StoreI                                 
        PushI        0                         
        PushD        register2                 
        Exchange                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% str
        LoadI                                  
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        register3                 
        Exchange                               
        StoreI                                 
        Jump         basicBlockHeader-7        
        Label        basicBlockHeader-7        
        PushD        register3                 
        LoadI                                  
        JumpFalse    basicBlock-28             
        Jump         basicBlock-8              
        Label        basicBlock-8              
        PushD        register1                 
        LoadI                                  
        PushD        register2                 
        LoadI                                  
        StoreI                                 
        Label        --for-statement--4-begin  
        PushD        register1                 
        LoadI                                  
        PushD        register2                 
        LoadI                                  
        PushD        register3                 
        LoadI                                  
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% j
        PushD        register1                 
        Exchange                               
        StoreI                                 
        PushI        0                         
        PushD        register2                 
        Exchange                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% str
        LoadI                                  
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        register3                 
        Exchange                               
        StoreI                                 
        Jump         basicBlockHeader-9        
        Label        basicBlockHeader-9        
        PushD        register3                 
        LoadI                                  
        JumpFalse    basicBlock-27             
        Jump         basicBlock-10             
        Label        basicBlock-10             
        PushD        register1                 
        LoadI                                  
        PushD        register2                 
        LoadI                                  
        StoreI                                 
        Label        --string-creation-5-string-creation-begin 
        Label        --string-creation-5-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --string-creation-5-backup-reg-end 
        Label        --string-creation-5-string-creation-get-length 
        PushI        1                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      basicBlock-3              
        Jump         basicBlock-11             
        Label        basicBlock-11             
        PushI        1                         
        Multiply                               
        PushI        12                        
        Add                                    
        Call         -mem-manager-allocate     
        Duplicate                              
        PushI        6                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-creation-5-string-creation-status 
        Duplicate                              
        PushI        9                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-creation-5-string-creation-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-creation-5-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --string-creation-5-restore-reg-end 
        Label        --string-creation-5-string-creation-end 
        Label        --string-initialization-6-string-initialization-begin 
        Duplicate                              
        PushI        40                        
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-initialization-6-string-initialization-end 
        Label        --print-string--13--begin- 
        Label        --print-string--13-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Exchange                               
        Label        --print-string--13-backup-reg-end 
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        register1                 
        Exchange                               
        StoreI                                 
        PushI        12                        
        Add                                    
        Jump         basicBlockHeader-12       
        Label        basicBlockHeader-12       
        PushD        register1                 
        LoadI                                  
        JumpFalse    basicBlock-14             
        Jump         basicBlock-13             
        Label        basicBlock-13             
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
        Jump         basicBlockHeader-12       
        Label        basicBlock-14             
        Pop                                    
        Label        --print-string--13-restore-reg-begin 
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --print-string--13-restore-reg-end 
        Label        --print-string--13--end-  
        Label        --string-element-at-index-7-string-index-begin 
        Label        --string-element-at-index-7-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --string-element-at-index-7-backup-reg-end 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% str
        LoadI                                  
        Duplicate                              
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% i
        LoadI                                  
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpNeg      basicBlock-4              
        Jump         basicBlock-15             
        Label        basicBlock-15             
        Exchange                               
        PushI        8                         
        Add                                    
        LoadI                                  
        Exchange                               
        Subtract                               
        JumpPos      basicBlock-16             
        Jump         basicBlock-5              
        Label        basicBlock-16             
        PushI        12                        
        Add                                    
        PushD        register1                 
        LoadI                                  
        PushI        1                         
        Multiply                               
        Add                                    
        Label        --string-element-at-index-7-string-index-fetching-end 
        Label        --string-element-at-index-7-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --string-element-at-index-7-restore-reg-end 
        Label        --string-element-at-index-7-string-index-end 
        LoadC                                  
        PushD        $print-format-char        
        Printf                                 
        Label        --string-creation-8-string-creation-begin 
        Label        --string-creation-8-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --string-creation-8-backup-reg-end 
        Label        --string-creation-8-string-creation-get-length 
        PushI        1                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      basicBlock-3              
        Jump         basicBlock-17             
        Label        basicBlock-17             
        PushI        1                         
        Multiply                               
        PushI        12                        
        Add                                    
        Call         -mem-manager-allocate     
        Duplicate                              
        PushI        6                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-creation-8-string-creation-status 
        Duplicate                              
        PushI        9                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-creation-8-string-creation-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-creation-8-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --string-creation-8-restore-reg-end 
        Label        --string-creation-8-string-creation-end 
        Label        --string-initialization-9-string-initialization-begin 
        Duplicate                              
        PushI        44                        
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-initialization-9-string-initialization-end 
        Label        --print-string--14--begin- 
        Label        --print-string--14-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Exchange                               
        Label        --print-string--14-backup-reg-end 
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        register1                 
        Exchange                               
        StoreI                                 
        PushI        12                        
        Add                                    
        Jump         basicBlockHeader-18       
        Label        basicBlockHeader-18       
        PushD        register1                 
        LoadI                                  
        JumpFalse    basicBlock-20             
        Jump         basicBlock-19             
        Label        basicBlock-19             
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
        Jump         basicBlockHeader-18       
        Label        basicBlock-20             
        Pop                                    
        Label        --print-string--14-restore-reg-begin 
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --print-string--14-restore-reg-end 
        Label        --print-string--14--end-  
        Label        --string-element-at-index-10-string-index-begin 
        Label        --string-element-at-index-10-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --string-element-at-index-10-backup-reg-end 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% str
        LoadI                                  
        Duplicate                              
        PushD        $global-memory-block      
        PushI        8                         
        Add                                    %% j
        LoadI                                  
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Duplicate                              
        JumpNeg      basicBlock-4              
        Jump         basicBlock-21             
        Label        basicBlock-21             
        Exchange                               
        PushI        8                         
        Add                                    
        LoadI                                  
        Exchange                               
        Subtract                               
        JumpPos      basicBlock-22             
        Jump         basicBlock-5              
        Label        basicBlock-22             
        PushI        12                        
        Add                                    
        PushD        register1                 
        LoadI                                  
        PushI        1                         
        Multiply                               
        Add                                    
        Label        --string-element-at-index-10-string-index-fetching-end 
        Label        --string-element-at-index-10-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --string-element-at-index-10-restore-reg-end 
        Label        --string-element-at-index-10-string-index-end 
        LoadC                                  
        PushD        $print-format-char        
        Printf                                 
        Label        --string-creation-11-string-creation-begin 
        Label        --string-creation-11-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --string-creation-11-backup-reg-end 
        Label        --string-creation-11-string-creation-get-length 
        PushI        1                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      basicBlock-3              
        Jump         basicBlock-23             
        Label        basicBlock-23             
        PushI        1                         
        Multiply                               
        PushI        12                        
        Add                                    
        Call         -mem-manager-allocate     
        Duplicate                              
        PushI        6                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-creation-11-string-creation-status 
        Duplicate                              
        PushI        9                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-creation-11-string-creation-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-creation-11-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --string-creation-11-restore-reg-end 
        Label        --string-creation-11-string-creation-end 
        Label        --string-initialization-12-string-initialization-begin 
        Duplicate                              
        PushI        41                        
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-initialization-12-string-initialization-end 
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
        Jump         basicBlockHeader-24       
        Label        basicBlockHeader-24       
        PushD        register1                 
        LoadI                                  
        JumpFalse    basicBlock-26             
        Jump         basicBlock-25             
        Label        basicBlock-25             
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
        Jump         basicBlockHeader-24       
        Label        basicBlock-26             
        Pop                                    
        Label        --print-string--15-restore-reg-begin 
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --print-string--15-restore-reg-end 
        Label        --print-string--15--end-  
        PushD        $print-format-newline     
        Printf                                 
        Label        --for-statement--4-continue 
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
        Jump         basicBlockHeader-9        
        Label        basicBlock-27             
        PushD        register3                 
        Exchange                               
        StoreI                                 
        PushD        register2                 
        Exchange                               
        StoreI                                 
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --for-statement--4-end    
        Label        --for-statement--3-continue 
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
        Jump         basicBlockHeader-7        
        Label        basicBlock-28             
        PushD        register3                 
        Exchange                               
        StoreI                                 
        PushD        register2                 
        Exchange                               
        StoreI                                 
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --for-statement--3-end    
        Label        --for-statement--16-begin 
        PushD        register1                 
        LoadI                                  
        PushD        register2                 
        LoadI                                  
        PushD        register3                 
        LoadI                                  
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% i
        PushD        register1                 
        Exchange                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% str
        LoadI                                  
        Duplicate                              
        PushD        register2                 
        Exchange                               
        StoreI                                 
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        register3                 
        Exchange                               
        StoreI                                 
        PushD        register2                 
        Duplicate                              
        LoadI                                  
        PushI        12                        
        Add                                    
        StoreI                                 
        Jump         basicBlockHeader-29       
        Label        basicBlockHeader-29       
        PushD        register3                 
        LoadI                                  
        JumpFalse    basicBlock-46             
        Jump         basicBlock-30             
        Label        basicBlock-30             
        PushD        register1                 
        LoadI                                  
        PushD        register2                 
        LoadI                                  
        LoadC                                  
        StoreC                                 
        Label        --for-statement--17-begin 
        PushD        register1                 
        LoadI                                  
        PushD        register2                 
        LoadI                                  
        PushD        register3                 
        LoadI                                  
        PushD        $global-memory-block      
        PushI        5                         
        Add                                    %% j
        PushD        register1                 
        Exchange                               
        StoreI                                 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% str
        LoadI                                  
        Duplicate                              
        PushD        register2                 
        Exchange                               
        StoreI                                 
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        register3                 
        Exchange                               
        StoreI                                 
        PushD        register2                 
        Duplicate                              
        LoadI                                  
        PushI        12                        
        Add                                    
        StoreI                                 
        Jump         basicBlockHeader-31       
        Label        basicBlockHeader-31       
        PushD        register3                 
        LoadI                                  
        JumpFalse    basicBlock-45             
        Jump         basicBlock-32             
        Label        basicBlock-32             
        PushD        register1                 
        LoadI                                  
        PushD        register2                 
        LoadI                                  
        LoadC                                  
        StoreC                                 
        Label        --string-creation-18-string-creation-begin 
        Label        --string-creation-18-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --string-creation-18-backup-reg-end 
        Label        --string-creation-18-string-creation-get-length 
        PushI        1                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      basicBlock-3              
        Jump         basicBlock-33             
        Label        basicBlock-33             
        PushI        1                         
        Multiply                               
        PushI        12                        
        Add                                    
        Call         -mem-manager-allocate     
        Duplicate                              
        PushI        6                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-creation-18-string-creation-status 
        Duplicate                              
        PushI        9                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-creation-18-string-creation-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-creation-18-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --string-creation-18-restore-reg-end 
        Label        --string-creation-18-string-creation-end 
        Label        --string-initialization-19-string-initialization-begin 
        Duplicate                              
        PushI        40                        
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-initialization-19-string-initialization-end 
        Label        --print-string--24--begin- 
        Label        --print-string--24-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Exchange                               
        Label        --print-string--24-backup-reg-end 
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        register1                 
        Exchange                               
        StoreI                                 
        PushI        12                        
        Add                                    
        Jump         basicBlockHeader-34       
        Label        basicBlockHeader-34       
        PushD        register1                 
        LoadI                                  
        JumpFalse    basicBlock-36             
        Jump         basicBlock-35             
        Label        basicBlock-35             
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
        Jump         basicBlockHeader-34       
        Label        basicBlock-36             
        Pop                                    
        Label        --print-string--24-restore-reg-begin 
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --print-string--24-restore-reg-end 
        Label        --print-string--24--end-  
        PushD        $global-memory-block      
        PushI        4                         
        Add                                    %% i
        LoadC                                  
        PushD        $print-format-char        
        Printf                                 
        Label        --string-creation-20-string-creation-begin 
        Label        --string-creation-20-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --string-creation-20-backup-reg-end 
        Label        --string-creation-20-string-creation-get-length 
        PushI        1                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      basicBlock-3              
        Jump         basicBlock-37             
        Label        basicBlock-37             
        PushI        1                         
        Multiply                               
        PushI        12                        
        Add                                    
        Call         -mem-manager-allocate     
        Duplicate                              
        PushI        6                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-creation-20-string-creation-status 
        Duplicate                              
        PushI        9                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-creation-20-string-creation-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-creation-20-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --string-creation-20-restore-reg-end 
        Label        --string-creation-20-string-creation-end 
        Label        --string-initialization-21-string-initialization-begin 
        Duplicate                              
        PushI        44                        
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-initialization-21-string-initialization-end 
        Label        --print-string--25--begin- 
        Label        --print-string--25-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Exchange                               
        Label        --print-string--25-backup-reg-end 
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        register1                 
        Exchange                               
        StoreI                                 
        PushI        12                        
        Add                                    
        Jump         basicBlockHeader-38       
        Label        basicBlockHeader-38       
        PushD        register1                 
        LoadI                                  
        JumpFalse    basicBlock-40             
        Jump         basicBlock-39             
        Label        basicBlock-39             
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
        Jump         basicBlockHeader-38       
        Label        basicBlock-40             
        Pop                                    
        Label        --print-string--25-restore-reg-begin 
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --print-string--25-restore-reg-end 
        Label        --print-string--25--end-  
        PushD        $global-memory-block      
        PushI        5                         
        Add                                    %% j
        LoadC                                  
        PushD        $print-format-char        
        Printf                                 
        Label        --string-creation-22-string-creation-begin 
        Label        --string-creation-22-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --string-creation-22-backup-reg-end 
        Label        --string-creation-22-string-creation-get-length 
        PushI        1                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      basicBlock-3              
        Jump         basicBlock-41             
        Label        basicBlock-41             
        PushI        1                         
        Multiply                               
        PushI        12                        
        Add                                    
        Call         -mem-manager-allocate     
        Duplicate                              
        PushI        6                         
        Exchange                               
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-creation-22-string-creation-status 
        Duplicate                              
        PushI        9                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-creation-22-string-creation-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-creation-22-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --string-creation-22-restore-reg-end 
        Label        --string-creation-22-string-creation-end 
        Label        --string-initialization-23-string-initialization-begin 
        Duplicate                              
        PushI        41                        
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-initialization-23-string-initialization-end 
        Label        --print-string--26--begin- 
        Label        --print-string--26-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Exchange                               
        Label        --print-string--26-backup-reg-end 
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        register1                 
        Exchange                               
        StoreI                                 
        PushI        12                        
        Add                                    
        Jump         basicBlockHeader-42       
        Label        basicBlockHeader-42       
        PushD        register1                 
        LoadI                                  
        JumpFalse    basicBlock-44             
        Jump         basicBlock-43             
        Label        basicBlock-43             
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
        Jump         basicBlockHeader-42       
        Label        basicBlock-44             
        Pop                                    
        Label        --print-string--26-restore-reg-begin 
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --print-string--26-restore-reg-end 
        Label        --print-string--26--end-  
        PushD        $print-format-newline     
        Printf                                 
        Label        --for-statement--17-continue 
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
        Jump         basicBlockHeader-31       
        Label        basicBlock-45             
        PushD        register3                 
        Exchange                               
        StoreI                                 
        PushD        register2                 
        Exchange                               
        StoreI                                 
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --for-statement--17-end   
        Label        --for-statement--16-continue 
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
        Jump         basicBlockHeader-29       
        Label        basicBlock-46             
        PushD        register3                 
        Exchange                               
        StoreI                                 
        PushD        register2                 
        Exchange                               
        StoreI                                 
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --for-statement--16-end   
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
        Jump         basicBlockHeader-47       
        Label        basicBlockHeader-47       
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        JumpFalse    basicBlock-52             
        Jump         basicBlock-48             
        Label        basicBlock-48             
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
        JumpPos      basicBlock-50             
        Jump         basicBlock-49             
        Label        basicBlock-49             
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
        Jump         basicBlockHeader-47       
        Label        basicBlock-50             
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
        JumpNeg      basicBlock-53             
        Jump         basicBlock-51             
        Label        basicBlock-51             
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
        Jump         basicBlock-53             
        Label        basicBlock-52             
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
        Jump         basicBlock-53             
        Label        basicBlock-53             
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
        JumpFalse    basicBlock-55             
        Jump         basicBlock-54             
        Label        basicBlock-54             
        PushD        $mmgr-dealloc-block       
        LoadI                                  
        PushD        $heap-first-free          
        LoadI                                  
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Jump         basicBlock-55             
        Label        basicBlock-55             
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
        JumpFalse    basicBlock-57             
        Jump         basicBlock-56             
        Label        basicBlock-56             
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
        Jump         basicBlock-58             
        Label        basicBlock-57             
        PushD        $mmgr-remove-next         
        LoadI                                  
        PushD        $heap-first-free          
        Exchange                               
        StoreI                                 
        Jump         basicBlock-58             
        Label        basicBlock-58             
        PushD        $mmgr-remove-next         
        LoadI                                  
        JumpFalse    basicBlock-60             
        Jump         basicBlock-59             
        Label        basicBlock-59             
        PushD        $mmgr-remove-prev         
        LoadI                                  
        PushD        $mmgr-remove-next         
        LoadI                                  
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Jump         basicBlock-60             
        Label        basicBlock-60             
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
        JumpTrue     basicBlock-62             
        Jump         basicBlock-61             
        Label        basicBlock-61             
        PushI        1                         
        Jump         basicBlock-70             
        Label        basicBlock-62             
        Jump         basicBlockHeader-63       
        Label        basicBlockHeader-63       
        PushD        register1                 
        LoadI                                  
        Duplicate                              
        JumpFalse    basicBlock-69             
        Jump         basicBlock-64             
        Label        basicBlock-64             
        PushD        register2                 
        LoadI                                  
        Duplicate                              
        JumpFalse    basicBlock-69             
        Jump         basicBlock-65             
        Label        basicBlock-65             
        Subtract                               
        JumpPos      basicBlock-67             
        Jump         basicBlock-66             
        Label        basicBlock-66             
        PushD        register2                 
        LoadI                                  
        PushD        register1                 
        LoadI                                  
        Subtract                               
        PushD        register2                 
        Exchange                               
        StoreI                                 
        Jump         basicBlock-68             
        Label        basicBlock-67             
        PushD        register1                 
        LoadI                                  
        PushD        register2                 
        LoadI                                  
        Subtract                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Jump         basicBlock-68             
        Label        basicBlock-68             
        Jump         basicBlockHeader-63       
        Label        basicBlock-69             
        Add                                    
        Jump         basicBlock-70             
        Label        basicBlock-70             
        PushD        register3                 
        LoadI                                  
        Return                                 
