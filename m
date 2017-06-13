From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: WMI and Kernel:User interface
Date: Tue, 13 Jun 2017 19:16:11 +0200
Message-ID: <201706131916.12144@pali>
References: <20170509231639.GB11404@fury> <20170613070535.GA13252@infradead.org> <20170613153857.GC27850@fury>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2822652.m9qIuZ5cZc";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170613153857.GC27850@fury>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Christoph Hellwig <hch@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Mario Limonciello <mario_limonciello@dell.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rafael Wysocki <rjw@rjwysocki.net>, Andy Lutomirski <luto@amacapital.net>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

--nextPart2822652.m9qIuZ5cZc
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday 13 June 2017 17:38:57 Darren Hart wrote:
> I'll mention this again I suspect in this thread, but rather than a
> "WMI filter" we can implement a "WMI proxy". If a kernel driver
> needs to own certain WMI calls for LED or Radio management, for
> example, all such calls can be proxied through that driver. It can
> do the necessary work to update its own state, and still perform the
> requested funtion, transparent to the userspace caller. This should
> accommodate the addition of new drivers and features to kernel
> drivers, without precluding the development of userspace management
> or platform daemons.

Such WMI proxy implemented in every WMI driver has one design problem:

There would be two different kernel APIs to configure some firmware=20
settings. E.g. if particular WMI method implements turning on/off radio=20
devices, then functionality would be exported to userspace via:

1) standard kernel rfkill interface which is device/driver/firmware=20
neutral (and any rfkill application can control it)

2) platform/firmware specific WMI method via newly standard /dev/wmi*=20
interface -- and only vendor specific application could do that and it=20
would work only for this one specific WMI GUID device

I do not like idea to have two kernel <--> userspace interfaces to=20
control one thing, plus one interface would be platform dependent.

In my opinion any management application which want to control radio=20
switches should use option 1) rfkill interface.

And I do not see reason for exporting same duplicate, but platform=20
dependent interface from kernel to userspace.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart2822652.m9qIuZ5cZc
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAllAHdwACgkQi/DJPQPkQ1JesACgkbBjCtkMJPw2b+/+vYTauRRp
R8EAn2H2qNlfANznBiiALJAtZqFlftaU
=q+5v
-----END PGP SIGNATURE-----

--nextPart2822652.m9qIuZ5cZc--
