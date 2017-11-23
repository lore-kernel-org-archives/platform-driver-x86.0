From: Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [RFC v8 0/7] SCU/PMC/PUNIT Inter-Processor Communication(IPC)
 driver cleanup
Date: Thu, 23 Nov 2017 15:56:06 +0200
Message-ID: <20171123135606.GF17418@kuha.fi.intel.com>
References: <cover.1509268570.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <cover.1509268570.git.sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, mingo-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, qipeng.zha-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, hpa-YMNOUZJC4hwAvxtiuMwx3w@public.gmane.org, dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, souvik.k.chakravarty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sathyaosid-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On Sun, Oct 29, 2017 at 02:49:53AM -0700, sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org wrote:
> Currently intel_pmc_ipc.c, intel_punit_ipc.c, intel_scu_ipc.c drivers
> implements the same IPC features. This code duplication could be avoided if we
> implement the IPC driver as a generic library and let custom device drivers
> use API provided by generic driver. This patchset mainly addresses this issue.
> 
> Along with above code duplication issue, This patchset also addresses
> following issues in intel_pmc_ipc and intel_punit_ipc drivers.
> 
> 1. Intel_pmc_ipc.c driver does not use any resource managed (devm_*) calls.
> 2. In Intel_pmc_ipc.c driver, dependent devices like PUNIT, Telemetry and iTCO
> are created manually and uses lot of redundant buffer code.
> 3. Global variable is used to store the IPC device structure and it is used
> across all functions in intel_pmc_ipc.c and intel_punit_ipc.c.

I think those changes are definitely welcome. On top of those, I want
to have regmap for using the IPC. It does not make any sense that the
drivers for the devices attached to for example the PMC, like the
WhiskeyCove PMIC, have to implement their own regmaps.

But a class for the IPC library does feel like overkill to me.


Thanks,

-- 
heikki
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
