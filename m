From: Tim Chen <tim.c.chen@linux.intel.com>
Subject: Re: [PATCH v2] platform: x86: Support Turbo Boost Max 3.0 for non
 HWP systems
Date: Thu, 19 Jan 2017 11:43:42 -0800
Message-ID: <1484855022.2833.36.camel@linux.intel.com>
References: <1484764155-183890-1-git-send-email-srinivas.pandruvada@linux.intel.com>
         <1484779250.2833.34.camel@linux.intel.com>
         <1484822314.2133.222.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1484822314.2133.222.camel@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, dvhart@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, 2017-01-19 at 12:38 +0200, Andy Shevchenko wrote:
> On Wed, 2017-01-18 at 14:40 -0800, Tim Chen wrote:
> > 
> > On Wed, 2017-01-18 at 10:29 -0800, Srinivas Pandruvada wrote:
> > > 
> > >  
> > > +
> > > +static int itmt_legacy_cpu_online(unsigned int cpu)
> > > +{
> > > +	static u32 max_highest_perf = 0, min_highest_perf =
> > > U32_MAX;
> > Should the max_highest_perf and min_highest_perf be defined and
> > initialized
> > outside this function?  Otherwise the max and min value will be lost
> > and reset
> > each time a new cpu comes online.
> > 
> > We will always find max_highest_perf == min_highest_perf.
> Perhaps you missed static keyword there. Their behaviour is the same as
> for global variables, i.e. the initial value assigned only at the
> beginning.
> 

Yes I did miss the static modifier. Sorry for the noise.

Tim
