From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 00/12] Introduce support for Dell SMBIOS over WMI
Date: Wed, 27 Sep 2017 09:39:58 -0700
Message-ID: <20170927163958.GC23572@fury>
References: <cover.1505999739.git.mario.limonciello@dell.com>
 <20170925161345.GJ22190@pali>
 <f7c7d039432d4adf965b36db65dbcd8d@ausx13mpc120.AMER.DELL.COM>
 <20170925164902.GN22190@pali>
 <00af0747a69a42c7ad0e9beaf9c50dab@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:40007 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752206AbdI0QkB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Sep 2017 12:40:01 -0400
Content-Disposition: inline
In-Reply-To: <00af0747a69a42c7ad0e9beaf9c50dab@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com
Cc: pali.rohar@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, quasisec@google.com

On Mon, Sep 25, 2017 at 07:27:24PM +0000, Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Pali Rohár [mailto:pali.rohar@gmail.com]
> > Sent: Monday, September 25, 2017 12:49 PM
> > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > Cc: dvhart@infradead.org; linux-kernel@vger.kernel.org; platform-driver-
> > x86@vger.kernel.org; quasisec@google.com
> > Subject: Re: [PATCH 00/12] Introduce support for Dell SMBIOS over WMI
> > 
> > On Monday 25 September 2017 16:32:52 Mario.Limonciello@dell.com wrote:
> > > Hi Pali,
> > >
> > > > -----Original Message-----
> > > > From: Pali Rohár [mailto:pali.rohar@gmail.com]
> > > > Sent: Monday, September 25, 2017 12:14 PM
> > > > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > > > Cc: dvhart@infradead.org; LKML <linux-kernel@vger.kernel.org>; platform-
> > driver-
> > > > x86@vger.kernel.org; quasisec@google.com
> > > > Subject: Re: [PATCH 00/12] Introduce support for Dell SMBIOS over WMI
> > > >
> > > > On Thursday 21 September 2017 08:57:05 Mario Limonciello wrote:
> > > > > The existing way that the dell-smbios helper module and associated
> > > > > other drivers (dell-laptop, dell-wmi) communicate with the platform
> > > > > really isn't secure.  It requires creating a buffer in physical
> > > > > DMA32 memory space and passing that to the platform via SMM.
> > > > >
> > > > > Since the platform got a physical memory pointer, you've just got
> > > > > to trust that the platform has only modified (and accessed) memory
> > > > > within that buffer.
> > > >
> > > > And what is the problem? The whole memory management is done by kernel
> > > > itself, so you already need to trust it.
> > >
> > > There's a lot of ifs, but it's not that crazy of a scenario.
> > >
> > > The problem is that if a malicious payload was delivered to the platform
> > > and exercised a vulnerability in the platform code that payload could
> > > potentially modify memory that it wasn't intended to modify and the OS
> > > would not be aware as operating in SMM.
> > >
> > > >
> > > > > Dell Platform designers recognize this security risk and offer a
> > > > > safer way to communicate with the platform over ACPI.  This is
> > > > > in turn exposed via a WMI interface to the OS.
> > > >
> > > > Hm... I cannot understand how some proprietary ACPI bytecode interpreted
> > > > by kernel can be safer as kernel code itself.
> > > >
> > >
> > > Inherently ACPI can only operate on operation regions and not physical memory.
> > > Data passed into ACPI needs to be copied to an operation region for any ACPI
> > > calls to use it.
> > 
> > But operation regions access is implemented by ACPI interpreter, which
> > is again kernel code.
> 
> So isn't that making my point?
> * Kernel can control operation region accessibility.  SMM can't operate outside
> of this region.
> * Direct SMI gives platform access to everything < 4G, kernel can't control this.

I think there may be some confusion with the term "platform code" - it means
different things to different people. I believe Mario is talking about limiting
memory access to the SMI/SMM code through the use of the ACPI op region in place
of the physical memory pointer, which is not visible nor can it be audited.

-- 
Darren Hart
VMware Open Source Technology Center
