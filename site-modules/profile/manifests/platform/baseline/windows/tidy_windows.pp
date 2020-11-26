class  profile::platform::baseline::windows::tidy_windows{

  # Always remove the given file
  tidy { 'c:/example.log': }

  # remove all files from /tmp/dropbox
  tidy { 'clean_dropbox':
    path    => 'c:/Temp',
    recurse => 1,
  }

  # remove all files, in /tmp/image_cache,
  # that are older than 1 week
  tidy { 'prune_old_caches':
    path    => 'c:/temp_1_week',
    age     => '1w',
    recurse => 1,
  }

}
