


.onAttach = function(libname, pkgname) {
  datasets = dataset_in_dir()
  if (length(datasets) == 0) {
    packageStartupMessage('No dataset has been downloaded yet. Use function download_gpdd to download datasets.')
  }
  else {
    packageStartupMessage('Loading datasets...')
    load_gpdd(datasets)
  }
}
