class  profile::platform::baseline::windows::tidy_windows{

  # Always remove the given file
  tidy { 'c:/example.log': }

  # remove all files from c:/tmp
  tidy { 'clean_tmp':
    path    => 'c:/Tmp',
    recurse => 1,
  }

  # remove all files, in c:/tmp_1_week
  # that are older than 1 week
  tidy { 'prune_old_caches':
    path    => 'c:/tmp_1_week',
    age     => '1w',
    recurse => 1,
  }

}
