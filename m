From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH 2/2] tools/power/x86/intel-speed-select: Display core
 count for bucket
Date: Sun, 08 Sep 2019 07:13:47 -0700
Message-ID: <4a2489611fedaaa60bdd54aafbe0e24b005995cc.camel@linux.intel.com>
References: <20190905233748.6822-1-srinivas.pandruvada@linux.intel.com>
         <20190905233748.6822-2-srinivas.pandruvada@linux.intel.com>
         <780a3faf-9e44-64f4-a354-bdee39af3af5@redhat.com>
         <20190906134655.GU2680@smile.fi.intel.com>
         <6b576770a4bbe6c24ea524083dec5a16bf3c9e94.camel@linux.intel.com>
         <b8c7bd1204f7b4f75a5bccec4d7c41b1225928f7.camel@linux.intel.com>
         <CAHp75Vc9xMPW38Toh2jKv9YYYNV16837aAcXKMP6WaM-L8zcSQ@mail.gmail.com>
         <533a8c7c-d309-9b65-d973-120ae3e9f8b4@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <533a8c7c-d309-9b65-d973-120ae3e9f8b4@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Prarit Bhargava <prarit@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, David Arcari <darcari@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, 2019-09-08 at 05:46 -0400, Prarit Bhargava wrote:
> 
> On 9/7/19 2:18 PM, Andy Shevchenko wrote:
> > On Fri, Sep 6, 2019 at 10:47 PM Srinivas Pandruvada
> > <srinivas.pandruvada@linux.intel.com> wrote:
> > > 
> > > On Fri, 2019-09-06 at 07:50 -0700, Srinivas Pandruvada wrote:
> > > > On Fri, 2019-09-06 at 16:46 +0300, Andy Shevchenko wrote:
> > > > > On Fri, Sep 06, 2019 at 05:39:54AM -0400, Prarit Bhargava
> > > > > wrote:
> > > > > > On 9/5/19 7:37 PM, Srinivas Pandruvada wrote:
> > > > > > > Read the bucket and core count relationship via MSR and
> > > > > > > display
> > > > > > > when displaying turbo ratio limits.
> > > > > > > +       ret = isst_send_msr_command(cpu, 0x1ae, 0,
> > > > > > > buckets_info);
> > > > > > 
> > > > > > ^^^ you can get rid of the magic number 0x1ae by doing
> > > > > > (sorry for
> > > > > > the cut-and-paste)
> > > > > > 
> > > > > > diff --git a/tools/power/x86/intel-speed-select/Makefile
> > > > > > b/tools/power/x86/intel
> > > > > > index 12c6939dca2a..087d802ad844 100644
> > > > > > --- a/tools/power/x86/intel-speed-select/Makefile
> > > > > > +++ b/tools/power/x86/intel-speed-select/Makefile
> > > > > > @@ -15,6 +15,8 @@ endif
> > > > > >  MAKEFLAGS += -r
> > > > > > 
> > > > > >  override CFLAGS += -O2 -Wall -g -D_GNU_SOURCE
> > > > > > -I$(OUTPUT)include
> > > > > > +override CFLAGS += -I../../../include
> > > > > > +override CFLAGS +=
> > > > > > -DMSRHEADER='"../../../../arch/x86/include/asm/msr-
> > > > > > index.h"'
> > > > 
> > > > No, we can't use msr_index.
> > > 
> > > This comment was meant for use of /dev/cpu/X/msr not msr_index.
> > > I didn't want to bring in dependency on msr-index.h for couple of
> > > 2
> > > MSRs and the names in msr-index.h doesn't really reflect the
> > > actual
> > > processing, they are doing. For example MSR_TURBO_RATIO_LIMIT1
> > > for
> > > 0x1ae. The definition of 0x1AE is different on cpu model 0x55 and
> > > beyond.
> > > 
> > > > 
> > 
> > It seems not applicable on top of tools patch series I had applied
> > before.
> > 
> > > > > 
> > > > > I guess it can be done in more neat way.
> > > > > 
> > > > > > As I've been looking at this code I have been wondering why
> > > > > > didn't
> > > > > > you just use
> > > > > > the standard /dev/cpu/X/msr interface that other x86 power
> > > > > > utilities (turbostat,
> > > > > > x86_energy_perf_policy) use?  Implementing msr_read() is
> > > > > > trivial
> > > > > > (warning
> > > > > > untested and uncompiled code)
> > > > 
> > > > No. We can't. The MSR interface is disabled on several
> > > > distribution
> > > > and
> > > > platforms with secured boot. So some special MSRs are only
> > > > allowed
> > > > via
> > > > this IOCTL interface.
> > > > 
> 
> Which distros don't have /dev/cpu/X/msr ?
Google "UEFI Secure Boot" 
The patch for kernel lock down was from RedHat, which restricted MSRs!

> 
> None of other Intel tools have this restriction (or requirement
> depending on
> your point of view).  Why is intel-speed-select special that we have
> to
> jump through hoops?

Not sure why you call jumping hoops here. You are comparing debug tools
with run time service from kernel for Intel speed select.

This is not about tool. This tool is giving example how user spaces can
control SST features through a kernel interface which should work with
any distribution including home grown distros. And this interface is
not for testing like turbostat or similar. So if any orchestration
software can send same message as this tool and able to control SST
features whether there is MSR access is there or not.

Also you are missing feature for save/restore state after
suspend/resume.



> 
> P.
> 
> > > > Thanks,
> > > > Srinivas
> > > > 
> > > > 
> > > > > 
> > > > > Actually good point!
> > > > > 
> > 
> > 
