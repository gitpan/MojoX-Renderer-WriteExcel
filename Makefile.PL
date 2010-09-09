
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'emit Excel spreadsheets from Mojo',
  'AUTHOR' => 'Zak B. Elep <zakame@cpan.org>',
  'BUILD_REQUIRES' => {
    'Test::Mojo' => '0',
    'Test::More' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'MojoX-Renderer-WriteExcel',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'MojoX::Renderer::WriteExcel',
  'PREREQ_PM' => {
    'Spreadsheet::WriteExcel::Simple' => '0'
  },
  'VERSION' => '0.41',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



