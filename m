From: <Mario.Limonciello@dell.com>
Subject: RE: WMI and Kernel:User interface
Date: Wed, 10 May 2017 22:02:46 +0000
Message-ID: <e346b0f0c5684102aa571b166e21a47e@ausx13mpc120.AMER.DELL.COM>
References: <20170509231639.GB11404@fury> <20170510051341.GA17835@kroah.com>
 <20170510061026.GA6232@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa1.dell-outbound.iphmx.com ([68.232.153.90]:21291 "EHLO
        esa1.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751096AbdEJWCs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 10 May 2017 18:02:48 -0400
In-Reply-To: <20170510061026.GA6232@fury>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org, pali.rohar@gmail.com, andriy.shevchenko@linux.intel.com, rjw@rjwysocki.net, luto@amacapital.net, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Wednesday, May 10, 2017 1:12 AM
> To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>; Limonciello, Mario
> <Mario_Limonciello@Dell.com>; Pali Roh=E1r <pali.rohar@gmail.com>; Andy
> Shevchenko <andriy.shevchenko@linux.intel.com>; Rafael Wysocki
> <rjw@rjwysocki.net>; Andy Lutomirski <luto@amacapital.net>; LKML <linux-
> kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org
> Subject: Re: WMI and Kernel:User interface
>=20
> On Wed, May 10, 2017 at 07:13:41AM +0200, Greg Kroah-Hartman wrote:
> > On Tue, May 09, 2017 at 04:16:39PM -0700, Darren Hart wrote:
> > > Linus and Greg,
> > >
> > > We are in the process of redesigning the Windows Management
> Instrumentation
> > > (WMI) [1] system in the kernel. WMI is the Microsoft implementation o=
f Web-
> Based
> > > Enterprise Management (WBEM). We are looking to provide WMI access to
> userspace,
> > > while allowing the kernel to filter requests that conflict with its o=
wn usage.
> > > We'd like your take on how this approach relates to our commitment to=
 not
> break
> > > userspace.
> > >
> > > For this discussion, we are specifically referring to ACPI PNP0C14 WM=
I
> > > devices, consisting of a GUID and a set of methods and events, as wel=
l as a
> > > precompiled intermediate description of the methods and arguments (MO=
F).
> Exposed
> > > to userspace, these methods provide for BIOS interaction and are used=
 for
> system
> > > management as well as LEDs, hot keys, radio switches, etc. There is v=
endor
> > > interest in achieving feature parity with Windows by exposing WMI met=
hods to
> > > userspace for system management.
> > >
> > > While it appears WMI intended to be accessed from userspace, we have
> > > made use of it in the kernel to support various laptop features by co=
nnecting
> > > the WMI methods to other subsystems, notably input, leds, and rfkill =
[2]. The
> > > challenge is continuing to use WMI for these platform features, while=
 allowing
> > > userspace to use it for system management tasks. Unfortunately, the W=
MI
> methods
> > > are not guaranteed to be split up along granular functional lines, an=
d we will
> > > certainly face situations where the same GUID::METHOD_ID will be need=
ed for
> a
> > > kernel feature (say LED support) as well as a system management task.
> > >
> > > To address this, I have proposed [3] that exporting WMI be opt-in, on=
ly done at
> > > the request of and in collaboration with a vendor, with the kernel pl=
atform
> > > driver given the opportunity to filter requests. This filtering would=
 need to be
> > > at the method and argument inspection level, such as checking for spe=
cific bits
> > > in the input buffer, and rejecting the request if they conflict with =
an in
> > > kernel usage (that's worst case, in some cases just GUID or method ID=
 could be
> > > sufficient).
> > >
> > > Because the kernel and the platform drivers are under continual devel=
opment,
> and
> > > new systems appear regularly, we will encounter necessary changes to =
the
> > > platform driver WMI request filters. These changes could be considere=
d a
> change
> > > to the kernel provided WMI interface to userspace. For example, we co=
uld
> > > regularly accept a call to $GUID::$METHOD_ID with bit 4 of the buffer=
 set, and
> > > later deny the call when we determine it interferes with kernel usage=
.
> > >
> > > In your view, is it acceptable to provide a chardev interface, for ex=
ample,
> > > exposing WMI methods to userspace, with the understanding that the ke=
rnel
> may
> > > choose to filter certain requests which conflict with its own use? An=
d that this
> > > filtering may change as new features are added to the platform driver=
s?
> >
> > So, for example, if a new driver for a "brightness key" were added to
> > the kernel, all of a sudden the "raw" access to the wmi data through th=
e
> > chardev would filtered away by the kernel and not seen by userspace?
> >
>=20
> Pali provided some detail in the rather lengthy thread I linked to [3], b=
ut the
> summary is that there is nothing to encourage vendors to separate out
> functionality into separate method ids. Some do, the asus-wmi driver seem=
s to
> have a reasonable separation, others do a lot with a single method id.
>=20
> In the scenario you mention, it could be that the brightness key shows up=
 in a
> new laptop. Because we've never seen it before, the kernel driver doesn't=
 detect
> it and send the input event. The clever user realizes they can write a us=
erspace
> program to deal with this [a] by writing a my-laptop-brightness-key-daemo=
n which
> also makes a WMI method call to affect the change in brightness in respon=
se to
> the keypress.
>=20
> Another user notices the dmesg is reporting "Unknown WMI Event" when they
> press
> that key and send a patch to make the corresponding wmi call to affect th=
e
> brightness change (which depends on driver data to track the brightness v=
alue).
> To avoid conflicting with userspace, they also blacklist the WMI_BRIGHTNE=
SS_CMD
> from being called by userspace.
>=20
> Now the first user makes a call to set the brightness, and receives an er=
ror
> code instead of a successful response. Their program no longer works - al=
though
> with a current kernel, their brightness key would.
>=20
> I glossed over a few things there, but the description isn't too far off =
from a
> plausible scenario.
>=20
> > Why would you want to do that?  What's wrong with providing "raw" acces=
s
> > through a chardev, and the current in-kernel access as well at the same
> > time?
> >
> > I don't really understand what would "break" over time here.
>=20
> Like the scenario above, if the behavior has state, if userspace and the =
kernel
> attempt to control it, neither will have an accurate state representation=
.
>=20
> We could allow both and if things start not working, the user would have =
to
> choose between the kernel driver and the userspace management application=
. This
> was the scenario Pali was particularly keen to avoid.
>=20
> That said, to date I haven't come across anything that states there can o=
nly be
> one userspace application accessing WMI at any given time. It should be
> straightforward to serialize WMI calls such that they cannot "cross the
> streams".
>=20
> >
> > thanks,
> >
> > greg k-h
> >
>=20
> a. This is perhaps a contrived scenario since hotkeys generate events, an=
d as
> far as I understand it, there is no interest in exporting events to users=
pace,
> just the methods.
>=20
> --
> Darren Hart
> VMware Open Source Technology Center

This above discussion is confusing because it's referring specifically to "=
WMI events".
related to brightness keypresses that don't make sense to go to userspace.

The more interesting (and potentially problematic) area is things that read=
 and write
data using ASL methods.

So here's a "more" realistic scenario:

OEM has support through a WMI function to control keyboard backlight timeou=
ts
and intensity.  That same WMI function also can support turning on/off an i=
ndividual
USB port.  Backlight timeouts are done by setting the first argument to "1"=
 and USB
port control is done by setting first argument to "2".

Some userspace app is developed that can control both of these functions th=
rough
the chardev.  Later an enterprising young kernel developer realizes that ba=
cklight=20
control should be done through a platform driver instead.

They write a platform driver to do it, and add a filter to block "1" argume=
nts from
userspace.  Now if the userspace app tries to call the chardev with the "1"=
 argument
some error code is returned indicating this request is not supported.

The result is the userspace app broke, but it broke because the kernel is s=
upporting
the method in a much smarter and more scalable way.
