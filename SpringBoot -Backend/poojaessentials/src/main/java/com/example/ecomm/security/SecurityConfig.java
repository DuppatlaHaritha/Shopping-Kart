/*package com.example.ecomm.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.*;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.*;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
@EnableMethodSecurity
public class SecurityConfig {

    @Autowired
    private JwtAuthenticationFilter jwtFilter;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration cfg) throws Exception {
        return cfg.getAuthenticationManager();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.csrf().disable()
            .authorizeHttpRequests()
           .requestMatchers("/api/auth/**", "/api/products/**", "/h2-console/**","/api/admin/**").permitAll()
            

            .anyRequest().authenticated()
            .and()
            .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);

        http.addFilterBefore(jwtFilter, UsernamePasswordAuthenticationFilter.class);
        return http.build();
    }
}*/

/*package com.example.ecomm.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.*;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
@EnableMethodSecurity
public class SecurityConfig {

    @Autowired
    private JwtAuthenticationFilter jwtFilter;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration cfg) throws Exception {
        return cfg.getAuthenticationManager();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.csrf().disable()
            .authorizeHttpRequests()
            // allow login/register endpoints
            .requestMatchers("/api/auth/**", "/api/products/**", "/h2-console/**", "/api/admin/**",  "/api/categories/**").permitAll()
            .anyRequest().authenticated()
            .and()
            .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);

        // JWT filter
        http.addFilterBefore(jwtFilter, UsernamePasswordAuthenticationFilter.class);

        return http.build();
    }
}
*/












/*package com.example.ecomm.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.*;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableMethodSecurity
public class SecurityConfig {

    @Autowired
    private JwtAuthenticationFilter jwtFilter;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration cfg) throws Exception {
        return cfg.getAuthenticationManager();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.csrf().disable()
            .authorizeHttpRequests(auth -> auth
                // allow login/register endpoints using AntPathRequestMatcher
                .requestMatchers(
                    new AntPathRequestMatcher("/api/auth/**"),
                    new AntPathRequestMatcher("/api/products/**"),
                    new AntPathRequestMatcher("/h2-console/**"),
                    new AntPathRequestMatcher("/api/admin/**"),
                    new AntPathRequestMatcher("/api/categories/**")
                ).permitAll()
                .anyRequest().authenticated()
            )
            .sessionManagement()
            .sessionCreationPolicy(SessionCreationPolicy.STATELESS);

        // JWT filter
        http.addFilterBefore(jwtFilter, UsernamePasswordAuthenticationFilter.class);

        return http.build();
    }
}

*/
//27-10-2025
/*

package com.example.ecomm.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.*;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableMethodSecurity
public class SecurityConfig {

    @Autowired
    private JwtAuthenticationFilter jwtFilter;

    // ------------------ Password Encoder ------------------
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    // ------------------ Authentication Manager ------------------
    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration cfg) throws Exception {
        return cfg.getAuthenticationManager();
    }

    // ------------------ Security Filter Chain ------------------
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.csrf().disable()
            .authorizeHttpRequests(auth -> auth
                // ✅ Public endpoints
                .requestMatchers(
                    new AntPathRequestMatcher("/api/auth/**"),       // login/register
                    new AntPathRequestMatcher("/api/products/**"),   // products
                    new AntPathRequestMatcher("/api/admin/**"),      // admin APIs
                    new AntPathRequestMatcher("/api/categories/**"), // categories
                    new AntPathRequestMatcher("/h2-console/**"),     // H2 console
                    new AntPathRequestMatcher("/uploads/**")         // ✅ allow images
                ).permitAll()
                // All other endpoints require authentication
                .anyRequest().authenticated()
            )
            // Stateless session
            .sessionManagement()
            .sessionCreationPolicy(SessionCreationPolicy.STATELESS);

        // Add JWT filter before UsernamePasswordAuthenticationFilter
        http.addFilterBefore(jwtFilter, UsernamePasswordAuthenticationFilter.class);

        // Optional: allow H2 console frames
        http.headers().frameOptions().disable();

        return http.build();
    }
}
*/
/*
package com.example.ecomm.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.*;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableMethodSecurity
public class SecurityConfig {

    @Autowired
    private JwtAuthenticationFilter jwtFilter;

    // ------------------ Password Encoder ------------------
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    // ------------------ Authentication Manager ------------------
    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration cfg) throws Exception {
        return cfg.getAuthenticationManager();
    }

    // ------------------ Security Filter Chain ------------------
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.csrf().disable()
            .authorizeHttpRequests(auth -> auth
                // ✅ Public endpoints
                .requestMatchers(
                    new AntPathRequestMatcher("/api/auth/**"),        // login/register
                    new AntPathRequestMatcher("/api/products/**"),    // product listing
                    new AntPathRequestMatcher("/api/categories/**"),  // categories
                    new AntPathRequestMatcher("/h2-console/**"),      // H2 console
                    new AntPathRequestMatcher("/uploads/**")          // image folder
                ).permitAll()

                // ✅ Admin-only endpoints (secured)
                .requestMatchers(new AntPathRequestMatcher("/api/admin/**")).hasRole("ADMIN")

                // ✅ All other endpoints require authentication
                .anyRequest().authenticated()
            )

            // Stateless session for JWT
            .sessionManagement()
            .sessionCreationPolicy(SessionCreationPolicy.STATELESS);

        // ✅ Add JWT filter before UsernamePasswordAuthenticationFilter
        http.addFilterBefore(jwtFilter, UsernamePasswordAuthenticationFilter.class);

        // ✅ Allow H2 console frames (optional for dev)
        http.headers().frameOptions().disable();

        return http.build();
    }
}
*/

