From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3 0/8] Introduce support for Dell SMBIOS over WMI
Date: Fri, 29 Sep 2017 19:16:57 -0700
Message-ID: <20170930021657.GF13307@fury>
References: <cover.1506571187.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:48747 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752639AbdI3CRA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 29 Sep 2017 22:17:00 -0400
Content-Disposition: inline
In-Reply-To: <cover.1506571187.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com

On Wed, Sep 27, 2017 at 11:02:12PM -0500, Mario Limonciello wrote:
> The existing way that the dell-smbios helper module and associated
> other drivers (dell-laptop, dell-wmi) communicate with the platform
> really isn't secure.  It requires creating a buffer in physical
> DMA32 memory space and passing that to the platform via SMM.
> 
> Since the platform got a physical memory pointer, you've just got
> to trust that the platform has only modified (and accessed) memory
> within that buffer.
> 
> Dell Platform designers recognize this security risk and offer a
> safer way to communicate with the platform over ACPI.  This is
> in turn exposed via a WMI interface to the OS.
> 
> When communicating over WMI-ACPI the communication doesn't occur
> with physical memory pointers.  When the ASL is invoked, the fixed
> length ACPI buffer is copied to a small operating region.  The ASL
> will invoke the SMI, and SMM will only have access to this operating
> region.  When the ASL returns the buffer is copied back for the OS
> to process.
> 
> This method of communication should also deprecate the usage of the
> dcdbas kernel module and software dependent upon it's interface.
> Instead offer a character device interface for communicating with this
> ASL method to allow userspace to use instead.
> 
> To faciliate that this patch series introduces a generic way for WMI
> drivers to be able to create discoverable character devices through
> the WMI bus when desired.
> Requiring WMI drivers to explicitly ask for this functionality will
> act as an effective vendor whitelist to character device creation.
> 

Mario,

Looking pretty good in general.

My biggest concern is around the dell-smbios.c "buffer" logic which is
starting to look really hacked together as it tries to deal with the
existing interface and the new WMI interface. Really seems like we
should be able to introduce one level of abstraction that would clean it
up. If not - can you explain your rationale in that patch?

My other concern is the freeform structure around creating the file
operations in each driver for the chardev IOCTL. It seems like we need
some kind of defined mapping from METHOD index to IOCTL number, or else
some way to advertise what it is?

-- 
Darren Hart
VMware Open Source Technology Center
