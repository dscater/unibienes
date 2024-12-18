<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>


    <!-- Google tag (gtag.js) -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-JSVKPXYSJE"></script>
    <script>
        window.dataLayer = window.dataLayer || [];

        function gtag() {
            dataLayer.push(arguments);
        }
        gtag('js', new Date());

        gtag('config', 'G-JSVKPXYSJE');
    </script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title inertia>{{ config('app.name', 'Laravel') }}</title>

    <link rel="shortcut icon" href="{{ asset('imgs/UNIBIENES.ico') }}">
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

    {{-- CSS --}}
    <link href="{{ asset('assets/portal/css/vendor.min.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/portal/css/app.min.css') }}" rel="stylesheet" />


    <script>
        g_url_assets = "{{ asset('') }}";
    </script>

    @routes
    @vite(['resources/js/portal.js', "resources/js/Pages/{$page['component']}.vue"])
    @inertiaHead

</head>

<body class="app-blank">
    <script src="{{ asset('assets/portal/js/vendor.min.js') }}"></script>
    <script src="{{ asset('assets/portal/js/app.min.js') }}"></script>
    @inertia

</body>

</html>
