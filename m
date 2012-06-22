From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 2/2] ACER: Add support for ambient light sensor
Date: Fri, 22 Jun 2012 22:20:15 +0200
Message-ID: <201206222220.15755.marex@denx.de>
References: <1338570683-16491-1-git-send-email-marex@denx.de> <201206060055.59421.marex@denx.de> <1338945755.1492.20.camel@rui.sh.intel.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:40363 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753804Ab2FVUUX convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 22 Jun 2012 16:20:23 -0400
In-Reply-To: <1338945755.1492.20.camel@rui.sh.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Zhang Rui <rui.zhang@intel.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, platform-driver-x86@vger.kernel.org, joeyli <jlee@suse.com>, Len Brown <len.brown@intel.com>, pavel@denx.de, Martin =?utf-8?q?Li=C5=A1ka?= <marxin.liska@gmail.com>

Dear Zhang Rui,

> On =E4=B8=89, 2012-06-06 at 00:55 +0200, Marek Vasut wrote:
> > Dear Corentin Chary,
> >=20
> > [...]
> >=20
> > > >> This is a generic device, and should be handled by ACPI core
> > > >> (Samsung laptop have this too). See "ACPI ALS" on linux-acpi.
> > > >=20
> > > > Saying this would be enough. Lee explained to me what this ACPI=
0008
> > > > means, I'm quite new to the ACPI land so pardon my ignorance he=
re.
> > > > But it then boils down to Lee's question, why wasn't the patch =
for
> > > > ACPI ALS that was already proposed accepted? And what can be do=
ne to
> > > > get it in?
> > >=20
> > > Yep, I've seen Lee's message latter. Regarding ACPI ALS status, i=
t was
> > > forgotten for a long time, and recently Zhang Rui told that he wi=
ll
> > > take another look at it, but nothing sure. If you want to know mo=
re
> > > about the status, you can do a quick search on gmane using "ACPI =
ALS"
> > > query on linux.acpi
> >=20
> > Actually, going through the ACPI0008 patch, I see it introduced new=
 sysfs
> > class. Maybe we should rather integrate it with Linux-IIO these day=
s?
>=20
> yes.
> please refer to this thread
> http://marc.info/?l=3Dlinux-acpi&m=3D132060809120911&w=3D2
>=20
> I do not have time to do this right now, and it will be great if you =
are
> interested in introducing the ACPI ALS driver.

So, I finally raised from dead again ... sorry I didn't reply earlier.=20
Apparently, one of my students is interested in fixing/writing such dri=
ver,=20
therefore I'll land him my hardware and let him do it.

I CCed him, please treat him well.

Best regards,
Marek Vasut
