From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 0/2] x86: Add IMR support to Quark/Galileo
Date: Mon, 5 Jan 2015 22:00:00 -0800
Message-ID: <20150106055959.GA59754@vmdeb7>
References: <1419873783-5161-1-git-send-email-pure.logic@nexus-software.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1419873783-5161-1-git-send-email-pure.logic@nexus-software.ie>
Sender: linux-kernel-owner@vger.kernel.org
To: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Cc: tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Dec 29, 2014 at 05:23:01PM +0000, Bryan O'Donoghue wrote:
> This patchset adds an IMR driver to the kernel plus platform code for
> Intel Galileo Gen1/Gen2 boards.
> 
> IMRs:
> Quark SoC X1000 ships with a set of registers called Isolated Memory Regions
> IMRs provide fine grained memory access control to various system agents
> within the SoC such as CPU SMM/non-SMM mode, PCIe virtual channels, CPU snoop
> cycles, eSRAM flush cycles and the RMU. In simple terms, IMRs provide a
> mechanism to protect memory regions from unwarranted access by system agents
> that should not have access to that memory.
> 
> IMRs support a lock bit. Once a lock bit is set for an individual IMR it is
> not possible to tear down that IMR without performing a cold boot of the
> system. IMRs support reporting of violations. The SoC system can be
> configured to reboot immediately when an IMR violation has taken place.
> Immediate reboot of the system on IMR violation is recommended and is
> currently how Quark BIOS configures the system.
> 
> As an example Galileo boards ship with an IMR around the ACPI runtime
> services memory and if a DMA read/write cycle were to occur to this region
> of memory this would trigger the IMR violation mechansim. 
> 
> Galileo:
> Intel's Arduino compatible Galileo boards boot to Linux with IMRs protecting
> the compressed kernel image and boot params data structure. The memory that

What is the motivation behind this?

> the compressed kernel and boot params data structure is in, is marked as
> usable memory by the EFI memory map. As a result it is possible for memory

Based on your response to the above, is marking this memory as usable a bad idea
in general? Or just bad in certain situations?

> marked as processor read/write only in an IMR to be given to devices in the
> SoC for the purposes of DMA by way of dma_alloc_coherent.

New line

> A DMA to a region of memory by a system agent which is not allowed access
> this memory result in a system reset. Without tearing down the IMRs placed
> around the compressed kernel image and boot params data structure there is a
> high risk of triggering an inadvertent system reset when performing DMA
> actions with any of the peripherals that support DMA in Quark such as the
> MMC, Ethernet or USB host/device.
> 
> Therefore Galileo specific platform code is the second component of this
> patchset. The platform code tears-down every unlocked IMR to ensure no

The firmware sets these IMRs, but does not lock them then, correct?

> conflict exists between the IMR usage during boot and the EFI memory map. In
> addition an IMR is placed around the kernel's .text section to ensure no
> invalid access to kernel code can happen by way of spurious DMA, SMM or RMU
> read/write cycles. This code gets compiled into the kernel because we want
> to run the code early before any DMA has taken place. The prime examples of
> DMA transactions resetting the system are mouting a root filesystem on MMC

mounting

> or mouting a root filesystem over NFS.

mounting

-- 
Darren Hart
Intel Open Source Technology Center
