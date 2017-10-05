From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v4 12/14] platform/x86: wmi: create character devices when
 requested by drivers
Date: Thu, 5 Oct 2017 19:03:24 +0000
Message-ID: <750018cd00674782a55f2b50e8aef689@ausx13mpc120.AMER.DELL.COM>
References: <cover.1507156392.git.mario.limonciello@dell.com>
 <528c9a1ca4fa2f29aedbb37d3ed13c480ef093fc.1507156392.git.mario.limonciello@dell.com>
 <20171005071619.GA25960@kroah.com>
 <aa10ae6ab119499c8bbdf613392a9605@ausx13mpc120.AMER.DELL.COM>
 <20171005154214.GB29347@kroah.com> <20171005155156.GZ10938@pali>
 <20171005162628.GA4993@kroah.com> <20171005173925.GD31452@fury>
 <20171005184728.GB9713@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171005184728.GB9713@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: greg@kroah.com, dvhart@infradead.org
Cc: pali.rohar@gmail.com, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: Greg KH [mailto:greg@kroah.com]
> Sent: Thursday, October 5, 2017 1:47 PM
> To: Darren Hart <dvhart@infradead.org>
> Cc: Pali Roh=E1r <pali.rohar@gmail.com>; Limonciello, Mario
> <Mario_Limonciello@Dell.com>; andy.shevchenko@gmail.com; linux-
> kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; luto@kernel.=
org;
> quasisec@google.com; rjw@rjwysocki.net; mjg59@google.com; hch@lst.de
> Subject: Re: [PATCH v4 12/14] platform/x86: wmi: create character devices=
 when
> requested by drivers
>=20
> On Thu, Oct 05, 2017 at 10:39:25AM -0700, Darren Hart wrote:
> > > It does, thanks.  And as we now understand it (I'm guessing it had to=
 be
> > > semi-understood in the older wmi drivers already), validating it
> > > properly seems to be the key for creating an interface that we "know"=
 to
> > > be safe.
> > >
> >
> > We don't use the MOF data in any of the existing wmi drivers, because
> > they are all oddities which map to kernel managed subsystems (hotkeys,
> > LED control, RF Kill switches) rather than what WMI (Windows
> > Manageability Interface) was designed for. The intent of these patches
> > to enable that management aspect of the platform.
> >
> > This is the biggest hurdle for WMI support.
> >
> > WMI was designed to bypass the OS, and is used in consumer devices
> > intended to run Windows. This leads to an interface that is very vendor
> > specific and not consistently broken up into nice functional blocks.
> >
> > Vendors would like to use this interface in Linux as it is being used i=
n
> > Windows. Specifically, they want to be able to have a generic system in
> > the kernel which allows the WMI mechanism to be used by userspace,
> > without the need to patch the kernel for every platform.
>=20
> And how _exactly_ is this interface exposed in Windows?  Is it ad-hoc
> with custom kernel drivers written by each vendor?  Or does the OS
> provide a "sane" interface for it?

On Windows it's a driver-less solution.  Vendors don't do anything other
than provide the MOF (which describes how the data passed to ASL looks).

When Windows boots up, _WDG is parsed, the binary MOF is loaded into
the WMI repository.  The MOF describes how named objects map to GUIDs
which map to ASL.

From Powershell or from any application that uses WMI as admin you can=20
look up the root namespace and see all objects.  You can pass calls back
and forth.  There's all sorts of examples of it here:
https://msdn.microsoft.com/en-us/library/windows/hardware/dn614028(v=3Dvs.8=
5).aspx

Windows doesn't validate the data when it's passed to ASL and back.
It just knows what it looks like, size of the buffer and relays the informa=
tion.

It's up to firmware to block the crazy stuff that you can put in a buffer.

>=20
> > This conflicts with the Linux approach, and I've worked with Mario,
> > Pali, and others to try to bridge this gap with something more
> > acceptable.
> >
> > MOF parsing is typically done in userspace, but by doing it in the
> > kernel, we can do at least some amount of message auditing within the
> > kernel in a generic way. So long as vendors continue using the same
> > GUIDs and provide proper MOF data, the kernel wouldn't need to be
> > changed. New GUIDs require new drivers, which must create the function
> > ops to get the char device created.
> >
> > I thought this served as a pragmatic bridge between the two approaches.
>=20
> The code as-is isn't a bridge at all, it's a pass-through tunnel with no
> tollbooth.  No parsing is being done that I can see here (if it is,
> where exactly was it done?)
>=20
> > This particular driver, doesn't have the benefit of the MOF data. It is
> > a halfway point intended to eliminate the SMI access to SMBIOS and
> > replace it with the WMI access, which uses an op region instead of
> > passing a physical memory pointer to SMM - but doesn't improve on the
> > message audit of the existing mechanism (but it shouldn't make it any
> > worse either).
>=20
> Again, it looks just to be a pass-through, no validation happening at
> all, with a random "blob" appended that userspace knows all about, and
> the BIOS knows about, but the kernel has no clue.  Given that the kernel
> is what is there to protect the BIOS from userspace, that feels really
> wrong.
>=20

It's entirely reasonable that Linux can filter more than Windows
can given there ARE vendor specific drivers in the Linux implementation
of WMI.

I'll add some verification of the supported calls on the system being run
on for v5.  Some of the write once only things can be filtered too here.

> Again, I like my TPM to work, and I don't want a random rootkit exploit
> to be able to destroy it :)

I'd like to however point out you can't kill your TPM from this interface.
