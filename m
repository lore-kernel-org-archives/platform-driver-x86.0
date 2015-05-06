From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Subject: Re: [PATCH 2/2] x86/quark: Add Quark embedded SRAM self-test
Date: Wed, 06 May 2015 07:27:06 -0700
Message-ID: <554A24BA.80605@nexus-software.ie>
References: <1430705875-6990-1-git-send-email-pure.logic@nexus-software.ie> <1430705875-6990-3-git-send-email-pure.logic@nexus-software.ie> <20150506100211.GB16458@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from outbound-smtp06.blacknight.com ([81.17.249.39]:55621 "EHLO
	outbound-smtp06.blacknight.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751116AbbEFO1P (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 6 May 2015 10:27:15 -0400
Received: from mail.blacknight.com (pemlinmail04.blacknight.ie [81.17.254.17])
	by outbound-smtp06.blacknight.com (Postfix) with ESMTPS id 4959898A0D
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 May 2015 14:27:14 +0000 (UTC)
In-Reply-To: <20150506100211.GB16458@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ingo Molnar <mingo2.kernel.org@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, dvhart@infradead.org, andy.schevchenko@gmail.com, boon.leong.ong@intel.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, derek.browne@intel.com, josef.ahmad@intel.com, erik.nyquist@intel.com

On 06/05/15 03:02, Ingo Molnar wrote:

>> + * This function is carefully constructed to measure and verify the
>> + * performance boost provided by eSRAM. We invalidate the cache with a
>> + * wbinvd() and then perform a series of reads - each of which will cause a
>> + * cacheline miss. We measure the aggregate time it takes to complete the
>> + * series of reads and return the delta in cycles. The calling function will
>> + * pass either a pointer to DRAM or a pointer to eSRAM.
>> + *
>> + * @param walker:	Pointer to RAM area to test.
>> + * @return:		Number of cycles to complete test.
>> + */

<snip>

>
> So I don't see the wbinvd() that the description mentions.

wbinvd(); isn't required to make the test do it's job. Missed scrubbing 
from the description - damn :(

>
>> + * esram_self_test_init - entry point for IMR driver.
>> + * esram_self_test_exit - exit point for IMR code.
>
> Stale 'IMR' references left over from copy & paste?

Yep
