import 'package:app/features/attractions/attractions.page.dart';
import 'package:app/features/auth/auth.forgot_password.dart';
import 'package:app/features/auth/auth.login.dart';
import 'package:app/features/auth/auth.register.dart';
import 'package:app/features/auth/auth.reset_password.dart';
import 'package:app/features/home/home.page.dart';
import 'package:app/features/onboarding/onboarding.page.dart';
import 'package:app/features/profile/profile.page.dart';
import 'package:app/features/splashscreen/splashscreen.page.dart';
import 'package:app/features/splashscreen/splashscreen_theme.page.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRoutes = GoRouter(
    initialLocation: "/splashscreen",
    routes: <RouteBase>[
      GoRoute(
          path: "/splashscreen",
          builder: (context,state)=>const SplashScreenPage()
      ),
      GoRoute(
          path: "/splashscreen-theme",
          builder: (context,state)=>const SplashScreenThemePage()
      ),
      GoRoute(
          path: "/onboarding",
          builder: (context,state)=>const OnboardingPage()
      ),
      GoRoute(
          path: "/login",
          builder: (context,state)=>const LoginPage()
      ),
      GoRoute(
          path: "/profile",
          builder: (context,state)=>const ProfilePage()
      ),
      GoRoute(
          path: "/forgot-password",
          builder: (context,state)=>const ForgotPasswordPage()
      ),
      GoRoute(
          path: "/reset-password",
          builder: (context,state)=>const ResetPasswordPage()
      ),
      GoRoute(
          path: "/create-account",
          builder: (context,state)=>const RegisterPage()
      ),
      GoRoute(
          path: "/",
          builder: (context,state)=>const HomePage()
      ),
    GoRoute(
          path: "/attractions",
          builder: (context,state)=>const AttractionPage()
      ),
    ]
);