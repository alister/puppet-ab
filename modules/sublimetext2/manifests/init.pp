class sublimetext2(
  $ver = 'dev'   # or beta?
) inherits sublimetext2::params
{

  anchor { 'sublimetext2::begin': }
  ~> class  { 'sublimetext2::config': }
  -> class  { 'sublimetext2::package': }
  -> anchor { 'sublimetext2::end': }

}
