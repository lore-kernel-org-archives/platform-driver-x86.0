From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3 5/8] platform/x86: dell-wmi-smbios: introduce
 character device for userspace
Date: Wed, 4 Oct 2017 17:02:35 -0700
Message-ID: <20171005000235.GA25018@fury>
References: <cover.1506571187.git.mario.limonciello@dell.com>
 <4a91eb76afa9cce7060bc30f5313d64bd51b66ca.1506571188.git.mario.limonciello@dell.com>
 <20171003092611.GC13295@kroah.com>
 <20171003152010.GB14523@fury>
 <5cbdbc85d3e14880a187dfb8f76b1745@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:57182 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750951AbdJEACl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Oct 2017 20:02:41 -0400
Content-Disposition: inline
In-Reply-To: <5cbdbc85d3e14880a187dfb8f76b1745@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: greg@kroah.com, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com

On Tue, Oct 03, 2017 at 03:49:04PM +0000, Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Darren Hart [mailto:dvhart@infradead.org]
> > Sent: Tuesday, October 3, 2017 10:20 AM
> > To: Greg KH <greg@kroah.com>
> > Cc: Limonciello, Mario <Mario_Limonciello@Dell.com>; Andy Shevchenko
> > <andy.shevchenko@gmail.com>; LKML <linux-kernel@vger.kernel.org>;
> > platform-driver-x86@vger.kernel.org; Andy Lutomirski <luto@kernel.org>;
> > quasisec@google.com; pali.rohar@gmail.com
> > Subject: Re: [PATCH v3 5/8] platform/x86: dell-wmi-smbios: introduce character
> > device for userspace
> > 
> > On Tue, Oct 03, 2017 at 11:26:11AM +0200, Greg KH wrote:
> > > On Wed, Sep 27, 2017 at 11:02:17PM -0500, Mario Limonciello wrote:
> > > > +static int dell_wmi_smbios_open(struct inode *inode, struct file *file)
> > > > +{
> > > > +	return nonseekable_open(inode, file);
> > > > +}
> > > > +
> > > > +static int dell_wmi_smbios_release(struct inode *inode, struct file *file)
> > > > +{
> > > > +	return 0;
> > > > +}
> > >
> > > Why even declare an open/release if you don't do anything with them?
> > > Just leave them empty.
> > >
> > > > +static long dell_wmi_smbios_ioctl(struct file *filp, unsigned int cmd,
> > > > +	unsigned long arg)
> > > > +{
> > > > +	void __user *p = (void __user *) arg;
> > > > +	size_t size;
> > > > +	int ret = 0;
> > > > +
> > > > +	if (_IOC_TYPE(cmd) != DELL_WMI_SMBIOS_IOC)
> > > > +		return -ENOTTY;
> > > > +
> > > > +	switch (cmd) {
> > > > +	case DELL_WMI_SMBIOS_CALL_CMD:
> > > > +		size = sizeof(struct wmi_calling_interface_buffer);
> > > > +		mutex_lock(&buffer_mutex);
> > > > +		if (copy_from_user(devfs_buffer, p, size)) {
> > > > +			ret = -EFAULT;
> > > > +			goto fail_smbios_cmd;
> > > > +		}
> > > > +		ret = run_wmi_smbios_call(devfs_buffer);
> > >
> > > You _are_ checking that your structures are valid here, right?  I didn't
> > > see you really were, so I'll let you go audit your code paths for the
> > > next set of patches.
> > >
> > > But really, ugh, this seems horrible.  It's a huge vague data blob going
> > > both ways, this feels ripe for abuse and other bad things.  Do you have
> > > a working userspace implementation for all of this to publish at the
> > > same time?
> > >
> > 
> > This is the general challenge with WMI support, as it was designed to
> > provide userspace with a way to talk to the firmware.
> > 
> > For the more general case going forward the intent is to perform the MOF
> > parsing in the kernel, which will make it possible to do some automated
> > buffer validation.
> > 
> > This particular driver is an intermediate step improving on the
> > mechanism used for existing devices (libsmbios -> dcdbas -> SMM) to use
> > the safer WMI entry point (using an op region instead of passing a
> > physical memory pointer to SMM).
> > 
> > But, that said... Mario, in lieu of the MOF description of the buffer,
> > we should be able to do some driver specific validation of this buffer
> > here.
> > 
> 
> As the WMI interface exists today even the MOF doesn't describe the 
> Content of the buffer either.  It's a buffer passed from userspace to BIOS and
> back.  I described it as the struct, but I'm not really sure how that can
> be further validated by the Linux kernel without a checksum.
> This is no different than how dell-smbios and dcdbas operates.

The notation about equivalence with the dell-smbios and dcdbas
implementation is a valid one. If all we do is move this to a WMI
managed access to SMBIOS and move away from the SMI based one, this is
still an improvement for difference in how memory is passed around as
described above.

I don't think a checksum will help with the concerns Greg is raising. A
userspace generated checksum only tells the kernel that what is in the
buffer is what userpsace intended. Similarly for the buffer coming back
from SMM.

Generally speaking, the kernel would want to validate data passing to
and from userspace and firmware - which WMI was designed to circumvent.

Mario:
Are there no specific bits that can be sanity checked? No reserved bits
in the buffer format? No Command Codes with a known range of values?

> New interfaces will have description that is parsable by MOF.

And to elaborate here. The above is about an improvement to the
dell-smbios driver for existing platforms which do not have available
MOF data. For platforms that do provide MOF data, we're working toward
moving the MOF parser into the kernel (rather than leaving it in
userspace as it was designed to be) which will afford the kernel more
oversight of these messages.

This series is an incremental improvement until the above is ready - but
it does lay out some of the ground work which we want to get agreement
on, mostly from patch 4 of 8 in the series:

1) The char dev IOCTL model for calling WMI methods

2) The /dev/wmi/<driver> path for the char dev

3) The function ops approach for WMI drivers to request the char dev
   from the WMI bus

-- 
Darren Hart
VMware Open Source Technology Center
