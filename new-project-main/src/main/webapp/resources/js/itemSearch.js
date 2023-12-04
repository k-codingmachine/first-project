
    function changePage(pageNum) {
        // 현재 선택된 color 값 가져오기
        var selectedColor = $("#color").val();
        console.log(color);
        // 페이지 이동
        window.location.href = "/itemSearch/list?pageNum=" + pageNum + "&color=" + color;
    }


