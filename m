From: joeyli <jlee@suse.com>
Subject: Re: [PATCH] backlight: add support for disabling backlights via
 sysfs
Date: Fri, 29 Jun 2012 10:43:59 +0800
Message-ID: <1340937839.6196.212.camel@linux-s257.site>
References: <1340910426-13269-1-git-send-email-seth.forshee@canonical.com>
	 <20120628191043.GA9777@srcf.ucam.org>
	 <20120628193017.GA29456@thinkpad-t410>
	 <20120628193652.GB10945@srcf.ucam.org>
	 <20120628211600.GB29456@thinkpad-t410>
	 <20120628211936.GA14286@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120628211936.GA14286@srcf.ucam.org>
Sender: linux-kernel-owner@vger.kernel.org
To: seth.forshee@canonical.com
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Corentin Chary <corentin.chary@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>
List-Id: platform-driver-x86.vger.kernel.org

=E6=96=BC =E5=9B=9B=EF=BC=8C2012-06-28 =E6=96=BC 22:19 +0100=EF=BC=8CMa=
tthew Garrett =E6=8F=90=E5=88=B0=EF=BC=9A
> On Thu, Jun 28, 2012 at 04:16:00PM -0500, Seth Forshee wrote:
>=20
> > What I still don't understand is your reason for preferring
> > driver-specific interfaces for disabling backlights to a single gen=
eric
> > interface. Are you afraid that allowing it to be done from userspac=
e
> > will make it too easy, and as a result quirks will be applied witho=
ut
> > attempting to fix the problem (i.e. the quriking should go through =
a
> > kernel dev to ensure someone tries to fix the problem is made befor=
e
> > applying a quirk)?
>=20
> Yup, that. We'll just end up with three billion forum posts telling=20
> people to add a line to a text file and nobody will ever fix the real=
=20
> problem.
>=20

Yes, we can not just hide this issue. It's entirely a manufacturers'
problem.

More and more machines have broken _BCM is because ODM didn't really
follow WDDM spec to maintain standard acpi interface for compatibility,
e.g. XP or Linux that don't support WDDM:
	http://msdn.microsoft.com/en-us/windows/hardware/gg487382.aspx

In WDDM architecture, in spec p.5, there have a "Monitor" driver to
check the WDDM driver support brightness DDI, if not, then it will use
standard acpi method to control brightness.

Unfortunately, no OEM preload Windows XP, now. So, more and more ODM
didn't test _BCM, actaully, they never test it, ODM QA just test the
brightness control UI available on newest Windows version (Windows 7).

We cann't just follow windows approach because it causes standard acpi
method neglected. If we also do that, then _BCM function will have no
chance to fix by any manufacturers because it's really nobody care.

Currently, on Linux we default use _BCM to control brightness, video
driver is a fallback. And we enable this fallback in platform driver.
It can keep still have people pay attention on standard acpi methods.


Thanks a lot!
Joey Lee
