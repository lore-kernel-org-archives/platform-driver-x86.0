From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: Re: [PATCH] platform/x86: intel_pmc_core: Add Package C-states
 residency info
Date: Fri, 18 Aug 2017 20:28:43 +0530
Message-ID: <20170818145843.GA10366@raj-desk2.iind.intel.com>
References: <1503059853-5118-1-git-send-email-rajneesh.bhardwaj@intel.com>
 <CAHp75VfFrdiSDb_SAunCAdWZY0FPY9hxriCgVUYn00_gmOQQcw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:62771 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751759AbdHRPBH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 18 Aug 2017 11:01:07 -0400
Content-Disposition: inline
In-Reply-To: <CAHp75VfFrdiSDb_SAunCAdWZY0FPY9hxriCgVUYn00_gmOQQcw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>

On Fri, Aug 18, 2017 at 03:57:34PM +0300, Andy Shevchenko wrote:
> On Fri, Aug 18, 2017 at 3:37 PM, Rajneesh Bhardwaj
> <rajneesh.bhardwaj@intel.com> wrote:
> > This patch introduces a new debugfs entry to read current Package C-state
> > residency values and, one new kernel API to read the Package C-10 residency
> > counter.
> >
> > Package C-state residency MSRs provide useful debug information about system
> > idle states. In idle states system must enter deeper Package C-states.
> >
> > For example, on Intel Skylake/Kabylake based systems one should expect more
> > Package C-8 residency in "Idle Display On" scenarios compared to higher
> > Package C-states. With a self refresh display panel we must expect even more
> > deeper Package C-9/C-10 residencies indicating more power savings. Package
> > C-states depend not only on Core C-States but also on various IP blocks
> > power gating status and LTR values.
> >
> > For Intel Core SoCs Package C-10 entry is a must for deeper sleep states
> > such as S0ix. "Suspend-to-idle"  should ideally take this path:
> > PC0 -> PC10 -> S0ix. For S0ix debug, its logical to check for Package-C10
> > residency if for some reason system fails to enter S0ix.
> >
> > Please refer to this link for MSR details:
> > https://software.intel.com/sites/default/files/managed/22/0d/335592-sdm-vol-4.pdf
> >
> > Usage:
> > cat /sys/kernel/debug/pmc_core/package_cstate_residency
> > Package C2       : 0xec2e21735f
> > Package C3       : 0xc30113ba4
> > Package C6       : 0x9ef4be15c5
> > Package C7       : 0x1e011904
> > Package C8       : 0x3c5653cfe5a
> > Package C9       : 0x0
> > Package C10      : 0x16fff4289
> >
> 
> 
> Why this patch is needed?

Andy, I'll try to give some background for this.

This is needed to enhance the S0ix failure debug capabilities from within
the kernel. On ChromeOS we have S0ix failsafe kernel framework that is used
to validate S0ix and report the blockers in case of a failure.
https://patchwork.kernel.org/patch/9148999/

So far only intel_pmc_slp_s0_counter_read is called by this framework to
check whether the previous attempt to enter S0ix was success or not. Having
another PC10 counter related exported function enhances the S0ix debug since
PC10 state is a prerequisite to enter S0ix.

> See, we have turbostat and cpupower user space tools which do this
> without any additional code to be written in kernel. What prevents
> your user space application do the same?
> 
> Moreover, we have events for cstate, I assume perf or something alike
> can monitor those counters as well.

You're right, perhaps the debugfs is redundant when we have those user space
tools but such tools are not available readily for all platforms/distros.
Interfaces like /dev/cpu/*/msr that turbostat uses are not available on all
the platforms.
PMC driver is a debug driver so i thought its better to show Package C-state
related info for low power debug here.

> 
> Sorry, NAK.

This patch has two parts i.e. exported PC10 API and the debugfs. Based on
the above explanation, if the patch is not good as is, please let me know if
i should drop the debugfs part and respin a v2 with just the exported API or
drop this totally.

Thanks for the feedback and thanks for taking time to review!

> > Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
> > ---
> >  * Applied on top of "Make the driver PCH family agnostic" sent by Srinivas
> >  * Tested on 4.13-rc4 as well as on the "testing" branch of the
> >    platform/drivers/x86.
> >
> 
> -- 
> With Best Regards,
> Andy Shevchenko

-- 
Best Regards,
Rajneesh
