<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<section id="view-chat">
    <div id="box-chat" class="card mt-5">
        <div class="card-header">
            <img id="img-outcoming" src="https://img.icons8.com/color/48/000000/circled-user-female-skin-type-7.png" width="50" height="50">
            <span id="name-outcoming" class="pb-3">Live chat</span>
            <i class="fa fa-times" id="btn-close-chat" style="position: absolute;right: 5%;top: 20px;" aria-hidden="true"></i>
        </div>
        <div id="list-content-chat" class="card-body" style="overflow-x: scroll;display: flex;flex-direction: column-reverse">
        </div>
        <div class="card-footer text-muted">
            <textarea id="content-mess" class="form-control" rows="3" placeholder="Type your message"></textarea>
        </div>
    </div>
</section>
<!-- Footer Section Begin -->
<footer class="footer spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="footer__about">
                    <div class="footer__about__logo">
                        <a href="./index.html"><img src="img/logo.png" alt=""></a>
                    </div>
                    <ul>
                        <li>Address: Hồ Chí Minh</li>
                        <li>Phone: +0774926640</li>
                        <li>Email: 2051012074nguyen@ou.edu.vn</li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                <div class="footer__widget">
                    <h6>Open university</h6>
                </div>
            </div>
            <div class="col-lg-4 col-md-12">
                <div class="footer__widget">
                    <h6>Bạn cần hỗ trợ?</h6>
                    <p>Nhập email, để tư vấn viên có thể giúp đỡ bạn!</p>
                    <form action="#">
                        <input type="text" placeholder="Enter your mail">
                        <button type="submit" class="site-btn">Send</button>
                    </form>
                    <div class="footer__widget__social">
                        <a href="#"><i class="fa fa-facebook"></i></a>
                        <a href="#"><i class="fa fa-instagram"></i></a>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-pinterest"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="footer__copyright">
                    <div class="footer__copyright__text"><p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright ©<script>document.write(new Date().getFullYear());</script></p></div>
                    <div class="footer__copyright__payment"><img src="img/payment-item.png" alt=""></div>
                </div>
            </div>
        </div>
    </div>
</footer>
<style>
    #box-chat{
        position: fixed;
        z-index: 1000;
        height: 580px;
        width: 500px;
        bottom: 0px;
        right: 0;
    }
    .outcoming{
        width: auto;
        padding: 10px;
        border: none;
        background-image: linear-gradient(45deg,#7fad39,rgb(70, 248, 25));
        font-size: 18px;
        border-radius: 10px;
        color: white;
    }
    .incoming{
        width: auto;
        padding: 10px;
        border: 1px solid #E7E7E9;
        font-size: 18px;
        border-radius: 10px;
        position: relative;
        color: black;
        text-align: right;
        
        
    }
    .chat{
        margin-right: 80px;
        height: auto;
    }
    .chat1{
        height: auto;
        margin-left: 80px;
    }
</style>