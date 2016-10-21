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
        DLabel       $usable-memory-start      
        DLabel       $global-memory-block      
        DataZ        1                         
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
        Label        $$main                    
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% A
        Label        -boolean_operator-4-arg1  
        Label        -boolean_operator-2-arg1  
        PushI        1                         
        JumpTrue     -boolean_operator-2-true  
        Label        -boolean_operator-2-arg2  
        Label        -boolean_operator-1-arg1  
        PushI        1                         
        JumpFalse    -boolean_operator-1-false 
        Label        -boolean_operator-1-arg2  
        PushI        0                         
        JumpFalse    -boolean_operator-1-false 
        Jump         -boolean_operator-1-true  
        Label        -boolean_operator-1-true  
        PushI        1                         
        Jump         -boolean_operator-1-join  
        Label        -boolean_operator-1-false 
        PushI        0                         
        Jump         -boolean_operator-1-join  
        Label        -boolean_operator-1-join  
        JumpTrue     -boolean_operator-2-true  
        Jump         -boolean_operator-2-false 
        Label        -boolean_operator-2-true  
        PushI        1                         
        Jump         -boolean_operator-2-join  
        Label        -boolean_operator-2-false 
        PushI        0                         
        Jump         -boolean_operator-2-join  
        Label        -boolean_operator-2-join  
        JumpTrue     -boolean_operator-4-true  
        Label        -boolean_operator-4-arg2  
        Label        -boolean_operator-3-arg1  
        PushI        1                         
        JumpFalse    -boolean_operator-3-false 
        Label        -boolean_operator-3-arg2  
        PushI        0                         
        JumpFalse    -boolean_operator-3-false 
        Jump         -boolean_operator-3-true  
        Label        -boolean_operator-3-true  
        PushI        1                         
        Jump         -boolean_operator-3-join  
        Label        -boolean_operator-3-false 
        PushI        0                         
        Jump         -boolean_operator-3-join  
        Label        -boolean_operator-3-join  
        JumpTrue     -boolean_operator-4-true  
        Jump         -boolean_operator-4-false 
        Label        -boolean_operator-4-true  
        PushI        1                         
        Jump         -boolean_operator-4-join  
        Label        -boolean_operator-4-false 
        PushI        0                         
        Jump         -boolean_operator-4-join  
        Label        -boolean_operator-4-join  
        StoreC                                 
        PushD        $global-memory-block      
        PushI        0                         
        Add                                    %% A
        LoadC                                  
        JumpTrue     -print-boolean-5-true     
        PushD        $boolean-false-string     
        Jump         -print-boolean-5-join     
        Label        -print-boolean-5-true     
        PushD        $boolean-true-string      
        Label        -print-boolean-5-join     
        PushD        $print-format-boolean     
        Printf                                 
        Halt                                   
