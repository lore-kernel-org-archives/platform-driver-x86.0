From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Subject: Re: [PATCH 1/2] x86/quark: Add Quark embedded SRAM support
Date: Wed, 06 May 2015 08:46:48 -0700
Message-ID: <554A3768.9070405@nexus-software.ie>
References: <1430705875-6990-1-git-send-email-pure.logic@nexus-software.ie> <1430705875-6990-2-git-send-email-pure.logic@nexus-software.ie> <20150506095858.GA16458@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from outbound-smtp05.blacknight.com ([81.17.249.38]:50118 "EHLO
	outbound-smtp05.blacknight.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751116AbbEFPqz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 6 May 2015 11:46:55 -0400
Received: from mail.blacknight.com (pemlinmail04.blacknight.ie [81.17.254.17])
	by outbound-smtp05.blacknight.com (Postfix) with ESMTPS id 2620A98B08
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 May 2015 15:46:54 +0000 (UTC)
In-Reply-To: <20150506095858.GA16458@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ingo Molnar <mingo2.kernel.org@gmail.com>
Cc: tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, dvhart@infradead.org, andy.schevchenko@gmail.com, boon.leong.ong@intel.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, derek.browne@intel.com, josef.ahmad@intel.com, erik.nyquist@intel.com

On 06/05/15 02:58, Ingo Molnar wrote:
>
> * Bryan O'Donoghue <pure.logic@nexus-software.ie> wrote:
>
>> +/**
>> + * esram_page_overlay - Overlay a page with fast access eSRAM.
>> + *
>> + * This function takes a 4 KiB aligned physical address and programs an
>> + * eSRAM page to overlay that 4 KiB region. We require and verify that the
>> + * target memory is read-write - since we don't support overlay of read-only
>> + * memory regions - such as kernel .text areas. Overlay of .text areas is
>> + * not supported because eSRAM isn't self-populating and we cannot guarantee
>> + * atomicity of the overlay operation. It is assumed and required that the
>> + * caller of the overlay function is overlaying a data buffer not kernel
>> + * code.
>
> So if this SRAM truly has L1 speeds then overlaying kernel text would
> sure be a lovely usecase!

Yes it would. The original BSP code does support overlay of kernel .text 
areas - and there's no reason why careful and intelligent mapping of 
.text areas would be precluded.....

However we would need to be very careful about which pieces of code we 
overlay - because

1. Enable overlay @ address X
2. eSRAM enables the overlay - with a buffer containing junk
3. Kernel needs to repopulate the overlayed page


> Which part of the overlay operation is inatomic?

Since the overlay page doesn't populate itself what happens is

1. Issue command to overlay via IOSF-MBI - returning almost instantly
2. eSRAM overlay operation starts and a number of cycles later completes
3. Kernel needs to poll for completion
3. Overlayed page now contains the data in the SRAM buffer (junk)
4. Kernel needs to repopulate the overlayed page with the original data

So between the command to enable the page and the time the memcpy() 
finishes the target page for overlay cannot be relied on.

Any code necessary to do the overlay (memcpy, any address in the esram 
driver, any address in the MBI driver, any address in the PCI code) 
couldn't be overlayed. This may mean maintaining a blacklist of 
addresses which is a pain or just judicious use of the overlay by code 
that the knowledgeable of what can and can't be overlayed. I think the 
latter option is best and a pretty obvious way of doing it.

> Could we solve it by
> double buffering: first creating a temporary buffer, mapping the eSRAM
> pages there and copying kernel text to it?

I think that depends on which pieces of code we are talking about.

> Now that we've populated it, we only have to remap the eSRAM to the
> real kernel text pages.
>
> Its inatomicity should not matter: whether the CPU fetches from DRAM
> or from eSRAM, it should be the same content.
>
> Once the remapping is done, the double buffer can be freed.
>
> Likewise, the text of kernel modules could be eSRAM cached as well,
> although core kernel text is probably even more beneficial.

Hmm. You know that's a good suggestion.... I think it's worth a try.

Bryan
