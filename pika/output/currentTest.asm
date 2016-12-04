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
        DLabel       $print-format-floating    
        DataC        37                        %% "%g"
        DataC        103                       
        DataC        0                         
        DLabel       $print-format-char        
        DataC        37                        %% "%c"
        DataC        99                        
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
        DLabel       $global-memory-block      
        DataZ        4                         
        DLabel       register1                 
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
        Label     `   basicBlock-1              
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
        Add                                    %% pop
        Label        --array-creation--1--begin 
        Label        --array-creation--1-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--1-backup-reg-end 
        Label        --array-creation--1--get-length 
        PushI        3                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      basicBlock-2              
        Jump         basicBlock-3              
        Label        basicBlock-2              
        PushD        $$errors-array-size-negative 
        PushD        $errors-general-message   
        Printf                                 
        Halt                                   
        Label        basicBlock-3              
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
        PushI        8                         
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
        PushI        97                        
        ConvertF                               
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        42.1000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushI        98                        
        ConvertF                               
        Exchange                               
        PushI        32                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--2-array-initialization-end 
        StoreI                                 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% pop
        LoadI                                  
        Label        --print-array--5--begin-  
        Label        --print-array--5-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Exchange                               
        Label        --print-array--5-backup-reg-end 
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
        Jump         basicBlockHeader-4        
        Label        basicBlockHeader-4        
        PushD        register1                 
        LoadI                                  
        JumpFalse    basicBlock-7              
        Jump         basicBlock-5              
        Label        basicBlock-5              
        Duplicate                              
        PushI        8                         
        Add                                    
        Exchange                               
        LoadF                                  
        PushD        $print-format-floating    
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
        JumpFalse    basicBlock-7              
        Jump         basicBlock-6              
        Label        basicBlock-6              
        PushD        $print-format-separator   
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        Jump         basicBlockHeader-4        
        Label        basicBlock-7              
        Pop                                    
        PushD        $print-format-close-square-bracket 
        Printf                                 
        Label        --print-array--5-restore-reg-begin 
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --print-array--5-restore-reg-end 
        Label        --print-array--5--end-    
        PushD        $print-format-space       
        Printf                                 
        Label        --string-creation-3-string-creation-begin 
        Label        --string-creation-3-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --string-creation-3-backup-reg-end 
        Label        --string-creation-3-string-creation-get-length 
        PushI        14                        
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      basicBlock-2              
        Jump         basicBlock-8              
        Label        basicBlock-8              
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
        Label        --string-creation-3-string-creation-status 
        Duplicate                              
        PushI        9                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-creation-3-string-creation-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-creation-3-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --string-creation-3-restore-reg-end 
        Label        --string-creation-3-string-creation-end 
        Label        --string-initialization-4-string-initialization-begin 
        Duplicate                              
        PushI        91                        
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        57                        
        Exchange                               
        PushI        13                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        55                        
        Exchange                               
        PushI        14                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        44                        
        Exchange                               
        PushI        15                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        32                        
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        52                        
        Exchange                               
        PushI        17                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        50                        
        Exchange                               
        PushI        18                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        46                        
        Exchange                               
        PushI        19                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        49                        
        Exchange                               
        PushI        20                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        44                        
        Exchange                               
        PushI        21                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        32                        
        Exchange                               
        PushI        22                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        57                        
        Exchange                               
        PushI        23                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        56                        
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreI                                 
        Duplicate                              
        PushI        93                        
        Exchange                               
        PushI        25                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --string-initialization-4-string-initialization-end 
        Label        --print-string--6--begin- 
        Label        --print-string--6-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Exchange                               
        Label        --print-string--6-backup-reg-end 
        Duplicate                              
        PushI        8                         
        Add                                    
        LoadI                                  
        PushD        register1                 
        Exchange                               
        StoreI                                 
        PushI        12                        
        Add                                    
        Jump         basicBlockHeader-9        
        Label        basicBlockHeader-9        
        PushD        register1                 
        LoadI                                  
        JumpFalse    basicBlock-11             
        Jump         basicBlock-10             
        Label        basicBlock-10             
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
        Jump         basicBlockHeader-9        
        Label        basicBlock-11             
        Pop                                    
        Label        --print-string--6-restore-reg-begin 
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --print-string--6-restore-reg-end 
        Label        --print-string--6--end-   
        PushD        $print-format-space       
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% pop
        Label        --array-creation--7--begin 
        Label        --array-creation--7-backup-reg-begin 
        PushD        register1                 
        LoadI                                  
        Label        --array-creation--7-backup-reg-end 
        Label        --array-creation--7--get-length 
        PushI        3                         
        Duplicate                              
        Duplicate                              
        PushD        register1                 
        Exchange                               
        StoreI                                 
        JumpNeg      basicBlock-2              
        Jump         basicBlock-12             
        Label        basicBlock-12             
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
        Label        --array-creation--7-set-status 
        Duplicate                              
        PushI        0                         
        Exchange                               
        PushI        4                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--7-set-subtype-size 
        Duplicate                              
        PushI        8                         
        Exchange                               
        PushI        8                         
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--7-set-length 
        Duplicate                              
        PushD        register1                 
        LoadI                                  
        Exchange                               
        PushI        12                        
        Add                                    
        Exchange                               
        StoreI                                 
        Label        --array-creation--7-restore-reg-begin 
        Exchange                               
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --array-creation--7-restore-reg-end 
        Label        --array-creation--7--end  
        Label        --array-initialization--8-array-initialization-begin 
        Duplicate                              
        PushF        1.00000                   
        Exchange                               
        PushI        16                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        2.10000                   
        Exchange                               
        PushI        24                        
        Add                                    
        Exchange                               
        StoreF                                 
        Duplicate                              
        PushF        3.20000                   
        Exchange                               
        PushI        32                        
        Add                                    
        Exchange                               
        StoreF                                 
        Label        --array-initialization--8-array-initialization-end 
        StoreI                                 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% pop
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
        Jump         basicBlockHeader-13       
        Label        basicBlockHeader-13       
        PushD        register1                 
        LoadI                                  
        JumpFalse    basicBlock-16             
        Jump         basicBlock-14             
        Label        basicBlock-14             
        Duplicate                              
        PushI        8                         
        Add                                    
        Exchange                               
        LoadF                                  
        PushD        $print-format-floating    
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
        JumpFalse    basicBlock-16             
        Jump         basicBlock-15             
        Label        basicBlock-15             
        PushD        $print-format-separator   
        Printf                                 
        PushD        $print-format-space       
        Printf                                 
        Jump         basicBlockHeader-13       
        Label        basicBlock-16             
        Pop                                    
        PushD        $print-format-close-square-bracket 
        Printf                                 
        Label        --print-array--9-restore-reg-begin 
        PushD        register1                 
        Exchange                               
        StoreI                                 
        Label        --print-array--9-restore-reg-end 
        Label        --print-array--9--end-    
        PushD        $print-format-space       
        Printf                                 
        PushD        $print-format-newline     
        Printf                                 
        Halt                                   
        Label        basicBlock-17             
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
        Label        basicBlock-18             
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
        Label        basicBlock-19             
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
        Jump         basicBlockHeader-20       
        Label        basicBlockHeader-20       
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        JumpFalse    basicBlock-25             
        Jump         basicBlock-21             
        Label        basicBlock-21             
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
        JumpPos      basicBlock-23             
        Jump         basicBlock-22             
        Label        basicBlock-22             
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
        Jump         basicBlockHeader-20       
        Label        basicBlock-23             
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
        JumpNeg      basicBlock-26             
        Jump         basicBlock-24             
        Label        basicBlock-24             
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
        Jump         basicBlock-26             
        Label        basicBlock-25             
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
        Jump         basicBlock-26             
        Label        basicBlock-26             
        PushD        $mmgr-alloc-current-block 
        LoadI                                  
        PushI        9                         
        Add                                    
        PushD        $mmgr-alloc-return        
        LoadI                                  
        Return                                 
        Label        basicBlock-27             
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
        Label        basicBlock-28             
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
        JumpFalse    basicBlock-30             
        Jump         basicBlock-29             
        Label        basicBlock-29             
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
        Jump         basicBlock-31             
        Label        basicBlock-30             
        PushD        $mmgr-remove-next         
        LoadI                                  
        PushD        $heap-first-free          
        Exchange                               
        StoreI                                 
        Jump         basicBlock-31             
        Label        basicBlock-31             
        PushD        $mmgr-remove-next         
        LoadI                                  
        JumpFalse    basicBlock-33             
        Jump         basicBlock-32             
        Label        basicBlock-32             
        PushD        $mmgr-remove-prev         
        LoadI                                  
        PushD        $mmgr-remove-next         
        LoadI                                  
        PushI        0                         
        Add                                    
        Exchange                               
        StoreI                                 
        Jump         basicBlock-33             
        Label        basicBlock-33             
        PushD        $mmgr-remove-return       
        LoadI                                  
        Return                                 
