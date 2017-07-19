From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: Re: [PATCH 3/3] platform/x86: Add Audio domain PG status events
Date: Wed, 19 Jul 2017 19:08:25 +0530
Message-ID: <20170719133825.GA18905@raj-desk1.iind.intel.com>
References: <1500033228-634-1-git-send-email-rajneesh.bhardwaj@intel.com>
 <1500033228-634-3-git-send-email-rajneesh.bhardwaj@intel.com>
 <5F7315E704FA0841B5DFCE90329B2BB462E90061@BGSMSX102.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5F7315E704FA0841B5DFCE90329B2BB462E90061@BGSMSX102.gar.corp.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Chakravarty, Souvik K" <souvik.k.chakravarty@intel.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "dvhart@infradead.org" <dvhart@infradead.org>, "andy@infradead.org" <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Murthy, Shanth" <shanth.murthy@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jul 17, 2017 at 10:48:30AM +0530, Chakravarty, Souvik K wrote:
> 
> 
> > -----Original Message-----
> > From: Bhardwaj, Rajneesh
> > Sent: Friday, July 14, 2017 5:24 PM
> > To: platform-driver-x86@vger.kernel.org
> > Cc: dvhart@infradead.org; andy@infradead.org; linux-
> > kernel@vger.kernel.org; Murthy, Shanth <shanth.murthy@intel.com>;
> > Chakravarty, Souvik K <souvik.k.chakravarty@intel.com>; Bhardwaj,
> > Rajneesh <rajneesh.bhardwaj@intel.com>
> > Subject: [PATCH 3/3] platform/x86: Add Audio domain PG status events
> > 
> > From: "Murthy, Shanth" <shanth.murthy@intel.com>
> > 
> > This patch adds events to ioss telemetry to read the power gating status for
> > the audio domain.
> > 
> > Signed-off-by: Shanth Murthy <shanth.murthy@intel.com>
> > Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
> > ---
> >  arch/x86/include/asm/intel_telemetry.h        | 2 +-
> >  drivers/platform/x86/intel_telemetry_pltdrv.c | 6 ++++++
> >  2 files changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/x86/include/asm/intel_telemetry.h
> > b/arch/x86/include/asm/intel_telemetry.h
> > index 85029b58d0cd..4eeae0a4f9a2 100644
> > --- a/arch/x86/include/asm/intel_telemetry.h
> > +++ b/arch/x86/include/asm/intel_telemetry.h
> > @@ -17,7 +17,7 @@
> >  #define INTEL_TELEMETRY_H
> > 
> >  #define TELEM_MAX_EVENTS_SRAM		28
> > -#define TELEM_MAX_OS_ALLOCATED_EVENTS	20
> > +#define TELEM_MAX_OS_ALLOCATED_EVENTS	25
> 
> This is something that should not be done without testing. There was an understanding to not use more than 20 counters in OS, so that tools like SoCWatch could use the rest 8 without total reconfiguration of the events. With this change we are not leaving much for tools and it may break SoCwatch/IMON or other tools dependent on using just 8. 
> The better way for this would be for the userspace tool to configure the extra 5 events via add_config() call and not increase the OS usage ceiling.
> 
> Or you could add some more sysfs apis for get/set events and do it via a daemon/script.
> 
> <snip>....

Thanks for the review and the feedback Souvik. Ideally user space tools
should not put a restriction such as this one. It would be good to document
such details.

Is there a plan to support more than 20 events in telemetry driver? If not
then we can probably think of removing few events and add audio related
events maintaining total count of 20?

For now i will respin the patches and drop this one. 

-- 
Best Regards,
Rajneesh
