
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="baseURL" value="${req.scheme}://${req.serverName}:${req.serverPort}${req.contextPath}" />
<input type="hidden" id="url-updatecart" value="${baseURL}/cart/updatecart""/>
<section class="breadcrumb-section set-bg" data-setbg="<c:url value='/resource/image/baner/Contact.jpg'/>" style="background-image: url(&quot;img/breadcrumb.jpg&quot;);">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Contact</font></font></h2>

                </div>
            </div>
        </div>
    </div>
</section>
<section class="shoping-cart spad">
    <div class="container">
        <div class="row">
            <div class="col-md-4" style="text-align: center">
                <div class="wysiwyg">
                    <div style="margin-top:25px">
                        <div alt="Email icon" data-embed-button="media_browser" data-entity-embed-display="media_image" data-entity-embed-display-settings="{&quot;link_url&quot;:&quot;&quot;,&quot;link_url_target&quot;:0,&quot;image_style&quot;:&quot;&quot;,&quot;image_link&quot;:&quot;&quot;,&quot;image_loading&quot;:{&quot;attribute&quot;:&quot;lazy&quot;},&quot;svg_render_as_image&quot;:1,&quot;svg_attributes&quot;:{&quot;width&quot;:&quot;50&quot;,&quot;height&quot;:&quot;50&quot;}}" data-entity-type="media" data-entity-uuid="8529f163-4cd7-4c0c-8e1f-92e2397a379a" data-langcode="en" title="Icon email" class="align-center embedded-entity"> 
                            <i class="fa fa-envelope fa-5x" aria-hidden="true"></i>
                        </div>
                        <p class="text-align-center" style="margin-top:20px">
                            <strong class="style--h4">Gửi email cho chúng tôi</strong>
                        </p>
                        <p class="text-align-center">
                            <span class="smallmargin">
                                Gửi email cho chúng tôi và chúng
                                <br>tôi sẽ trả lời trong vòng 48 giờ
                            </span>
                        </p>
                        <p class="text-align-center">
                            <a class="btn-tertiary" data-entity-substitution="canonical" data-entity-type="node" data-entity-uuid="754a9891-20ac-48a2-a120-b75cd27ded98" href="/vi/email-us">Điền vào mẫu email</a>
                        </p>
                    </div>
                </div>

            </div>
            <div class="col-md-4" style="text-align: center">
                <div class="wysiwyg">
                    <div style="margin-top:25px">
                        <div alt="Icon phone" data-embed-button="media_browser" data-entity-embed-display="media_image" data-entity-embed-display-settings="{&quot;link_url&quot;:&quot;&quot;,&quot;link_url_target&quot;:0,&quot;image_style&quot;:&quot;&quot;,&quot;image_link&quot;:&quot;&quot;,&quot;image_loading&quot;:{&quot;attribute&quot;:&quot;lazy&quot;},&quot;svg_render_as_image&quot;:1,&quot;svg_attributes&quot;:{&quot;width&quot;:&quot;50&quot;,&quot;height&quot;:&quot;50&quot;}}" data-entity-type="media" data-entity-uuid="54d09fd1-b64a-42c1-bff3-180489d80ef4" data-langcode="en" title="Icon phone blue 282" class="align-center embedded-entity"> 
                            <i class="fa fa-phone-square fa-5x" aria-hidden="true"></i>
                        </div>
                        <p class="text-align-center" style="margin-top:20px">
                            <strong class="style--h4">Gọi cho chúng tôi</strong>
                        </p>
                        <p class="text-align-center">
                            <span class="smallmargin">Gọi cho chúng tôi và chúng tôi sẽ sẵn<br>lòng trả lời câu hỏi của bạn</span>
                        </p>
                        <p class="text-align-center" style="margin-bottom:0">
                            <span style="color:#0077c8;">Hỗ trợ bán hàng</span>
                        </p>
                        <p class="text-align-center">
                            <a class="btn-tertiary" href="tel: 0774926640"><span>+84 (0) 774926640</span></a>
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-4" style="text-align: center">
                <div class="wysiwyg">
                    <div style="margin-top:20px">
                        <div alt="Quote icon" data-embed-button="media_browser" data-entity-embed-display="media_image" data-entity-embed-display-settings="{&quot;link_url&quot;:&quot;&quot;,&quot;link_url_target&quot;:0,&quot;image_style&quot;:&quot;&quot;,&quot;image_link&quot;:&quot;&quot;,&quot;image_loading&quot;:{&quot;attribute&quot;:&quot;lazy&quot;},&quot;svg_render_as_image&quot;:1,&quot;svg_attributes&quot;:{&quot;width&quot;:&quot;60&quot;,&quot;height&quot;:&quot;60&quot;}}" data-entity-type="media" data-entity-uuid="bb43d07f-8237-49bf-bbb5-b7530f4949bf" data-langcode="en" title="Icon free quote" class="align-center embedded-entity"> 
                            <i class="fa fa-question-circle fa-5x" aria-hidden="true"></i>
                        </div>
                        <p class="text-align-center" style="margin-top: 20px">
                            <strong class="style--h4">Có thêm thông tin</strong></p><p class="text-align-center"><span class="smallmargin">
                                Hãy cho chúng tôi biết thêm về dự án<br>ủa bạn và chúng tôi sẽ gửi cho bạn<br>các đề xuất và báo giá miễn phí
                            </span>
                        </p>
                        <p class="text-align-center">
                            <a class="btn-tertiary" href="tel: 0774926640">Liên hệ báo giá</a>
                        </p>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>
