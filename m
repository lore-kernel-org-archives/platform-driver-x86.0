From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 00/12] Introduce support for Dell SMBIOS over WMI
Date: Mon, 25 Sep 2017 18:13:45 +0200
Message-ID: <20170925161345.GJ22190@pali>
References: <cover.1505999739.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1505999739.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, quasisec@google.com
List-Id: platform-driver-x86.vger.kernel.org

On Thursday 21 September 2017 08:57:05 Mario Limonciello wrote:
> The existing way that the dell-smbios helper module and associated
> other drivers (dell-laptop, dell-wmi) communicate with the platform
> really isn't secure.  It requires creating a buffer in physical
> DMA32 memory space and passing that to the platform via SMM.
> 
> Since the platform got a physical memory pointer, you've just got
> to trust that the platform has only modified (and accessed) memory
> within that buffer.

And what is the problem? The whole memory management is done by kernel
itself, so you already need to trust it.

> Dell Platform designers recognize this security risk and offer a
> safer way to communicate with the platform over ACPI.  This is
> in turn exposed via a WMI interface to the OS.

Hm... I cannot understand how some proprietary ACPI bytecode interpreted
by kernel can be safer as kernel code itself.

Can you describe more details about this security risk?

> When communicating over WMI-ACPI the communication doesn't occur
> with physical memory pointers.  When the ASL is invoked, the fixed
> length ACPI buffer is copied to a small operating region.  The ASL
> will invoke the SMI, and SMM will only have access to this operating
> region.  When the ASL returns the buffer is copied back for the OS
> to process.

If problem is in current kernel implementation, then it can be fixed.

I'm not against using new WMI communication, but I cannot understand how
kernel code itself is less safer as some other code which is interpreted
by kernel. It does not make sense for me.

> This method of communication should also deprecate the usage of the
> dcdbas kernel module and software dependent upon it's interface.
> Instead offer a syfs interface for communicating with this ASL
> method to allow userspace to use instead.
> 
> To faciliate that needs for userspace and kernel space this patch
> series introduces a generic way for WMI drivers to be able to
> create character devices through the WMI bus when desired.
> Requiring WMI drivers to explictly ask for this functionality will
> act as an effective vendor whitelist.

-- 
Pali Rohár
pali.rohar@gmail.com
