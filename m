From: Ingo Molnar <mingo2.kernel.org@gmail.com>
Subject: Re: [PATCH 1/2] x86/quark: Add Quark embedded SRAM support
Date: Wed, 6 May 2015 11:58:58 +0200
Message-ID: <20150506095858.GA16458@gmail.com>
References: <1430705875-6990-1-git-send-email-pure.logic@nexus-software.ie>
 <1430705875-6990-2-git-send-email-pure.logic@nexus-software.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1430705875-6990-2-git-send-email-pure.logic@nexus-software.ie>
Sender: linux-kernel-owner@vger.kernel.org
To: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Cc: tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, dvhart@infradead.org, andy.schevchenko@gmail.com, boon.leong.ong@intel.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, derek.browne@intel.com, josef.ahmad@intel.com, erik.nyquist@intel.com
List-Id: platform-driver-x86.vger.kernel.org


* Bryan O'Donoghue <pure.logic@nexus-software.ie> wrote:

> +/**
> + * esram_page_overlay - Overlay a page with fast access eSRAM.
> + *
> + * This function takes a 4 KiB aligned physical address and programs an
> + * eSRAM page to overlay that 4 KiB region. We require and verify that the
> + * target memory is read-write - since we don't support overlay of read-only
> + * memory regions - such as kernel .text areas. Overlay of .text areas is
> + * not supported because eSRAM isn't self-populating and we cannot guarantee
> + * atomicity of the overlay operation. It is assumed and required that the
> + * caller of the overlay function is overlaying a data buffer not kernel
> + * code.

So if this SRAM truly has L1 speeds then overlaying kernel text would 
sure be a lovely usecase!

Which part of the overlay operation is inatomic? Could we solve it by 
double buffering: first creating a temporary buffer, mapping the eSRAM 
pages there and copying kernel text to it?

Now that we've populated it, we only have to remap the eSRAM to the 
real kernel text pages.

Its inatomicity should not matter: whether the CPU fetches from DRAM 
or from eSRAM, it should be the same content.

Once the remapping is done, the double buffer can be freed.

Likewise, the text of kernel modules could be eSRAM cached as well, 
although core kernel text is probably even more beneficial.

Thanks,

	Ingo
