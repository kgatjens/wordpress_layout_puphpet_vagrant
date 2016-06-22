include composer

class wordpress_composer_install(
    $wpcconf
    ){

    composer::exec { 'Wordpress-Install':
        cmd => 'install',
        cwd => $wpcconf['settings']['path'],
        logoutput => false,
        prefer_source => false,
        prefer_dist   => false,
        dry_run       => false,
        custom_installers => true,
        scripts       => false,
        interaction   => false,
        optimize      => false,
        dev           => true,
        onlyif        => undef,
        unless        => undef,
    }

}
