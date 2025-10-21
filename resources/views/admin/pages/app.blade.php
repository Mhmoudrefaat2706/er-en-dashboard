<!doctype html>
<html lang="{{ app()->getLocale() }}" dir="{{ app()->getLocale() == 'ar' ? 'rtl' : 'ltr' }}">

<head>
    @include("admin.incloudes.head")
    @stack("css")
</head>

<body data-sidebar="dark">

    <!-- <body data-layout="horizontal" data-topbar="dark"> -->

    <!-- Begin page -->
    <div id="layout-wrapper">

        @include("admin.incloudes.header")
        <!-- ========== Left Sidebar Start ========== -->
        @include("admin.incloudes.sidebar")
        <!-- Left Sidebar End -->
        <!-- ============================================================== -->
        <!-- Start right Content here -->
        <!-- ============================================================== -->
        <div class="main-content">

            <div class="page-content @if(app()->getLocale() == 'ar') arabic-layout @endif">

                @yield("content")

            </div>

            @include("admin.incloudes.footer")
        </div>
        <!-- end main content-->

    </div>
    <!-- JAVASCRIPT -->
    @include("admin.incloudes.scripts")
    @stack("scripts")

</body>

</html>
