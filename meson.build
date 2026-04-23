project('budgie-screenshot-applet', 'vala', 'c')

gtk    = dependency('gtk+-3.0')
budgie = dependency('budgie-3.0')
peas   = dependency('libpeas-2')

plugin_dir = join_paths(get_option('libdir'), 'budgie-desktop', 'plugins', 'budgie-screenshot-applet')

shared_library(
  'budgie-screenshot-applet',
  'ScreenshotApplet.vala',
  dependencies: [gtk, budgie, peas],
  vala_args: ['--vapidir', meson.current_source_dir()],
  install: true,
  install_dir: plugin_dir
)

install_data(
  'budgie-screenshot-applet.plugin',
  install_dir: plugin_dir
)
