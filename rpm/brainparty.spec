Name: brainparty
Version: 0.5.993
Release: 1
Summary: A puzzle game to tease your brain
Group: Games
License: GPL
Url: http://tuxradar.com/brainparty
Source: %{name}-%{version}.tar.bz2
BuildRequires: pkgconfig(sdl2)
BuildRequires: pkgconfig(SDL2_image)
BuildRequires: pkgconfig(SDL2_mixer)
BuildRequires: pkgconfig(SDL2_ttf)
BuildRequires: pkgconfig(glesv1_cm)
BuildRequires: pkgconfig(egl)

%description
Brain Party is a fun, free puzzle game for all the family that's made up of 36
minigames designed to push your brain to its limits by testing memory, logic,
mathematics, reaction time and more!

%prep
%setup -q

%build
make

%install
%make_install

%files
%defattr(-,root,root,-)
%doc README CREDITS
/opt/brainparty/*
%{_datadir}/applications/*.desktop
