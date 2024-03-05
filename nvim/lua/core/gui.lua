if vim.g.neovide then
  vim.o.guifont = "Red Hat Mono:h12:b"
  vim.g.neovide_transparency = 0.8
  vim.g.neovide_window_blurred = true

  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0

  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_refresh_rate_idle = 5
  vim.g.neovide_scroll_animation_length = 0.3

  vim.g.neovide_unlink_border_highlights = true
end
