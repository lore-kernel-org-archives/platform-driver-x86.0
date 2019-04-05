From: Evan Green <evgreen@chromium.org>
Subject: Re: [PATCH] platform/x86: intel_pmc_core: Report slp_s0 residency range
Date: Fri, 5 Apr 2019 10:52:04 -0700
Message-ID: <CAE=gft7r+0s6M2KZLdcp33xvnxjX2Kqyg-vVk5dVVoC5PUOGqw@mail.gmail.com>
References: <20190401180505.6621-1-evgreen@chromium.org> <20190405071455.GA30194@raj-desk2.iind.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190405071455.GA30194@raj-desk2.iind.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: Rajat Jain <rajatja@google.com>, Furquan Shaikh <furquan@chromium.org>, Ravi Chandra Sadineni <ravisadineni@chromium.org>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Andy Shevchenko <andy@infradead.org>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Apr 5, 2019 at 12:28 AM Rajneesh Bhardwaj
<rajneesh.bhardwaj@intel.com> wrote:
>
> On Mon, Apr 01, 2019 at 11:05:04AM -0700, Evan Green wrote:
> > The PMC driver performs a 32-bit read on the sleep s0 residency counter,
> > followed by a hard-coded multiplication to convert into microseconds.
> > The maximum value this counter could have would be 0xffffffff*0x64
> > microseconds, which by my calculations is about 4.9 days. This is well
> > within a reasonable time period to observe an overflow.
> >
> > Usermode consumers watching slp_s0_residency_usec need to be aware of
> > overflows, but have no idea what the maximum value of this counter is,
> > given the hardcoded multiply of a 32-bit value by
> > SPT_PMC_SLP_S0_RES_COUNTER_STEP.
>
> This register is a 32 bit register untill ICL generation and a recent patch
> from Rajat fixed the overflow https://patchwork.kernel.org/patch/10816103/
> already so i am not sure how this will help userspace. I think the userspace
> can still take care of any overflow concerns based on the information
> available about this register in EDS so i feel exposing a new debugfs entry
> just for the sake of knowing range is probably not needed.

So you don't anticipate reusing this driver for other models where the
factor of 100 might change, or the counter might be a different width?
We can hardcode the multiply in usermode in order to detect when we've
exceeded the 4.9 day rollover range, but it seemed brittle, and would
break if this hardware implementation detail ever changed.
-Evan
