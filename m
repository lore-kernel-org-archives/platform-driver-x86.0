From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH 0/5] tools/power/x86/intel-speed-select: New command and
Date: Sat, 14 Sep 2019 12:22:54 -0700
Message-ID: <85876cd057ff5f871dd830ff19a6e32c83e8e344.camel@linux.intel.com>
References: <20190914070513.19807-1-srinivas.pandruvada@linux.intel.com>
         <20190914171950.GW2680@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190914171950.GW2680@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, prarit@redhat.com, darcari@redhat.com
List-Id: platform-driver-x86.vger.kernel.org

On Sat, 2019-09-14 at 20:19 +0300, Andy Shevchenko wrote:
> On Sat, Sep 14, 2019 at 12:05:08AM -0700, Srinivas Pandruvada wrote:
> > This series contains some minor fixes, when firmware mask is
> > including
> > invalid CPU in the perf-profile mask. Also add some commands to
> > better manage core-power feature.
> 
> Hmm... 150+ LOCs doesn't count to me as minor fixes.
> So, are you considering this a material for v5.4?
Sorry, I should be clear. It is for 5.4. I am trying to catch merge
window. None of the fixes are critical. The majority of the code is
added for new command features.

What is your cut off for 5.4? I want to send some more features if
possible for 5.4.

Thanks,
Srinivas

> 
> 
> > Srinivas Pandruvada (4):
> >   tools/power/x86/intel-speed-select: Allow online/offline based on
> > tdp
> >   tools/power/x86/intel-speed-select: Format get-assoc information
> >   tools/power/x86/intel-speed-select: Fix some debug prints
> >   tools/power/x86/intel-speed-select: Extend core-power command set
> > 
> > Youquan Song (1):
> >   tools/power/x86/intel-speed-select: Fix high priority core mask
> > over
> >     count
> > 
> >  .../x86/intel-speed-select/isst-config.c      | 108
> > ++++++++++++++++--
> >  .../power/x86/intel-speed-select/isst-core.c  |  25 ++++
> >  .../x86/intel-speed-select/isst-display.c     |  51 +++++++++
> >  tools/power/x86/intel-speed-select/isst.h     |   9 +-
> >  4 files changed, 182 insertions(+), 11 deletions(-)
> > 
> > -- 
> > 2.17.2
> > 
> 
> 
