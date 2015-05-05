From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH 2/2] x86/quark: Add Quark embedded SRAM self-test
Date: Tue, 05 May 2015 10:34:39 +0200
Message-ID: <1430814879.3843.16.camel@x220>
References: <1430705875-6990-1-git-send-email-pure.logic@nexus-software.ie>
	 <1430705875-6990-3-git-send-email-pure.logic@nexus-software.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from lb1-smtp-cloud3.xs4all.net ([194.109.24.22]:44406 "EHLO
	lb1-smtp-cloud3.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756756AbbEEIep (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 5 May 2015 04:34:45 -0400
In-Reply-To: <1430705875-6990-3-git-send-email-pure.logic@nexus-software.ie>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Cc: tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, dvhart@infradead.org, andy.schevchenko@gmail.com, boon.leong.ong@intel.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, derek.browne@intel.com, josef.ahmad@intel.com, erik.nyquist@intel.com

On Mon, 2015-05-04 at 03:17 +0100, Bryan O'Donoghue wrote:
> --- a/arch/x86/Kconfig.debug
> +++ b/arch/x86/Kconfig.debug
 
> +config DEBUG_ESRAM_SELFTEST
> +	bool "Embedded SRAM self test"
> +	default n
> +	depends on INTEL_ESRAM
> +	---help---
> +	  This option enables automated sanity testing of the eSRAM driver
> +	  on Quark X1000. A simple set of tests with performance metrics
> +	  measured a DRAM baseline are run. These tests show the measured
> +	  performance increase across a given memory size for a series of
> +	  incrementing read sizes.
> +
> +	  If unsure say N here.

> --- a/arch/x86/platform/intel-quark/Makefile
> +++ b/arch/x86/platform/intel-quark/Makefile

> +obj-$(CONFIG_DEBUG_ESRAM_SELFTEST) += esram_selftest.o

DEBUG_ESRAM_SELFTEST is a bool Kconfig symbol. So esram_selftest.o will
never be part of a module, right?

> --- /dev/null
> +++ b/arch/x86/platform/intel-quark/esram_selftest.c

> + * IMR self test. The purpose of this module is to run a set of tests on the
> + * IMR API to validate it's sanity. We check for overlapping, reserved
> + * addresses and setup/teardown sanity.

> +MODULE_DEVICE_TABLE(x86cpu, esram_ids);

> +module_init(esram_self_test_init);
> +module_exit(esram_self_test_exit);
> +
> +MODULE_AUTHOR("Bryan O'Donoghue <pure.logic@nexus-software.ie>");
> +MODULE_DESCRIPTION("Intel Quark eSRAM self-test driver");
> +MODULE_LICENSE("Dual BSD/GPL");

There's some module specific boilerplate above. (Note that I'm not sure
whether KBUILD_MODNAME is module specific, sorry.) And the comment talks
about a module too.

Was your intention to make DEBUG_ESRAM_SELFTEST a tristate symbol?

Thanks,


Paul Bolle
