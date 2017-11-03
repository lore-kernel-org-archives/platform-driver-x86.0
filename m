From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v12 00/16] Introduce support for Dell SMBIOS over WMI
Date: Thu, 2 Nov 2017 17:50:25 -0700
Message-ID: <20171103005025.GA7971@fury>
References: <cover.1509561822.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:40340 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932398AbdKCAub (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Nov 2017 20:50:31 -0400
Content-Disposition: inline
In-Reply-To: <cover.1509561822.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>

On Wed, Nov 01, 2017 at 02:25:21PM -0500, Mario Limonciello wrote:
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
> drivers to be able to create discoverable character devices with
> a predictable IOCTL interface through the WMI bus when desired.
> Requiring WMI drivers to explicitly ask for this functionality will
> act as an effective vendor whitelist to character device creation.
> 
> Some of this work is the basis for what will be a proper interpreter
> of MOF in the kernel and controls for what drivers will be able to
> do with that MOF.
> 
> NOTE: This patch series is intended to go on top of platform-drivers-x86
> linux-next.
> 
> For convenience the entire series including those is also available here:
> https://github.com/dell/linux/tree/wmi-smbios

Queued for testing, thanks Mario.

-- 
Darren Hart
VMware Open Source Technology Center
