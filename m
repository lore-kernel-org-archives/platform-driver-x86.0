From: Peter =?utf-8?q?H=C3=BCwe?= <PeterHuewe@gmx.de>
Subject: Re: [PATCH] platform/x86: Fix recursive Kconfig dependency
Date: Sun, 19 Dec 2010 20:00:14 +0100
Message-ID: <201012192000.14969.PeterHuewe@gmx.de>
References: <1291850970-7190-1-git-send-email-peterhuewe@gmx.de> <201012152214.29452.PeterHuewe@gmx.de> <AANLkTikPVqaZE8KBOCKWuwkqRpn3mHKQn+V3bUU5cW7=@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout-de.gmx.net ([213.165.64.22]:37660 "HELO mail.gmx.net"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with SMTP
	id S932375Ab0LSTAW convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 19 Dec 2010 14:00:22 -0500
In-Reply-To: <AANLkTikPVqaZE8KBOCKWuwkqRpn3mHKQn+V3bUU5cW7=@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: sedat.dilek@gmail.com, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Corentin Chary <corentin.chary@gmail.com>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, John Linville <linville@tuxdriver.com>

Am Freitag 17 Dezember 2010, 12:30:15 schrieb Sedat Dilek:
> On Wed, Dec 15, 2010 at 10:14 PM, Peter H=C3=BCwe <PeterHuewe@gmx.de>=
 wrote:
> > Am Mittwoch 15 Dezember 2010, 21:51:04 schrieb Randy Dunlap:
> >> > Hi, another patch was posted before:
> >> >=20
> >> > http://article.gmane.org/gmane.linux.drivers.platform.x86.devel/=
970/ma
> >> > tch =3Dacpi_wmi
> >> >Acked-by: Randy Dunlap <randy.dunlap@oracle.com>
> >=20
> > Yeah, you're right - but as Sedat's patch is perfect (and fixes bot=
h) -
> > so for Sedats's patch:
> > Acked-by: Peter Huewe <peterhuewe@gmx.de>
> >=20
> > Thanks,
> > Peter
>=20
> [ CC John Linville ]
>=20
> It's a bit disappointing to see my fix is still not in
> platform-drivers-x86/linux-next [1] (even it's only fixing "warnings"=
,
> 9 days past).
> linux-next tree is for me a very high dynamic SCM tree, I am doing
> mostly daily builds, at weekend I am testing/pulling other trees
> before they go into Monday's linux-next.
> As far as I have fun with "my process"... I will continue.



Added Stephen Rothwell on CC, maybe he can apply it directly to linux-n=
ext ;)

Peter
