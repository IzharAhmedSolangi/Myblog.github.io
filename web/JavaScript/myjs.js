function dolike(uid , pid){
    
    console.log(uid +" , " + pid);
    
    const d = {
      uid:uid,
      pid:pid,
      'Operation':'like'
    };
    
    $.ajax({
       url:'likeServlet',
       data:d,
        success: function (data, textStatus, jqXHR) {
            console.log(data);
            if(data.trim()==='true'){
                let c = $(".like-counter").html();
                c++;
                $(".like-counter").html(c);
                
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            
        }
        
    });
    
}


