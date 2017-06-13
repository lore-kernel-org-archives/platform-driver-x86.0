From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: WMI and Kernel:User interface
Date: Tue, 13 Jun 2017 20:00:30 +0200
Message-ID: <201706132000.30449@pali>
References: <20170509231639.GB11404@fury> <201706131916.12144@pali> <20170613174027.GL27850@fury>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2290942.pCovsuuPNb";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170613174027.GL27850@fury>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Christoph Hellwig <hch@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Mario Limonciello <mario_limonciello@dell.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rafael Wysocki <rjw@rjwysocki.net>, Andy Lutomirski <luto@amacapital.net>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

--nextPart2290942.pCovsuuPNb
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday 13 June 2017 19:40:27 Darren Hart wrote:
> On Tue, Jun 13, 2017 at 07:16:11PM +0200, Pali Roh=C3=A1r wrote:
> > On Tuesday 13 June 2017 17:38:57 Darren Hart wrote:
> > > I'll mention this again I suspect in this thread, but rather than
> > > a "WMI filter" we can implement a "WMI proxy". If a kernel
> > > driver needs to own certain WMI calls for LED or Radio
> > > management, for example, all such calls can be proxied through
> > > that driver. It can do the necessary work to update its own
> > > state, and still perform the requested funtion, transparent to
> > > the userspace caller. This should accommodate the addition of
> > > new drivers and features to kernel drivers, without precluding
> > > the development of userspace management or platform daemons.
> >=20
> > Such WMI proxy implemented in every WMI driver has one design
> > problem:
> >=20
> > There would be two different kernel APIs to configure some firmware
> > settings. E.g. if particular WMI method implements turning on/off
> > radio devices, then functionality would be exported to userspace
> > via:
> >=20
> > 1) standard kernel rfkill interface which is device/driver/firmware
> > neutral (and any rfkill application can control it)
> >=20
> > 2) platform/firmware specific WMI method via newly standard
> > /dev/wmi* interface -- and only vendor specific application could
> > do that and it would work only for this one specific WMI GUID
> > device
>=20
> Yes, platform specific control is what WMI is for.
>=20
> > I do not like idea to have two kernel <--> userspace interfaces to
> > control one thing, plus one interface would be platform dependent.
> >=20
> > In my opinion any management application which want to control
> > radio switches should use option 1) rfkill interface.
>=20
> Agreed, they should.
>=20
> > And I do not see reason for exporting same duplicate, but platform
> > dependent interface from kernel to userspace.
>=20
> So this question boils down to: do we export WMI to userspace or not?
>=20
> The WMI GUIDs and methods will not be divided across convenient Linux
> subsystem boundaries allowing us to pick and choose what we export.
> If we export WMI to userspace, we will be providing another means of
> access. Sometimes, this may cause conflict, and the answer may just
> be "don't do that".
>=20
> There are plenty of other examples of things you can do to screw up
> the state of your system if you have the right permissions for which
> the answer is "don't do that". Consider MEM(4), SETPCI(8), ...
> /dev/sda ... for example.

I know. There is also iopl(3). But this nor above examples are not tools=20
for such activity. (Yes, there is e.g. lspci which can be switched to=20
use iopl(3), but also it is not for normal usage.)

But on the other hand proposed WMI API designed are for such usage and=20
developers are directly motivated to use it.

> So we can either export them and possibly offer some means of
> proxying where necessary, or we can not export them.

I just tried to show that proposed proxy has above problem and looks=20
like anti-pattern for linux kernel. As this should be evaluated when=20
going to accept or reject it.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart2290942.pCovsuuPNb
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAllAKD4ACgkQi/DJPQPkQ1IaCQCfTxBPsOaZl45UbwocRTHfCeg2
cmgAn3W1l18ljoQTd3WpZnJcRls52U4F
=ouLy
-----END PGP SIGNATURE-----

--nextPart2290942.pCovsuuPNb--
