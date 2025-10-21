<div class="vertical-menu">
    <div data-simplebar class="h-100">
        <div id="sidebar-menu">
            <ul class="metismenu list-unstyled" id="side-menu">
                <li class="menu-title">{{ __('Menu') }}</li>

                <li>
                    <a href="" class="waves-effect">
                        <i class="ri-bar-chart-box-line"></i>
                        <span>{{ __('Dashboard') }}</span>
                    </a>
                </li>

                <li>
                    <a href="javascript:void(0);" class="has-arrow waves-effect">
                        <i class="ri-shield-user-line"></i>
                        <span>{{ __('Admins') }}</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="{{ route('admin.admins.index') }}">{{ __('List') }}</a></li>
                    </ul>
                </li>

                <li>
                    <a href="javascript:void(0);" class="has-arrow waves-effect">
                        <i class="ri-user-3-line"></i>
                        <span>{{ __('Users') }}</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="{{ route('admin.users.index') }}">{{ __('List') }}</a></li>
                    </ul>
                </li>

                <li>
                    <a href="javascript:void(0);" class="has-arrow waves-effect">
                        <i class="ri-layout-4-line"></i>
                        <span>{{ __('Sections') }}</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="{{ route('admin.home_banner.index') }}">{{ __('Home Banner') }}</a></li>
                        <li><a href="{{ route('admin.featured.index') }}">{{ __('Featured') }}</a></li>
                        <li><a href="{{ route('admin.video.index') }}">{{ __('Video View') }}</a></li>
                    </ul>
                </li>

                <li>
                    <a href="javascript:void(0);" class="has-arrow waves-effect">
                        <i class="ri-share-box-line"></i>
                        <span>{{ __('Social Media') }}</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="{{ route('admin.social_media.index') }}">{{ __('List') }}</a></li>
                    </ul>
                </li>

                {{-- <li>
                    <a href="javascript:void(0);" class="has-arrow waves-effect">
                        <i class="ri-lock-line"></i>
                        <span>{{ __('Permissions') }}</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="{{ route('admin.permissions.index') }}">{{ __('List') }}</a></li>
                    </ul>
                </li> --}}

                {{-- <li>
                    <a href="javascript:void(0);" class="has-arrow waves-effect">
                        <i class="ri-group-line"></i>
                        <span>{{ __('Roles') }}</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="{{ route('admin.roles.index') }}">{{ __('List') }}</a></li>
                    </ul>
                </li> --}}

                <li>
                    <a href="javascript:void(0);" class="has-arrow waves-effect">
                        <i class="ri-building-2-line"></i>
                        <span>{{ __('Projects') }}</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="{{ route('admin.projects.index') }}">{{ __('List') }}</a></li>
                    </ul>
                </li>

                <li>
                    <a href="javascript:void(0);" class="has-arrow waves-effect">
                        <i class="ri-folder-line"></i>
                        <span>{{ __('Categories') }}</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="{{ route('admin.categories.index') }}">{{ __('List') }}</a></li>
                    </ul>
                </li>

                <li>
                    <a href="javascript:void(0);" class="has-arrow waves-effect">
                        <i class="ri-newspaper-line"></i>
                        <span>{{ __('Blogs') }}</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="{{ route('admin.blogs.index') }}">{{ __('List') }}</a></li>
                    </ul>
                </li>

                <li>
                    <a href="javascript:void(0);" class="has-arrow waves-effect">
                        <i class="ri-mail-line"></i>
                        <span>{{ __('Messages') }}</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="{{ route('admin.messages.index') }}">{{ __('List') }}</a></li>
                    </ul>
                </li>

                {{-- <li>
                    <a href="javascript:void(0);" class="has-arrow waves-effect">
                        <i class="ri-star-line"></i>
                        <span>{{ __('Reviews') }}</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="{{ route('admin.reviews.index') }}">{{ __('List') }}</a></li>
                    </ul>
                </li> --}}

                {{-- <li>
                    <a href="javascript:void(0);" class="has-arrow waves-effect">
                        <i class="ri-question-line"></i>
                        <span>{{ __('FAQs') }}</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="{{ route('admin.faqs.index') }}">{{ __('List') }}</a></li>
                    </ul>
                </li> --}}

                <li>
                    <a href="javascript:void(0);" class="has-arrow waves-effect">
                        <i class="ri-book-2-line"></i>
                        <span>{{ __('Blog Categories') }}</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="{{ route('admin.blog_categories.index') }}">{{ __('List') }}</a></li>
                    </ul>
                </li>

                {{-- Uncomment when needed
                <li>
                    <a href="javascript:void(0);" class="has-arrow waves-effect">
                        <i class="ri-mail-send-line"></i>
                        <span>{{ __('Newsletters') }}</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="{{ route('admin.newsletters.index') }}">{{ __('List') }}</a></li>
                    </ul>
                </li>
                --}}

                <li>
                    <a href="javascript:void(0);" class="has-arrow waves-effect">
                        <i class="ri-settings-3-line"></i>
                        <span>{{ __('Settings') }}</span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li><a href="{{ route('admin.settings.index') }}">{{ __('List') }}</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>
