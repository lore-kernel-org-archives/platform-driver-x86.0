From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v4 13/14] platform/x86: dell-smbios-wmi: introduce
 userspace interface
Date: Thu, 5 Oct 2017 16:28:40 +0000
Message-ID: <a62f7b6cc2fd4439af1cbea5ea73b380@ausx13mpc120.AMER.DELL.COM>
References: <cover.1507156392.git.mario.limonciello@dell.com>
 <ad918eaaa2c9cab878d92be4691cb67f44d13681.1507156392.git.mario.limonciello@dell.com>
 <20171005072321.GB25960@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa2.dell-outbound.iphmx.com ([68.232.149.220]:58292 "EHLO
        esa2.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751797AbdJEQ27 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2017 12:28:59 -0400
In-Reply-To: <20171005072321.GB25960@kroah.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: greg@kroah.com
Cc: dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de

> -----Original Message-----
> From: Greg KH [mailto:greg@kroah.com]
> Sent: Thursday, October 5, 2017 2:23 AM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: dvhart@infradead.org; Andy Shevchenko <andy.shevchenko@gmail.com>;
> LKML <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org;
> Andy Lutomirski <luto@kernel.org>; quasisec@google.com;
> pali.rohar@gmail.com; rjw@rjwysocki.net; mjg59@google.com; hch@lst.de
> Subject: Re: [PATCH v4 13/14] platform/x86: dell-smbios-wmi: introduce
> userspace interface
>=20
> On Wed, Oct 04, 2017 at 05:48:39PM -0500, Mario Limonciello wrote:
> > This userspace character device will be used to perform SMBIOS calls
> > from any applications.
> >
> > It provides an ioctl that will allow passing the 32k WMI calling
> > interface buffer between userspace and kernel space.
>=20
> {sigh}  Did you really test this?  It feels like it wasn't, due to the
> api you are using here.  Did you run it with a 32bit userspace and 64bit
> kernel?  32bit kernel/userspace?  How well did your userspace developer
> fall down crying when you tried that?  :)

I tested 64 bit kernel / 64 bit userspace.

>=20
> > This character device is intended to deprecate the dcdbas kernel module
> > and the interface that it provides to userspace.
>=20
> At least that driver has a well-documented api to userspace, you are
> throwing all of that away here, are you _sure_ you want to do that?
> Seems like you just made things much harder.

Being a well-documented API isn't the same as a "good" API.  Have you
seen how exactly that driver works to userspace?  It's not pretty.

That BIOS <-> OS interface that we use with it will stop working too on new
machines at some point soon too.  With no new interface available
this will just mean no way to get this data from userspace.

>=20
> > It's important for the driver to provide a R/W ioctl to ensure that
> > two competing userspace processes don't race to provide or read each
> > others data.
>=20
> The whole goal of this patch is to provide that ioctl, right?  So of
> course it is "important" :)
>=20
> > The API for interacting with this interface is defined in documentation
> > as well as a uapi header provides the format of the structures.
>=20
> Ok, let's _just_ review that api please:
>=20
> > diff --git a/include/uapi/linux/dell-smbios-wmi.h b/include/uapi/linux/=
dell-
> smbios-wmi.h
> > new file mode 100644
> > index 000000000000..0d0d09b04021
> > --- /dev/null
> > +++ b/include/uapi/linux/dell-smbios-wmi.h
> > @@ -0,0 +1,25 @@
> > +#ifndef _UAPI_DELL_SMBIOS_WMI_H_
> > +#define _UAPI_DELL_SMBIOS_WMI_H_
> > +
> > +#include <linux/ioctl.h>
> > +#include <linux/wmi.h>
> > +
> > +struct wmi_calling_interface_buffer {
> > +	u16 class;
> > +	u16 select;
> > +	u32 input[4];
> > +	u32 output[4];
> > +	u32 argattrib;
> > +	u32 blength;
> > +	u8 *data;
> > +} __packed;
>=20
> {sigh}
>=20
> For structures that cross the user/kernel boundry, you _HAVE_ to use the
> correct types.  For some things, that is easy, u16 needs to be __u16,
> u32 needs to be __u32, but u8*?  Hah, good luck!  Remember what I
> mentioned above about 32/64 bit issues?
>=20
> Why do you need a pointer here at all?  You are providing a huge chunk
> of memory to the ioctl, what's the use of a pointer?  How are you
> dereferenceing this pointer (remember, it's a userspace pointer, which
> you are not saying here, so odds are the kernel code is wrong...)

So the part that is probably not obvious here is that the size of this buff=
er
The BIOS will expect will vary from one machine to another.  The two sizes
that will be encountered are 4k and 32k.  The last 10 years it's been 4k,
we just jumped up to 32k.  Maybe some day it will be 64k, who knows.

This detail of the size is encoded in the MOF, and also available through
the dell-wmi-descriptor driver call I added to look up buffer size.
>=20
>=20
> > +struct wmi_smbios_ioctl {
> > +	u32 length;
>=20
> __u32.
>=20
> And why not __u64?  Is 32 bits always going to be ok?

If length stays around, I'll adjust this.

>=20
> > +	struct wmi_calling_interface_buffer *buf;
>=20
> Another pointer?  2 pointer dereferences in the same ioctl structure?
> Crazy, you are wanting to make your life harder than it has to be...
>=20
Well so the way I look at it, if you have to support 4k and 32k, you
want userspace to at least claim that it allocated the right size.

>=20
> > +};
> > +
> > +/* only offers on the single instance */
> > +#define DELL_WMI_SMBIOS_CMD		WMI_IOWR(0)
>=20
> I don't understand the comment, please explain it better.
>=20
> Please sit down and work out your api here, I don't think you have
> thought it through properly, given the number of pointers alone.
>=20
> thanks,
>=20
> greg k-h

So I did give this some thought, which is why I ended up with where=20
I am.

1) Userspace reads buffer size
2) Userspace allocates a structure to pass buffer size and a pointer
3) Userpsace allocates another structure of what buffer size should be and=
=20
fills in the first structure with the length of the pointer.
4) Kernel picks it up, and if it sees that userspace used the wrong length
complains.
5) If it's the right length, kernel unwinds and does stuff.


The other alternative is to just always do 32k to and from userspace
and internally in the kernel copy only the supported size.
the difference in output is just the size of the data section, which
above 4k isn't used by very many calls anyway.

That's obviously a much cleaner API, but what happens if one day this
does need to go to 64k?  I hope it doesn't, but I don't have a crystal ball=
.
