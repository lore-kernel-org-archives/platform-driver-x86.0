From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH v4 13/14] platform/x86: dell-smbios-wmi: introduce
 userspace interface
Date: Thu, 5 Oct 2017 18:40:55 +0200
Message-ID: <20171005164055.GB7036@kroah.com>
References: <cover.1507156392.git.mario.limonciello@dell.com>
 <ad918eaaa2c9cab878d92be4691cb67f44d13681.1507156392.git.mario.limonciello@dell.com>
 <20171005072321.GB25960@kroah.com>
 <a62f7b6cc2fd4439af1cbea5ea73b380@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:43023 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751144AbdJEQku (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2017 12:40:50 -0400
Content-Disposition: inline
In-Reply-To: <a62f7b6cc2fd4439af1cbea5ea73b380@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de

On Thu, Oct 05, 2017 at 04:28:40PM +0000, Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Greg KH [mailto:greg@kroah.com]
> > Sent: Thursday, October 5, 2017 2:23 AM
> > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > Cc: dvhart@infradead.org; Andy Shevchenko <andy.shevchenko@gmail.com>;
> > LKML <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org;
> > Andy Lutomirski <luto@kernel.org>; quasisec@google.com;
> > pali.rohar@gmail.com; rjw@rjwysocki.net; mjg59@google.com; hch@lst.de
> > Subject: Re: [PATCH v4 13/14] platform/x86: dell-smbios-wmi: introduce
> > userspace interface
> > 
> > On Wed, Oct 04, 2017 at 05:48:39PM -0500, Mario Limonciello wrote:
> > > This userspace character device will be used to perform SMBIOS calls
> > > from any applications.
> > >
> > > It provides an ioctl that will allow passing the 32k WMI calling
> > > interface buffer between userspace and kernel space.
> > 
> > {sigh}  Did you really test this?  It feels like it wasn't, due to the
> > api you are using here.  Did you run it with a 32bit userspace and 64bit
> > kernel?  32bit kernel/userspace?  How well did your userspace developer
> > fall down crying when you tried that?  :)
> 
> I tested 64 bit kernel / 64 bit userspace.

It showed :(

> > > This character device is intended to deprecate the dcdbas kernel module
> > > and the interface that it provides to userspace.
> > 
> > At least that driver has a well-documented api to userspace, you are
> > throwing all of that away here, are you _sure_ you want to do that?
> > Seems like you just made things much harder.
> 
> Being a well-documented API isn't the same as a "good" API.  Have you
> seen how exactly that driver works to userspace?  It's not pretty.
> 
> That BIOS <-> OS interface that we use with it will stop working too on new
> machines at some point soon too.  With no new interface available
> this will just mean no way to get this data from userspace.

Sure it will stop, if you change the BIOS to use a different interface.
I don't understand the comparison here, you will have to do _something_,
right?  Giving a "raw pipe" to userspace doesn't feel like a good
solution given the issues involved (see the other emails in this
thread...)

> > > It's important for the driver to provide a R/W ioctl to ensure that
> > > two competing userspace processes don't race to provide or read each
> > > others data.
> > 
> > The whole goal of this patch is to provide that ioctl, right?  So of
> > course it is "important" :)
> > 
> > > The API for interacting with this interface is defined in documentation
> > > as well as a uapi header provides the format of the structures.
> > 
> > Ok, let's _just_ review that api please:
> > 
> > > diff --git a/include/uapi/linux/dell-smbios-wmi.h b/include/uapi/linux/dell-
> > smbios-wmi.h
> > > new file mode 100644
> > > index 000000000000..0d0d09b04021
> > > --- /dev/null
> > > +++ b/include/uapi/linux/dell-smbios-wmi.h
> > > @@ -0,0 +1,25 @@
> > > +#ifndef _UAPI_DELL_SMBIOS_WMI_H_
> > > +#define _UAPI_DELL_SMBIOS_WMI_H_
> > > +
> > > +#include <linux/ioctl.h>
> > > +#include <linux/wmi.h>
> > > +
> > > +struct wmi_calling_interface_buffer {
> > > +	u16 class;
> > > +	u16 select;
> > > +	u32 input[4];
> > > +	u32 output[4];
> > > +	u32 argattrib;
> > > +	u32 blength;
> > > +	u8 *data;
> > > +} __packed;
> > 
> > {sigh}
> > 
> > For structures that cross the user/kernel boundry, you _HAVE_ to use the
> > correct types.  For some things, that is easy, u16 needs to be __u16,
> > u32 needs to be __u32, but u8*?  Hah, good luck!  Remember what I
> > mentioned above about 32/64 bit issues?
> > 
> > Why do you need a pointer here at all?  You are providing a huge chunk
> > of memory to the ioctl, what's the use of a pointer?  How are you
> > dereferenceing this pointer (remember, it's a userspace pointer, which
> > you are not saying here, so odds are the kernel code is wrong...)
> 
> So the part that is probably not obvious here is that the size of this buffer
> The BIOS will expect will vary from one machine to another.  The two sizes
> that will be encountered are 4k and 32k.  The last 10 years it's been 4k,
> we just jumped up to 32k.  Maybe some day it will be 64k, who knows.
> 
> This detail of the size is encoded in the MOF, and also available through
> the dell-wmi-descriptor driver call I added to look up buffer size.

Fine, then make it a variable structure size.  Using a pointer is not
how to do it in a portable way (if you tried a 32bit userspace, boom...)

> > > +	struct wmi_calling_interface_buffer *buf;
> > 
> > Another pointer?  2 pointer dereferences in the same ioctl structure?
> > Crazy, you are wanting to make your life harder than it has to be...
> > 
> Well so the way I look at it, if you have to support 4k and 32k, you
> want userspace to at least claim that it allocated the right size.

Again, variable length structures are your friend.

> So I did give this some thought, which is why I ended up with where 
> I am.
> 
> 1) Userspace reads buffer size

From where?  That's a crazy thing in the first place you know, how does
the kernel "know" this in a way that userspace doesn't ahead of time?

> 2) Userspace allocates a structure to pass buffer size and a pointer

No pointers!

> 3) Userpsace allocates another structure of what buffer size should be and 
> fills in the first structure with the length of the pointer.

Ick ick ick.

> 4) Kernel picks it up, and if it sees that userspace used the wrong length
> complains.

length checking is good, no objection there.

> 5) If it's the right length, kernel unwinds and does stuff.

"unwinding" is hard to do right, on all of the needed combinations, try
it.  I'll be waiting :)

variable length structures are your friend, you can still put the length
it in, no objection there (you need it.)

hope this helps,

greg k-h
