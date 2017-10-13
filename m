From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v7 10/15] platform/x86: dell-smbios: add filtering
 capability for requests
Date: Fri, 13 Oct 2017 15:03:10 +0000
Message-ID: <62ce0707d58b42618128e68f3bb9a45f@ausx13mpc124.AMER.DELL.COM>
References: <cover.1507733291.git.mario.limonciello@dell.com>
 <83dc225624f1cde5ee1797aebc945732444ded91.1507733291.git.mario.limonciello@dell.com>
 <20171012110903.3ab4ed5e@alans-desktop> <20171013004645.GB1470@fury>
 <20171013094314.GB29864@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa1.dell-outbound.iphmx.com ([68.232.153.90]:12649 "EHLO
        esa1.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753454AbdJMPDQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 13 Oct 2017 11:03:16 -0400
In-Reply-To: <20171013094314.GB29864@kroah.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: greg@kroah.com, dvhart@infradead.org
Cc: gnomes@lxorguk.ukuu.org.uk, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de

> -----Original Message-----
> From: Greg KH [mailto:greg@kroah.com]
> Sent: Friday, October 13, 2017 4:43 AM
> To: Darren Hart <dvhart@infradead.org>
> Cc: Alan Cox <gnomes@lxorguk.ukuu.org.uk>; Limonciello, Mario
> <Mario_Limonciello@Dell.com>; Andy Shevchenko
> <andy.shevchenko@gmail.com>; LKML <linux-kernel@vger.kernel.org>;
> platform-driver-x86@vger.kernel.org; Andy Lutomirski <luto@kernel.org>;
> quasisec@google.com; pali.rohar@gmail.com; rjw@rjwysocki.net;
> mjg59@google.com; hch@lst.de
> Subject: Re: [PATCH v7 10/15] platform/x86: dell-smbios: add filtering ca=
pability
> for requests
>=20
> On Thu, Oct 12, 2017 at 05:46:45PM -0700, Darren Hart wrote:
> > On Thu, Oct 12, 2017 at 11:09:03AM +0100, One Thousand Gnomes wrote:
> > > On Wed, 11 Oct 2017 11:27:36 -0500
> > > Mario Limonciello <mario.limonciello@dell.com> wrote:
> > >
> > > > There are some categories of tokens and SMBIOS calls that it makes
> > > > sense to protect userspace from accessing.  These are calls that
> > > > may write to one time use fields or activate hardware debugging
> > > > capabilities.  They are not intended for general purpose use.
> > > >
> > > > This same functionality may be be later extended to also intercept
> > > > calls that may cause kernel functionality to get out of sync if
> > > > the same functions are used by other drivers.
> > >
> > > This doesn't work. You are creating an API. If you then have to remov=
e
> > > parts of the API because it messes stuff up you break your API guaran=
tee.
> > >
> > > As I said before, this needs to be a whitelist of stuff that is safe,=
 and
> > > it needs to have a security model. When you make a feature available =
you
> > > can't nicely take it away again as you'll break people's user space.
> > >
> > > Start with a whitelist of the ones you know people want to use, or th=
at
> > > your existing tooling you want to enable uses. Add others as needed i=
n
> > > future releases of the kernel.
> >
> > Hi Alan,
> >
> > I've attempted to get a focused discussion on this topic a few times,
> > but have failed to get it the focus in really needs. Thanks for bringin=
g
> > it up. I look forward to your thoughts on the following:
> >
> > The core of the issue is we are trying to achieve feature parity with
> > Windows using the Windows Management Instrumentation (WMI) mechanism.
> > I'm trying to support vendors like Dell in their attempts to do so, and
> > acknowledging that this involves supporting a platform which was
> > designed according to the norms and standards of the windows ecosystem.
>=20
> Note, we really don't care what Windows does, as I really doubt they
> care what we do, so this isn't a valid decision.  Do we also care about
> OS-X and how it handles WMI?  :)

