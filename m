From: joeyli <jlee@suse.com>
Subject: Re: [PATCH] backlight: add support for disabling backlights via
 sysfs
Date: Fri, 29 Jun 2012 15:18:49 +0800
Message-ID: <1340954329.6196.273.camel@linux-s257.site>
References: <1340910426-13269-1-git-send-email-seth.forshee@canonical.com>
	 <20120628191043.GA9777@srcf.ucam.org>
	 <20120628193017.GA29456@thinkpad-t410>
	 <20120628193652.GB10945@srcf.ucam.org>
	 <20120628211600.GB29456@thinkpad-t410>
	 <20120628211936.GA14286@srcf.ucam.org>
	 <1340937839.6196.212.camel@linux-s257.site>
	 <20120629025724.GB18605@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from nat.nue.novell.com ([195.135.221.2]:14910 "EHLO
	nat.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750806Ab2F2HT1 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 29 Jun 2012 03:19:27 -0400
In-Reply-To: <20120629025724.GB18605@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: seth.forshee@canonical.com, Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Corentin Chary <corentin.chary@gmail.com>

=E6=96=BC =E4=BA=94=EF=BC=8C2012-06-29 =E6=96=BC 03:57 +0100=EF=BC=8CMa=
tthew Garrett =E6=8F=90=E5=88=B0=EF=BC=9A
> On Fri, Jun 29, 2012 at 10:43:59AM +0800, joeyli wrote:
>=20
> > 	http://msdn.microsoft.com/en-us/windows/hardware/gg487382.aspx
> >
> > In WDDM architecture, in spec p.5, there have a "Monitor" driver to
> > check the WDDM driver support brightness DDI, if not, then it will =
use
> > standard acpi method to control brightness.
>=20
> What's the interaction between GPU drivers and platform drivers? For=20
> instance, on acer systems that have backlight control via WMI, does=20
> Windows use WMI, the GPU driver or ACPI?
> =20

I think GPU driver.

Because there have no wmi method support backlight control on modern
Acer machine and _BCM also broken on some machines.


On old machines that have 6AF4F258 wmi method, it supported to set
brightness level through wmi. But 6AF4F258 is really old now and almost
broken or not provide by new acer BIOS.

So, it is clear for modern Acer machines do NOT use wmi to control
backlight. It must control brightness through acpi or GPU driver.
(For very very new machine maybe changed again, need to check.)

Have a a period of time, acer BIOS provide healthful _BCM
implementation, in _BCM, they changed brightness through OPregion or
write EC register.

But now, some machines have broken _BCM and they are also not control
brightness through WMI, that means the brightness control is through GP=
U
driver.

Per WDDM spec, if WDDM driver support DDI, the NORMAL code path of
brightness control is:
	Mobility Center(userland) -> Monitor Driver -> WDDM Driver -> Graphics=
 Adapter


Reviewed DSDT from Acer machines, I believe Acer didn't force ODM fully=
 implement
Acer's WMI space. So, also need to check with Acer for how many ODM rea=
lly follow WDDM spec.






=20
