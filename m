From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH v4 12/14] platform/x86: wmi: create character devices
 when requested by drivers
Date: Thu, 5 Oct 2017 17:42:14 +0200
Message-ID: <20171005154214.GB29347@kroah.com>
References: <cover.1507156392.git.mario.limonciello@dell.com>
 <528c9a1ca4fa2f29aedbb37d3ed13c480ef093fc.1507156392.git.mario.limonciello@dell.com>
 <20171005071619.GA25960@kroah.com>
 <aa10ae6ab119499c8bbdf613392a9605@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:49445 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751094AbdJEPmU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2017 11:42:20 -0400
Content-Disposition: inline
In-Reply-To: <aa10ae6ab119499c8bbdf613392a9605@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de

On Thu, Oct 05, 2017 at 02:35:43PM +0000, Mario.Limonciello@dell.com wrote:
> > 
> > > +		strcpy(buf, "wmi/");
> > > +		strcpy(buf + 4, wdriver->driver.name);
> > > +		wblock->misc_dev.minor = MISC_DYNAMIC_MINOR;
> > > +		wblock->misc_dev.name = buf;
> > > +		wblock->misc_dev.fops = &wmi_fops;
> > > +		ret = misc_register(&wblock->misc_dev);
> > > +		if (ret) {
> > > +			dev_warn(dev, "failed to register char dev: %d", ret);
> > > +			kfree(buf);
> > 
> > Again, no unwinding needed?  Error message value returned?
> 
> It comes down to if the character device should be considered optional.  I'll
> make it fail if it can't create it.

Given that you are relying on it in this patch, it would be good to fail
if something is going wrong.

> > > +	if (wdriver->file_operations) {
> > > +		kfree(wblock->misc_dev.name);
> > > +		misc_deregister(&wblock->misc_dev);
> > 
> > Unregister before freeing the device name, right?
> 
> Well if you unregister and then free the name you'll have lost the pointer.
> So isn't that the right order?

Yes, but save the pointer to the name and then free it after the larger
structure is gone.  misc_deregister() does not free anything, so you
still have the memory around here, no need to even use a temp variable.

> > > --- /dev/null
> > > +++ b/include/uapi/linux/wmi.h
> > > @@ -0,0 +1,10 @@
> > > +#ifndef _UAPI_LINUX_WMI_H
> > > +#define _UAPI_LINUX_WMI_H
> > > +
> > > +#define WMI_IOC 'W'
> > > +#define WMI_IO(instance)	_IO(WMI_IOC, instance)
> > > +#define WMI_IOR(instance)	_IOR(WMI_IOC, instance, void*)
> > > +#define WMI_IOW(instance)	_IOW(WMI_IOC, instance, void*)
> > > +#define WMI_IOWR(instance)	_IOWR(WMI_IOC, instance, void*)
> > 
> > Ugh, void *, this is going to be "fun"...
> > 
> > My comments on just how fun is left for the actual driver that attempted
> > to implement these...
> > 
> 
> So until in kernel MOF parsing is available you can't predict the format of
> what an individual ACPI method will expect for its input.  Even when the in
> kernel MOF parsing is made available the data types may be complex structures.


I have no idea what MOF is, what "parsing" is involved, or how in the
world ACPI got involved here...

good luck!

greg k-h