If you want to be able to offer tools that do the same thing on all OSes th=
at
hardware ships with it's a good idea to do it through the same interface in
both places and to use the same code base on both if possible.  Otherwise
that's just asking for bugs.

Maybe Dell is alone in this area in trying to improve this, I don't know.

>=20
> > This WMI mechanism was designed to enable vendors to create management
> > tools which could talk to interfaces their firmware exposed for this
> > purpose without any platform specific OS driver or vendor specific
> > knowledge on the part of the OS driver [1].
>=20
> That was how Microsoft designed it, due to totally different
> requirements of their ecosystem.  You really can't compare the two for
> obvious reasons, and I think that's the major disconnect here.
>=20
> > The result of this design decision is as you would expect: there is no
> > consistency in design, no guarantee of interfaces with functional
> > boundaries, across the various WMI interface implementations across
> > vendors (or even within the interface of a given vendor on a given
> > platform).
>=20
> See, different ecosystem, I like ours better :)
>=20
> > The result is a mechanism which is fundamentally incompatible with
> > standard Linux kernel approach to isolating userspace from the firmware=
.
> > WMI enumerates available data, methods, and events, and shepherds a
> > buffer of bits back and forth between firmware and userspace through
> > these methods.
> >
> > Over the last few months, I've worked with Mario, Pali, Andy L, and
> > others to try and find an acceptable way to support Dell in their
> > efforts, while respecting Linux's design principles.
> >
> > The first concession was to agree not to automatically publish a WMI
> > interface to userspace. This series includes the mechanism which
> > requires a GUID-specific driver to be written and to provide the file
> > ops structure, explicitly requesting the character device. This creates
> > a WMI GUID granular whitelist. I'm willing to deny any such driver whic=
h
> > is sent for review without the explicit collaboration of the vendor, to
> > ensure they are doing their due diligence with respect to their firmwar=
e
> > implementation. There has been some discussion in this thread regarding
> > Dell's firmware testing, and the access these interfaces have to
> > critical hardware resources.
>=20
> How are you going to prevent out-of-tree drivers from using this same
> api to directly get access to the WMI interface without using any type
> of whitelist or review?

Out of tree drivers is really a distraction in this context.  An out of tre=
e driver
could also just as easily create its own character device without using the
WMI bus.

>=20
> > The second concession was to acknowledge that some features implemented
> > in WMI are rightly the domain of the Linux kernel. LEDs, RFKill,
> > Backlight control, hotkey support, etc. When an exported GUID is used
> > for these purposes in addition to whatever purpose userspace requires
> > (see my comment above about a lack of functional boundaries in the
> > exported interfaces), we will provide a way to filter these usages. As
> > Mario said, we can either return an error, or we can attempt to handle
> > the request via the appropriate Linux kernel subsystem connections.
>=20
> That's great, but I don't see that in the patches posted, did I miss it?

You are correct, as of v7 this specific filtering of stuff already done in =
kernel=20
is not present.  Unless there is more opposition to this approach I'll modi=
fy=20
to return errors for those.

