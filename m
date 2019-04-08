From: Rajat Jain <rajatja@google.com>
Subject: Re: [PATCH v3 2/3] platform/x86: intel_pmc_core: Allow to dump debug
 registers on S0ix failure
Date: Mon, 8 Apr 2019 11:58:06 -0700
Message-ID: <CACK8Z6Fb603NV-CreX6mxgj=JF0VmfP0kORHZg5T8L5vOeTsQA@mail.gmail.com>
References: <20190313222124.229371-1-rajatja@google.com> <20190405203558.19160-1-rajatja@google.com>
 <20190405203558.19160-2-rajatja@google.com> <CAHp75VehpYPm1ApFozisSsNi1g0EtbKBm3C97jxXC2u04tpt0A@mail.gmail.com>
 <CACK8Z6FGFiS_jN_5ctWmjKbrcUyjGkV0MsVs7_2TsaS7UAoydA@mail.gmail.com> <CAHp75Ve9zq2MWbiHhNV6RSV8xgmWQdqaMi=UdE7RFiZ9QgmH5Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Ve9zq2MWbiHhNV6RSV8xgmWQdqaMi=UdE7RFiZ9QgmH5Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tomasz Wysocki <Wysocki@google.com>, Rafael J <rafael.j.wysocki@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Furquan Shaikh <furquan@google.com>, Evan Green <evgreen@google.com>, Rajat Jain <rajatxjain@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Apr 8, 2019 at 11:41 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Apr 8, 2019 at 9:36 PM Rajat Jain <rajatja@google.com> wrote:
> > On Mon, Apr 8, 2019 at 10:02 AM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Fri, Apr 5, 2019 at 11:36 PM Rajat Jain <rajatja@google.com> wrote:
>
> > > Perhaps something like
> > >
> > > pmcdev->check_counters = false;
> > > /* User doesn't want to be warned */
> > > if (!warn_on...)
> > >  return 0;
> > > /* We do suspend via firmware */
> > > if (...)
> > >  return 0;
> > > ...
> > >
> > > ?
> >
> > I guess what you mean is one conditional per line. Sure, I will do that.
>
> Yes
>
> > > > +static inline bool pc10_failed(struct pmc_dev *pmcdev)
> > >
> > > To be or not to be? :-)
> > > Perhaps names of the functions should be
> > >
> > > pmc_code_is_pc10_failed()
> > >
> > > and so on
> >
> > I think the suggestion is to use pmc_core_* as the function names. OK,
> > I will rename the functions to:
> >
> > pmc_core_pc10_failed()
> > and
> > pmc_core_s0ix_failed()
>
> And verb "to be". See above.
>
> > > Can't we utilize existing print helpers?
> >
> > I didn't quite see any existing print helpers in this file. I took
> > this code from pmc_core_slps0_dbg_show(), and I think although I can
> > abstract out this code into a static function, the calling code need
> > to use seq_printf(s,...) and dev_warn(dev,...) respectively. - so
> > might be overkill (did not feel that the benefits were worth it).
> > Please let me know if you have any suggestions and will be happy to
> > use them.
>
> Instead of adding module parameter and doing these prints, perhaps
> introduce another debugfs node.

Uh, I actually did wanted to print them at the resume time in kernel
logs, because I think this is something kernel developers would be
responsible for debugging and thus would be great to have this
included within the kernel logs. User space tools may differ on
different distros and may or may not be looking for S0ix failures, and
particularly may not dump this new debugfs attribute.

The other thing is that seemingly this could also help in situations
where debugfs is not configured?

Thanks,

Rajat


>
> --
> With Best Regards,
> Andy Shevchenko
