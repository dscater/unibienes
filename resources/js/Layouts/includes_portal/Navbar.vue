<script setup>
import { ref } from "vue";
const url_asset = ref(g_url_assets);
</script>
<template>
    <!-- BEGIN #top-nav -->
    <div id="top-nav" class="top-nav">
        <!-- BEGIN container -->
        <div class="container">
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="dropdown dropdown-hover">
                        <a href="#" data-bs-toggle="dropdown"
                            ><img
                                src="/assets/portal/img/flag/flag-english.png"
                                class="flag-img"
                                alt="" />
                            English <b class="caret"></b
                        ></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#" class="dropdown-item"
                                    ><img
                                        src="/assets/portal/img/flag/flag-english.png"
                                        class="flag-img"
                                        alt=""
                                    />
                                    English</a
                                >
                            </li>
                            <li>
                                <a href="#" class="dropdown-item"
                                    ><img
                                        src="/assets/portal/img/flag/flag-german.png"
                                        class="flag-img"
                                        alt=""
                                    />
                                    German</a
                                >
                            </li>
                            <li>
                                <a href="#" class="dropdown-item"
                                    ><img
                                        src="/assets/portal/img/flag/flag-spanish.png"
                                        class="flag-img"
                                        alt=""
                                    />
                                    Spanish</a
                                >
                            </li>
                            <li>
                                <a href="#" class="dropdown-item"
                                    ><img
                                        src="/assets/portal/img/flag/flag-french.png"
                                        class="flag-img"
                                        alt=""
                                    />
                                    French</a
                                >
                            </li>
                            <li>
                                <a href="#" class="dropdown-item"
                                    ><img
                                        src="/assets/portal/img/flag/flag-chinese.png"
                                        class="flag-img"
                                        alt=""
                                    />
                                    Chinese</a
                                >
                            </li>
                        </ul>
                    </li>
                    <li><a href="#">Customer Care</a></li>
                    <li><a href="#">Order Tracker</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-end">
                    <li><a href="#">Career</a></li>
                    <li><a href="#">Our Forum</a></li>
                    <li><a href="#">Newsletter</a></li>
                    <li>
                        <a href="#"><i class="fab fa-facebook-f f-s-14"></i></a>
                    </li>
                    <li>
                        <a href="#"><i class="fab fa-twitter f-s-14"></i></a>
                    </li>
                    <li>
                        <a href="#"><i class="fab fa-instagram f-s-14"></i></a>
                    </li>
                    <li>
                        <a href="#"><i class="fab fa-dribbble f-s-14"></i></a>
                    </li>
                    <li>
                        <a href="#"><i class="fab fa-google f-s-14"></i></a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- END container -->
    </div>
    <!-- END #top-nav -->
    <!-- BEGIN #header -->
    <div id="header" class="header" data-fixed-top="true">
        <!-- BEGIN container -->
        <div class="container">
            <!-- BEGIN header-container -->
            <div class="header-container">
                <!-- BEGIN navbar-toggle -->
                <button
                    type="button"
                    class="navbar-toggle collapsed"
                    data-bs-toggle="collapse"
                    data-bs-target="#navbar-collapse"
                >
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <!-- END navbar-toggle -->
                <!-- BEGIN header-logo -->
                <div class="header-logo">
                    <a href="index.html">
                        <span class="brand-logo"></span>
                        <span class="brand-text">
                            <span>Color</span>Admin
                            <small>e-commerce frontend theme</small>
                        </span>
                    </a>
                </div>
                <!-- END header-logo -->
                <!-- BEGIN header-nav -->
                <div class="header-nav">
                    <div class="collapse navbar-collapse" id="navbar-collapse">
                        <ul class="nav justify-content-center">
                            <li class="active">
                                <a href="index.html">Home</a>
                            </li>
                            <li
                                class="dropdown dropdown-full-width dropdown-hover"
                            >
                                <a href="#" data-bs-toggle="dropdown">
                                    Our Store
                                    <b class="caret"></b>
                                    <span class="arrow top"></span>
                                </a>
                                <!-- BEGIN dropdown-menu -->
                                <div class="dropdown-menu p-0">
                                    <!-- BEGIN dropdown-menu-container -->
                                    <div class="dropdown-menu-container">
                                        <!-- BEGIN dropdown-menu-sidebar -->
                                        <div class="dropdown-menu-sidebar">
                                            <h4 class="title">
                                                Shop By Categories
                                            </h4>
                                            <ul class="dropdown-menu-list">
                                                <li>
                                                    <a href="product.html"
                                                        >Mobile Phone</a
                                                    >
                                                </li>
                                                <li>
                                                    <a href="product.html"
                                                        >Tablet</a
                                                    >
                                                </li>
                                                <li>
                                                    <a href="product.html"
                                                        >Laptop</a
                                                    >
                                                </li>
                                                <li>
                                                    <a href="product.html"
                                                        >Desktop</a
                                                    >
                                                </li>
                                                <li>
                                                    <a href="product.html"
                                                        >TV</a
                                                    >
                                                </li>
                                                <li>
                                                    <a href="product.html"
                                                        >Speaker</a
                                                    >
                                                </li>
                                                <li>
                                                    <a href="product.html"
                                                        >Gadget</a
                                                    >
                                                </li>
                                            </ul>
                                        </div>
                                        <!-- END dropdown-menu-sidebar -->
                                        <!-- BEGIN dropdown-menu-content -->
                                        <div class="dropdown-menu-content">
                                            <h4 class="title">
                                                Shop By Popular Phone
                                            </h4>
                                            <div class="row">
                                                <div class="col-lg-3">
                                                    <ul
                                                        class="dropdown-menu-list"
                                                    >
                                                        <li>
                                                            <a
                                                                href="product_detail.html"
                                                                ><i
                                                                    class="fa fa-fw fa-angle-right text-muted"
                                                                ></i>
                                                                iPhone 7</a
                                                            >
                                                        </li>
                                                        <li>
                                                            <a
                                                                href="product_detail.html"
                                                                ><i
                                                                    class="fa fa-fw fa-angle-right text-muted"
                                                                ></i>
                                                                iPhone 6s</a
                                                            >
                                                        </li>
                                                        <li>
                                                            <a
                                                                href="product_detail.html"
                                                                ><i
                                                                    class="fa fa-fw fa-angle-right text-muted"
                                                                ></i>
                                                                iPhone 6</a
                                                            >
                                                        </li>
                                                        <li>
                                                            <a
                                                                href="product_detail.html"
                                                                ><i
                                                                    class="fa fa-fw fa-angle-right text-muted"
                                                                ></i>
                                                                iPhone 5s</a
                                                            >
                                                        </li>
                                                        <li>
                                                            <a
                                                                href="product_detail.html"
                                                                ><i
                                                                    class="fa fa-fw fa-angle-right text-muted"
                                                                ></i>
                                                                iPhone 5</a
                                                            >
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="col-lg-3">
                                                    <ul
                                                        class="dropdown-menu-list"
                                                    >
                                                        <li>
                                                            <a
                                                                href="product_detail.html"
                                                                ><i
                                                                    class="fa fa-fw fa-angle-right text-muted"
                                                                ></i>
                                                                Galaxy S7</a
                                                            >
                                                        </li>
                                                        <li>
                                                            <a
                                                                href="product_detail.html"
                                                                ><i
                                                                    class="fa fa-fw fa-angle-right text-muted"
                                                                ></i>
                                                                Galaxy A9</a
                                                            >
                                                        </li>
                                                        <li>
                                                            <a
                                                                href="product_detail.html"
                                                                ><i
                                                                    class="fa fa-fw fa-angle-right text-muted"
                                                                ></i>
                                                                Galaxy J3</a
                                                            >
                                                        </li>
                                                        <li>
                                                            <a
                                                                href="product_detail.html"
                                                                ><i
                                                                    class="fa fa-fw fa-angle-right text-muted"
                                                                ></i>
                                                                Galaxy Note 5</a
                                                            >
                                                        </li>
                                                        <li>
                                                            <a
                                                                href="product_detail.html"
                                                                ><i
                                                                    class="fa fa-fw fa-angle-right text-muted"
                                                                ></i>
                                                                Galaxy S7</a
                                                            >
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="col-lg-3">
                                                    <ul
                                                        class="dropdown-menu-list"
                                                    >
                                                        <li>
                                                            <a
                                                                href="product_detail.html"
                                                                ><i
                                                                    class="fa fa-fw fa-angle-right text-muted"
                                                                ></i>
                                                                Lumia 730</a
                                                            >
                                                        </li>
                                                        <li>
                                                            <a
                                                                href="product_detail.html"
                                                                ><i
                                                                    class="fa fa-fw fa-angle-right text-muted"
                                                                ></i>
                                                                Lumia 735</a
                                                            >
                                                        </li>
                                                        <li>
                                                            <a
                                                                href="product_detail.html"
                                                                ><i
                                                                    class="fa fa-fw fa-angle-right text-muted"
                                                                ></i>
                                                                Lumia 830</a
                                                            >
                                                        </li>
                                                        <li>
                                                            <a
                                                                href="product_detail.html"
                                                                ><i
                                                                    class="fa fa-fw fa-angle-right text-muted"
                                                                ></i>
                                                                Lumia 820</a
                                                            >
                                                        </li>
                                                        <li>
                                                            <a
                                                                href="product_detail.html"
                                                                ><i
                                                                    class="fa fa-fw fa-angle-right text-muted"
                                                                ></i>
                                                                Lumia Icon</a
                                                            >
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="col-lg-3">
                                                    <ul
                                                        class="dropdown-menu-list"
                                                    >
                                                        <li>
                                                            <a
                                                                href="product_detail.html"
                                                                ><i
                                                                    class="fa fa-fw fa-angle-right text-muted"
                                                                ></i>
                                                                Xperia X</a
                                                            >
                                                        </li>
                                                        <li>
                                                            <a
                                                                href="product_detail.html"
                                                                ><i
                                                                    class="fa fa-fw fa-angle-right text-muted"
                                                                ></i>
                                                                Xperia Z5</a
                                                            >
                                                        </li>
                                                        <li>
                                                            <a
                                                                href="product_detail.html"
                                                                ><i
                                                                    class="fa fa-fw fa-angle-right text-muted"
                                                                ></i>
                                                                Xperia M5</a
                                                            >
                                                        </li>
                                                        <li>
                                                            <a
                                                                href="product_detail.html"
                                                                ><i
                                                                    class="fa fa-fw fa-angle-right text-muted"
                                                                ></i>
                                                                Xperia C5</a
                                                            >
                                                        </li>
                                                        <li>
                                                            <a
                                                                href="product_detail.html"
                                                                ><i
                                                                    class="fa fa-fw fa-angle-right text-muted"
                                                                ></i>
                                                                Xperia C4</a
                                                            >
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <h4 class="title">Shop By Brand</h4>
                                            <ul
                                                class="dropdown-brand-list mb-0"
                                            >
                                                <li>
                                                    <a href="product.html"
                                                        ><img
                                                            src="/assets/portal/img/brand/brand-apple.png"
                                                            alt=""
                                                    /></a>
                                                </li>
                                                <li>
                                                    <a href="product.html"
                                                        ><img
                                                            src="/assets/portal/img/brand/brand-samsung.png"
                                                            alt=""
                                                    /></a>
                                                </li>
                                                <li>
                                                    <a href="product.html"
                                                        ><img
                                                            src="/assets/portal/img/brand/brand-htc.png"
                                                            alt=""
                                                    /></a>
                                                </li>
                                                <li>
                                                    <a href="product.html"
                                                        ><img
                                                            src="/assets/portal/img/brand/brand-microsoft.png"
                                                            alt=""
                                                    /></a>
                                                </li>
                                                <li>
                                                    <a href="product.html"
                                                        ><img
                                                            src="/assets/portal/img/brand/brand-nokia.png"
                                                            alt=""
                                                    /></a>
                                                </li>
                                                <li>
                                                    <a href="product.html"
                                                        ><img
                                                            src="/assets/portal/img/brand/brand-blackberry.png"
                                                            alt=""
                                                    /></a>
                                                </li>
                                                <li>
                                                    <a href="product.html"
                                                        ><img
                                                            src="/assets/portal/img/brand/brand-sony.png"
                                                            alt=""
                                                    /></a>
                                                </li>
                                            </ul>
                                        </div>
                                        <!-- END dropdown-menu-content -->
                                    </div>
                                    <!-- END dropdown-menu-container -->
                                </div>
                                <!-- END dropdown-menu -->
                            </li>
                            <li class="dropdown dropdown-hover">
                                <a href="#" data-bs-toggle="dropdown">
                                    Accessories
                                    <b class="caret"></b>
                                    <span class="arrow top"></span>
                                </a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="product.html"
                                        >Mobile Phone</a
                                    >
                                    <a class="dropdown-item" href="product.html"
                                        >Tablet</a
                                    >
                                    <a class="dropdown-item" href="product.html"
                                        >TV</a
                                    >
                                    <a class="dropdown-item" href="product.html"
                                        >Desktop</a
                                    >
                                    <a class="dropdown-item" href="product.html"
                                        >Laptop</a
                                    >
                                    <a class="dropdown-item" href="product.html"
                                        >Speaker</a
                                    >
                                    <a class="dropdown-item" href="product.html"
                                        >Gadget</a
                                    >
                                </div>
                            </li>
                            <li><a href="product.html">New Arrival</a></li>
                            <li class="dropdown dropdown-hover">
                                <a href="#" data-bs-toggle="dropdown">
                                    Pages
                                    <b class="caret"></b>
                                    <span class="arrow top"></span>
                                </a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="index.html"
                                        >Home (Default)</a
                                    >
                                    <a
                                        class="dropdown-item"
                                        href="index_fixed_header.html"
                                        >Home (Fixed Header)</a
                                    >
                                    <a
                                        class="dropdown-item"
                                        href="index_inverse_header.html"
                                        >Home (Inverse Header)</a
                                    >
                                    <a
                                        class="dropdown-item"
                                        href="search_results.html"
                                        >Search Results</a
                                    >
                                    <a class="dropdown-item" href="product.html"
                                        >Product Page</a
                                    >
                                    <a
                                        class="dropdown-item"
                                        href="product_detail.html"
                                        >Product Details Page</a
                                    >
                                    <a
                                        class="dropdown-item"
                                        href="checkout_cart.html"
                                        >Checkout Cart</a
                                    >
                                    <a
                                        class="dropdown-item"
                                        href="checkout_info.html"
                                        >Checkout Shipping</a
                                    >
                                    <a
                                        class="dropdown-item"
                                        href="checkout_payment.html"
                                        >Checkout Payment</a
                                    >
                                    <a
                                        class="dropdown-item"
                                        href="checkout_complete.html"
                                        >Checkout Complete</a
                                    >
                                    <a
                                        class="dropdown-item"
                                        href="my_account.html"
                                        >My Account</a
                                    >
                                    <a
                                        class="dropdown-item"
                                        href="contact_us.html"
                                        >Contact Us</a
                                    >
                                    <a
                                        class="dropdown-item"
                                        href="about_us.html"
                                        >About Us</a
                                    >
                                    <a class="dropdown-item" href="faq.html"
                                        >FAQ</a
                                    >
                                </div>
                            </li>
                            <li class="dropdown dropdown-hover">
                                <a href="#" data-bs-toggle="dropdown">
                                    <i class="fa fa-search search-btn"></i>
                                    <span class="arrow top"></span>
                                </a>
                                <div class="dropdown-menu p-15px">
                                    <form
                                        action="search_results.html"
                                        method="POST"
                                        name="search_form"
                                    >
                                        <div class="input-group">
                                            <input
                                                type="text"
                                                placeholder="Search"
                                                class="form-control bg-light"
                                            />
                                            <button
                                                class="btn btn-dark"
                                                type="submit"
                                            >
                                                <i class="fa fa-search"></i>
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- END header-nav -->
                <!-- BEGIN header-nav -->
                <div class="header-nav">
                    <ul class="nav justify-content-end">
                        <li class="dropdown dropdown-hover">
                            <a
                                href="#"
                                class="header-cart"
                                data-bs-toggle="dropdown"
                            >
                                <i class="fa fa-shopping-bag"></i>
                                <span class="total">2</span>
                                <span class="arrow top"></span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-cart p-0">
                                <div class="cart-header">
                                    <h4 class="cart-title">Shopping Bag (1)</h4>
                                </div>
                                <div class="cart-body">
                                    <ul class="cart-item">
                                        <li>
                                            <div class="cart-item-image">
                                                <img
                                                    src="/assets/portal/img/product/product-ipad.jpg"
                                                    alt=""
                                                />
                                            </div>
                                            <div class="cart-item-info">
                                                <h4>
                                                    iPad Pro Wi-Fi 128GB -
                                                    Silver
                                                </h4>
                                                <p class="price">$699.00</p>
                                            </div>
                                            <div class="cart-item-close">
                                                <a
                                                    href="#"
                                                    data-bs-toggle="tooltip"
                                                    data-bs-title="Remove"
                                                    >&times;</a
                                                >
                                            </div>
                                        </li>
                                        <li>
                                            <div class="cart-item-image">
                                                <img
                                                    src="/assets/portal/img/product/product-imac.jpg"
                                                    alt=""
                                                />
                                            </div>
                                            <div class="cart-item-info">
                                                <h4>21.5-inch iMac</h4>
                                                <p class="price">$1299.00</p>
                                            </div>
                                            <div class="cart-item-close">
                                                <a
                                                    href="#"
                                                    data-bs-toggle="tooltip"
                                                    data-bs-title="Remove"
                                                    >&times;</a
                                                >
                                            </div>
                                        </li>
                                        <li>
                                            <div class="cart-item-image">
                                                <img
                                                    src="/assets/portal/img/product/product-iphone.png"
                                                    alt=""
                                                />
                                            </div>
                                            <div class="cart-item-info">
                                                <h4>iPhone 6s 16GB - Silver</h4>
                                                <p class="price">$649.00</p>
                                            </div>
                                            <div class="cart-item-close">
                                                <a
                                                    href="#"
                                                    data-bs-toggle="tooltip"
                                                    data-bs-title="Remove"
                                                    >&times;</a
                                                >
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="cart-footer">
                                    <div class="row gx-2">
                                        <div class="col-6">
                                            <a
                                                href="checkout_cart.html"
                                                class="btn btn-default btn-theme d-block"
                                                >View Cart</a
                                            >
                                        </div>
                                        <div class="col-6">
                                            <a
                                                href="checkout_cart.html"
                                                class="btn btn-dark btn-theme d-block"
                                                >Checkout</a
                                            >
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a :href="route('login')">
                                <img
                                    src="/assets/portal/img/user/user-1.jpg"
                                    class="user-img"
                                    alt=""
                                />
                                <span class="d-none d-xl-inline">Acceder</span>
                            </a>
                        </li>
                    </ul>
                </div>
                <!-- END header-nav -->
            </div>
            <!-- END header-container -->
        </div>
        <!-- END container -->
    </div>
    <!-- END #header -->

    <!-- BEGIN #slider -->
    <div id="slider" class="section-container p-0 bg-dark">
        <!-- BEGIN carousel -->
        <div id="main-carousel" class="carousel slide" data-ride="carousel">
            <!-- BEGIN carousel-inner -->
            <div class="carousel-inner">
                <!-- BEGIN item -->
                <div
                    class="carousel-item active"
                    data-paroller="true"
                    data-paroller-factor="0.3"
                    data-paroller-factor-sm="0.01"
                    data-paroller-factor-xs="0.01"
                    :style="{
                        background: `url(${url_asset}assets/portal/img/slider/slider-1-cover.jpg) center 0 / cover no-repeat`,
                    }"
                >
                    <div class="container">
                        <img
                            src="/assets/portal/img/slider/slider-1-product.png"
                            class="product-img right bottom animate__fadeInRight animate__animated"
                            alt=""
                        />
                    </div>
                    <div
                        class="carousel-caption carousel-caption-left text-white"
                    >
                        <div class="container">
                            <h3
                                class="title mb-5px animate__fadeInLeftBig animate__animated"
                            >
                                iMac
                            </h3>
                            <p
                                class="mb-15px animate__fadeInLeftBig animate__animated"
                            >
                                The vision is brighter than ever.
                            </p>
                            <div
                                class="price mb-30px animate__fadeInLeftBig animate__animated"
                            >
                                <small>from</small> <span>$2299.00</span>
                            </div>
                            <a
                                href="product_detail.html"
                                class="btn btn-outline btn-lg animate__fadeInLeftBig animate__animated"
                                >Buy Now</a
                            >
                        </div>
                    </div>
                </div>
                <!-- END item -->
                <!-- BEGIN item -->
                <div
                    class="carousel-item"
                    data-paroller="true"
                    data-paroller-factor="-0.3"
                    data-paroller-factor-sm="0.01"
                    data-paroller-factor-xs="0.01"
                    :style="{
                        background: `url(${url_asset}assets/portal/img/slider/slider-2-cover.jpg) center 0 / cover no-repeat`,
                    }"
                >
                    <div class="container">
                        <img
                            src="/assets/portal/img/slider/slider-2-product.png"
                            class="product-img left bottom animate__fadeInLeft animate__animated"
                            alt=""
                        />
                    </div>
                    <div
                        class="carousel-caption carousel-caption-right text-white"
                    >
                        <div class="container">
                            <h3
                                class="title mb-5px animate__fadeInRightBig animate__animated"
                            >
                                iPhone X
                            </h3>
                            <p
                                class="mb-15px animate__fadeInRightBig animate__animated"
                            >
                                Say hello to the future.
                            </p>
                            <div
                                class="price mb-30px animate__fadeInRightBig animate__animated"
                            >
                                <small>from</small> <span>$1,149.00</span>
                            </div>
                            <a
                                href="product_detail.html"
                                class="btn btn-outline btn-lg animate__fadeInRightBig animate__animated"
                                >Buy Now</a
                            >
                        </div>
                    </div>
                </div>
                <!-- END item -->
                <!-- BEGIN item -->
                <div
                    class="carousel-item"
                    data-paroller="true"
                    data-paroller-factor="-0.3"
                    data-paroller-factor-sm="0.01"
                    data-paroller-factor-xs="0.01"
                    :style="{
                        background: `url(${url_asset}assets/portal/img/slider/slider-3-cover.jpg) center 0 / cover no-repeat`,
                    }"
                >
                    <div class="carousel-caption text-white">
                        <div class="container">
                            <h3
                                class="title mb-5px animate__fadeInDownBig animate__animated"
                            >
                                Macbook Air
                            </h3>
                            <p
                                class="mb-15px animate__fadeInDownBig animate__animated"
                            >
                                Thin.Light.Powerful.<br />And ready for anything
                            </p>
                            <div
                                class="price animate__fadeInDownBig animate__animated"
                            >
                                <small>from</small> <span>$999.00</span>
                            </div>
                            <a
                                href="product_detail.html"
                                class="btn btn-outline btn-lg animate__fadeInUpBig animate__animated"
                                >Buy Now</a
                            >
                        </div>
                    </div>
                </div>
                <!-- END item -->
            </div>
            <!-- END carousel-inner -->
            <a
                class="carousel-control-prev"
                href="#main-carousel"
                data-bs-slide="prev"
            >
                <i class="fa fa-angle-left"></i>
            </a>
            <a
                class="carousel-control-next"
                href="#main-carousel"
                data-bs-slide="next"
            >
                <i class="fa fa-angle-right"></i>
            </a>
        </div>
        <!-- END carousel -->
    </div>
    <!-- END #slider -->
</template>
