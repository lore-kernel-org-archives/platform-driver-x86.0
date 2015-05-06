From: Ingo Molnar <mingo2.kernel.org@gmail.com>
Subject: Re: [PATCH 0/2] x86/quark: Add eSRAM driver and test code
Date: Wed, 6 May 2015 11:52:35 +0200
Message-ID: <20150506095235.GA16272@gmail.com>
References: <1430705875-6990-1-git-send-email-pure.logic@nexus-software.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f68.google.com ([74.125.82.68]:33964 "EHLO
	mail-wg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750818AbbEFJwj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 6 May 2015 05:52:39 -0400
Content-Disposition: inline
In-Reply-To: <1430705875-6990-1-git-send-email-pure.logic@nexus-software.ie>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Cc: tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, dvhart@infradead.org, andy.schevchenko@gmail.com, boon.leong.ong@intel.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, derek.browne@intel.com, josef.ahmad@intel.com, erik.nyquist@intel.com


* Bryan O'Donoghue <pure.logic@nexus-software.ie> wrote:

> Quark X1000 SoC contains a 512 KiB embedded SRAM (eSRAM) memory that can
> be mapped onto an area of DRAM in block or on per-page overlay mode where a
> 4 KiB aligned region can be overlayed - allowing for broken up mappings
> with a 4 KiB individual granularity.
> 
> eSRAM has access times similar to an L1 cache. The following patchset
> adds a gen_pool driver and automatic test routine to exercise eSRAM. The
> intent of the eSRAM driver is to allow other drivers to allocate SRAM
> buffers. In contrast to the original BSP code no attempt will be made to
> map kernel .data section code, this is a simple SRAM buffer allocation/free
> mechanism and a sanity test to ensure it's ongoing correctness.
> 
> Bryan O'Donoghue (2):
>   x86/quark: Add Quark embedded SRAM support
>   x86/quark: Add Quark embedded SRAM self-test

So I'm wondering what the primary usecase is for this. The eSRAM API 
is purely in-kernel, right? The only user seems to be the self-test. 
What other users will there be?

Thanks,

	Ingo
