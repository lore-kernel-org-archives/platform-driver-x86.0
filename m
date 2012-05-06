From: joeyli <jlee@suse.com>
Subject: Re: [PATCH] acer-wmi: add 3 laptops to video backlight vendor mode
 quirk table
Date: Sun, 06 May 2012 17:45:04 +0800
Message-ID: <1336297504.5272.4450.camel@linux-s257.site>
References: <1336220335-7004-1-git-send-email-jlee@suse.com>
	 <1419557.QLNuvvmj4y@valkyrie>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from nat.nue.novell.com ([195.135.221.2]:35208 "EHLO
	nat.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752053Ab2EFJsP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 6 May 2012 05:48:15 -0400
In-Reply-To: <1419557.QLNuvvmj4y@valkyrie>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Carlos Corbacho <carlos@strangeworlds.co.uk>
Cc: mjg@redhat.com, platform-driver-x86@vger.kernel.org, stable@kernel.org, "Christopher M. Penalver" <christopher.penalver@gmx.com>, Bence Lukacs <lukacs.bence1@gmail.com>, Joern Heissler <kernelbugs2012@joern.heissler.de>, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

=E6=96=BC =E6=97=A5=EF=BC=8C2012-05-06 =E6=96=BC 00:09 +0100=EF=BC=8CCa=
rlos Corbacho =E6=8F=90=E5=88=B0=EF=BC=9A
> On Saturday 05 May 2012 20:18:55 Lee, Chun-Yi wrote:
> > Acer Extensa 5235, TravelMate 5760 and Aspire 5750 laptop have brok=
en _BCM
> > implemenation, the AML code wrote value to EC register but firmware=
 didn't
> > change brighenss.
> >=20
> > Fortunately, the brightness control works on those machines with ve=
ndor
> > mode. So, add this machine to video backlight vendor mode quirk tab=
le.
>=20
> Is there no way we can auto-detect this somehow? Is there something p=
eculiar=20
> about the broken implementation that we can use to do this detection =
instead?
>=20
> -Carlos
>=20

Unfortunately, I didn't see anyway can auto-detect the broken _BCM
implementation.
On those machines, the _BCM method write the brightness value to a EC
register, and, we make sure the value write success but EC didn't chang=
e
the brightness level.

_BCM like this:
        Method (_BCM, 1, NotSerialized)
        { =20
            Divide (Arg0, 0x0A, Local0, Local1)
            Decrement (Local1)
            Store (Local1, ^^^LPCB.EC0.BRTS)     <=3D=3D=3D write to BR=
TS register


Currently, didn't find good way to know EC doesn't really change the
brightness level.

I think Acer's ODM don't know this issue because on Vista and Windows 7
platform, they changed brightness through WDDM video driver but not
standard acpi method like _BCM. Some ODM only test brightness by human
eyes and they didn't check acpi method should also works.

Microsoft WDDM spec:
 http://msdn.microsoft.com/en-us/windows/hardware/gg487382.aspx

Actually, per WDDM spec, they should keep the standard acpi method work=
s
for backward compatibility to XP or any OS doesn't support WDDM.=20

I face to face told to Acer's PM at last year for this issue, and also
told them should keep the standard acpi methods works fine, he said wil=
l
check with ODM. But, finally, I didn't get further response from Acer.


Use a quirk table to set those machines to 'acpi_backlight=3Dvendor' mo=
de
is better then use 'acpi_osi=3DLinux', so, I hope experts can kindly
accept this patch to acer-wmi driver for those _BCM broken machines.


Thanks a lot!
Joey Lee