//28-10-2025
/*
package com.example.ecomm.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.*;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableMethodSecurity
public class SecurityConfig {

    @Autowired
    private JwtAuthenticationFilter jwtFilter;

    // ------------------ Password Encoder ------------------
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    // ------------------ Authentication Manager ------------------
    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration cfg) throws Exception {
        return cfg.getAuthenticationManager();
    }

    // ------------------ Security Filter Chain ------------------
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.csrf().disable()
            .authorizeHttpRequests(auth -> auth
                // ✅ Public endpoints
                .requestMatchers(
                    new AntPathRequestMatcher("/api/auth/register"),
                    new AntPathRequestMatcher("/api/auth/login"),
                    new AntPathRequestMatcher("/api/auth/change-password"), // ✅ Added for password update
                    new AntPathRequestMatcher("/api/products/**"),           // product listing
                    new AntPathRequestMatcher("/api/categories/**"),         // categories
                    new AntPathRequestMatcher("/h2-console/**"),             // H2 console
                    new AntPathRequestMatcher("/uploads/**")                 // image folder
                ).permitAll()

                // ✅ Admin-only endpoints (secured)
                .requestMatchers(new AntPathRequestMatcher("/api/admin/**")).hasRole("ADMIN")

                // ✅ All other endpoints require authentication
                .anyRequest().authenticated()
            )

            // ✅ Stateless session for JWT
            .sessionManagement()
            .sessionCreationPolicy(SessionCreationPolicy.STATELESS);

        // ✅ Add JWT filter before UsernamePasswordAuthenticationFilter
        http.addFilterBefore(jwtFilter, UsernamePasswordAuthenticationFilter.class);

        // ✅ Allow H2 console frames (optional for dev)
        http.headers().frameOptions().disable();

        return http.build();
    }
}
*/

/*
package com.example.ecomm.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.*;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableMethodSecurity
public class SecurityConfig {

    @Autowired
    private JwtAuthenticationFilter jwtFilter;

    // ------------------ Password Encoder ------------------
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    // ------------------ Authentication Manager ------------------
    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration cfg) throws Exception {
        return cfg.getAuthenticationManager();
    }

    // ------------------ Security Filter Chain ------------------
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.csrf().disable()
            .authorizeHttpRequests(auth -> auth
                // ✅ Public endpoints (accessible without JWT)
                .requestMatchers(
                    new AntPathRequestMatcher("/api/auth/register"),
                    new AntPathRequestMatcher("/api/auth/login"),
                    new AntPathRequestMatcher("/api/auth/reset-password"),  // ✅ Added for forgot/reset password
                    new AntPathRequestMatcher("/api/products/**"),           // product listing
                    new AntPathRequestMatcher("/api/categories/**"),         // categories
                    new AntPathRequestMatcher("/h2-console/**"),             // H2 console
                    new AntPathRequestMatcher("/uploads/**")                 // image folder
                ).permitAll()

                // ✅ Admin-only endpoints
                .requestMatchers(new AntPathRequestMatcher("/api/admin/**")).hasRole("ADMIN")

                // ✅ All other endpoints require authentication
                .anyRequest().authenticated()
            )

            // ✅ Stateless sessions for JWT authentication
            .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))

            // ✅ Allow H2 console (for development only)
            .headers(headers -> headers.frameOptions().disable());

        // ✅ Add JWT filter before UsernamePasswordAuthenticationFilter
        http.addFilterBefore(jwtFilter, UsernamePasswordAuthenticationFilter.class);

        return http.build();
    }
}
*/




