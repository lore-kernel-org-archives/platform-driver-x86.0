From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: intel_pmc_core: Report slp_s0 residency range
Date: Sat, 6 Apr 2019 22:11:29 +0300
Message-ID: <CAHp75VdBwUYu7FudBUUeo5cU4RHDk8hey2y-X09-GaskZXU+=Q@mail.gmail.com>
References: <20190401180505.6621-1-evgreen@chromium.org> <20190405071455.GA30194@raj-desk2.iind.intel.com>
 <CAE=gft7r+0s6M2KZLdcp33xvnxjX2Kqyg-vVk5dVVoC5PUOGqw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAE=gft7r+0s6M2KZLdcp33xvnxjX2Kqyg-vVk5dVVoC5PUOGqw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Evan Green <evgreen@chromium.org>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Rajat Jain <rajatja@google.com>, Furquan Shaikh <furquan@chromium.org>, Ravi Chandra Sadineni <ravisadineni@chromium.org>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Andy Shevchenko <andy@infradead.org>, LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Apr 5, 2019 at 8:52 PM Evan Green <evgreen@chromium.org> wrote:
> On Fri, Apr 5, 2019 at 12:28 AM Rajneesh Bhardwaj
> <rajneesh.bhardwaj@intel.com> wrote:
> > On Mon, Apr 01, 2019 at 11:05:04AM -0700, Evan Green wrote:

> > This register is a 32 bit register untill ICL generation and a recent patch
> > from Rajat fixed the overflow https://patchwork.kernel.org/patch/10816103/
> > already so i am not sure how this will help userspace. I think the userspace
> > can still take care of any overflow concerns based on the information
> > available about this register in EDS so i feel exposing a new debugfs entry
> > just for the sake of knowing range is probably not needed.
>
> So you don't anticipate reusing this driver for other models where the
> factor of 100 might change, or the counter might be a different width?
> We can hardcode the multiply in usermode in order to detect when we've
> exceeded the 4.9 day rollover range, but it seemed brittle, and would
> break if this hardware implementation detail ever changed.

No user space component should ever rely on debugfs interface.

-- 
With Best Regards,
Andy Shevchenko
