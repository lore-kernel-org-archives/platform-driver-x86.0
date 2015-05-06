From: Ingo Molnar <mingo2.kernel.org@gmail.com>
Subject: Re: [PATCH 2/2] x86/quark: Add Quark embedded SRAM self-test
Date: Wed, 6 May 2015 12:08:49 +0200
Message-ID: <20150506100849.GA16621@gmail.com>
References: <1430705875-6990-1-git-send-email-pure.logic@nexus-software.ie>
 <1430705875-6990-3-git-send-email-pure.logic@nexus-software.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f196.google.com ([209.85.212.196]:36516 "EHLO
	mail-wi0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750799AbbEFKIx (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 6 May 2015 06:08:53 -0400
Content-Disposition: inline
In-Reply-To: <1430705875-6990-3-git-send-email-pure.logic@nexus-software.ie>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Cc: tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, dvhart@infradead.org, andy.schevchenko@gmail.com, boon.leong.ong@intel.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, derek.browne@intel.com, josef.ahmad@intel.com, erik.nyquist@intel.com


* Bryan O'Donoghue <pure.logic@nexus-software.ie> wrote:

> +config INTEL_ESRAM
> +	bool "Intel Embedded SRAM (eSRAM) support"
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

So presumably X86_INTEL_QUARK is only enabled if the user wants to 
build for Galileo/Quark. So you might as well make this 'default y'.

Thanks,

	Ingo
