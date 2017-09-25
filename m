From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 00/12] Introduce support for Dell SMBIOS over WMI
Date: Mon, 25 Sep 2017 18:49:02 +0200
Message-ID: <20170925164902.GN22190@pali>
References: <cover.1505999739.git.mario.limonciello@dell.com>
 <20170925161345.GJ22190@pali>
 <f7c7d039432d4adf965b36db65dbcd8d@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:51031 "EHLO
        mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752558AbdIYQtF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Sep 2017 12:49:05 -0400
Content-Disposition: inline
In-Reply-To: <f7c7d039432d4adf965b36db65dbcd8d@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: dvhart@infradead.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, quasisec@google.com

On Monday 25 September 2017 16:32:52 Mario.Limonciello@dell.com wrote:
> Hi Pali,
> 
> > -----Original Message-----
> > From: Pali Rohár [mailto:pali.rohar@gmail.com]
> > Sent: Monday, September 25, 2017 12:14 PM
> > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > Cc: dvhart@infradead.org; LKML <linux-kernel@vger.kernel.org>; platform-driver-
> > x86@vger.kernel.org; quasisec@google.com
> > Subject: Re: [PATCH 00/12] Introduce support for Dell SMBIOS over WMI
> > 
> > On Thursday 21 September 2017 08:57:05 Mario Limonciello wrote:
> > > The existing way that the dell-smbios helper module and associated
> > > other drivers (dell-laptop, dell-wmi) communicate with the platform
> > > really isn't secure.  It requires creating a buffer in physical
> > > DMA32 memory space and passing that to the platform via SMM.
> > >
> > > Since the platform got a physical memory pointer, you've just got
> > > to trust that the platform has only modified (and accessed) memory
> > > within that buffer.
> > 
> > And what is the problem? The whole memory management is done by kernel
> > itself, so you already need to trust it.
> 
> There's a lot of ifs, but it's not that crazy of a scenario.
> 
> The problem is that if a malicious payload was delivered to the platform
> and exercised a vulnerability in the platform code that payload could 
> potentially modify memory that it wasn't intended to modify and the OS
> would not be aware as operating in SMM.
> 
> > 
> > > Dell Platform designers recognize this security risk and offer a
> > > safer way to communicate with the platform over ACPI.  This is
> > > in turn exposed via a WMI interface to the OS.
> > 
> > Hm... I cannot understand how some proprietary ACPI bytecode interpreted
> > by kernel can be safer as kernel code itself.
> > 
> 
> Inherently ACPI can only operate on operation regions and not physical memory.
> Data passed into ACPI needs to be copied to an operation region for any ACPI
> calls to use it.

But operation regions access is implemented by ACPI interpreter, which
is again kernel code.

> Furthermore you can decompile the ASL and audit, you can't do this with direct
> SMI/SMM.
> 
> > Can you describe more details about this security risk?
> > 
> > > When communicating over WMI-ACPI the communication doesn't occur
> > > with physical memory pointers.  When the ASL is invoked, the fixed
> > > length ACPI buffer is copied to a small operating region.  The ASL
> > > will invoke the SMI, and SMM will only have access to this operating
> > > region.  When the ASL returns the buffer is copied back for the OS
> > > to process.
> > 
> > If problem is in current kernel implementation, then it can be fixed.
> > 
> >
> > I'm not against using new WMI communication, but I cannot understand how
> > kernel code itself is less safer as some other code which is interpreted
> > by kernel. It does not make sense for me.
> > 
> 
> Well we're talking hypotheticals here in the way things work.
> There aren't necessarily problems with the current implementation.

Ok.

> Also, I didn't already mention this explicitly but I've alluded it to it;
> Dell is deprecating that interface.  I can't say when, but it will stop working
> on some new hardware at some point.
> 
> That's the other reason why I'm pushing for the new communication path
> now.

Ok, as I wrote I'm not against new communication method and specially
now, when you confirmed that in future new machines would not support
"old" method...

... but old communication method should stay there for older machines. I
do not think it would be hard to have both implementations in kernel and
choosing that which is supported on current machine.

> > > This method of communication should also deprecate the usage of the
> > > dcdbas kernel module and software dependent upon it's interface.
> > > Instead offer a syfs interface for communicating with this ASL
> > > method to allow userspace to use instead.
> > >
> > > To faciliate that needs for userspace and kernel space this patch
> > > series introduces a generic way for WMI drivers to be able to
> > > create character devices through the WMI bus when desired.
> > > Requiring WMI drivers to explictly ask for this functionality will
> > > act as an effective vendor whitelist.
> > 
> > --
> > Pali Rohár
> > pali.rohar@gmail.com

-- 
Pali Rohár
pali.rohar@gmail.com