/*
package com.example.ecomm.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.*;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.List;

@Configuration
@EnableMethodSecurity
public class SecurityConfig {

    @Autowired
    private JwtAuthenticationFilter jwtFilter;

    // ------------------ Password Encoder ------------------
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    // ------------------ Authentication Manager ------------------
    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration cfg) throws Exception {
        return cfg.getAuthenticationManager();
    }

    // ------------------ Security Filter Chain ------------------
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            // ✅ Enable CORS and disable CSRF for APIs
            .cors().and()
            .csrf().disable()

            // ✅ Authorize request mappings
            .authorizeHttpRequests(auth -> auth
                // Public endpoints (accessible without JWT)
                .requestMatchers(
                    new AntPathRequestMatcher("/api/auth/register"),
                    new AntPathRequestMatcher("/api/auth/login"),
                    new AntPathRequestMatcher("/api/auth/reset-password"), // ✅ Allow reset-password
                    new AntPathRequestMatcher("/api/products/**"),
                    new AntPathRequestMatcher("/api/categories/**"),
                    new AntPathRequestMatcher("/h2-console/**"),
                    new AntPathRequestMatcher("/uploads/**"),
                    new AntPathRequestMatcher("/api/media/**")
                ).permitAll()

                // Admin-only endpoints
                .requestMatchers(new AntPathRequestMatcher("/api/admin/**")).hasRole("ADMIN")
                .requestMatchers("/api/sales/**").hasRole("SALES")   // <-- add this
                .requestMatchers("/api/user/**").hasAnyRole("USER","SALES","ADMIN")

                // All others need authentication
                .anyRequest().authenticated()
            )

            // ✅ Stateless JWT-based authentication
            .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))

            // ✅ Allow H2 console (for development)
            .headers(headers -> headers.frameOptions().disable());

        // ✅ Add JWT filter before UsernamePasswordAuthenticationFilter
        http.addFilterBefore(jwtFilter, UsernamePasswordAuthenticationFilter.class);

        return http.build();
    }

    // ------------------ CORS Configuration ------------------
    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedOrigins(List.of("*")); // ✅ Allow all origins
        configuration.setAllowedMethods(List.of("GET", "POST", "PUT", "DELETE", "OPTIONS"));
        configuration.setAllowedHeaders(List.of("*"));
        configuration.setAllowCredentials(true); // Allow credentials if needed

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }
}
*/



/*
package com.example.ecomm.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.*;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.List;

@Configuration
@EnableMethodSecurity
public class SecurityConfig {

    @Autowired
    private JwtAuthenticationFilter jwtFilter;

    // ------------------ Password Encoder ------------------
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    // ------------------ Authentication Manager ------------------
    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration cfg) throws Exception {
        return cfg.getAuthenticationManager();
    }

    // ------------------ Security Filter Chain ------------------
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            // ✅ Enable CORS and disable CSRF for APIs
            .cors().and()
            .csrf().disable()

            // ✅ Disable default login forms and basic auth popups
            .httpBasic(httpBasic -> httpBasic.disable())
            .formLogin(form -> form.disable())

            // ✅ Authorize request mappings
            .authorizeHttpRequests(auth -> auth
                // Public endpoints (accessible without JWT)
                .requestMatchers(
                    new AntPathRequestMatcher("/api/auth/register"),
                    new AntPathRequestMatcher("/api/auth/login"),
                    new AntPathRequestMatcher("/api/auth/reset-password"), // ✅ Allow reset-password
                    new AntPathRequestMatcher("/api/products/**"),
                    new AntPathRequestMatcher("/api/categories/**"),
                    new AntPathRequestMatcher("/h2-console/**"),
                    new AntPathRequestMatcher("/uploads/**"),
                    new AntPathRequestMatcher("/api/media/**")
                ).permitAll()

                // Admin-only endpoints
                .requestMatchers(new AntPathRequestMatcher("/api/admin/**")).hasRole("ADMIN")
                .requestMatchers("/api/sales/**").hasRole("SALES")   // <-- add this
                .requestMatchers("/api/user/**").hasAnyRole("USER","SALES","ADMIN")

                // All others need authentication
                .anyRequest().authenticated()
            )

            // ✅ Stateless JWT-based authentication
            .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))

            // ✅ Allow H2 console (for development)
            .headers(headers -> headers.frameOptions().disable());

        // ✅ Add JWT filter before UsernamePasswordAuthenticationFilter
        http.addFilterBefore(jwtFilter, UsernamePasswordAuthenticationFilter.class);

        return http.build();
    }

    // ------------------ CORS Configuration ------------------
    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedOrigins(List.of("*")); // ✅ Allow all origins
        configuration.setAllowedMethods(List.of("GET", "POST", "PUT", "DELETE", "OPTIONS"));
        configuration.setAllowedHeaders(List.of("*"));
        configuration.setAllowCredentials(true); // Allow credentials if needed

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }
}
*/



