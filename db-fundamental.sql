INSERT INTO `admins` (`id`, `investor_id`, `employee_id`, `branch_id`, `name`, `username`, `type`, `mobile`, `email`, `password`, `image`, `status`, `created_at`, `updated_at`, `remember_token`) VALUES
(1, 1, 1, 1, 'Super Admin', NULL, 1, '01763634878', 'admin@gmail.com', '$2y$10$72mM6bhPWEoFlgJKq1WaueJN1g7vMISry0HMa1c5THjRYa7HTISV2', 'admin-1753071086.png', 1, '2024-08-30 19:03:44', '2025-07-21 04:11:26', 'HwxfWSUhNxvgd2zDPDGo9VUV8mfeIZyPs0bCTs7kXqSODc4cUsATq21GFfc9');

INSERT INTO `roles` (`id`, `is_superadmin`, `created_by`, `role`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Super Admin', 1,  NULL, NULL),
(2, 0, 1, 'Investor', 1, NULL, NULL),
(3, 0, 1, 'Branch Manager', 1,  NULL, NULL);