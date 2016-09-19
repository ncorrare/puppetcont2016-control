class profile::windows::localadmin (
  $localadmin    = hiera('localadmin'),
  $adminpassword = hiera('adminpassword'),
  ) {
  #Example Local Admin implementation, using DSC Types

  dsc_user { $localadmin:
    dsc_fullname             => 'Jaye Tyler',
    dsc_description          => 'Local Administrator User',
    dsc_ensure               => present,
    dsc_username             => $localadmin,
    dsc_password             => {
      'user'     => $localadmin,
      'password' => $adminpassword
    },
    dsc_passwordneverexpires => false,
    dsc_disabled             => true,
  }
}
