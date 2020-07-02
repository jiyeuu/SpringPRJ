package poly.dto;

public class PagingDTO {
   
      private int pageSize =8; //한페이지당 게시글 수            ////
      private int rangeSize =3;// 한 블록당 페이지수             ////
      
      private int curPage = 1; // 현재 페이지                    ////
      private int curRange= 1; // 현재 블록                  ////
      
      private int listCnt; // 총 게시글                
      private int pageCnt; // 총 페이지수
      private int rangeCnt; //총 블록 수
      
      private int startPage =1; //시작페이지
      private int endPage =1; //끝 페이지
      
      private int startIndex =0; //시작 index ////
      private int endIndex;//끝 index  ////
      
      private int prevPage; //이전페이지 ////
      private int nextPage; //다음페이지 ////

   
       public PagingDTO(int listCnt, int curPage){
          
           // 총 게시물 수와 현재 페이지를 Controller로 부터 받아온다.
           /** 현재페이지 **/
           setCurPage(curPage);
           /** 총 게시물 수 **/
           setListCnt(listCnt);
           /** 현재 블록 세팅**/
           setCurRange(curPage);
           /** 1. 총 페이지 수 **/
           setPageCnt(listCnt);
           /** 2. 총 블럭(range)수 **/
           setRangeCnt(pageCnt);
           /** 3. 블럭(range) setting **/
           rangeSetting(curPage);
           
           /** DB 질의를 위한 startIndex 설정 **/
           setStartIndex(curPage);
           
           setEndIndex(curPage);

       }
      
       //총 페이지 수
      public void setPageCnt(int listCnt) {
         this.pageCnt = (int)Math.ceil(listCnt*1.0/pageSize);
      }
      
      //총 블럭 수
      public void setRangeCnt(int pageCnt) {
         this.rangeCnt = (int)Math.ceil(pageCnt*1.0/rangeSize);
      }
      
      //다음 페이지나 이전 페이지 눌렀을때 숫자 표시
      public void rangeSetting(int curPage) {
         
         
         setCurPage(curPage);
         this.startPage=(curRange-1)*rangeSize+1;
         this.endPage = startPage+ rangeSize-1;
         
         if(endPage > pageCnt) {
            this.endPage = pageCnt;
         }
         
         this.prevPage = curPage -1;
         this.nextPage = curPage +1;

      }
      
      
     
      //현재 페이지 표시
      public void setCurRange(int curPage) {
         this.curRange = (int)((curPage-1)/rangeSize)+1;
      }
      
      //DB 조회를 위한 startIndex 설정
      public void setStartIndex(int curPage) {
         this.startIndex = (curPage-1)*pageSize;
      }
      
      
      
      
      
      
      
      public int getEndIndex() {
         return endIndex;
      }

      public void setEndIndex(int curPage) {
         this.endIndex = (curPage*pageSize);
      }

      
      
      
      
      public int getPageSize() {
         return pageSize;
      }
      public void setPageSize(int pageSize) {
         this.pageSize = pageSize;
      }
      public int getRangeSize() {
         return rangeSize;
      }
      //수정함
      public void setRangeSize(int rangeSize) {
         this.rangeSize = rangeSize;
      }
      public int getCurPage() {
         return curPage;
      }
      public void setCurPage(int curPage) {
         this.curPage = curPage;
      }
      public int getCurRange() {
         return curRange;
      }

      public int getListCnt() {
         return listCnt;
      }
      public void setListCnt(int listCnt) {
         this.listCnt = listCnt;
      }
      public int getPageCnt() {
         return pageCnt;
      }

      public int getRangeCnt() {
         return rangeCnt;
      }

      public int getStartPage() {
         return startPage;
      }
      public void setStartPage(int startPage) {
         this.startPage = startPage;
      }
      public int getEndPage() {
         return endPage;
      }
      public void setEndPage(int endPage) {
         this.endPage = endPage;
      }
      public int getStartIndex() {
         return startIndex;
      }

      public int getPrevPage() {
         return prevPage;
      }

      public void setPrevPage(int prevPage) {
         this.prevPage = prevPage;
      }

      public int getNextPage() {
         return nextPage;
      }
      public void setNextPage(int nextPage) {
         this.nextPage = nextPage;
      }

      
      
}