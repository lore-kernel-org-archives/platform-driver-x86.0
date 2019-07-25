From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: intel_pmc_core: Add ICL-NNPI support to PMC Core
Date: Thu, 25 Jul 2019 20:23:50 +0300
Message-ID: <CAHp75VdEZ_VMEk3GjYYtgvSCOOOAMhZj-98B-+t__UdB207T8Q@mail.gmail.com>
References: <20190614080940.13640-1-rajneesh.bhardwaj@linux.intel.com>
 <CAHp75VfMdKqpC3_gF-VzcJQqiWM9E0irORr60KLXyu8HuQg9KA@mail.gmail.com> <37653b30-7a76-0896-ecb7-2fbeab4308ec@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <37653b30-7a76-0896-ecb7-2fbeab4308ec@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@linux.intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jul 25, 2019 at 11:02 AM Bhardwaj, Rajneesh
<rajneesh.bhardwaj@linux.intel.com> wrote:
>
> Hi Andy
>
> On 29-Jun-19 6:48 PM, Andy Shevchenko wrote:
> > On Fri, Jun 14, 2019 at 11:14 AM Rajneesh Bhardwaj
> > <rajneesh.bhardwaj@linux.intel.com> wrote:
> >> Ice Lake Neural Network Processor for deep learning inference a.k.a.
> >> ICL-NNPI can re-use Ice Lake Mobile regmap to enable Intel PMC Core
> >> driver on it.
> >>
> > This will be postponed till next cycle since the CPU model will not
> > appear before merge window.
> > So, please, resend than (I guess somewhat in a month).
>
>
> The dependent CPUID Patch is now upstream,
> https://github.com/torvalds/linux/blob/bed38c3e2dca01b358a62b5e73b46e875742fd75/arch/x86/include/asm/intel-family.h#L59
> so can you please apply this one?

Yes, it's in plan for rc2.

-- 
With Best Regards,
Andy Shevchenko
