<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/WEB-INF/jsp/include/head.jsp"%>
   <div class="content-wrapper">
   
   <h1>
   	<i class="fa-regular fa-star"></i>
   	<c:if test="${phoneBookType eq '1' }">
   	공유 주소록
   	</c:if>
   	<c:if test="${phoneBookType eq '2' }">
   	개인 주소록
   	</c:if>
   	<c:if test="${phoneBookType eq '3' }">
   	주소록 휴지통
   	</c:if>
   </h1>
	<div class="col-12">
	  <div class="card">
	    <div class="card-header row">
	      <!-- <h3 class="card-title"></h3> -->
	      <div class="btns col-sm-6">
	      <c:if test="${phoneBookType ne '3' }">
	      	<button type="button" class="btn bg-gradient" style="background: #5865F2; color:#ffffff;" onclick="OpenWindow('registForm','주소록 등록',800,800);">주소록 등록</button>
	      	<button type="button" class="btn bg-gradient" style="background: #5865F2; color:#ffffff;" onclick="deleteChecked();">삭제</button>
	      </c:if>
		  <c:if test="${phoneBookType eq '3' }">
		  <button type="button" class="btn bg-gradient" style="background: #5865F2; color:#ffffff;">주소록 복구</button>
		  <button type="button" class="btn bg-gradient" style="background: #5865F2; color:#ffffff;">주소록 영구삭제</button>
   		  </c:if>	      	
	      </div>
	      <div class="card-tools col-sm-6">
	        <form action="" class="">
	        <div class="input-group input-group-sm ">
	          <select name="searchType">
	          	<option value="" disabled="disabled" selected="selected">검색구분</option>
	          	<option value="name">이름</option>
	          	<option value="dep">부서</option>
	          	<option value="tag">태그</option>
	          </select>
	          <input
	            type="text"
	            name="keyword"
	            class="form-control float-right"
	            placeholder="Search"
	          />
	       
	          <div class="input-group-append">
	            <button type="submit" class="btn btn-default">
	              <i class="fas fa-search"></i>
	            </button>
	          </div>
	        </div>
	        </form>
	      </div>
	    </div>
	
	    <div class="card-body table-responsive p-0">
	      <table class="table table-hover text-nowrap">
	        <thead>
	          <tr>
	          	<th><input type="checkbox" name="all" class="check-all"/></th>
	          	<th><i class="fa-regular fa-star"></i></th>
	            <th>이름</th>
	           	<th>전화번호</th>
	           	<th>이메일</th>
	           	<th>회사</th>
	           	<th>태그</th>
	          </tr> 
	        </thead>
	        <tbody>
	        <c:forEach var="sharePhone" items="${phoneBookList }">
	          <tr>
	           <td><input type="checkbox" class="ab"/></td>
	           
	           <td><i class="fa-regular fa-star"></i></td>
	           
	           <td>
	           	<a href="javascript:OpenWindow('detail?phone_Book_Id=${sharePhone.phone_Book_Id }','주소록 상세조회',800,800);">
	           		${sharePhone.phone_Book_Name }
	           	</a>
	           </td>
	           
	           <td>${sharePhone.phone_Book_Phone }</td>
	           
	           <td>${sharePhone.phone_Book_Email }</td>
	           
	           <td>${sharePhone.phone_Book_Company }</td>
	           
	           <td>
	           	<a href="">
	           		${sharePhone.phone_Book_Tag }
	           	</a>
	           </td>
	          </tr>
	        </c:forEach>
	         
	        </tbody>
	      </table>
	    </div>
	  </div>
	</div>
	<div class="page-menu mt-5 flex justify-center">
	    <div class="btn-group">
	    <c:set var="pageMenuArmLen" value="4"/>
	    <c:set var="startPage" value="${page - pageMenuArmLen >= 1 ? page - pageMenuArmLen : 1}"/>
	    <c:set var="endPage" value="${page + pageMenuArmLen <= pagesCount ? page + pageMenuArmLen : pagesCount}"/>
	    <c:set var="pageBaseUri" value="?phone_Book_Type=${phoneBookType}"/>
	    <c:set var="pageBaseUri" value="${pageBaseUri}&keyword=${param.keyword}"/>
	    <c:set var="pageBaseUri" value="${pageBaseUri}&searchType=${param.searchType}"/>
	    
	    <c:if test="${startPage > 1}">
	    	<a class="btn btn-sm" href="?${pageBaseUri}&page=1">1</a>
	    	<c:if test="${startPage > 2}">
	    		<a class="btn btn-sm btn-disabled" >...</a>
	    	</c:if>
	    </c:if>
		
		<c:forEach begin="${startPage}" end="${endPage}" var="i">
		  	<a class="btn btn-sm ${page == i ? 'btn-active' : ''}" href="?${pageBaseUri}&page=${i}">${i}</a>
		</c:forEach>
		
		<c:if test="${endPage < pagesCount}">
			<c:if test="${endPage < pagesCount - 1}">
				<a class="btn btn-sm btn-disabled" >...</a>
			</c:if>
	    	<a class="btn btn-sm" href="?${pageBaseUri}&page=${pagesCount}">${pagesCount}</a>
	    </c:if>
		</div>
	</div>
   </div>
	

<%@include file="/WEB-INF/jsp/include/foot.jsp"%>
<script>
function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight){
	winleft = (screen.width - WinWidth) / 2;
	wintop = (screen.height - WinHeight) / 2;
	var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth+",height="+ WinHeight +",top="+wintop+",left="+ winleft +",resizable=yes" );
	win.focus();
}
//체크박스 전부 선택
$( document ).ready( function() {
	  $( '.check-all' ).click( function() {
	    $( '.ab' ).prop( 'checked', this.checked );
	  });
	});
	
	
function deleteChecked(){
	var checked=$('.ab').attr('checked');
	alert(checked);
}
</script>