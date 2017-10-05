From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3 0/8] Introduce support for Dell SMBIOS over WMI
Date: Wed, 4 Oct 2017 19:44:51 -0700
Message-ID: <20171005024451.GI25018@fury>
References: <cover.1506571187.git.mario.limonciello@dell.com>
 <20170930021657.GF13307@fury>
 <bff1f575d2d44b79ba9636433f19df9d@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:41170 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751225AbdJECox (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Oct 2017 22:44:53 -0400
Content-Disposition: inline
In-Reply-To: <bff1f575d2d44b79ba9636433f19df9d@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com

On Sat, Sep 30, 2017 at 07:56:33PM +0000, Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Darren Hart [mailto:dvhart@infradead.org]
> > Sent: Friday, September 29, 2017 9:17 PM
> > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > Cc: Andy Shevchenko <andy.shevchenko@gmail.com>; LKML <linux-
> > kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org; Andy Lutomirski
> > <luto@kernel.org>; quasisec@google.com; pali.rohar@gmail.com
> > Subject: Re: [PATCH v3 0/8] Introduce support for Dell SMBIOS over WMI
> > 
> > On Wed, Sep 27, 2017 at 11:02:12PM -0500, Mario Limonciello wrote:

...

> > My other concern is the freeform structure around creating the file
> > operations in each driver for the chardev IOCTL. It seems like we need
> > some kind of defined mapping from METHOD index to IOCTL number, or else
> > some way to advertise what it is?
> > 
> 
> I was originally thinking it would be a good way to do this cleanly too, but my 
> main concern is this one character device may handle multiple methods problem.
> If you map method instance (index) to ioctl number you will most likely run into 
> clashes.  So maybe it's worth not allowing that?
> 
> So I've got another idea.  How about instead of a variety of freeform ioctl per driver,
> provide three ioctl functions for all the character devices that come in through
> the WMI bus to use (say IOC 'W') with either read, write or write/read.  The WMI bus
> should be able to know which driver to pass it on to by the character device used.
> 

This is not something I have any experience with. I see you added it to v4, so
let's see what others have to say there.

-- 
Darren Hart
VMware Open Source Technology Center
