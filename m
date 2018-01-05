From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2] x86/platform/intel-mid: Revert "Make 'bt_sfi_data'
 const"
Date: Fri, 05 Jan 2018 19:18:16 +0200
Message-ID: <1515172696.7000.754.camel@linux.intel.com>
References: <20171228122523.21802-1-andriy.shevchenko@linux.intel.com>
         <20171228123413.3shmkfsewmq3y4e5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:3199 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751888AbeAERZv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 Jan 2018 12:25:51 -0500
In-Reply-To: <20171228123413.3shmkfsewmq3y4e5@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>, Fengguang Wu <fengguang.wu@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Bhumika Goyal <bhumirks@gmail.com>, julia.lawall@lip6.fr

On Thu, 2017-12-28 at 13:34 +0100, Ingo Molnar wrote:
> * Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
> > v2: low the tone of accusation that this made a regression
> 
> BTW., don't worry about that aspect too much: after a long debugging
> session it's 
> pretty natural to be upset at whoever introduced a regression.

It appears that regression has been introduced by a new dependency to
the hci_bcm.c.

In any case, can we apply this one to 4.15 cycle to make others prevent
do an actual regressions further:

commit 03838ae1e8f692dd2bdbd49820ed668d4b7bfbc2
Author: Andi Kleen <ak@linux.intel.com>
Date:   Fri Jan 5 13:26:44 2018 +1100

    arch/x86/platform/intel-mid/device_libs/platform_bt.c: fix const
confusion

> 
> ( In fact a number of times I too got upset at the moron who wrote a
> particular 
>   piece of buggy code, only for 'git annotate' to remind me that the
> moron was me. )
> 
> I personally just ignore the emotional attributes, and I usually edit
> changelogs 
> accordingly as well so the temporary state of mind of finding a
> regression doesn't 
> trickle upstream.
> 
> Plus in this particular case if we can help type propagation for
> driver data to 
> become a bit cleaner then the kernel project has gained a bit through
> all this 
> pain.

I has been thinking if 0day can complain about these:
1) castings in new code
2) applying const to older *working* code

Fengguang, what do you think?

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
