From: Ingo Molnar <mingo2.kernel.org@gmail.com>
Subject: Re: [PATCH 2/2] x86/quark: Add Quark embedded SRAM self-test
Date: Wed, 6 May 2015 12:02:11 +0200
Message-ID: <20150506100211.GB16458@gmail.com>
References: <1430705875-6990-1-git-send-email-pure.logic@nexus-software.ie>
 <1430705875-6990-3-git-send-email-pure.logic@nexus-software.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f67.google.com ([74.125.82.67]:34154 "EHLO
	mail-wg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750812AbbEFKCP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 6 May 2015 06:02:15 -0400
Content-Disposition: inline
In-Reply-To: <1430705875-6990-3-git-send-email-pure.logic@nexus-software.ie>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Cc: tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, dvhart@infradead.org, andy.schevchenko@gmail.com, boon.leong.ong@intel.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, derek.browne@intel.com, josef.ahmad@intel.com, erik.nyquist@intel.com


* Bryan O'Donoghue <pure.logic@nexus-software.ie> wrote:

> +/**
> + * esram_self_test_time
> + *
> + * This function is carefully constructed to measure and verify the
> + * performance boost provided by eSRAM. We invalidate the cache with a
> + * wbinvd() and then perform a series of reads - each of which will cause a
> + * cacheline miss. We measure the aggregate time it takes to complete the
> + * series of reads and return the delta in cycles. The calling function will
> + * pass either a pointer to DRAM or a pointer to eSRAM.
> + *
> + * @param walker:	Pointer to RAM area to test.
> + * @return:		Number of cycles to complete test.
> + */
> +static cycles_t esram_self_test_time(char *walker, ssize_t step, ssize_t size)
> +{
> +	volatile u32 dummy = 0;
> +	int i;
> +	int j;
> +	cycle_t t1;
> +	cycle_t t2;
> +	u32 page_count = size / PAGE_SIZE;
> +
> +	local_irq_disable();
> +	t1 = get_cycles();
> +	for (i = 0; i < page_count; i++) {
> +		for (j = 0; j < PAGE_SIZE/step; j++) {
> +			dummy += *(u32 *)walker;
> +			walker += step;
> +		}
> +	}
> +	t2 = get_cycles();
> +	local_irq_enable();
> +
> +	return t2 > t1 ? t2 - t1 : ULLONG_MAX - t2 + t1;
> +}

So I don't see the wbinvd() that the description mentions.

> + * esram_self_test_init - entry point for IMR driver.
> + * esram_self_test_exit - exit point for IMR code.

Stale 'IMR' references left over from copy & paste?

Thanks,

	Ingo
