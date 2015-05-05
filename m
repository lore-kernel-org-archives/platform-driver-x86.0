From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH 1/2] x86/quark: Add Quark embedded SRAM support
Date: Tue, 05 May 2015 10:44:47 +0200
Message-ID: <1430815487.3843.24.camel@x220>
References: <1430705875-6990-1-git-send-email-pure.logic@nexus-software.ie>
	 <1430705875-6990-2-git-send-email-pure.logic@nexus-software.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from lb1-smtp-cloud3.xs4all.net ([194.109.24.22]:59133 "EHLO
	lb1-smtp-cloud3.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1030902AbbEEIou (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 5 May 2015 04:44:50 -0400
In-Reply-To: <1430705875-6990-2-git-send-email-pure.logic@nexus-software.ie>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Cc: tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, dvhart@infradead.org, andy.schevchenko@gmail.com, boon.leong.ong@intel.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, derek.browne@intel.com, josef.ahmad@intel.com, erik.nyquist@intel.com

On Mon, 2015-05-04 at 03:17 +0100, Bryan O'Donoghue wrote:
> --- a/arch/x86/platform/intel-quark/Makefile
> +++ b/arch/x86/platform/intel-quark/Makefile

>  obj-$(CONFIG_INTEL_IMR) += imr.o

(Your change to drivers/platform/x86/Kconfig now makes it possible that
imr.o will be part of a module. More on that below.)

> +obj-$(CONFIG_INTEL_ESRAM) += esram.o

INTEL_ESRAM is a bool Kconfig symbol, so esram.o will never be part of a
module, right?

> --- /dev/null
> +++ b/arch/x86/platform/intel-quark/esram.c

> +MODULE_DEVICE_TABLE(x86cpu, esram_ids);

> +module_init(esram_init);
> +module_exit(esram_exit);
> +
> +MODULE_AUTHOR("Bryan O'Donoghue <pure.logic@nexus-software.ie>");
> +MODULE_DESCRIPTION("Intel Embedded SRAM overlay driver");
> +MODULE_LICENSE("Dual BSD/GPL");
> +

(Trailing empty line.)

> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig

>  config INTEL_IMR
> -	bool "Intel Isolated Memory Region support"
> +	tristate "Intel Isolated Memory Region support"

It's not obvious, at least to me, why this symbol is changed to
tristate. Does that follow from the other changes?

>  	default n
>  	depends on X86_INTEL_QUARK && IOSF_MBI
>  	---help---
 
> +config INTEL_ESRAM
> +	bool "Intel Embedded SRAM (eSRAM) support"

If I'm reading the corresponding Makefile change correctly, esram.o will
never be part of a module. But esram.c is added with some module
specific boilerplate. (Note, again, that I'm not sure whether
KBUILD_MODNAME is module specific.)

Was your intention perhaps to make this a tristate symbol?

> +	default n
> +	depends on X86_INTEL_QUARK && IOSF_MBI
> +	select GENERIC_ALLOCATOR
> +	---help---
> +	  This options provides an API to allocate memory from Embedded SRAM
> +	  (eSRAM) present on Quark X1000 SoC processors.
> +	  eSRAM is a 512 KiB block of low-latency SRAM organized as
> +	  128 * 4 KiB pages or as one 512 KiB chunk of memory. This driver
> +	  enables eSRAM in per-page overlay mode and provides a gen_pool
> +	  allocator which allows allocation of memory from the eSRAM pool.
> +
> +	  If you are running on a Galileo/Quark say Y here.

Thanks,


Paul Bolle
