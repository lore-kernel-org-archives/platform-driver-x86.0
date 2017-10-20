From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v10 13/15] platform/x86: wmi: create userspace
        interface for drivers
Date: Fri, 20 Oct 2017 16:48:39 +0200
Message-ID: <20171020144839.GA4550@lst.de>
References: <cover.1508434513.git.mario.limonciello@dell.com> <175838453318108ae69be344c4d3a2b75c2edc69.1508434514.git.mario.limonciello@dell.com> <20171020132138.GA23973@kroah.com> <19e30ca305e449de86b702ae8900d306@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from verein.lst.de ([213.95.11.211]:49280 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752102AbdJTOsl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 20 Oct 2017 10:48:41 -0400
Content-Disposition: inline
In-Reply-To: <19e30ca305e449de86b702ae8900d306@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: greg@kroah.com, dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, gnomes@lxorguk.ukuu.org.uk

On Fri, Oct 20, 2017 at 01:54:36PM +0000, Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Greg KH [mailto:greg@kroah.com]
> > Sent: Friday, October 20, 2017 8:22 AM
> > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > Cc: dvhart@infradead.org; Andy Shevchenko <andy.shevchenko@gmail.com>;
> > LKML <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org; Andy
> > Lutomirski <luto@kernel.org>; quasisec@google.com; pali.rohar@gmail.com;
> > rjw@rjwysocki.net; mjg59@google.com; hch@lst.de; Alan Cox
> > <gnomes@lxorguk.ukuu.org.uk>
> > Subject: Re: [PATCH v10 13/15] platform/x86: wmi: create userspace interface for
> > drivers
> > 
> > On Thu, Oct 19, 2017 at 12:50:16PM -0500, Mario Limonciello wrote:
> > > +	wblock = container_of(wdev, struct wmi_block, dev);
> > > +	if (!wblock)
> > > +		return -ENODEV;
> > 
> > How can container_of() ever return NULL?  If so, you have a very odd
> > memory layout...
> > 
> 
> I'm assuming this is from set_required_buffer_size right?
> 
> The symbol is exported out for other drivers to use.  It's possible for another
> driver to allocate a wmi_device structure that's not part of a wblock.

container_of can never return NULL, it does arithmetics on a pointer
based on the type it is embedded into.

You better don't register a wmi_device that's not part of the block
with your driver.  Which others drivers are those, btw?

> > > +	list_for_each_entry_safe(wblock, next, &wmi_block_list, list) {
> > > +		wdriver = container_of(wblock->dev.dev.driver,
> > > +					struct wmi_driver, driver);
> > > +		if (!wdriver)
> > > +			continue;
> > 
> > Same here.  And other places in this file.
> > 
> 
> This one it's possible that a driver isn't bound to a device, and when
> that happens wdriver is NULL.

See above, no it can't.  Maybe wblock->dev.dev.driver can be NULL,
but in that case you must not call container_of on it.