>=20
> > From the Linux kernel side, the ask is that we acknowledge that it is
> > not practical to audit every WMI interface to present a set of
> > functional knobs to userspace - because they were specifically designed
> > without that requirement.
>=20
> Not true, we can audit whatever we want.  whitelists are good for this
> very reason.  Just because a vendor is used to replacing any part of the
> OS with their own custom api direct to the hardware in other operating
> systems, doesn't mean that we have to also emulate that crazy api as
> well, especially given that it can be easily abused, as we discussed
> before.
>=20
> > The platform was designed in this way specifically to optimize the
> > software support effort on the part of the vendor. They don't write
> > Windows OS drivers for these mechanisms, it is unrealistic to expect
> > them to write them for Linux.
>=20
> Note, we write drivers for hardware for free if asked, so is it
> unrealistic to require a kernel driver if we offer to do it for them? :)
>=20
> > I believe we need to arrive at a compromise which allows a vendor to
> > work upstream like Mario is doing on behalf of Dell to fully enable
> > their platforms as they were designed on Linux, while ensuring we don't
> > adversely affect the functionality or security of other platforms. I
> > believe the whitelist and blacklist above provides for this compromise.
> >
> > Perhaps an additional concession we should consider is to make exportin=
g
> > WMI interfaces a configuration option. If not set, the drivers will
> > continue to work, but the WMI bus driver will not create the character
> > device, even if requested. This would allow vendors to create a fully
> > supported platform using upstream code, while allowing individuals the
> > control to disable WMI userspace functionality if they don't trust the
> > mechanism.
>=20
> config options do not work, distros have to turn them all on, you know
> that...
>=20
> > The alternative seems to be that we accept these features will not be
> > available on Linux for these platforms, or that vendors will develop a
> > single wmi mapping driver out of tree, likely without the noted
> > concessions.
>=20
> So you are saying they are blackmailing us that if we do not provide
> these wide-open api, then they just will take their toys and go home?
> In other words, back where we are today?  :)

I think within all of this discussion the spirit of intent is getting lost.

There is an interface that exists today in Windows as a dell signed kernel=
=20
driver and in Linux as dcdbas that lets various tools access interesting
pieces of data from the BIOS.

Dell is deprecating this interface and moving to a driverless model on=20
Windows and this patch series represents the parity of the "driverless"
solution for Linux.

Certainly I can advocate internally that all this effort is a waste of time
and something can be carried out of tree and shipped with tools, but
I don't want people using our tools to have to use tainted kernels.

>=20
> I understand the goal here of getting this to all work properly, but
> note that this is a different type of an operating system, and for some
> things, maybe we just do not allow direct userspace access for the
> obvious reasons (security, maintance, auditability, long-term-support,
> etc.)  A whitelist of known-good commands sounds like a good place to
> start, why not start with that and go from there?
>=20

Take off your "kernel" hat and put on a "customer" hat for a few moments
while I try to put this in practical terms why the whitelist approach doesn=
't
scale for what I'm trying to do.

Let's say hypothetically a future version of this series that has only whit=
elisted
commands and tokens lands in a kernel that's in the next Ubuntu LTS, RHEL
release etc.
Hardware coming out about that time works fine, you can control the various
knobs.  Then later that year some new headless hardware is released that ha=
s
zigbee controllers that work with inbox kernel drivers but you can't turn t=
hem=20
on and off any way BUT through the manageability interface (it's headless!)=
.
In the manageability interface we also offer a new class/select or token th=
at=20
can control the GPIO that turns on/off these radios.

A patch could be submitted upstream to whitelist that new class/select or t=
oken,=20
but then you run into the problem that anyone on these stable LTS type dist=
ros
won't pick it up.  You can submit it to linux-stable and that might help Ub=
untu,=20
but a distro like RHEL doesn't track linux-stable.  So that means now you'r=
e stuck=20
in a place that tools don't work with the interface solely because of a whi=
telist
that the kernel community hasn't yet blessed that it's ok to turn on/off zi=
gbee
controllers through the OEM's manageability interface.

You now have introduced a ton of red tape that will artificially slow down =
supporting
HW with Linux for something as simple as controlling a GPIO in a manageabil=
ity interface.

Tools that could otherwise work in many kernel versions will be gimped to o=
nly
offer full functionality in the latest kernel versions.

As a na=EFve customer why Does Dell's tool for managing my zigbee radios no=
t work
in RHEL 7.x but only in RHEL 7.x+1?  No one will understand that.

So considering the above isn't offering stuff like this a decision better m=
ade by the OEM?
If the OEM  doen't want customers to be able to modify something we don't o=
ffer it in the
manageability interface.  If the kernel community doesn't want people to be=
=20
modifying something the OEM does offer, it can just as well be blacklisted =
in the=20
kernel driver like the current filtering approach offers.
