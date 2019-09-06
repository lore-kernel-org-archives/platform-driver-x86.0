From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH 2/2] tools/power/x86/intel-speed-select: Display core
 count for bucket
Date: Fri, 06 Sep 2019 07:50:21 -0700
Message-ID: <6b576770a4bbe6c24ea524083dec5a16bf3c9e94.camel@linux.intel.com>
References: <20190905233748.6822-1-srinivas.pandruvada@linux.intel.com>
         <20190905233748.6822-2-srinivas.pandruvada@linux.intel.com>
         <780a3faf-9e44-64f4-a354-bdee39af3af5@redhat.com>
         <20190906134655.GU2680@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190906134655.GU2680@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@intel.com>, Prarit Bhargava <prarit@redhat.com>
Cc: darcari@redhat.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, 2019-09-06 at 16:46 +0300, Andy Shevchenko wrote:
> On Fri, Sep 06, 2019 at 05:39:54AM -0400, Prarit Bhargava wrote:
> > On 9/5/19 7:37 PM, Srinivas Pandruvada wrote:
> > > Read the bucket and core count relationship via MSR and display
> > > when displaying turbo ratio limits.
> > > +	ret = isst_send_msr_command(cpu, 0x1ae, 0, buckets_info);
> > 
> > ^^^ you can get rid of the magic number 0x1ae by doing (sorry for
> > the cut-and-paste)
> > 
> > diff --git a/tools/power/x86/intel-speed-select/Makefile
> > b/tools/power/x86/intel
> > index 12c6939dca2a..087d802ad844 100644
> > --- a/tools/power/x86/intel-speed-select/Makefile
> > +++ b/tools/power/x86/intel-speed-select/Makefile
> > @@ -15,6 +15,8 @@ endif
> >  MAKEFLAGS += -r
> > 
> >  override CFLAGS += -O2 -Wall -g -D_GNU_SOURCE -I$(OUTPUT)include
> > +override CFLAGS += -I../../../include
> > +override CFLAGS +=
> > -DMSRHEADER='"../../../../arch/x86/include/asm/msr-index.h"'
No, we can't use msr_index.

> 
> I guess it can be done in more neat way.
> 
> > As I've been looking at this code I have been wondering why didn't
> > you just use
> > the standard /dev/cpu/X/msr interface that other x86 power
> > utilities (turbostat,
> > x86_energy_perf_policy) use?  Implementing msr_read() is trivial
> > (warning
> > untested and uncompiled code)
No. We can't. The MSR interface is disabled on several distribution and
platforms with secured boot. So some special MSRs are only allowed via
this IOCTL interface.

Thanks,
Srinivas


> 
> Actually good point!
> 
