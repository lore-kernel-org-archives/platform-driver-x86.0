From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: Re: [PATCH] tools/power/x86/intel-speed-select: Fix CLX-N package
 information output
Date: Wed, 15 Apr 2020 09:59:53 -0700
Message-ID: <12612c48b9d00d10350d5e07587d90ae3759101f.camel@linux.intel.com>
References: <20200402180732.24684-1-prarit@redhat.com>
         <20200415161043.GU185537@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200415161043.GU185537@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Prarit Bhargava <prarit@redhat.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, 2020-04-15 at 19:10 +0300, Andy Shevchenko wrote:
> On Thu, Apr 02, 2020 at 02:07:32PM -0400, Prarit Bhargava wrote:
> > On CLX-N the perf-profile output is missing the package, die, and
> > cpu
> > output.  On CLX-N the pkg_dev struct will never be evaluated by the
> > core
> > code so pkg_dev.processed is always 0 and the package, die, and cpu
> > information is never output.
> > 
> > Set the pkg_dev.processed flag to 1 for CLX-N processors.
> 
Sorry Prarit. It took long to respond. The patch is fine. I am applying
to my tree.

-Srinivas

> I will accept this with PR from Srinivas whenever he sends one to
> public mailing list.
> 
> > Signed-off-by: Prarit Bhargava <prarit@redhat.com>
> > Cc: andriy.shevchenko@linux.intel.com
> > Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> > Cc: platform-driver-x86@vger.kernel.org
> > ---
> >  tools/power/x86/intel-speed-select/isst-config.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/tools/power/x86/intel-speed-select/isst-config.c
> > b/tools/power/x86/intel-speed-select/isst-config.c
> > index d1ac57be0cbd..2e64b9b6eb2e 100644
> > --- a/tools/power/x86/intel-speed-select/isst-config.c
> > +++ b/tools/power/x86/intel-speed-select/isst-config.c
> > @@ -1169,6 +1169,7 @@ static void dump_clx_n_config_for_cpu(int
> > cpu, void *arg1, void *arg2,
> >  
> >  		ctdp_level = &clx_n_pkg_dev.ctdp_level[0];
> >  		pbf_info = &ctdp_level->pbf_info;
> > +		clx_n_pkg_dev.processed = 1;
> >  		isst_ctdp_display_information(cpu, outf, tdp_level,
> > &clx_n_pkg_dev);
> >  		free_cpu_set(ctdp_level->core_cpumask);
> >  		free_cpu_set(pbf_info->core_cpumask);
> > -- 
> > 2.18.2
> > 
