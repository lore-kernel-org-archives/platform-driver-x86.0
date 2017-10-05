From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v4 12/14] platform/x86: wmi: create character devices when
 requested by drivers
Date: Thu, 5 Oct 2017 19:34:57 +0000
Message-ID: <2494c99c1b8a421bbe080dc8a174a80a@ausx13mpc120.AMER.DELL.COM>
References: <cover.1507156392.git.mario.limonciello@dell.com>
 <528c9a1ca4fa2f29aedbb37d3ed13c480ef093fc.1507156392.git.mario.limonciello@dell.com>
 <20171005071619.GA25960@kroah.com>
 <aa10ae6ab119499c8bbdf613392a9605@ausx13mpc120.AMER.DELL.COM>
 <20171005154214.GB29347@kroah.com> <20171005155156.GZ10938@pali>
 <20171005162628.GA4993@kroah.com> <20171005173925.GD31452@fury>
 <20171005184728.GB9713@kroah.com>
 <750018cd00674782a55f2b50e8aef689@ausx13mpc120.AMER.DELL.COM>
 <20171005190948.GA21238@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa4.dell-outbound.iphmx.com ([68.232.149.214]:30697 "EHLO
        esa4.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751408AbdJETfA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2017 15:35:00 -0400
In-Reply-To: <20171005190948.GA21238@kroah.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: greg@kroah.com
Cc: dvhart@infradead.org, pali.rohar@gmail.com, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de

> -----Original Message-----
> From: Greg KH [mailto:greg@kroah.com]
> Sent: Thursday, October 5, 2017 2:10 PM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: dvhart@infradead.org; pali.rohar@gmail.com; andy.shevchenko@gmail.com=
;
> linux-kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org;
> luto@kernel.org; quasisec@google.com; rjw@rjwysocki.net;
> mjg59@google.com; hch@lst.de
> Subject: Re: [PATCH v4 12/14] platform/x86: wmi: create character devices=
 when
> requested by drivers
>=20
> On Thu, Oct 05, 2017 at 07:03:24PM +0000, Mario.Limonciello@dell.com wrot=
e:
> > > -----Original Message-----
> > > From: Greg KH [mailto:greg@kroah.com]
> > > Sent: Thursday, October 5, 2017 1:47 PM
> > > To: Darren Hart <dvhart@infradead.org>
> > > Cc: Pali Roh=E1r <pali.rohar@gmail.com>; Limonciello, Mario
> > > <Mario_Limonciello@Dell.com>; andy.shevchenko@gmail.com; linux-
> > > kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org;
> luto@kernel.org;
> > > quasisec@google.com; rjw@rjwysocki.net; mjg59@google.com; hch@lst.de
> > > Subject: Re: [PATCH v4 12/14] platform/x86: wmi: create character dev=
ices
> when
> > > requested by drivers
> > >
> > > On Thu, Oct 05, 2017 at 10:39:25AM -0700, Darren Hart wrote:
> > > > > It does, thanks.  And as we now understand it (I'm guessing it ha=
d to be
> > > > > semi-understood in the older wmi drivers already), validating it
> > > > > properly seems to be the key for creating an interface that we "k=
now" to
> > > > > be safe.
> > > > >
> > > >
> > > > We don't use the MOF data in any of the existing wmi drivers, becau=
se
> > > > they are all oddities which map to kernel managed subsystems (hotke=
ys,
> > > > LED control, RF Kill switches) rather than what WMI (Windows
> > > > Manageability Interface) was designed for. The intent of these patc=
hes
> > > > to enable that management aspect of the platform.
> > > >
> > > > This is the biggest hurdle for WMI support.
> > > >
> > > > WMI was designed to bypass the OS, and is used in consumer devices
> > > > intended to run Windows. This leads to an interface that is very ve=
ndor
> > > > specific and not consistently broken up into nice functional blocks=
.
> > > >
> > > > Vendors would like to use this interface in Linux as it is being us=
ed in
> > > > Windows. Specifically, they want to be able to have a generic syste=
m in
> > > > the kernel which allows the WMI mechanism to be used by userspace,
> > > > without the need to patch the kernel for every platform.
> > >
> > > And how _exactly_ is this interface exposed in Windows?  Is it ad-hoc
> > > with custom kernel drivers written by each vendor?  Or does the OS
> > > provide a "sane" interface for it?
> >
> > On Windows it's a driver-less solution.  Vendors don't do anything othe=
r
> > than provide the MOF (which describes how the data passed to ASL looks)=
.
>=20
> How do they "provide it"?

In that link I shared you can see there is a GUID that maps to the one that
has the binary MOF.  The MOF is compiled when the BIOS is built using
mofcomp.exe on Windows into a binary format.

>=20
> > When Windows boots up, _WDG is parsed,
>=20
> Who parses it, the Windows kernel?
>=20
Presumably?  Wmiacpi.sys.  I believe it to be user side, but I don't know W=
indows
source code and where they draw the line.

> > the binary MOF is loaded into the WMI repository.
>=20
> Who does the loading?  Where does the "WMI repository" live?

Windows OS does this.  Same wmiacpi.sys I believe.  The WMI repository is a
database that's on disk.  It doesn't just do these things, it contains MOF =
(managed
object format) for a bunch of stuff.  You can tweak way too many knobs with=
 it.

It's store in "%windir%System32\Wbem\Repository"
There's more info about how it works here
https://technet.microsoft.com/en-us/library/cc753534.aspx

I do have a longer term vision for Linux that CIMOM tools will be able to p=
arse
what the kernel shares in sysfs from the WMI bus and know how to work with=
=20
these character devices.

My patch series is the first part of that, and there are still a lot of oth=
er steps.

>=20
> > The MOF describes how named objects map to GUIDs which map to ASL.
>=20
> So this all lives in kernelspace?
>=20
> > From Powershell or from any application that uses WMI as admin you can
> > look up the root namespace and see all objects.
>=20
> And what is the interface that powershell uses to get that information
> from the kerenel?

You query the WMI repository for available namespaces.  The stuff in the bi=
nary
MOF will have registered under a particular namespace.
When you look at that namespace, you can query classes within it.

Some of those classes will enumerate objects that you can read attributes.
If you're calling a method, you need to fill in the arguments as described =
in the
MOF.  You can query the namespace to tell what those arguments look like.

So going to my patch series, "dell-wmi-descriptor" would map out to a class
In the namespace.  You can query it to see what the size of the buffer look=
s
like and what the interface is.

The class that in Linux represents "dell-smbios-wmi" would map to another o=
ne. =20
You can't enumerate it since It's not a data type, but you can look at what=
 arguments
it takes and if you provide the arguments it expects you can call it and th=
e OS
will pass it to the ASL and return the result.

It's not very different than what I proposed in my patch series.

>=20
> > You can pass calls back
> > and forth.  There's all sorts of examples of it here:
> > https://msdn.microsoft.com/en-
> us/library/windows/hardware/dn614028(v=3Dvs.85).aspx
> >
> > Windows doesn't validate the data when it's passed to ASL and back.
>=20
> How do you know?  Who does the "passing"?  The Windows kernel is just a
> blind pipe?  If so, then what does the mappings?

The application or cmdlet calling the method passes the data as described
in the MOF which can be queried from the namespace.

Windows doesn't know anything about what that data is, it can't.  All it kn=
ows
is the format of the data as described in the MOF.  It knows which ASL meth=
od
to call by the GUID in the MOF which matches the GUID in _WDG which contain=
s
the ASL method.

I can't confidently know which parts of that are done by Windows kernel and
which are handled by Windows userspace.  All I know is that from a "consume=
r"
of this the application or cmdlet runs in userspace.=20

>=20
> > It just knows what it looks like, size of the buffer and relays the inf=
ormation.
>=20
> relays from/to what?

The ASL method.

Let me try to explain better.
_WDG contains a bunch of objects.
Each of those objects has a GUID, instance count, data type, and two letter=
s that
correspond to an ASL method.
One of those objects is binary MOF.

Binary MOF contains a description of namespaces, objects, their formats etc=
.
It also contains classes that map to GUIDs.

Windows boots up, some process parses _WDG.
It looks at binary MOF, decompiles/parses it.
It maps the classes to GUIDs, the GUIDs to ASL methods.

You call an object of a class, that will then call the ASL method.

Make more sense?
>=20
> > It's up to firmware to block the crazy stuff that you can put in a buff=
er.
>=20
> So userspace can pass any blob it wants to the firmware through this
> interface and the kernel does not parse anything?  How is that
> "protected"?
>=20
> > > Again, I like my TPM to work, and I don't want a random rootkit explo=
it
> > > to be able to destroy it :)
> >
> > I'd like to however point out you can't kill your TPM from this interfa=
ce.
>=20
> On _your_ platform, can you guarantee it on any other platform?  :)
>=20
> And I strongly doubt your BIOS would stand up to a good fuzzer, almost
> no firmware can.  Heck, the kernel even has issues, we've been fixing
> them for years...
>=20
Well that's software for you.  It will always have problems, but=20
