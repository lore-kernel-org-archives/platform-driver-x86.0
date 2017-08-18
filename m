From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: Re: your mail
Date: Fri, 18 Aug 2017 23:23:02 +0530
Message-ID: <20170818175301.GA12806@raj-desk2.iind.intel.com>
References: <20170818174214.GA12519@raj-desk2.iind.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170818174214.GA12519@raj-desk2.iind.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, dbasehore@chromium.org, rjw@rjwysocki.net, rajatja@google.com
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Aug 18, 2017 at 11:12:14PM +0530, Rajneesh Bhardwaj wrote:
> Bcc: 
> Subject: Re: [PATCH] platform/x86: intel_pmc_core: Add Package C-states
>  residency info
> Reply-To: 
> In-Reply-To: <CAHp75Vd5Wnio-RCEBENtonYWOJF2+88FDvqkUv1HzV3CdcaaPA@mail.gmail.com>
>

Please ignore my previous email without subject. It was sent by mistake.

> On Fri, Aug 18, 2017 at 08:17:32PM +0300, Andy Shevchenko wrote:
> > +PeterZ (since I mentioned his name)
> > 
> > On Fri, Aug 18, 2017 at 5:58 PM, Rajneesh Bhardwaj
> > <rajneesh.bhardwaj@intel.com> wrote:
> > > On Fri, Aug 18, 2017 at 03:57:34PM +0300, Andy Shevchenko wrote:
> > >> On Fri, Aug 18, 2017 at 3:37 PM, Rajneesh Bhardwaj
> > >> <rajneesh.bhardwaj@intel.com> wrote:
> > >> > This patch introduces a new debugfs entry to read current Package C-state
> > >> > residency values and, one new kernel API to read the Package C-10 residency
> > >> > counter.
> > >> >
> > >> > Package C-state residency MSRs provide useful debug information about system
> > >> > idle states. In idle states system must enter deeper Package C-states.
> > 
> > >> Why this patch is needed?
> > >
> > > Andy, I'll try to give some background for this.
> > >
> > > This is needed to enhance the S0ix failure debug capabilities from within
> > > the kernel. On ChromeOS we have S0ix failsafe kernel framework that is used
> > > to validate S0ix and report the blockers in case of a failure.
> > > https://patchwork.kernel.org/patch/9148999/
> > 
> > (It's not part of upstream)
> 
> Sorry i sent an older link. There are fresh attempts to get this into
> mainline kernel and looks like there is a traction for it.
> https://patchwork.kernel.org/patch/9831229/
> 
> Package C-state (PC10) validation is discussed there.
> 
> > 
> > > So far only intel_pmc_slp_s0_counter_read is called by this framework to
> > > check whether the previous attempt to enter S0ix was success or not.
> > 
> > I harder see even a single user of that API in current kernel. It
> > should be unexported and removed I think.
> > 
> > >  Having
> > > another PC10 counter related exported function enhances the S0ix debug since
> > > PC10 state is a prerequisite to enter S0ix.
> > >
> > >> See, we have turbostat and cpupower user space tools which do this
> > >> without any additional code to be written in kernel. What prevents
> > >> your user space application do the same?
> > >>
> > >> Moreover, we have events for cstate, I assume perf or something alike
> > >> can monitor those counters as well.
> > >
> > > You're right, perhaps the debugfs is redundant when we have those user space
> > > tools but such tools are not available readily for all platforms/distros.
> > > Interfaces like /dev/cpu/*/msr that turbostat uses are not available on all
> > > the platforms.
> > > PMC driver is a debug driver so i thought its better to show Package C-state
> > > related info for low power debug here.
> > >
> > >>
> > >> Sorry, NAK.
> > >
> > > This patch has two parts i.e. exported PC10 API and the debugfs. Based on
> > > the above explanation, if the patch is not good as is, please let me know if
> > > i should drop the debugfs part and respin a v2 with just the exported API or
> > > drop this totally.
> > >
> > > Thanks for the feedback and thanks for taking time to review!
> > 
> > Reading above makes me think that entire design of this is misguided.
> > Since the most of values are counters they better to be accessed in a
> > way how perf does.
> > 
> > In case you need *in-kernel* facility, do some APIs (if it's not done
> > yet) for events drivers first.
> > cstate event driver is already in upstream.
> > 
> > Sorry, NAK for entire patch until it would be blessed by people like Peter Z.
> > 
> > -- 
> > With Best Regards,
> > Andy Shevchenko
> 
> -- 
> Best Regards,
> Rajneesh

-- 
Best Regards,
Rajneesh
