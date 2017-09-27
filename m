From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH 11/12] platform/x86: dell-wmi-smbios: introduce character
 device for userspace
Date: Wed, 27 Sep 2017 18:10:55 +0000
Message-ID: <5a68f1bdb7484009be88a39660d478ae@ausx13mpc120.AMER.DELL.COM>
References: <cover.1505999739.git.mario.limonciello@dell.com>
 <a7829a31691da18e4d28e0760645ca2a3f302b66.1505999739.git.mario.limonciello@dell.com>
 <20170925163150.GM22190@pali>
 <CAHp75Vewet4v-kwiEGd82XicaLv_XbNt6o6q+CVqYCUFnUg+oQ@mail.gmail.com>
 <23b3029bac144f17bd3a68a13cfe9cf4@ausx13mpc120.AMER.DELL.COM>
 <20170927165936.GF23572@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa8.dell-outbound.iphmx.com ([68.232.149.218]:36118 "EHLO
        esa8.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751907AbdI0SK5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Sep 2017 14:10:57 -0400
In-Reply-To: <20170927165936.GF23572@fury>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: andy.shevchenko@gmail.com, pali.rohar@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, quasisec@google.com

> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Wednesday, September 27, 2017 1:00 PM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: andy.shevchenko@gmail.com; pali.rohar@gmail.com; linux-
> kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org;
> quasisec@google.com
> Subject: Re: [PATCH 11/12] platform/x86: dell-wmi-smbios: introduce chara=
cter
> device for userspace
>=20
> On Mon, Sep 25, 2017 at 05:46:54PM +0000, Mario.Limonciello@dell.com wrot=
e:
> > > -----Original Message-----
> > > From: Andy Shevchenko [mailto:andy.shevchenko@gmail.com]
> > > Sent: Monday, September 25, 2017 12:58 PM
> > > To: Pali Roh=E1r <pali.rohar@gmail.com>
> > > Cc: Limonciello, Mario <Mario_Limonciello@Dell.com>; dvhart@infradead=
.org;
> > > LKML <linux-kernel@vger.kernel.org>; Platform Driver <platform-driver=
-
> > > x86@vger.kernel.org>; quasisec@google.com
> > > Subject: Re: [PATCH 11/12] platform/x86: dell-wmi-smbios: introduce c=
haracter
> > > device for userspace
> > >
> > > On Mon, Sep 25, 2017 at 7:31 PM, Pali Roh=E1r <pali.rohar@gmail.com> =
wrote:
> > > > On Thursday 21 September 2017 08:57:16 Mario Limonciello wrote:
> > > >> This userspace character device will be used to perform SMBIOS cal=
ls
> > > >> from any applications sending a properly formatted 4k calling inte=
rface
> > > >> buffer.
> > > >>
> > > >> This character device is intended to deprecate the dcdbas kernel m=
odule
> > > >> and the interface that it provides to userspace.
> > > >>
> > > >> It's important for the driver to provide a R/W ioctl to ensure tha=
t
> > > >> two competing userspace processes don't race to provide or read ea=
ch
> > > >> others data.
> > >
> > > >> +What:                /dev/wmi-dell-wmi-smbios
> > > >
> > > > What about just /dev/dell-smbios? IOCTL provided here is just SMBIO=
S
> > > > related and I think userspace does not have to care if it is via WM=
I or
> > > > direct SMM mode... Important is that it provides character device f=
or
> > > > SMBIOS API and not how it is implemented.
>=20
> I agree with this point, the implementation (WMI under the covers) is
> not relevant. That said, this is an example of exposing WMI
> functionality to userspace, and I DO NOT want to have a naming
> discussion for every single WMI GUID that we choose to expose.

Yes, I agree let's make sure it's stable and automatic for all drivers that=
 will use it.

>=20
> > > >
> > > > Anyway, Darren, Andy, do we have some convention for naming platfor=
m
> > > > character devices?
> > >
> > > For me, looking to this case, seems better to expose a folder like
> > > /dev/smbios/
> > > with actual vendor device nodes inside like
> > > /dev/smbios/dell
> >
> > I disagree with this.  Dell exposes smbios calling in this kernel inter=
face but
> > other vendor drivers may also expose different methods for character de=
vices
> > that are not SMBIOS.
> >
> > I'm envisioning that this is just the first kernel module that will use=
 a WMI
> > character device to userspace.  That's why I wanted to use a generic na=
mespace.
> >
> > I would say it could be /dev/wmi-$GUID or /dev/wmi/$driver-$GUID if you=
 want
> > something more generic.
> > As long as it's discovereable from uevent that's fine to me.
> >
> > >
> > > Darren?
>=20
> I would like to see an automated and definiitive way to export WMI
> GUIDs. Something we can look at, compare to a set of rules, and say
> yay/nay. From that perspective, I like Mario's general proposal. It is
> not clear to me if the $driver- prefix adds any value though - would we
> ever have need of DRIVER_X-GUID_A and DRIVER_Y-GUID_A ??? I'm thinking
> not.
>=20
> /dev/wmi/$GUID
>=20

I don't think you should allow two drivers to use the same GUID, but what i=
f
a driver needs to use multiple GUIDs?

This obviously isn't a problem yet.
I envision that as we get MOF interpretation as part of the bus we "may" ge=
t into=20
that situation with more complicated MOF design.  The vendor driver could=20
register with the bus for each GUID and  request a character device for eac=
h but=20
that's meaning userspace has to worry about knowing which GUIDs do what. =20
I think it's potentially asking for a complicated interface to userspace fo=
r the future.

Here's a hypothetical scenario based on some more advanced MOF design I kno=
w of:

Separate GUID provided for each:
* All integer settings (data type)
* All string settings (data type)
* Notifications (event type)
* enumeration types (data type)
* Applying a Setting (method type)
* Managing users (method type)

How would a new driver for that look?  I would think you would want one dri=
ver to register
and encapsulate at least all of those GUIDs.

I would say all the data should be exported into sysfs, but that you really=
 only want
one character device that is used for both methods.

The interface to userspace would then have two IOCTL's that the driver woul=
d internally
apply to the correct GUID.  Example:=20
"/dev/wmi/$driver" supports 2 different IOCTL's.
Internally the driver would then ferry the request through the WMI bus to t=
he correct
GUID based on the ioctl call number.

If you went with the pass the GUID information up and create character devi=
ce for each
GUID, userspace will have to know:
"I use /dev/wmi/$GUID_X" for applying the setting IOCTL on Acme Inc machine=
.
And
"I use /dev/wmi/$GUID_Y" for managing users IOCTL on Acme Inc machine.

And what if the notifications are valuable to userspace?  Would you want to=
 create another
character device for those?  I think you would just want to keep them in th=
e same device
and add a poll/select file operation.
