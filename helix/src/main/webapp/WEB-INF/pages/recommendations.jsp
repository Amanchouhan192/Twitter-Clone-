<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en" class="">
   <head></head>
   <body data-new-gr-c-s-check-loaded="14.1012.0" data-gr-ext-installed="" data-new-gr-c-s-loaded="14.1012.0">
      <grammarly-extension data-grammarly-shadow-root="true" style="position: absolute; top: 0px; left: 0px; pointer-events: none;" class="cGcvT"></grammarly-extension>
      <grammarly-extension data-grammarly-shadow-root="true" style="mix-blend-mode: darken; position: absolute; top: 0px; left: 0px; pointer-events: none;" class="cGcvT"></grammarly-extension>
      <meta charset="UTF-8">
      <link href="https://fonts.googleapis.com/css?family=DM+Sans&amp;display=swap" rel="stylesheet">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.css">
      <script src="https://code.jquery.com/jquery-3.5.0.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
      <link rel="stylesheet" href="/static/css/recommendations.css">
      <div id="root">
         <div>
            <div class="layout">
               <div class="layout_wrapper">
                <jsp:include page="template/navbar.jsp"/>
                  <div class="layout_content">
                     <div class="feed">
                        <div class="feed_header">
                           <h1 class="feed_title">Recommendations for you!</h1>
                        </div>
                        <c:forEach var="member" items="${RECOMMENDATIONS}">
                           <div class="feed_item">
                              <div class="joke">
                                 <div class="joke_wrapper">
                                    <div class="joke_block joke_block--header">
                                       <span class="joke_element joke_element--author-name">${member.name}</span>
                                       <span class="joke_element joke_element--author-username">${member.email} </span>
                                       <div class="joke_element joke_element--author-img"><img src="/static/images/dummy.png"></div>
                                    </div>
                                    <c:if test="${not member.is_followed}">
                                       <button class="follow-member" member-id = "${member.id}" type="submit" tab-index="0" style="margin-top:7px">
                                       <span tab-index="-1">Follow</span>  </button>
                                    </c:if>
                                    <c:if test="${member.is_followed}">
                                       <button class="follow-member followed-button" member-id = "${member.id}" type="submit" tab-index="0" style="margin-top:7px">
                                       <span tab-index="-1">Followed</span>  </button>
                                    </c:if>
                                 </div>
                              </div>
                           </div>
                        </c:forEach>
                        <div class="feed_footer">
                           <div class="pagination pagination--infinite-scroll"><button class="pagination_button_next">Load more...</button></div>
                        </div>
                     </div>
                  </div>
                  <jsp:include page="template/sidebar.jsp"/>
               </div>
            </div>
         </div>
      </div>
      <script type="text/javascript" src="/static/js/user.js"></script>
   </body>
</html>