/*package com.example.ecomm.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.*;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.List;

@Configuration
@EnableMethodSecurity
public class SecurityConfig {

    @Autowired
    private JwtAuthenticationFilter jwtFilter;

    // ------------------ Password Encoder ------------------
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    // ------------------ Authentication Manager ------------------
    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration cfg) throws Exception {
        return cfg.getAuthenticationManager();
    }

    // ------------------ Security Filter Chain ------------------
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            // ✅ Enable CORS and disable CSRF for APIs
            .cors().and()
            .csrf().disable()

            // ✅ Disable default login forms and basic auth popups
            .httpBasic(httpBasic -> httpBasic.disable())
            .formLogin(form -> form.disable())

            // ✅ Authorize request mappings
            .authorizeHttpRequests(auth -> auth
                // Public endpoints (accessible without JWT)
                .requestMatchers(
                    new AntPathRequestMatcher("/api/auth/register"),
                    new AntPathRequestMatcher("/api/auth/login"),
                    new AntPathRequestMatcher("/api/auth/reset-password"),
                    new AntPathRequestMatcher("/api/products/**"),
                    new AntPathRequestMatcher("/api/categories/**"),
                    new AntPathRequestMatcher("/h2-console/**"),
                    new AntPathRequestMatcher("/uploads/**"),
                    new AntPathRequestMatcher("/api/media/**")
                ).permitAll()

                // ✅ Admin + Sales can access /api/admin/**
                .requestMatchers(new AntPathRequestMatcher("/api/admin/**"))
                    .hasAnyRole("ADMIN", "SALES")

                // ✅ Sales-specific endpoints
                .requestMatchers("/api/sales/**").hasRole("SALES")

                // ✅ User endpoints accessible by all authenticated roles
                .requestMatchers("/api/user/**").hasAnyRole("USER", "SALES", "ADMIN")

                // ✅ All others require authentication
                .anyRequest().authenticated()
            )

            // ✅ Stateless JWT-based authentication
            .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))

            // ✅ Allow H2 console (for development)
            .headers(headers -> headers.frameOptions().disable());

        // ✅ Add JWT filter before UsernamePasswordAuthenticationFilter
        http.addFilterBefore(jwtFilter, UsernamePasswordAuthenticationFilter.class);

        return http.build();
    }

    // ------------------ CORS Configuration ------------------
    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedOrigins(List.of("*")); // ✅ Allow all origins
        configuration.setAllowedMethods(List.of("GET", "POST", "PUT", "DELETE", "OPTIONS"));
        configuration.setAllowedHeaders(List.of("*"));
        configuration.setAllowCredentials(true); // Allow credentials if needed

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }
}*/
package com.example.ecomm.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.*;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.List;

@Configuration
@EnableMethodSecurity
public class SecurityConfig {

    @Autowired
    private JwtAuthenticationFilter jwtFilter;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration cfg) throws Exception {
        return cfg.getAuthenticationManager();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        http
            .cors().and()
            .csrf(csrf -> csrf.disable())
            .httpBasic(httpBasic -> httpBasic.disable())
            .formLogin(form -> form.disable())

            .authorizeHttpRequests(auth -> auth

                // Allow preflight CORS
                .requestMatchers(HttpMethod.OPTIONS, "/**").permitAll()

                // Public Endpoints (No Login Needed)
                .requestMatchers("/api/auth/**").permitAll()
                .requestMatchers("/api/products/**").permitAll()
                .requestMatchers("/api/categories/**").permitAll()

                // Allow uploaded product images
                .requestMatchers("/uploads/**").permitAll()
                .requestMatchers("/api/media/**").permitAll()
                .requestMatchers("/h2-console/**").permitAll()

                // Reports → Only Admin & Sales
                .requestMatchers("/api/reports/**")
                    .hasAnyRole("ADMIN", "SALES")

                // Admin API → Admin + Sales
                .requestMatchers("/api/admin/**")
                    .hasAnyRole("ADMIN", "SALES")

                // Sales Only
                .requestMatchers("/api/sales/**")
                    .hasRole("SALES")

                // User Area → Any authenticated user
                .requestMatchers("/api/user/**")
                    .hasAnyRole("USER", "SALES", "ADMIN")

                // Everything else requires login
                .anyRequest().authenticated()
            )

            .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
            .headers(headers -> headers.frameOptions().disable());

        http.addFilterBefore(jwtFilter, UsernamePasswordAuthenticationFilter.class);

        return http.build();
    }

    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedOrigins(List.of("*"));
        configuration.setAllowedMethods(List.of("GET", "POST", "PUT", "DELETE", "OPTIONS"));
        configuration.setAllowedHeaders(List.of("*"));
        configuration.setExposedHeaders(List.of("Authorization"));
        configuration.setAllowCredentials(true);

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        return source;
    }
}
